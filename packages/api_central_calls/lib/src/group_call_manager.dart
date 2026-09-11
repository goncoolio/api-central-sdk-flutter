import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart' show internal, listEquals;
import 'package:flutter_webrtc/flutter_webrtc.dart' show MediaStream;

import 'call_manager.dart' show CallManagerState;
import 'group_call_participant.dart';
import 'group_call_room.dart';
import 'livekit_group_call_room.dart';

/// Pilote la couche média d'un appel de groupe, par le SFU LiveKit.
///
/// Pendant de `CallManager` dès trois participants : chacun publie son micro,
/// et sa caméra pour un appel vidéo, dans la room LiveKit de l'appel, qui
/// relaie les flux aux autres. `CallSession` choisit l'un ou l'autre au
/// démarrage de l'appel.
///
/// L'URL du SFU et le jeton viennent de l'API (`calls.getLiveKitToken`) : rien
/// n'est codé en dur. Comme pour `CallManager`, l'application demande les
/// permissions caméra et micro avant [start] ou [accept], et ouvre la
/// connexion temps réel avant l'appel : c'est par elle qu'arrive `call_ended`
/// quand l'appel se termine pour tous.
class GroupCallManager {
  GroupCallManager({required ApiCentral sdk, required String userId})
    : this.withRoomFactory(
        sdk: sdk,
        userId: userId,
        roomFactory: LiveKitGroupCallRoom.new,
      );

  /// Remplace la room LiveKit par [roomFactory]. Réservé au package : aux
  /// tests, et à `CallSession.withRoomFactory`.
  @internal
  GroupCallManager.withRoomFactory({
    required this.sdk,
    required this.userId,
    required GroupCallRoom Function() roomFactory,
  }) : _roomFactory = roomFactory;

  final ApiCentral sdk;

  /// Id de l'utilisateur courant dans l'API.
  final String userId;

  final GroupCallRoom Function() _roomFactory;

  final _states = StreamController<CallManagerState>.broadcast();
  final _participantsChanges =
      StreamController<List<GroupCallParticipant>>.broadcast();

  GroupCallRoom? _room;
  StreamSubscription<GroupCallRoomEvent>? _abonnementRoom;
  StreamSubscription<CallEndedEvent>? _abonnementFin;
  Future<void>? _connexion;
  String? _callId;
  CallManagerState _state = CallManagerState.idle;
  List<GroupCallParticipant> _participants = const [];

  Stream<CallManagerState> get states => _states.stream;
  CallManagerState get state => _state;

  /// Appel en cours, `null` hors appel.
  String? get callId => _callId;

  /// Participants distants, dans leur ordre d'arrivée. Vide hors appel.
  List<GroupCallParticipant> get participants => _participants;

  /// Liste des participants distants, réémise à chaque changement : arrivée,
  /// départ, micro ou caméra coupés, vidéo reçue.
  Stream<List<GroupCallParticipant>> get participantsChanges =>
      _participantsChanges.stream;

  /// Flux de la caméra locale, pour l'aperçu. `null` en audio et hors appel.
  ///
  /// LiveKit redémarre la piste quand la caméra est rétablie ou retournée, et
  /// le flux change avec elle : relisez-le après [setCameraEnabled] et
  /// [switchCamera].
  MediaStream? get localStream => _room?.localVideoStream;

  void _setState(CallManagerState nouveau) {
    if (_state == nouveau) return;
    _state = nouveau;
    if (!_states.isClosed) _states.add(nouveau);
  }

  /// Rejoint l'appel côté appelant : jeton LiveKit, connexion au SFU, puis
  /// publication du micro, et de la caméra pour un appel vidéo.
  ///
  /// Lève [StateError] si un appel est déjà en cours : quittez-le d'abord avec
  /// [leave]. Sur un échec, la room est libérée, l'état passe à
  /// [CallManagerState.failed] et l'erreur remonte.
  Future<void> start(String callId, {required CallType callType}) =>
      _entrer(callId, () => _rejoindre(callId, callType));

  /// Décroche un appel de groupe entrant.
  ///
  /// Rejoint la room et publie le média avant de prévenir l'API : si le média
  /// échoue, l'appel continue de sonner au lieu d'annoncer un participant
  /// muet.
  Future<void> accept(String callId) => _entrer(callId, () async {
    final call = await sdk.calls.get(callId);
    await _decrocher(callId, call.callType);
  });

  /// Variante de [accept] pour un appel déjà chargé, qui évite de le relire.
  /// Réservée à `CallSession`.
  @internal
  Future<void> acceptWithCall(Call call) =>
      _entrer(call.id, () => _decrocher(call.id, call.callType));

  Future<void> _decrocher(String callId, CallType callType) async {
    await _rejoindre(callId, callType);
    await sdk.calls.answer(callId, userId: userId);
  }

  Future<void> _entrer(
    String callId,
    Future<void> Function() connexion,
  ) async {
    if (_callId != null) {
      throw StateError(
        "L'appel $_callId est en cours : quittez-le avec leave() avant d'en "
        'rejoindre un autre.',
      );
    }
    _callId = callId;
    _setState(CallManagerState.connecting);
    _ecouterFinDAppel(callId);

    final enCours = _connexion = connexion();
    try {
      await enCours;
      // La room a pu se fermer pendant la connexion : l'état reste alors
      // celui qu'a fixé sa fermeture.
      if (_room != null) _setState(CallManagerState.connected);
    } on Object {
      await _abandonner();
      rethrow;
    } finally {
      _connexion = null;
    }
  }

  Future<void> _rejoindre(String callId, CallType callType) async {
    final jeton = await sdk.calls.getLiveKitToken(callId);
    final room = _room = _roomFactory();
    _abonnementRoom = room.events.listen(_surEvenementRoom);
    // Toujours l'URL renvoyée par l'API : c'est celle du SFU public.
    await room.connect(jeton.url, jeton.token);
    await room.setMicrophoneEnabled(true);
    if (callType != CallType.audio) await room.setCameraEnabled(true);
    _majParticipants(room.remoteParticipants);
  }

  void _surEvenementRoom(GroupCallRoomEvent evenement) {
    switch (evenement) {
      case GroupCallRoomEvent.participantsChanged:
        final room = _room;
        if (room != null) _majParticipants(room.remoteParticipants);
      case GroupCallRoomEvent.reconnecting:
        _setState(CallManagerState.connecting);
      case GroupCallRoomEvent.reconnected:
        _setState(CallManagerState.connected);
      case GroupCallRoomEvent.disconnected:
        unawaited(_terminer());
      case GroupCallRoomEvent.connectionLost:
        unawaited(_perdreConnexion());
    }
  }

  /// `call_ended` arrive quand un participant termine l'appel pour tous, ou
  /// quand LiveKit signale la fin de la room. L'API ne ferme pas la room
  /// elle-même : c'est à chaque appareil de la quitter.
  void _ecouterFinDAppel(String callId) {
    final realtime = sdk.realtime;
    if (realtime == null) return;
    _abonnementFin = realtime.onCallEnded
        .where((event) => event.callId == callId)
        .listen((_) => unawaited(_finParServeur(callId)));
  }

  Future<void> _finParServeur(String callId) async {
    await _attendreConnexion();
    if (_callId != callId) return;
    await _terminer();
  }

  /// Quitte l'appel, qui continue pour les autres participants.
  ///
  /// Prévient l'API, puis libère la room, même si l'API a déjà clos l'appel.
  /// Appelé pendant [start] ou [accept], attend d'abord que la connexion
  /// aboutisse ou échoue, pour ne pas laisser de room à moitié ouverte.
  ///
  /// Pour terminer l'appel pour tous, appelez `sdk.calls.end` : chacun reçoit
  /// alors `call_ended` et quitte la room.
  Future<void> leave() async {
    await _attendreConnexion();
    final callId = _callId;
    if (callId != null) {
      try {
        await sdk.calls.leave(callId, userId: userId);
      } on ApiCentralException {
        // L'appel peut déjà être terminé côté serveur : on libère la room
        // dans tous les cas.
      }
    }
    await _terminer();
  }

  Future<void> _attendreConnexion() async {
    final enCours = _connexion;
    if (enCours == null) return;
    try {
      await enCours;
    } on Object {
      // L'échec remonte déjà à l'appelant de start ou accept.
    }
  }

  /// Fin de l'appel pour cet appareil : libère tout, sans appeler l'API.
  Future<void> _terminer() async {
    await _arreterEcouteFin();
    await _libererRoom();
    _callId = null;
    _majParticipants(const []);
    _setState(CallManagerState.ended);
  }

  /// Connexion perdue : libère la room mais garde l'appel, pour que [leave]
  /// prévienne l'API, qui croit l'utilisateur toujours présent.
  Future<void> _perdreConnexion() async {
    await _libererRoom();
    _majParticipants(const []);
    _setState(CallManagerState.failed);
  }

  /// Échec de [start] ou [accept] : libère la room et rend la main pour un
  /// nouvel essai.
  Future<void> _abandonner() async {
    await _arreterEcouteFin();
    await _libererRoom();
    _callId = null;
    _majParticipants(const []);
    _setState(CallManagerState.failed);
  }

  Future<void> _arreterEcouteFin() async {
    await _abonnementFin?.cancel();
    _abonnementFin = null;
  }

  Future<void> _libererRoom() async {
    final room = _room;
    if (room == null) return;
    _room = null;
    await _abonnementRoom?.cancel();
    _abonnementRoom = null;
    try {
      await room.disconnect();
    } finally {
      await room.dispose();
    }
  }

  void _majParticipants(List<GroupCallParticipant> participants) {
    if (listEquals(participants, _participants)) return;
    _participants = List.unmodifiable(participants);
    if (!_participantsChanges.isClosed) {
      _participantsChanges.add(_participants);
    }
  }

  /// Coupe ou rétablit le micro, dans la room et côté serveur.
  Future<void> setMicrophoneEnabled(bool enabled) async {
    await _room?.setMicrophoneEnabled(enabled);
    final callId = _callId;
    if (callId != null) {
      await sdk.calls.setMuted(callId, userId, muted: !enabled);
    }
  }

  /// Coupe ou rétablit la caméra, dans la room et côté serveur.
  Future<void> setCameraEnabled(bool enabled) async {
    await _room?.setCameraEnabled(enabled);
    final callId = _callId;
    if (callId != null) {
      await sdk.calls.setVideoEnabled(callId, userId, enabled: enabled);
    }
  }

  /// Bascule entre caméra avant et arrière.
  Future<void> switchCamera() async {
    await _room?.switchCamera();
  }

  /// Quitte l'appel et libère les ressources. À appeler quand l'écran d'appel
  /// est détruit.
  Future<void> dispose() async {
    await leave();
    await _states.close();
    await _participantsChanges.close();
  }
}
