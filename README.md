# API Central SDK for Flutter

SDK Dart/Flutter pour l'API Central S2S.

## Packages

| Package | Version | Description |
|---|---|---|
| `api_central_sdk` | 0.2.0 | Core Dart pur : auth, users, messaging, notifications, support, live, signalisation des appels, realtime |
| `api_central_calls` | 0.2.0 | Média des appels (Flutter ≥ 3.38) : WebRTC direct à deux, SFU LiveKit en groupe |
| `api_central_encryption` | 0.1.0 | Chiffrement E2E : X25519 et AES-GCM (Dart pur) |
| `api_central_provider` | 0.1.0 | ChangeNotifier prêts à brancher (Flutter) |

Chaque package décrit ses évolutions dans son `CHANGELOG.md`.

## Appels audio/vidéo

`api_central_calls` ajoute la couche média au SDK. Il exige **Flutter 3.38 ou
plus** : `livekit_client` 2.12, qui porte les appels de groupe, le demande.

```yaml
dependencies:
  api_central_calls:
    path: ../api-central-sdk-flutter/packages/api_central_calls
```

### P2P à deux, LiveKit en groupe : `CallSession`

`CallSession` est le point d'entrée. Au démarrage de l'appel, `start` (côté
appelant) et `accept` (côté appelé) chargent l'appel et choisissent la couche
média d'après son nombre de participants, initiateur compris :

| Participants | `CallMode` | Gestionnaire | Média |
|---|---|---|---|
| 2 | `p2p` | `CallManager` | WebRTC direct entre les deux appareils, relayé par TURN au besoin |
| 3 ou plus | `group` | `GroupCallManager` | SFU LiveKit : chacun publie une fois, le serveur relaie à tous |

Tous les participants comptent, quel que soit leur statut, y compris un invité
qui a refusé : l'appelant et ceux qui décrochent aboutissent au même mode.

```dart
final session = CallSession(sdk: sdk, userId: monId);
final realtime = await sdk.connectRealtime(); // avant l'appel : voir « Prérequis »

// Côté appelant
final call = await sdk.calls.initiate(
  participantIds: [bob, carol], // avec vous, trois participants : LiveKit
  callType: CallType.video,
);
// Au premier décroché : voir « Limites à connaître »
await realtime.on<CallAnsweredEvent>().firstWhere((e) => e.callId == call.id);
final mode = await session.start(call.id, callType: CallType.video);

// Côté appelé, quand l'utilisateur décroche l'appel signalé par call_incoming
await session.accept(callId);

session.states.listen(afficherEtat); // connecting, connected, ended, failed
await session.setMicrophoneEnabled(false);
await session.switchCamera();
await session.hangUp();
await session.dispose(); // quand l'écran d'appel est détruit
```

`hangUp` termine l'appel pour les deux participants en P2P, mais ne fait que
**quitter** un appel de groupe, qui continue pour les autres. Pour terminer un
appel de groupe pour tous, appelez `sdk.calls.end` : chaque appareil reçoit
alors `call_ended` et quitte la room.

Le média distant se lit sur le gestionnaire du mode choisi :

```dart
switch (session.mode) {
  case CallMode.p2p:
    session.p2pManager.remoteStreams.listen((flux) => renderer.srcObject = flux);
  case CallMode.group:
    session.groupManager.participantsChanges.listen((participants) {
      for (final p in participants) {
        // p.userId, p.isMicrophoneEnabled, p.isCameraEnabled, et
        // p.videoStream : un MediaStream pour un RTCVideoRenderer
      }
    });
  case null:
    break; // pas encore d'appel
}
```

L'aperçu local est `session.localStream`. En groupe, LiveKit le remplace quand
la caméra est rétablie ou retournée : relisez-le après `setCameraEnabled` et
`switchCamera`.

`CallManager` et `GroupCallManager` restent utilisables seuls. `CallManager`
refuse désormais les appels de trois participants ou plus : `start` et `accept`
lèvent `UnsupportedError` avant tout accès au média, là où il se connectait
auparavant au seul premier autre participant.

### Limites à connaître

- **En P2P, l'appelant lance le média après le décroché.** L'API ne délivre
  l'offre SDP qu'en temps réel, sans jamais la rejouer, et `CallManager` ne
  l'écoute côté appelé qu'à partir d'`accept` : une offre envoyée pendant la
  sonnerie serait perdue. Attendez donc `call_answered` avant `session.start`,
  comme dans l'exemple ci-dessus, et abandonnez l'attente sur `call_declined` ou
  `call_ended`. LiveKit, lui, accepte les arrivées dans n'importe quel ordre.
- **Le mode est fixé au démarrage de l'appel.** Un participant ajouté ensuite
  (`calls.addParticipant`) à un appel à deux déjà établi en P2P ne le fait pas
  basculer sur LiveKit : à son `accept`, il rejoindrait seul la room LiveKit,
  sans jamais retrouver les deux autres. Invitez tous les participants dès
  `calls.initiate`.
- **L'URL du SFU vient toujours de l'API.** `GroupCallManager` se connecte à
  l'URL et avec le jeton que renvoie `GET /calls/{id}/token`
  (`calls.getLiveKitToken`), jamais à une URL codée en dur. La route exige un
  token utilisateur, un participant de l'appel, et une API dont LiveKit est
  configuré.
- **En groupe, le SFU voit le média.** En P2P, WebRTC chiffre le média de bout
  en bout, même relayé par TURN. En groupe, le SFU LiveKit déchiffre les flux
  pour les relayer : le chiffrement de bout en bout de LiveKit n'est pas activé,
  et `Call.encryptionEnabled` n'y change rien.

### Prérequis

Les permissions caméra et micro sont à la charge de l'application, et doivent
être accordées **avant** `start` ou `accept` :

- **iOS** — `NSCameraUsageDescription` et `NSMicrophoneUsageDescription` dans
  `Info.plist`, et le mode d'arrière-plan `audio` (`UIBackgroundModes`) pour
  qu'un appel continue quand l'application passe en arrière-plan.
- **Android** — `CAMERA` et `RECORD_AUDIO` dans `AndroidManifest.xml`, plus ce
  que `livekit_client` demande pour les appels de groupe :
  `ACCESS_NETWORK_STATE`, `MODIFY_AUDIO_SETTINGS` et, pour les casques
  Bluetooth, `BLUETOOTH_CONNECT`.

La connexion temps réel doit être ouverte **avant** l'appel : sans elle, les
offres SDP et les candidats ICE d'un appel P2P n'arrivent jamais, et un
appareil en groupe ne reçoit pas `call_ended` (l'API ne ferme jamais la room
LiveKit elle-même).

## Directs (live streaming)

Le SDK gère le cycle de vie des directs et tout ce qui les entoure
(spectateurs, commentaires, réactions, événements temps réel), mais pas la
vidéo : l'hôte branche **son propre encodeur RTMP**, les spectateurs **leur
propre lecteur HLS**.

```dart
// Hôte
final direct = await sdk.live.createStream(hostId: monId, title: 'Mon direct');
await sdk.live.startStream(direct.id); // le direct passe « live »
await monEncodeurRtmp.publier(direct.rtmpUrl!); // l'URL exacte renvoyée par l'API
// ...
await sdk.live.endStream(direct.id);

// Spectateur
final direct = await sdk.live.getStream(streamId);
await monLecteurHls.ouvrir(direct.playbackUrl!); // flux HLS (.m3u8)
await sdk.live.joinStream(streamId, userId: monId);
```

- **Publiez avec l'URL `rtmpUrl` exacte que renvoie l'API**, sans jamais la
  reconstruire à partir de `streamKey` : son format peut changer côté serveur,
  et le SDK la traite comme une chaîne opaque, tout comme `playbackUrl`. Dans un
  outil qui demande un serveur et une clé, comme OBS, le serveur est l'URL
  jusqu'à `/live` inclus, et la clé est tout ce qui suit `/live/`.
- **`rtmpUrl` et `streamKey` ne concernent que l'hôte** : l'API ne les renvoie
  qu'à lui, ou à un token d'application. Les spectateurs n'ont besoin que de
  `playbackUrl`.
- **Publier ne suffit pas à démarrer le direct** : appelez `startStream` pour le
  passer « live », puis `endStream`. Le serveur RTMP refuse une clé inconnue, ou
  un direct terminé.
- Spectateurs, commentaires et réactions arrivent en temps réel par
  `sdk.realtime` : `onStreamViewerCount`, `onStreamCommentNew`,
  `onStreamReactionBurst`, `onStreamEnded`.

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

## État prêt à brancher

`api_central_provider` fournit des `ChangeNotifier` pour les usages courants :

```dart
final conversations = ConversationsNotifier(sdk: sdk, userId: monId);
await sdk.connectRealtime();
await conversations.load();
conversations.bindRealtime();   // après connectRealtime, pas avant

ChangeNotifierProvider.value(value: conversations, child: MonEcran());
```

| Notifier | Ce qu'il tient à jour |
|---|---|
| `ConversationsNotifier` | liste triée, non-lus, remontée sur message entrant |
| `MessagesNotifier` | messages d'une conversation, pagination, envoi |
| `NotificationsNotifier` | liste et compteur pour un badge |
| `ConnectionNotifier` | état du WebSocket |

Trois comportements à connaître :

- **Un échec réseau ne vide pas l'état.** `errorMessage` est renseigné, les
  données déjà chargées restent affichées.
- **`bindRealtime()` s'appelle après `connectRealtime()`** : sans WebSocket
  ouvert, il ne s'abonne à rien et reste silencieux.
- **Aucune notification après `dispose()`.** Une requête qui se termine sur un
  écran déjà fermé ne fait pas planter l'application.

Les directs et les appels n'ont pas de notifier : leur état dépend trop de
chaque application (lecteur vidéo, écran d'appel) pour qu'un générique aide.

## Authentification

Les credentials de l'API Central S2S (`api_key`, `api_secret`) restent sur le backend
de chaque application et ne sont **jamais** embarqués dans une app mobile. Le SDK obtient
un token utilisateur via un `TokenProvider` fourni par l'application.

Voir `docs/superpowers/specs/2026-08-02-sdk-flutter-design.md` dans le dépôt
`api-central-s2s-rust`.

### Ce que borne un token utilisateur

L'API n'identifie plus l'appelant d'après le corps de la requête : avec un token
utilisateur, elle applique ses propres limites. Les erreurs ci-dessous sont donc
normales et ne signalent pas un bug du SDK.

- **Messagerie** — une conversation dont l'utilisateur du token n'est pas
  participant renvoie 403 ; une conversation inconnue ou appartenant à une autre
  application renvoie 404. Cela vaut pour la lecture comme pour l'envoi, les
  accusés de lecture et les pièces jointes.
- **Notifications** — `markAsRead` ne marque que les notifications de
  l'utilisateur du token : celles d'un autre utilisateur ne sont pas comptées
  dans `updatedCount`, sans erreur. `delete` renvoie 404 sur une notification
  qui ne lui appartient pas.
- **Présence** — `users.getPresence` renvoie 404 pour un utilisateur d'une autre
  application, et `subscribePresence` écarte silencieusement les identifiants
  hors application. Les seuls statuts produits sont `online` et `offline`,
  dérivés des connexions WebSocket ouvertes ; `updatePresence` se contente de
  rafraîchir la date de dernière activité et renvoie le statut envoyé.
- **Annuaire** — `users.listUsers` et `users.getUser` laissent `email` et
  `metadata` à `null` pour les autres utilisateurs ; ces champs ne sont
  renseignés que pour l'utilisateur du token. Un token d'application, lui, voit
  tout l'annuaire de son application.

## Développement et tests

Chaque package se teste à part :

```bash
# Core, Dart pur
cd packages/api_central_sdk
dart pub get
dart test -x integration   # unitaires et contrat, sans serveur
dart analyze

# Chiffrement, Dart pur
cd packages/api_central_encryption
dart pub get && dart test && dart analyze

# Packages Flutter
cd packages/api_central_calls
flutter pub get && flutter test && flutter analyze

cd packages/api_central_provider
flutter pub get && flutter test && flutter analyze
```

- **Tests d'intégration** (`api_central_sdk/test/integration/`, tag
  `integration`) : ils parlent à une API locale sur `localhost:3004`
  (`http://localhost:3004/s2s/v1` et `ws://localhost:3004/events`), avec
  l'application de test déclarée en tête de `realtime_live_test.dart`.
  `-x integration` les exclut ; `dart test -t integration` les lance seuls, une
  fois l'API démarrée.
- **Média** : les tests d'`api_central_calls` remplacent LiveKit par une room
  simulée, et le P2P s'y arrête à la création de la `RTCPeerConnection`, faute
  de plugin natif. La négociation WebRTC et la connexion au SFU se valident sur
  deux appareils réels.
