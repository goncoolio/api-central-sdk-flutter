import 'dart:async';

import 'package:flutter_webrtc/flutter_webrtc.dart' show MediaStream;
import 'package:livekit_client/livekit_client.dart' as lk;

import 'group_call_participant.dart';
import 'group_call_room.dart';

/// [GroupCallRoom] adossée à `livekit_client`.
///
/// Seul fichier du package à dépendre de LiveKit, et volontairement réduit à
/// une traduction : les décisions (jeton, publication, appels à l'API, états)
/// reviennent à `GroupCallManager`, testé avec une room simulée. La connexion
/// elle-même demande un SFU et des appareils réels : elle se valide à la main.
class LiveKitGroupCallRoom implements GroupCallRoom {
  LiveKitGroupCallRoom()
    : _room = lk.Room(
        // dynacast : le SFU cesse de relayer les couches vidéo que personne ne
        // regarde. adaptiveStream reste coupé : il se règle sur les widgets
        // VideoTrackRenderer de LiveKit, et suspendrait des flux affichés avec
        // RTCVideoView.
        roomOptions: const lk.RoomOptions(dynacast: true),
      ) {
    _ecouteur = _room.createListener()
      ..on<lk.ParticipantConnectedEvent>((_) => _participantsModifies())
      ..on<lk.ParticipantDisconnectedEvent>((_) => _participantsModifies())
      ..on<lk.TrackPublishedEvent>((_) => _participantsModifies())
      ..on<lk.TrackUnpublishedEvent>((_) => _participantsModifies())
      ..on<lk.TrackSubscribedEvent>((_) => _participantsModifies())
      ..on<lk.TrackUnsubscribedEvent>((_) => _participantsModifies())
      ..on<lk.TrackMutedEvent>((_) => _participantsModifies())
      ..on<lk.TrackUnmutedEvent>((_) => _participantsModifies())
      // Une reprise rapide comme une reconnexion complète se concluent par
      // RoomReconnectedEvent.
      ..on<lk.RoomResumingEvent>(
        (_) => _emettre(GroupCallRoomEvent.reconnecting),
      )
      ..on<lk.RoomReconnectingEvent>(
        (_) => _emettre(GroupCallRoomEvent.reconnecting),
      )
      ..on<lk.RoomReconnectedEvent>(
        (_) => _emettre(GroupCallRoomEvent.reconnected),
      )
      ..on<lk.RoomDisconnectedEvent>((event) {
        final evenement = evenementDeDeconnexion(event.reason);
        if (evenement != null) _emettre(evenement);
      });
  }

  final lk.Room _room;
  late final lk.EventsListener<lk.RoomEvent> _ecouteur;
  final _events = StreamController<GroupCallRoomEvent>.broadcast();

  @override
  Stream<GroupCallRoomEvent> get events => _events.stream;

  @override
  List<GroupCallParticipant> get remoteParticipants => [
    for (final participant in _room.remoteParticipants.values)
      GroupCallParticipant(
        userId: participant.identity,
        isMicrophoneEnabled: participant.isMicrophoneEnabled(),
        isCameraEnabled: participant.isCameraEnabled(),
        videoStream: _fluxCamera(participant),
      ),
  ];

  @override
  MediaStream? get localVideoStream {
    final local = _room.localParticipant;
    return local == null ? null : _fluxCamera(local);
  }

  static MediaStream? _fluxCamera(
    lk.Participant<lk.TrackPublication<lk.Track>> participant,
  ) => participant
      .getTrackPublicationBySource(lk.TrackSource.camera)
      ?.track
      ?.mediaStream;

  @override
  Future<void> connect(String url, String token) async {
    await _room.connect(url, token);
    // Relevé final : le gestionnaire voit ainsi les participants déjà présents
    // dans la room, quel que soit l'ordre des événements de connexion.
    _participantsModifies();
  }

  @override
  Future<void> setMicrophoneEnabled(bool enabled) async {
    await _room.localParticipant?.setMicrophoneEnabled(enabled);
  }

  @override
  Future<void> setCameraEnabled(bool enabled) async {
    await _room.localParticipant?.setCameraEnabled(enabled);
  }

  @override
  Future<void> switchCamera() async {
    final piste = _room.localParticipant
        ?.getTrackPublicationBySource(lk.TrackSource.camera)
        ?.track;
    if (piste is! lk.LocalVideoTrack) return;
    final options = piste.currentOptions;
    final position = options is lk.CameraCaptureOptions
        ? options.cameraPosition
        : lk.CameraPosition.front;
    // Redémarre la piste, donc remplace son MediaStream.
    await piste.setCameraPosition(position.switched());
  }

  @override
  Future<void> disconnect() => _room.disconnect();

  @override
  Future<void> dispose() async {
    await _ecouteur.dispose();
    await _room.dispose();
    await _events.close();
  }

  void _participantsModifies() =>
      _emettre(GroupCallRoomEvent.participantsChanged);

  void _emettre(GroupCallRoomEvent evenement) {
    if (!_events.isClosed) _events.add(evenement);
  }
}

/// Traduit la cause d'une déconnexion LiveKit pour `GroupCallManager`.
///
/// `null` quand la déconnexion vient du gestionnaire lui-même : il a déjà
/// libéré la room. Une room fermée côté serveur, ou quittée sur ordre du
/// serveur, termine l'appel pour cet appareil. Toute autre cause est une
/// connexion perdue, que l'API ignore encore.
GroupCallRoomEvent? evenementDeDeconnexion(lk.DisconnectReason? raison) =>
    switch (raison) {
      lk.DisconnectReason.clientInitiated => null,
      lk.DisconnectReason.roomClosed ||
      lk.DisconnectReason.roomDeleted ||
      lk.DisconnectReason.participantRemoved ||
      lk.DisconnectReason.duplicateIdentity => GroupCallRoomEvent.disconnected,
      _ => GroupCallRoomEvent.connectionLost,
    };
