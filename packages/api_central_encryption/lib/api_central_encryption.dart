/// Chiffrement de bout en bout pour l'API Central S2S.
///
/// Fournit la génération des clés X25519, l'accord de clé et le chiffrement
/// AES-GCM des messages. Le paquet est en Dart pur : il fonctionne aussi bien
/// dans une application Flutter que dans un service Dart.
///
/// Le protocole double ratchet n'est pas implémenté — voir le plan de phase 6.
library;

export 'src/key_pair.dart';
export 'src/message_cipher.dart';
