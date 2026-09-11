import 'package:flutter_webrtc/flutter_webrtc.dart' show MediaStream;

import 'group_call_participant.dart';

/// Ce qui arrive à la room d'un appel de groupe, vu de `GroupCallManager`.
enum GroupCallRoomEvent {
  /// Un participant distant est arrivé, parti, ou a changé ses pistes : relire
  /// [GroupCallRoom.remoteParticipants].
  participantsChanged,

  /// Connexion au SFU interrompue, reconnexion en cours.
  reconnecting,

  /// Reconnexion aboutie.
  reconnected,

  /// Room fermée côté serveur, ou utilisateur retiré de la room : l'appel est
  /// terminé pour cet appareil.
  disconnected,

  /// Connexion perdue pour de bon : l'API croit l'utilisateur toujours dans
  /// l'appel.
  connectionLost,
}

/// Room LiveKit d'un appel de groupe, réduite à ce dont `GroupCallManager` a
/// besoin.
///
/// Interface interne : elle isole `livekit_client` pour que le gestionnaire se
/// teste avec une room simulée. `LiveKitGroupCallRoom` en est la seule
/// implémentation réelle.
abstract interface class GroupCallRoom {
  /// Événements de la room.
  Stream<GroupCallRoomEvent> get events;

  /// Participants distants, dans leur ordre d'arrivée.
  List<GroupCallParticipant> get remoteParticipants;

  /// Flux de la caméra locale, `null` tant qu'elle n'est pas publiée.
  MediaStream? get localVideoStream;

  /// Rejoint la room du SFU à [url], avec le jeton [token] émis par l'API.
  Future<void> connect(String url, String token);

  /// Publie, coupe ou rétablit le micro local.
  Future<void> setMicrophoneEnabled(bool enabled);

  /// Publie, coupe ou rétablit la caméra locale.
  Future<void> setCameraEnabled(bool enabled);

  /// Bascule entre caméra avant et arrière.
  Future<void> switchCamera();

  /// Quitte la room.
  Future<void> disconnect();

  /// Libère les ressources : la room n'est plus utilisable ensuite.
  Future<void> dispose();
}
