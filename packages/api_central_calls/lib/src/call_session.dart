import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter_webrtc/flutter_webrtc.dart' show MediaStream;

import 'call_manager.dart';
import 'call_mode.dart';
import 'group_call_manager.dart';
import 'group_call_room.dart';

/// Point d'entrée des appels : choisit la couche média au démarrage.
///
/// [start] et [accept] chargent l'appel, puis le confient à [p2pManager]
/// (WebRTC direct) s'il réunit deux participants, à [groupManager] (SFU
/// LiveKit) dès [CallMode.minGroupParticipants]. L'appelant et ceux qui
/// décrochent aboutissent ainsi au même mode.
///
/// Le mode est fixé au démarrage de l'appel. Un participant ajouté ensuite à
/// un appel à deux ne le fait pas basculer sur LiveKit : à son [accept], il
/// rejoindrait seul la room LiveKit, sans jamais retrouver les deux autres,
/// restés en P2P. Invitez donc tous les participants dès `calls.initiate`.
///
/// Les commandes communes (micro, caméra, raccrocher) passent par la session.
/// Le média distant se lit sur le gestionnaire du mode choisi :
/// [CallManager.remoteStreams] en P2P, [GroupCallManager.participants] en
/// groupe.
class CallSession {
  CallSession({required ApiCentral sdk, required String userId})
    : this._(sdk, userId, GroupCallManager(sdk: sdk, userId: userId));

  /// Remplace la room LiveKit du mode groupe par [roomFactory], pour les
  /// tests.
  @visibleForTesting
  CallSession.withRoomFactory({
    required ApiCentral sdk,
    required String userId,
    required GroupCallRoom Function() roomFactory,
  }) : this._(
         sdk,
         userId,
         GroupCallManager.withRoomFactory(
           sdk: sdk,
           userId: userId,
           roomFactory: roomFactory,
         ),
       );

  CallSession._(this.sdk, this.userId, this.groupManager)
    : p2pManager = CallManager(sdk: sdk, userId: userId) {
    _relais = [
      p2pManager.states.listen((etat) {
        if (_mode == CallMode.p2p) _emettre(etat);
      }),
      groupManager.states.listen((etat) {
        if (_mode == CallMode.group) _emettre(etat);
      }),
    ];
  }

  final ApiCentral sdk;

  /// Id de l'utilisateur courant dans l'API.
  final String userId;

  /// Gestionnaire des appels à deux : [CallManager.remoteStreams] porte le
  /// média distant.
  final CallManager p2pManager;

  /// Gestionnaire des appels de groupe : [GroupCallManager.participants] et
  /// [GroupCallManager.participantsChanges] portent le média distant.
  final GroupCallManager groupManager;

  final _states = StreamController<CallManagerState>.broadcast();
  late final List<StreamSubscription<CallManagerState>> _relais;

  CallMode? _mode;
  String? _callIdEnPreparation;
  Future<CallMode>? _preparation;
  CallManagerState _state = CallManagerState.idle;

  /// Mode de l'appel en cours, ou du dernier appel.
  ///
  /// `null` avant le premier appel, et pendant le chargement de l'appel au
  /// démarrage : il est fixé avant que le gestionnaire choisi ne se connecte.
  CallMode? get mode => _mode;

  /// État du média de l'appel, quel que soit le mode.
  CallManagerState get state => switch (_mode) {
    CallMode.p2p => p2pManager.state,
    CallMode.group => groupManager.state,
    null => _state,
  };

  Stream<CallManagerState> get states => _states.stream;

  /// Appel en cours, `null` hors appel.
  String? get callId => switch (_mode) {
    CallMode.p2p => p2pManager.callId,
    CallMode.group => groupManager.callId,
    null => _callIdEnPreparation,
  };

  /// Flux local pour l'aperçu : caméra et micro en P2P, caméra seule en
  /// groupe. `null` hors appel.
  ///
  /// En groupe, LiveKit le remplace quand la caméra est rétablie ou
  /// retournée : relisez-le après [setCameraEnabled] et [switchCamera].
  MediaStream? get localStream => switch (_mode) {
    CallMode.p2p => p2pManager.localStream,
    CallMode.group => groupManager.localStream,
    null => null,
  };

  void _emettre(CallManagerState etat) {
    if (_state == etat) return;
    _state = etat;
    if (!_states.isClosed) _states.add(etat);
  }

  /// Démarre un appel côté appelant, dans le mode que dicte son nombre de
  /// participants, et renvoie ce mode.
  ///
  /// Lève [StateError] si un appel est déjà en cours. En cas d'échec, l'erreur
  /// remonte, et [hangUp] libère ce qui a pu être engagé.
  Future<CallMode> start(String callId, {required CallType callType}) =>
      _demarrer(
        callId,
        (mode, call) => switch (mode) {
          CallMode.p2p => p2pManager.startWithCall(call, callType: callType),
          CallMode.group => groupManager.start(call.id, callType: callType),
        },
      );

  /// Décroche un appel entrant, dans le mode que dicte son nombre de
  /// participants, et renvoie ce mode.
  ///
  /// Mêmes erreurs que [start].
  Future<CallMode> accept(String callId) => _demarrer(
    callId,
    (mode, call) => switch (mode) {
      CallMode.p2p => p2pManager.acceptWithCall(call),
      CallMode.group => groupManager.acceptWithCall(call),
    },
  );

  Future<CallMode> _demarrer(
    String callId,
    Future<void> Function(CallMode mode, Call call) deleguer,
  ) async {
    if (_preparation != null || this.callId != null) {
      throw StateError(
        "Un appel est déjà en cours : raccrochez avec hangUp() avant d'en "
        'démarrer un autre.',
      );
    }
    final preparation = _preparation = _preparer(callId, deleguer);
    try {
      return await preparation;
    } finally {
      _preparation = null;
    }
  }

  /// Charge l'appel une seule fois, fixe le mode, puis confie l'appel déjà
  /// chargé au gestionnaire choisi.
  Future<CallMode> _preparer(
    String callId,
    Future<void> Function(CallMode mode, Call call) deleguer,
  ) async {
    _mode = null;
    _callIdEnPreparation = callId;
    _emettre(CallManagerState.connecting);
    final Call call;
    try {
      call = await sdk.calls.get(callId);
    } on Object {
      _emettre(CallManagerState.failed);
      rethrow;
    } finally {
      _callIdEnPreparation = null;
    }
    final mode = _mode = CallMode.forCall(call);
    await deleguer(mode, call);
    return mode;
  }

  /// Raccroche.
  ///
  /// En P2P, termine l'appel pour les deux participants
  /// ([CallManager.hangUp]). En groupe, quitte l'appel, qui continue pour les
  /// autres ([GroupCallManager.leave]). Appelé pendant [start] ou [accept],
  /// attend d'abord que le démarrage aboutisse ou échoue.
  Future<void> hangUp() async {
    final preparation = _preparation;
    if (preparation != null) {
      try {
        await preparation;
      } on Object {
        // L'échec remonte déjà à l'appelant de start ou accept.
      }
    }
    switch (_mode) {
      case CallMode.p2p:
        await p2pManager.hangUp();
      case CallMode.group:
        await groupManager.leave();
      case null:
        _emettre(CallManagerState.ended);
    }
  }

  /// Coupe ou rétablit le micro, localement et côté serveur.
  Future<void> setMicrophoneEnabled(bool enabled) => switch (_mode) {
    CallMode.p2p => p2pManager.setMicrophoneEnabled(enabled),
    CallMode.group => groupManager.setMicrophoneEnabled(enabled),
    null => Future<void>.value(),
  };

  /// Coupe ou rétablit la caméra, localement et côté serveur.
  Future<void> setCameraEnabled(bool enabled) => switch (_mode) {
    CallMode.p2p => p2pManager.setCameraEnabled(enabled),
    CallMode.group => groupManager.setCameraEnabled(enabled),
    null => Future<void>.value(),
  };

  /// Bascule entre caméra avant et arrière.
  Future<void> switchCamera() => switch (_mode) {
    CallMode.p2p => p2pManager.switchCamera(),
    CallMode.group => groupManager.switchCamera(),
    null => Future<void>.value(),
  };

  /// Raccroche et libère les ressources. À appeler quand l'écran d'appel est
  /// détruit.
  Future<void> dispose() async {
    await hangUp();
    for (final relais in _relais) {
      await relais.cancel();
    }
    await p2pManager.dispose();
    await groupManager.dispose();
    await _states.close();
  }
}
