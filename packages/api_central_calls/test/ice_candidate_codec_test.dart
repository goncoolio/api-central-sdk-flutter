import 'dart:convert';

import 'package:api_central_calls/src/ice_candidate_codec.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

/// L'événement `call_ice_candidate` de l'API ne transporte qu'un champ texte :
/// `sdpMid` et `sdpMLineIndex` doivent voyager dedans, sinon le pair refuse le
/// candidat.
void main() {
  test('encoderCandidat transporte le candidat, son mid et son index', () {
    final charge = encoderCandidat(
      RTCIceCandidate('candidate:1 1 UDP 2 1.2.3.4 5 typ host', 'audio', 0),
    );

    expect(
      jsonDecode(charge),
      equals({
        'candidate': 'candidate:1 1 UDP 2 1.2.3.4 5 typ host',
        'sdpMid': 'audio',
        'sdpMLineIndex': 0,
      }),
    );
  });

  test('decoderCandidat relit ce qu encoderCandidat a produit', () {
    final origine = RTCIceCandidate(
      'candidate:2 1 UDP 2 5.6.7.8 9 typ srflx',
      'video',
      1,
    );

    final relu = decoderCandidat(encoderCandidat(origine));

    expect(relu.candidate, equals(origine.candidate));
    expect(relu.sdpMid, equals('video'));
    expect(relu.sdpMLineIndex, equals(1));
  });

  test('decoderCandidat accepte une ligne brute, sans mid ni index', () {
    final relu = decoderCandidat('candidate:3 1 UDP 2 9.9.9.9 1 typ relay');

    expect(relu.candidate, equals('candidate:3 1 UDP 2 9.9.9.9 1 typ relay'));
    expect(relu.sdpMid, isNull);
    expect(relu.sdpMLineIndex, isNull);
  });

  test('decoderCandidat accepte un JSON sans mid ni index', () {
    final relu = decoderCandidat(
      jsonEncode({'candidate': 'candidate:4 1 UDP 2 8.8.8.8 2 typ host'}),
    );

    expect(relu.candidate, contains('typ host'));
    expect(relu.sdpMid, isNull);
    expect(relu.sdpMLineIndex, isNull);
  });
}
