/// Appels audio et vidéo WebRTC pour l'API Central S2S.
///
/// Ce package ajoute la couche média au SDK. Il dépend de `flutter_webrtc`,
/// qui embarque du code natif : une application qui ne passe pas d'appels n'a
/// pas à l'installer.
library;

export 'package:flutter_webrtc/flutter_webrtc.dart'
    show MediaStream, RTCVideoRenderer, RTCVideoView;

export 'src/call_manager.dart';
export 'src/call_mode.dart';
