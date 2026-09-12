import 'dart:convert';

import 'package:flutter/foundation.dart' show internal;
import 'package:flutter_webrtc/flutter_webrtc.dart';

/// Encode un candidat ICE pour la signalisation WebSocket.
///
/// L'événement `call_ice_candidate` de l'API ne transporte qu'un champ texte
/// `candidate`. Le SDK JS y place le candidat complet en JSON : sans cela,
/// `sdpMid` et `sdpMLineIndex` seraient perdus, et un navigateur refuse un
/// candidat dépourvu des deux. Ce SDK suit la même convention, pour que les
/// clients Flutter et web s'appellent entre eux.
@internal
String encoderCandidat(RTCIceCandidate candidat) => jsonEncode({
  'candidate': candidat.candidate ?? '',
  'sdpMid': candidat.sdpMid,
  'sdpMLineIndex': candidat.sdpMLineIndex,
});

/// Décode un candidat reçu.
///
/// Accepte aussi une simple ligne de candidat, pour rester compatible avec un
/// client qui n'encoderait pas en JSON.
@internal
RTCIceCandidate decoderCandidat(String charge) {
  try {
    final decode = jsonDecode(charge);
    if (decode is Map<String, dynamic> && decode['candidate'] is String) {
      return RTCIceCandidate(
        decode['candidate'] as String,
        decode['sdpMid'] as String?,
        (decode['sdpMLineIndex'] as num?)?.toInt(),
      );
    }
  } on FormatException {
    // Ligne brute : ni mid ni index à en tirer.
  }
  return RTCIceCandidate(charge, null, null);
}
