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
  group('EncryptionModule', () {
    test('enregistre les clés sans transmettre d utilisateur', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(
            200, {'success': true, 'message': 'Keys registered'}),
      );

      await _sdk(adapter).encryption.registerKeys(
        identityKey: 'aWQ=',
        signedPrekeyId: 1,
        signedPrekey: 'c3A=',
        signedPrekeySignature: 'c2c=',
        prekeys: const [PreKeyInfo(prekeyId: 101, prekey: 'cDE=')],
      );

      expect(adapter.requests.single.path, equals('/encryption/keys/register'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye.containsKey('user_id'), isFalse,
          reason: "l'API prend l'utilisateur du token");
      expect(envoye['identity_key'], equals('aWQ='));
      expect((envoye['prekeys']! as List).single,
          equals({'prekey_id': 101, 'prekey': 'cDE='}));
    });

    test('lit le bundle d un pair', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'userId': 'u2',
          'identityKey': 'aWQ=',
          'signedPrekeyId': 1,
          'signedPrekey': 'c3A=',
          'signedPrekeySignature': 'c2c=',
          'prekey': {'prekeyId': 101, 'prekey': 'cDE='},
        }),
      );

      final bundle = await _sdk(adapter).encryption.getPreKeyBundle('u2');

      expect(bundle.userId, equals('u2'));
      expect(bundle.prekey?.prekeyId, equals(101));
      expect(adapter.requests.single.path, equals('/encryption/keys/u2'));
    });

    test('accepte un bundle sans prekey disponible', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'userId': 'u2',
          'identityKey': 'aWQ=',
          'signedPrekeyId': 1,
          'signedPrekey': 'c3A=',
          'signedPrekeySignature': 'c2c=',
        }),
      );

      final bundle = await _sdk(adapter).encryption.getPreKeyBundle('u2');

      expect(bundle.prekey, isNull,
          reason: 'le stock de prekeys peut être épuisé');
    });

    test('compte les prekeys de l utilisateur du token', () async {
      final adapter = FakeAdapter(
        (options, callIndex) =>
            const FakeReply(200, {'userId': 'u1', 'availablePrekeys': 42}),
      );

      final count = await _sdk(adapter).encryption.getPrekeysCount();

      expect(count.availablePrekeys, equals(42));
      expect(adapter.requests.single.path,
          equals('/encryption/keys/prekeys/count'),
          reason: "pas d'identifiant dans le chemin");
    });

    test('réapprovisionne les prekeys', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).encryption.uploadPrekeys(
        const [PreKeyInfo(prekeyId: 201, prekey: 'cDI=')],
      );

      expect(adapter.requests.single.path, equals('/encryption/keys/prekeys'));
    });

    test('fait tourner la clé signée', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).encryption.rotateSignedPrekey(
            signedPrekeyId: 2,
            signedPrekey: 'c3Ay',
            signedPrekeySignature: 'c2cy',
          );

      expect(adapter.requests.single.path, equals('/encryption/keys/rotate'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['signed_prekey_id'], equals(2));
    });
  });
}
