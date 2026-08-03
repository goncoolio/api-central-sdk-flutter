import 'dart:convert';

import 'package:api_central_encryption/api_central_encryption.dart';
import 'package:test/test.dart';

void main() {
  group('MessageCipher', () {
    late String secret;

    setUp(() async {
      final alice = await IdentityKeyPair.generate();
      final bob = await IdentityKeyPair.generate();
      secret = await deriveSharedSecret(
        privateKeyBase64: alice.privateKeyBase64,
        peerPublicKeyBase64: bob.publicKeyBase64,
      );
    });

    test('chiffre puis déchiffre un message', () async {
      final chiffre = await MessageCipher.encrypt('Bonjour', secret);
      final clair = await MessageCipher.decrypt(chiffre, secret);

      expect(clair, equals('Bonjour'));
    });

    test('le chiffré ne laisse pas fuiter le texte clair', () async {
      final chiffre = await MessageCipher.encrypt('mot-de-passe', secret);

      expect(chiffre.ciphertextBase64, isNot(contains('mot-de-passe')));
      expect(utf8.decode(base64Decode(chiffre.ciphertextBase64),
              allowMalformed: true),
          isNot(contains('mot-de-passe')));
    });

    test('produit un chiffré différent à chaque appel', () async {
      final a = await MessageCipher.encrypt('Bonjour', secret);
      final b = await MessageCipher.encrypt('Bonjour', secret);

      expect(a.ciphertextBase64, isNot(equals(b.ciphertextBase64)),
          reason: 'le nonce doit changer à chaque chiffrement');
      expect(a.nonceBase64, isNot(equals(b.nonceBase64)));
    });

    test('refuse un déchiffrement avec le mauvais secret', () async {
      final chiffre = await MessageCipher.encrypt('Secret', secret);
      final autre = await IdentityKeyPair.generate();
      final mauvais = await deriveSharedSecret(
        privateKeyBase64: autre.privateKeyBase64,
        peerPublicKeyBase64: autre.publicKeyBase64,
      );

      await expectLater(
        MessageCipher.decrypt(chiffre, mauvais),
        throwsA(anything),
      );
    });

    test('détecte un chiffré altéré', () async {
      final chiffre = await MessageCipher.encrypt('Intact', secret);

      // Un octet retourné dans le chiffré : le MAC doit le voir.
      final octets = base64Decode(chiffre.ciphertextBase64);
      octets[0] ^= 0xFF;
      final altere = EncryptedMessage(
        ciphertextBase64: base64Encode(octets),
        nonceBase64: chiffre.nonceBase64,
        macBase64: chiffre.macBase64,
      );

      await expectLater(
        MessageCipher.decrypt(altere, secret),
        throwsA(anything),
        reason: "c'est ce que le MAC de AES-GCM garantit",
      );
    });

    test('préserve les caractères accentués et les emoji', () async {
      const message = 'Été — çà et là 🔐';
      final chiffre = await MessageCipher.encrypt(message, secret);

      expect(await MessageCipher.decrypt(chiffre, secret), equals(message));
    });

    test('survit à un aller-retour JSON', () async {
      final chiffre = await MessageCipher.encrypt('Transporté', secret);
      final restaure =
          EncryptedMessage.fromJson(jsonDecode(jsonEncode(chiffre.toJson()))
              as Map<String, dynamic>);

      expect(await MessageCipher.decrypt(restaure, secret),
          equals('Transporté'));
    });
  });
}
