import 'dart:convert';

import 'package:api_central_encryption/api_central_encryption.dart';
import 'package:test/test.dart';

void main() {
  group('IdentityKeyPair', () {
    test('génère une paire X25519 encodée en base64', () async {
      final pair = await IdentityKeyPair.generate();

      expect(() => base64Decode(pair.publicKeyBase64), returnsNormally);
      expect(() => base64Decode(pair.privateKeyBase64), returnsNormally);
      expect(base64Decode(pair.publicKeyBase64), hasLength(32),
          reason: 'une clé publique X25519 fait 32 octets');
    });

    test('deux générations donnent des clés différentes', () async {
      final a = await IdentityKeyPair.generate();
      final b = await IdentityKeyPair.generate();

      expect(a.privateKeyBase64, isNot(equals(b.privateKeyBase64)));
    });

    test('se restaure depuis du base64', () async {
      final origine = await IdentityKeyPair.generate();
      final restauree = IdentityKeyPair.fromBase64(
        publicKeyBase64: origine.publicKeyBase64,
        privateKeyBase64: origine.privateKeyBase64,
      );

      expect(restauree.publicKeyBase64, equals(origine.publicKeyBase64));
    });
  });

  group('E2eKeyMaterial', () {
    test('produit ce qu attend registerKeys', () async {
      final material = await E2eKeyMaterial.generate(prekeyCount: 5);

      expect(material.prekeys, hasLength(5));
      expect(material.identity.publicKeyBase64, isNotEmpty);
      expect(material.signedPreKey.signatureBase64, isNotEmpty);
      expect(material.prekeys.map((p) => p.prekeyId).toSet(), hasLength(5),
          reason: 'les identifiants de prekey doivent être uniques');
    });

    test('expose les prekeys publiques au format du SDK', () async {
      final material = await E2eKeyMaterial.generate(prekeyCount: 2);
      final publiques = material.publicPreKeys();

      expect(publiques, hasLength(2));
      expect(publiques.first.prekey, isNotEmpty);
    });
  });

  group('Accord de clé', () {
    test('les deux pairs calculent le même secret partagé', () async {
      final alice = await IdentityKeyPair.generate();
      final bob = await IdentityKeyPair.generate();

      final coteAlice = await deriveSharedSecret(
        privateKeyBase64: alice.privateKeyBase64,
        peerPublicKeyBase64: bob.publicKeyBase64,
      );
      final coteBob = await deriveSharedSecret(
        privateKeyBase64: bob.privateKeyBase64,
        peerPublicKeyBase64: alice.publicKeyBase64,
      );

      expect(coteAlice, equals(coteBob),
          reason: "c'est la propriété qui rend Diffie-Hellman utile");
    });

    test('un tiers n obtient pas le même secret', () async {
      final alice = await IdentityKeyPair.generate();
      final bob = await IdentityKeyPair.generate();
      final eve = await IdentityKeyPair.generate();

      final legitime = await deriveSharedSecret(
        privateKeyBase64: alice.privateKeyBase64,
        peerPublicKeyBase64: bob.publicKeyBase64,
      );
      final intrus = await deriveSharedSecret(
        privateKeyBase64: eve.privateKeyBase64,
        peerPublicKeyBase64: bob.publicKeyBase64,
      );

      expect(intrus, isNot(equals(legitime)));
    });
  });
}
