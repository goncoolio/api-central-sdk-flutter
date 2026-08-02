import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

import '../support/fake_adapter.dart';

ApiCentral _sdk(FakeAdapter adapter) {
  final sdk = ApiCentral(
    config: const ApiCentralConfig(
      baseUrl: 'https://api.test/s2s/v1',
      applicationId: 'app-42',
    ),
    tokenProvider: () async => 'jwt-1',
  );
  sdk.client.dio.httpClientAdapter = adapter;
  return sdk;
}

void main() {
  group('UsersModule', () {
    test('crée un utilisateur en snake_case', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'u1',
          'externalUserId': 'ext-1',
          'displayName': 'Alice',
        }),
      );

      final user = await _sdk(adapter).users.create(
            externalUserId: 'ext-1',
            displayName: 'Alice',
          );

      expect(user.id, equals('u1'));
      expect(adapter.requests.single.path, equals('/users'));
      expect(adapter.requests.single.method, equals('POST'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['external_user_id'], equals('ext-1'));
      expect(envoye['display_name'], equals('Alice'));
    });

    test('liste les utilisateurs avec pagination', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'data': [
            {'id': 'u1', 'externalUserId': 'ext-1'},
          ],
          'pagination': {
            'page': 1,
            'limit': 20,
            'total': 1,
            'totalPages': 1,
          },
        }),
      );

      final page = await _sdk(adapter).users.list(page: 1, limit: 20);

      expect(page.data.single.id, equals('u1'));
      expect(adapter.requests.single.queryParameters,
          equals({'page': 1, 'limit': 20}));
    });

    test('récupère un utilisateur par identifiant externe encodé', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'u1',
          'externalUserId': 'ext/1',
        }),
      );

      await _sdk(adapter).users.getByExternalId('ext/1');

      expect(adapter.requests.single.path, equals('/users/by-external/ext%2F1'),
          reason:
              'un identifiant externe peut contenir des caractères à encoder');
    });

    test('enregistre un appareil', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'd1',
          'userId': 'u1',
          'deviceToken': 'fcm-token',
          'platform': 'android',
          'isActive': true,
        }),
      );

      final device = await _sdk(adapter).users.registerDevice(
            'u1',
            deviceToken: 'fcm-token',
            platform: DevicePlatform.android,
          );

      expect(device.platform, equals(DevicePlatform.android));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['device_token'], equals('fcm-token'));
      expect(envoye['platform'], equals('android'));
    });

    test('supprime un appareil en encodant le token', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).users.removeDevice('u1', 'token/avec/slash');

      expect(adapter.requests.single.path,
          equals('/users/u1/devices/token%2Favec%2Fslash'));
      expect(adapter.requests.single.method, equals('DELETE'));
    });

    test('met à jour la présence', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'userId': 'u1',
          'status': 'online',
          'lastSeenAt': '2026-08-02T09:00:00Z',
        }),
      );

      final presence =
          await _sdk(adapter).users.updatePresence('u1', status: 'online');

      expect(presence.status, equals('online'));
      expect(adapter.requests.single.method, equals('PUT'));
    });
  });
}
