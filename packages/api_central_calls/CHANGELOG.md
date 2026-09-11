## 0.2.0

- **Appels de groupe par LiveKit.** `GroupCallManager` rejoint la room LiveKit
  de l'appel avec l'URL et le jeton que renvoie `calls.getLiveKitToken`, publie
  le micro (et la caméra pour un appel vidéo), expose les participants distants
  (`GroupCallParticipant`), et coupe micro et caméra dans la room comme côté
  API. `leave` quitte l'appel sans le terminer pour les autres ; `call_ended`
  libère la room.
- **Choix automatique du mode.** `CallSession` charge l'appel au démarrage
  (`start`, `accept`) et le confie à `CallManager` à deux participants, à
  `GroupCallManager` dès trois (`CallMode.forCall`). Le mode est fixé au
  démarrage : un participant ajouté ensuite à un appel P2P n'est pas basculé
  sur LiveKit.
- **`CallManager` refuse les appels de groupe.** Dès trois participants, `start`
  et `accept` lèvent `UnsupportedError` avant tout accès au média. Il ne
  reliait jusque-là que le premier autre participant, sans rien signaler. Son
  API publique ne change pas.
- **Flutter 3.38 minimum** (au lieu de 3.24), à cause de la nouvelle dépendance
  `livekit_client` ^2.12.0. Celle-ci épingle `flutter_webrtc` 1.6.0, que la
  contrainte `^1.5.2` admet.
- S'appuie sur `calls.getLiveKitToken`, ajouté dans `api_central_sdk` 0.2.0.
- Documentation : en P2P, l'appelant lance le média après le décroché
  (`call_answered`). L'API ne délivre l'offre SDP qu'en temps réel, et
  l'appelé ne l'écoute qu'à partir d'`accept`.

## 0.1.0

- `CallManager` : appel WebRTC à deux, avec offre et réponse SDP et candidats
  ICE relayés par l'API, serveurs STUN/TURN fournis par l'API, micro, caméra et
  bascule de caméra.
