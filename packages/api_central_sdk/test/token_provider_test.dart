import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:test/test.dart';

void main() {
  group('HttpTokenProvider', () {
    test('récupère le token auprès du backend applicatif', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://backend.test'));
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/s2s/token',
        (server) => server.reply(200, {'token': 'jwt-abc'}),
      );

      final provider = HttpTokenProvider(
        endpoint: '/s2s/token',
        dio: dio,
      );

      expect(await provider(), equals('jwt-abc'));
    });

    test('respecte un nom de champ personnalisé', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://backend.test'));
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/s2s/token',
        (server) => server.reply(200, {'socketToken': 'jwt-xyz'}),
      );

      final provider = HttpTokenProvider(
        endpoint: '/s2s/token',
        tokenField: 'socketToken',
        dio: dio,
      );

      expect(await provider(), equals('jwt-xyz'));
    });

    test('lève UnauthorizedException si le champ est absent', () async {
      final dio = Dio(BaseOptions(baseUrl: 'https://backend.test'));
      final adapter = DioAdapter(dio: dio);
      adapter.onPost(
        '/s2s/token',
        (server) => server.reply(200, {'autre': 'valeur'}),
      );

      final provider = HttpTokenProvider(
        endpoint: '/s2s/token',
        dio: dio,
      );

      expect(provider.call, throwsA(isA<UnauthorizedException>()));
    });
  });

  group('CachedTokenProvider', () {
    test('n appelle le provider sous-jacent qu une seule fois', () async {
      var appels = 0;
      final cached = CachedTokenProvider(inner: () async {
        appels++;
        return 'jwt-$appels';
      });

      expect(await cached(), equals('jwt-1'));
      expect(await cached(), equals('jwt-1'));
      expect(appels, equals(1));
    });

    test('rappelle le provider après invalidate()', () async {
      var appels = 0;
      final cached = CachedTokenProvider(inner: () async {
        appels++;
        return 'jwt-$appels';
      });

      expect(await cached(), equals('jwt-1'));
      cached.invalidate();
      expect(await cached(), equals('jwt-2'));
      expect(appels, equals(2));
    });

    test('mutualise les appels concurrents', () async {
      var appels = 0;
      final cached = CachedTokenProvider(inner: () async {
        appels++;
        await Future<void>.delayed(const Duration(milliseconds: 50));
        return 'jwt-$appels';
      });

      final resultats = await Future.wait([cached(), cached(), cached()]);

      expect(resultats, equals(['jwt-1', 'jwt-1', 'jwt-1']));
      expect(appels, equals(1));
    });
  });
}
