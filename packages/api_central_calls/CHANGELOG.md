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
- **Signalisation par WebSocket.** L'offre, la réponse et les candidats ICE
  passent par le WebSocket (`call_offer`, `call_answer`, `call_ice_candidate`)
  au lieu des routes REST `offer`, `answer-sdp` et `ice-candidate` : l'API
  stocke celles-ci puis les publie sur un canal sans abonné, sans jamais les
  relayer au pair, si bien qu'un appel à deux ne pouvait pas se connecter. Les
  candidats voyagent en JSON dans le champ `candidate`, avec `sdpMid` et
  `sdpMLineIndex`, comme dans le SDK JS : un candidat privé des deux est refusé
  par les navigateurs. `start` et `accept` exigent donc `connectRealtime` et
  lèvent `StateError` sans lui, avant tout accès au micro.
- **Échec au démarrage.** Une erreur de `start` ou `accept` (permission
  refusée, serveurs ICE injoignables, connexion impossible) libère le média,
  ferme la connexion et passe en `CallManagerState.failed`, au lieu de laisser
  l'état sur `connecting`. L'appel reste connu, pour que `hangUp` le clore
  côté API.
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
