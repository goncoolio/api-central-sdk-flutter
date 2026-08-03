import 'dart:convert';

import 'package:cryptography/cryptography.dart';

final _aesGcm = AesGcm.with256bits();

/// Message chiffré, prêt à transiter dans le champ `content` d'un message.
///
/// Les trois parties sont nécessaires au déchiffrement : le nonce garantit
/// qu'un même texte ne produit jamais deux fois le même chiffré, le MAC
/// détecte toute altération.
class EncryptedMessage {
  const EncryptedMessage({
    required this.ciphertextBase64,
    required this.nonceBase64,
    required this.macBase64,
  });

  factory EncryptedMessage.fromJson(Map<String, dynamic> json) =>
      EncryptedMessage(
        ciphertextBase64: json['ciphertext'] as String,
        nonceBase64: json['nonce'] as String,
        macBase64: json['mac'] as String,
      );

  final String ciphertextBase64;
  final String nonceBase64;
  final String macBase64;

  Map<String, dynamic> toJson() => {
        'ciphertext': ciphertextBase64,
        'nonce': nonceBase64,
        'mac': macBase64,
      };
}

/// Chiffrement symétrique AES-GCM des messages.
///
/// Le secret partagé vient de `deriveSharedSecret`. Cette classe ne gère aucun
/// état de session : chaque message est chiffré indépendamment.
class MessageCipher {
  const MessageCipher._();

  static Future<EncryptedMessage> encrypt(
    String plaintext,
    String sharedSecretBase64,
  ) async {
    final key = SecretKey(base64Decode(sharedSecretBase64));
    final box = await _aesGcm.encrypt(
      utf8.encode(plaintext),
      secretKey: key,
    );

    return EncryptedMessage(
      ciphertextBase64: base64Encode(box.cipherText),
      nonceBase64: base64Encode(box.nonce),
      macBase64: base64Encode(box.mac.bytes),
    );
  }

  static Future<String> decrypt(
    EncryptedMessage message,
    String sharedSecretBase64,
  ) async {
    final key = SecretKey(base64Decode(sharedSecretBase64));
    final box = SecretBox(
      base64Decode(message.ciphertextBase64),
      nonce: base64Decode(message.nonceBase64),
      mac: Mac(base64Decode(message.macBase64)),
    );

    return utf8.decode(await _aesGcm.decrypt(box, secretKey: key));
  }
}
