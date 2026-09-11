/// Appels audio et vidéo pour l'API Central S2S.
///
/// Ce package ajoute la couche média au SDK : WebRTC direct
/// (`flutter_webrtc`) pour les appels à deux, SFU LiveKit (`livekit_client`)
/// dès trois participants. Tous deux embarquent du code natif : une
/// application qui ne passe pas d'appels n'a pas à installer ce package.
library;

export 'package:flutter_webrtc/flutter_webrtc.dart'
    show MediaStream, RTCVideoRenderer, RTCVideoView;

export 'src/call_manager.dart';
export 'src/call_mode.dart';
export 'src/group_call_manager.dart';
export 'src/group_call_participant.dart';
