# api_central_calls

Couche média des appels de l'API Central S2S, pour Flutter. Le core
`api_central_sdk` gère la signalisation ; ce package fait circuler l'audio et
la vidéo :

- **`CallSession`**, le point d'entrée : au démarrage de l'appel, il choisit le
  P2P à deux participants, et LiveKit dès trois ;
- **`CallManager`** : WebRTC direct entre deux appareils (`flutter_webrtc`) ;
- **`GroupCallManager`** : SFU LiveKit pour les appels de groupe
  (`livekit_client`).

## Prérequis

- **Flutter 3.38** ou plus (Dart 3.11) : `livekit_client` 2.12 l'exige.
- Un token **utilisateur** : `GET /calls/{id}/token`, notamment, refuse les
  tokens d'application.
- Pour les appels de groupe, une API dont la section `[livekit]` est
  configurée : sinon la route du jeton répond 400, et le démarrage échoue avec
  une `ValidationException`.
- Les permissions caméra et micro accordées, et la connexion temps réel
  ouverte, avant l'appel. Le README à la racine du dépôt détaille les
  déclarations iOS et Android.

## Utilisation

```dart
final session = CallSession(sdk: sdk, userId: monId);
await sdk.connectRealtime();

final mode = await session.start(callId, callType: CallType.video); // ou accept(callId)
session.states.listen(afficherEtat);

if (mode == CallMode.group) {
  session.groupManager.participantsChanges.listen(afficherParticipants);
} else {
  session.p2pManager.remoteStreams.listen(afficherFluxDistant);
}

await session.hangUp();
await session.dispose();
```

## Deux modes, une session

| | P2P (`CallManager`) | Groupe (`GroupCallManager`) |
|---|---|---|
| Participants | 2 | 3 ou plus |
| Média distant | `remoteStreams` (`MediaStream`) | `participants` et `participantsChanges` (`GroupCallParticipant.videoStream`) |
| `hangUp` de la session | termine l'appel pour les deux (`calls.end`) | quitte l'appel, qui continue (`calls.leave`) |
| Micro, caméra | coupés localement et signalés à l'API | coupés dans la room LiveKit et signalés à l'API |
| `call_ended` du serveur | raccroche | quitte la room, sans rappeler l'API |
| Confidentialité du média | chiffré de bout en bout (DTLS-SRTP) | déchiffré par le SFU pour être relayé |

- **La signalisation P2P passe par le WebSocket.** Offre, réponse et candidats
  ICE circulent en `call_offer`, `call_answer` et `call_ice_candidate` : les
  routes REST équivalentes de l'API ne relaient rien au pair. `start` et
  `accept` lèvent donc `StateError` si `connectRealtime` n'a pas été appelé.
  Les candidats sont encodés en JSON dans le champ `candidate`, comme dans le
  SDK JS, pour conserver `sdpMid` et `sdpMLineIndex`.
- **En P2P, l'appelant démarre après le décroché.** L'offre SDP n'est délivrée
  qu'en temps réel, et l'appelé ne l'écoute qu'à partir d'`accept` : côté
  appelant, attendez `call_answered` avant `start`.
- **Le mode est fixé au démarrage.** Un participant ajouté à un appel à deux
  déjà établi en P2P ne le fait pas basculer sur LiveKit : il rejoindrait seul
  la room LiveKit. Invitez tout le monde dès `calls.initiate`.
- **`CallManager` refuse les appels de groupe** : dès trois participants,
  `start` et `accept` lèvent `UnsupportedError` avant tout accès au média.
- **Connexion au SFU perdue** : `GroupCallManager` passe en `failed` et libère
  la room, mais garde l'appel, que l'API croit toujours en cours pour cet
  utilisateur. Appelez `hangUp` (ou `leave`) pour la prévenir.
- **Aperçu local en groupe** : LiveKit remplace le flux de la caméra quand elle
  est rétablie ou retournée ; relisez `localStream` après `setCameraEnabled` et
  `switchCamera`.
- **Une seule source pour le SFU** : l'URL et le jeton viennent de
  `calls.getLiveKitToken`. Rien n'est codé en dur.

## Tests

```bash
flutter pub get
flutter test
flutter analyze
```

Les tests remplacent LiveKit par une room simulée
(`test/support/fake_group_call_room.dart`) et l'API par un adaptateur Dio
(`test/support/fake_http.dart`). Ils couvrent le choix du mode, le jeton, la
publication, les appels à l'API et les états. La négociation WebRTC et la
connexion au SFU demandent deux appareils réels : elles se valident à la main.
