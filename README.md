# API Central SDK for Flutter

SDK Dart/Flutter pour l'API Central S2S.

## Packages

| Package | Description |
|---|---|
| `api_central_sdk` | Core Dart pur : auth, users, messaging, notifications, support, live, realtime |
| `api_central_calls` | Appels audio/vidéo WebRTC (phase 5) |
| `api_central_encryption` | Chiffrement E2E : X25519 et AES-GCM (Dart pur) |
| `api_central_provider` | ChangeNotifier prêts à brancher (phase 7) |

## Appels audio/vidéo

`api_central_calls` ajoute la couche média WebRTC :

```yaml
dependencies:
  api_central_calls:
    path: ../api-central-sdk-flutter/packages/api_central_calls
```

Les permissions caméra et micro sont à la charge de l'application, et doivent
être accordées **avant** de démarrer un appel :

- **iOS** — `NSCameraUsageDescription` et `NSMicrophoneUsageDescription` dans `Info.plist`
- **Android** — `CAMERA` et `RECORD_AUDIO` dans `AndroidManifest.xml`

```dart
final manager = CallManager(sdk: sdk, userId: monId);

await sdk.connectRealtime();          // la signalisation passe par le WebSocket
final call = await sdk.calls.initiate(
  participantIds: [autreUtilisateur],
  callType: CallType.video,
);
await manager.start(call.id, callType: CallType.video);

manager.remoteStreams.listen((flux) => renderer.srcObject = flux);
```

La connexion temps réel doit être ouverte **avant** l'appel : sans elle, les
offres SDP et les candidats ICE n'arrivent jamais.

## Chiffrement de bout en bout

`api_central_encryption` fournit les primitives ; le module `encryption` du core
publie les clés publiques. Le package est en Dart pur — utilisable hors Flutter.

```dart
// À la première configuration : générer et publier
final material = await E2eKeyMaterial.generate(prekeyCount: 100);
await sdk.encryption.registerKeys(
  identityKey: material.identity.publicKeyBase64,
  signedPrekeyId: material.signedPreKey.keyId,
  signedPrekey: material.signedPreKey.publicKeyBase64,
  signedPrekeySignature: material.signedPreKey.signatureBase64,
  prekeys: material.publicPreKeys(),
);

// Ouvrir une session avec un pair
final bundle = await sdk.encryption.getPreKeyBundle(peerId);
final secret = await deriveSharedSecret(
  privateKeyBase64: material.identity.privateKeyBase64,
  peerPublicKeyBase64: bundle.identityKey,
);

// Chiffrer un message
final chiffre = await MessageCipher.encrypt('Bonjour', secret);
await sdk.messaging.sendMessage(convId,
    senderId: monId, content: jsonEncode(chiffre.toJson()));
```

Trois points à connaître :

- **Les clés privées ne quittent jamais l'application.** Le SDK ne les stocke
  pas : à vous de les persister, dans le trousseau de la plateforme de
  préférence.
- **`getPreKeyBundle` consomme une prekey du pair.** Surveillez votre propre
  stock avec `getPrekeysCount` et réapprovisionnez sous une vingtaine.
- **Le double ratchet n'est pas implémenté.** Chaque message est chiffré avec le
  secret de session, sans renouvellement par message : la compromission d'une
  clé expose l'historique de la session. Cela empêche le serveur de lire les
  messages, mais n'offre pas de confidentialité persistante complète.

## Authentification

Les credentials de l'API Central S2S (`api_key`, `api_secret`) restent sur le backend
de chaque application et ne sont **jamais** embarqués dans une app mobile. Le SDK obtient
un token utilisateur via un `TokenProvider` fourni par l'application.

Voir `docs/superpowers/specs/2026-08-02-sdk-flutter-design.md` dans le dépôt
`api-central-s2s-rust`.

## Développement

```bash
cd packages/api_central_sdk
dart pub get
dart test
dart analyze
```
