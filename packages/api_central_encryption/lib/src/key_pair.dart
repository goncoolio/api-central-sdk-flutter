import 'dart:convert';

import 'package:api_central_sdk/api_central_sdk.dart' show PreKeyInfo;
import 'package:cryptography/cryptography.dart';

final _x25519 = X25519();
final _ed25519 = Ed25519();

/// Paire de clés d'identité, stable pour la durée de vie de l'installation.
class IdentityKeyPair {
  const IdentityKeyPair({
    required this.publicKeyBase64,
    required this.privateKeyBase64,
  });

  /// Restaure une paire persistée par l'application.
  factory IdentityKeyPair.fromBase64({
    required String publicKeyBase64,
    required String privateKeyBase64,
  }) =>
      IdentityKeyPair(
        publicKeyBase64: publicKeyBase64,
        privateKeyBase64: privateKeyBase64,
      );

  final String publicKeyBase64;
  final String privateKeyBase64;

  static Future<IdentityKeyPair> generate() async {
    final pair = await _x25519.newKeyPair();
    final priv = await pair.extractPrivateKeyBytes();
    final pub = await pair.extractPublicKey();
    return IdentityKeyPair(
      publicKeyBase64: base64Encode(pub.bytes),
      privateKeyBase64: base64Encode(priv),
    );
  }
}

/// Clé signée, à faire tourner périodiquement.
class SignedPreKeyPair {
  const SignedPreKeyPair({
    required this.keyId,
    required this.publicKeyBase64,
    required this.privateKeyBase64,
    required this.signatureBase64,
  });

  final int keyId;
  final String publicKeyBase64;
  final String privateKeyBase64;

  /// Signature de la clé publique, qui prouve au pair qu'elle vient bien de
  /// son interlocuteur.
  final String signatureBase64;

  static Future<SignedPreKeyPair> generate({required int keyId}) async {
    final pair = await _x25519.newKeyPair();
    final priv = await pair.extractPrivateKeyBytes();
    final pub = await pair.extractPublicKey();

    final signingKey = await _ed25519.newKeyPair();
    final signature = await _ed25519.sign(pub.bytes, keyPair: signingKey);

    return SignedPreKeyPair(
      keyId: keyId,
      publicKeyBase64: base64Encode(pub.bytes),
      privateKeyBase64: base64Encode(priv),
      signatureBase64: base64Encode(signature.bytes),
    );
  }
}

/// Prekey à usage unique, consommée à l'ouverture d'une session.
class OneTimePreKeyPair {
  const OneTimePreKeyPair({
    required this.prekeyId,
    required this.publicKeyBase64,
    required this.privateKeyBase64,
  });

  final int prekeyId;
  final String publicKeyBase64;
  final String privateKeyBase64;

  static Future<OneTimePreKeyPair> generate({required int prekeyId}) async {
    final pair = await _x25519.newKeyPair();
    final priv = await pair.extractPrivateKeyBytes();
    final pub = await pair.extractPublicKey();
    return OneTimePreKeyPair(
      prekeyId: prekeyId,
      publicKeyBase64: base64Encode(pub.bytes),
      privateKeyBase64: base64Encode(priv),
    );
  }
}

/// Jeu complet de clés pour une installation.
///
/// L'application persiste ce matériel — le SDK ne le stocke nulle part — et
/// n'en publie que la partie publique.
class E2eKeyMaterial {
  const E2eKeyMaterial({
    required this.identity,
    required this.signedPreKey,
    required this.prekeys,
  });

  final IdentityKeyPair identity;
  final SignedPreKeyPair signedPreKey;
  final List<OneTimePreKeyPair> prekeys;

  static Future<E2eKeyMaterial> generate({int prekeyCount = 100}) async {
    final identity = await IdentityKeyPair.generate();
    final signed = await SignedPreKeyPair.generate(keyId: 1);
    final prekeys = <OneTimePreKeyPair>[];
    for (var i = 0; i < prekeyCount; i++) {
      prekeys.add(await OneTimePreKeyPair.generate(prekeyId: i + 1));
    }
    return E2eKeyMaterial(
      identity: identity,
      signedPreKey: signed,
      prekeys: prekeys,
    );
  }

  /// Partie publique des prekeys, au format attendu par `registerKeys`.
  List<PreKeyInfo> publicPreKeys() => prekeys
      .map((p) => PreKeyInfo(prekeyId: p.prekeyId, prekey: p.publicKeyBase64))
      .toList();
}

/// Calcule le secret partagé entre une clé privée et la clé publique d'un pair.
///
/// Les deux côtés obtiennent la même valeur, ce qui fonde tout l'échange.
Future<String> deriveSharedSecret({
  required String privateKeyBase64,
  required String peerPublicKeyBase64,
}) async {
  final keyPair = await _x25519.newKeyPairFromSeed(
    base64Decode(privateKeyBase64),
  );
  final peer = SimplePublicKey(
    base64Decode(peerPublicKeyBase64),
    type: KeyPairType.x25519,
  );

  final secret = await _x25519.sharedSecretKey(
    keyPair: keyPair,
    remotePublicKey: peer,
  );
  return base64Encode(await secret.extractBytes());
}
