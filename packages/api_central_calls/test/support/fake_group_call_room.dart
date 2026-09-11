import 'dart:async';

import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_calls/src/group_call_room.dart';

/// Room simulée : journalise ce que le gestionnaire lui demande, et laisse le
/// test émettre les événements d'une vraie room LiveKit.
class FakeGroupCallRoom implements GroupCallRoom {
  final _events = StreamController<GroupCallRoomEvent>.broadcast();

  /// Opérations demandées, dans l'ordre : `connect`, `micro:true`...
  final List<String> journal = [];

  /// URL et jeton reçus par [connect].
  String? url;
  String? token;

  /// Si renseignée, [connect] lève cette erreur.
  Object? erreurConnexion;

  /// Si renseigné, [connect] attend qu'il soit complété : de quoi agir pendant
  /// la connexion.
  Completer<void>? connexionRetenue;

  /// Ce que la room renvoie pour [remoteParticipants].
  List<GroupCallParticipant> participantsDistants = const [];

  /// Simule un événement de la room.
  void emettre(GroupCallRoomEvent event) => _events.add(event);

  @override
  Stream<GroupCallRoomEvent> get events => _events.stream;

  @override
  List<GroupCallParticipant> get remoteParticipants => participantsDistants;

  @override
  MediaStream? get localVideoStream => null;

  @override
  Future<void> connect(String url, String token) async {
    journal.add('connect');
    await connexionRetenue?.future;
    final erreur = erreurConnexion;
    if (erreur != null) throw erreur;
    this.url = url;
    this.token = token;
  }

  @override
  Future<void> setMicrophoneEnabled(bool enabled) async =>
      journal.add('micro:$enabled');

  @override
  Future<void> setCameraEnabled(bool enabled) async =>
      journal.add('camera:$enabled');

  @override
  Future<void> switchCamera() async => journal.add('switchCamera');

  @override
  Future<void> disconnect() async => journal.add('disconnect');

  @override
  Future<void> dispose() async {
    journal.add('dispose');
    await _events.close();
  }
}
