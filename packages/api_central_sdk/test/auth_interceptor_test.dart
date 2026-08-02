import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:api_central_sdk/src/http/auth_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

import 'support/fake_adapter.dart';

Dio _dioAvecAuth(CachedTokenProvider provider, FakeAdapter adapter) {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
    ..httpClientAdapter = adapter;
  dio.interceptors.add(AuthInterceptor(
    tokenProvider: provider,
    applicationId: 'app-42',
    dio: dio,
  ));
  return dio;
}

const _corps401 = {
  'message': 'Token expired',
  'statusCode': 401,
  'error': 'Unauthorized',
};

void main() {
  group('AuthInterceptor', () {
    test('ajoute le Bearer token et X-Application-Id', () async {
      final adapter = FakeAdapter((_, __) => const FakeReply(200, {'ok': true}));
      final dio = _dioAvecAuth(
        CachedTokenProvider(inner: () async => 'jwt-1'),
        adapter,
      );

      await dio.get<dynamic>('/users');

      expect(adapter.requests.single.headers['Authorization'],
          equals('Bearer jwt-1'));
      expect(adapter.requests.single.headers['X-Application-Id'],
          equals('app-42'));
    });

    test('rafraîchit le token et rejoue une fois sur 401', () async {
      var appelsProvider = 0;
      final adapter = FakeAdapter((_, callIndex) => callIndex == 1
          ? const FakeReply(401, _corps401)
          : const FakeReply(200, {'ok': true}));

      final dio = _dioAvecAuth(
        CachedTokenProvider(inner: () async {
          appelsProvider++;
          return 'jwt-$appelsProvider';
        }),
        adapter,
      );

      final response = await dio.get<dynamic>('/users');

      expect(response.statusCode, equals(200));
      expect(adapter.callCount, equals(2),
          reason: 'la requête doit être rejouée une fois');
      expect(appelsProvider, equals(2), reason: 'le token doit être redemandé');
      expect(adapter.requests.last.headers['Authorization'],
          equals('Bearer jwt-2'),
          reason: 'le rejeu doit porter le nouveau token');
    });

    test('ne rejoue pas deux fois sur 401 répété', () async {
      final adapter = FakeAdapter((_, __) => const FakeReply(401, _corps401));
      final dio = _dioAvecAuth(
        CachedTokenProvider(inner: () async => 'jwt-mort'),
        adapter,
      );

      await expectLater(
        dio.get<dynamic>('/users'),
        throwsA(isA<DioException>()),
      );
      expect(adapter.callCount, equals(2), reason: 'un seul rejeu autorisé');
    });
  });
}
