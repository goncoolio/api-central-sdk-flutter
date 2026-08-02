import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'support/fake_adapter.dart';

ApiClient _client(FakeAdapter adapter) {
  final dio = Dio()..httpClientAdapter = adapter;
  return ApiClient(
    config: const ApiCentralConfig(
      baseUrl: 'https://api.test/s2s/v1',
      applicationId: 'app-42',
    ),
    tokenProvider: CachedTokenProvider(inner: () async => 'jwt-1'),
    dio: dio,
  );
}

void main() {
  group('ApiClient', () {
    test('convertit la réponse en camelCase', () async {
      final adapter = FakeAdapter(
        (options, callIndex) =>
            const FakeReply(200, {'success': true, 'sent_count': 3}),
      );

      final result = await _client(adapter).post<Map<String, dynamic>>(
        '/notifications/send-bulk',
        body: {'userIds': <String>['a'], 'notificationType': 'system'},
      );

      expect(result['sentCount'], equals(3));
    });

    test('convertit le corps de requête en snake_case', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, {'id': 'n1'}));

      await _client(adapter).post<Map<String, dynamic>>(
        '/notifications/send',
        body: {'userId': 'u1', 'notificationType': 'message'},
      );

      // dio conserve la Map dans RequestOptions.data : la sérialisation JSON
      // n'intervient qu'après l'intercepteur.
      final envoye = (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye, equals({'user_id': 'u1', 'notification_type': 'message'}));
    });

    test('convertit les query params en snake_case', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, {'count': 4}));

      final result = await _client(adapter).get<Map<String, dynamic>>(
        '/notifications/unread-count',
        query: {'userId': 'u1'},
      );

      expect(result['count'], equals(4));
      expect(adapter.requests.single.queryParameters,
          equals({'user_id': 'u1'}));
    });

    test('traduit un 404 en NotFoundException', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(404, {
          'message': 'User not found',
          'statusCode': 404,
          'error': 'Not Found',
        }),
      );

      await expectLater(
        _client(adapter).get<Map<String, dynamic>>('/users/inconnu'),
        throwsA(isA<NotFoundException>()
            .having((e) => e.message, 'message', 'User not found')),
      );
    });

    test('traduit un timeout en NetworkException', () async {
      final dio = Dio()
        ..httpClientAdapter = _AdapterQuiEchoue(DioExceptionType.connectionTimeout);
      final client = ApiClient(
        config: const ApiCentralConfig(
          baseUrl: 'https://api.test/s2s/v1',
          applicationId: 'app-42',
        ),
        tokenProvider: CachedTokenProvider(inner: () async => 'jwt-1'),
        dio: dio,
      );

      await expectLater(
        client.get<Map<String, dynamic>>('/users'),
        throwsA(isA<NetworkException>()),
      );
    });

    test('applique le timeout étendu sur /messaging/', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, {'id': 'm1'}));

      await _client(adapter).post<Map<String, dynamic>>(
        '/messaging/conversations/c1/messages',
        body: {'senderId': 'u1', 'content': 'hello'},
      );

      expect(adapter.requests.single.receiveTimeout,
          equals(const Duration(seconds: 45)));
    });

    test('garde le timeout par défaut hors /messaging/', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, {'id': 'u1'}));

      await _client(adapter).get<Map<String, dynamic>>('/users/u1');

      expect(adapter.requests.single.receiveTimeout,
          equals(const Duration(seconds: 15)));
    });
  });
}

/// Adaptateur qui échoue toujours, pour simuler une panne réseau.
class _AdapterQuiEchoue implements HttpClientAdapter {
  _AdapterQuiEchoue(this.type);

  final DioExceptionType type;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    throw DioException(requestOptions: options, type: type);
  }

  @override
  void close({bool force = false}) {}
}
