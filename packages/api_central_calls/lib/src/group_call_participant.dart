import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_webrtc/flutter_webrtc.dart' show MediaStream;

/// Participant distant d'un appel de groupe, tel que la room LiveKit le voit.
///
/// Son audio est joué automatiquement : seule la vidéo est à afficher.
@immutable
class GroupCallParticipant {
  const GroupCallParticipant({
    required this.userId,
    this.isMicrophoneEnabled = false,
    this.isCameraEnabled = false,
    this.videoStream,
  });

  /// Id de l'utilisateur dans l'API : l'identité LiveKit que lui donne son
  /// jeton, la même que `CallParticipant.user.id`.
  final String userId;

  /// Micro publié et actif.
  final bool isMicrophoneEnabled;

  /// Caméra publiée et active.
  final bool isCameraEnabled;

  /// Flux de sa caméra, à passer à un `RTCVideoRenderer` comme ceux de
  /// `CallManager.remoteStreams`. `null` tant que sa vidéo n'est pas reçue.
  ///
  /// Une caméra coupée garde son flux : fiez-vous à [isCameraEnabled] pour
  /// afficher un avatar à la place.
  final MediaStream? videoStream;

  @override
  bool operator ==(Object other) =>
      other is GroupCallParticipant &&
      other.userId == userId &&
      other.isMicrophoneEnabled == isMicrophoneEnabled &&
      other.isCameraEnabled == isCameraEnabled &&
      identical(other.videoStream, videoStream);

  @override
  int get hashCode =>
      Object.hash(userId, isMicrophoneEnabled, isCameraEnabled, videoStream);

  @override
  String toString() =>
      'GroupCallParticipant(userId: $userId, micro: $isMicrophoneEnabled, '
      'caméra: $isCameraEnabled, vidéo reçue: ${videoStream != null})';
}
