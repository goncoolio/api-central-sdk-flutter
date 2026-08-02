import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

import 'support/fake_adapter.dart';

void main() {
  group('ApiCentral', () {
    test('expose un client configuré avec le TokenProvider fourni', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {'data': <dynamic>[]}),
      );

      final sdk = ApiCentral(
        config: const ApiCentralConfig(
          baseUrl: 'https://api.test/s2s/v1',
          applicationId: 'app-42',
        ),
        tokenProvider: () async => 'jwt-1',
      );
      sdk.client.dio.httpClientAdapter = adapter;

      final response = await sdk.client.get<Map<String, dynamic>>('/users');

      expect(response['data'], isEmpty);
      expect(adapter.requests.single.headers['Authorization'],
          equals('Bearer jwt-1'));
    });

    test('invalidateToken force un nouvel appel au provider', () async {
      var appels = 0;
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, <String, dynamic>{}));

      final sdk = ApiCentral(
        config: const ApiCentralConfig(
          baseUrl: 'https://api.test/s2s/v1',
          applicationId: 'app-42',
        ),
        tokenProvider: () async {
          appels++;
          return 'jwt-$appels';
        },
      );
      sdk.client.dio.httpClientAdapter = adapter;

      await sdk.client.get<Map<String, dynamic>>('/users');
      expect(appels, equals(1));

      await sdk.client.get<Map<String, dynamic>>('/users');
      expect(appels, equals(1), reason: 'le token est mis en cache');

      sdk.invalidateToken();
      await sdk.client.get<Map<String, dynamic>>('/users');
      expect(appels, equals(2));
    });
  });
}
