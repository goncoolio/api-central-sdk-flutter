import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart' show internal;
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'call_mode.dart';
import 'ice_candidate_codec.dart';

/// Crée la `RTCPeerConnection` d'un appel. Injectable, car les tests n'ont pas
/// les canaux de plateforme que réclame `flutter_webrtc`.
typedef PeerConnectionFactory =
    Future<RTCPeerConnection> Function(Map<String, dynamic> configuration);

/// Ouvre le flux micro et caméra local. Injectable pour la même raison.
typedef LocalMediaFactory =
    Future<MediaStream> Function(Map<String, dynamic> contraintes);

Future<MediaStream> _mediaParDefaut(Map<String, dynamic> contraintes) =>
    navigator.mediaDevices.getUserMedia(contraintes);

/// État d'un appel du point de vue du média.
///
/// Distinct de [CallStatus], qui reflète l'état côté serveur : un appel peut
/// être `connected` pour l'API alors que la négociation WebRTC échoue encore.
enum CallManagerState { idle, connecting, connected, ended, failed }

/// Pilote la couche média d'un appel à deux, en WebRTC direct.
///
/// Assemble trois choses que l'application n'a pas à orchestrer elle-même : la
/// `RTCPeerConnection`, la signalisation via le SDK, et les flux média locaux
/// et distants.
///
/// L'application reste responsable des permissions caméra et micro : les
/// demander avant [start] ou [accept], sinon `getUserMedia` échoue.
///
/// La connexion temps réel doit être ouverte avant l'appel : toute la
/// signalisation passe par le WebSocket, et [start] comme [accept] refusent de
/// démarrer sans elle.
///
/// Ne relie que deux participants : dès [CallMode.minGroupParticipants],
/// [start] et [accept] lèvent [UnsupportedError] avant tout accès au média.
/// `CallSession` choisit pour vous entre ce gestionnaire et
/// `GroupCallManager`, qui passe par LiveKit.
class CallManager {
  CallManager({required this.sdk, required this.userId})
    : _creerPeerConnection = createPeerConnection,
      _ouvrirMediaLocal = _mediaParDefaut;

  /// Réservé aux tests : remplace la `RTCPeerConnection` et le flux local par
  /// des doublures.
  @internal
  CallManager.withFactories({
    required this.sdk,
    required this.userId,
    required PeerConnectionFactory peerConnectionFactory,
    required LocalMediaFactory localMediaFactory,
  }) : _creerPeerConnection = peerConnectionFactory,
       _ouvrirMediaLocal = localMediaFactory;

  final ApiCentral sdk;
  final String userId;
  final PeerConnectionFactory _creerPeerConnection;
  final LocalMediaFactory _ouvrirMediaLocal;

  final _states = StreamController<CallManagerState>.broadcast();
  final _remoteStreams = StreamController<MediaStream>.broadcast();
  final List<StreamSubscription<dynamic>> _abonnements = [];

  RTCPeerConnection? _pc;
  MediaStream? _localStream;
  String? _callId;
  String? _pairId;
  CallManagerState _state = CallManagerState.idle;

  /// Flux média local, disponible dès que [start] ou [accept] a abouti.
  MediaStream? get localStream => _localStream;

  /// Flux distants, un par participant qui publie du média.
  Stream<MediaStream> get remoteStreams => _remoteStreams.stream;

  Stream<CallManagerState> get states => _states.stream;
  CallManagerState get state => _state;

  /// Appel en cours, `null` hors appel.
  String? get callId => _callId;

  void _setState(CallManagerState nouveau) {
    if (_state == nouveau) return;
    _state = nouveau;
    if (!_states.isClosed) _states.add(nouveau);
  }

  /// Démarre l'appel côté appelant : média local, offre SDP, envoi.
  ///
  /// Lève [UnsupportedError], avant tout accès au média, si l'appel compte
  /// [CallMode.minGroupParticipants] participants ou plus.
  Future<void> start(String callId, {required CallType callType}) async {
    _entrerEnConnexion(callId);
    final call = await sdk.calls.get(callId);
    await _demarrer(call, callType);
  }

  /// Accepte un appel entrant. L'offre distante arrive par le WebSocket.
  ///
  /// Lève [UnsupportedError], sans décrocher, si l'appel compte
  /// [CallMode.minGroupParticipants] participants ou plus.
  Future<void> accept(String callId) async {
    _entrerEnConnexion(callId);
    final call = await sdk.calls.get(callId);
    await _accepter(call);
  }

  /// Variante de [start] pour un appel déjà chargé, qui évite de le relire.
  /// Réservée à `CallSession`.
  @internal
  Future<void> startWithCall(Call call, {required CallType callType}) async {
    _entrerEnConnexion(call.id);
    await _demarrer(call, callType);
  }

  /// Variante de [accept] pour un appel déjà chargé. Réservée à
  /// `CallSession`.
  @internal
  Future<void> acceptWithCall(Call call) async {
    _entrerEnConnexion(call.id);
    await _accepter(call);
  }

  void _entrerEnConnexion(String callId) {
    _callId = callId;
    _setState(CallManagerState.connecting);
  }

  Future<void> _demarrer(Call call, CallType callType) async {
    _exigerAppelADeux(call);
    final realtime = _exigerTempsReel();

    try {
      await _preparerConnexion(call.id, callType, realtime);

      _pairId = call.participants
          .map((p) => p.user.id)
          .firstWhere((id) => id != userId, orElse: () => '');

      final offre = await _pc!.createOffer();
      await _pc!.setLocalDescription(offre);

      final pair = _pairId;
      if (pair != null && pair.isNotEmpty) {
        realtime.sendCallOffer(call.id, toUserId: pair, sdp: offre.sdp ?? '');
      }
    } on Object {
      await _abandonner();
      rethrow;
    }
  }

  Future<void> _accepter(Call call) async {
    _exigerAppelADeux(call);
    final realtime = _exigerTempsReel();

    try {
      await _preparerConnexion(call.id, call.callType, realtime);
      await sdk.calls.answer(call.id, userId: userId);
    } on Object {
      await _abandonner();
      rethrow;
    }
  }

  /// Refuse un appel de groupe avant tout accès au média.
  ///
  /// Sans ce contrôle, un appel à trois ne relierait que le premier autre
  /// participant, sans rien signaler.
  void _exigerAppelADeux(Call call) {
    if (CallMode.forCall(call) == CallMode.p2p) return;
    _callId = null;
    _setState(CallManagerState.failed);
    throw UnsupportedError(
      "CallManager ne relie que deux participants, or l'appel ${call.id} en "
      'compte ${call.participants.length}. Passez par CallSession, qui choisit '
      'LiveKit dès ${CallMode.minGroupParticipants} participants, ou '
      'directement par GroupCallManager.',
    );
  }

  /// Exige une connexion temps réel, car toute la signalisation passe par
  /// elle : les routes REST `offer`, `answer-sdp` et `ice-candidate` de l'API
  /// stockent le signal et le publient sur un canal sans abonné, si bien que
  /// le pair ne reçoit rien. Mieux vaut échouer avant d'ouvrir le micro.
  RealtimeModule _exigerTempsReel() {
    final realtime = sdk.realtime;
    if (realtime != null) return realtime;
    _callId = null;
    _setState(CallManagerState.failed);
    throw StateError(
      'La signalisation des appels passe par le WebSocket : appelez '
      'sdk.connectRealtime() avant start ou accept.',
    );
  }

  Future<void> _preparerConnexion(
    String callId,
    CallType callType,
    RealtimeModule realtime,
  ) async {
    final iceServers = await sdk.calls.getIceServers(callId);

    _pc = await _creerPeerConnection({
      'iceServers': iceServers.iceServers
          .map(
            (s) => <String, dynamic>{
              'urls': s.urls,
              if (s.username != null) 'username': s.username,
              if (s.credential != null) 'credential': s.credential,
            },
          )
          .toList(),
    });

    _localStream = await _ouvrirMediaLocal({
      'audio': true,
      'video': callType == CallType.audio ? false : {'facingMode': 'user'},
    });

    for (final piste in _localStream!.getTracks()) {
      await _pc!.addTrack(piste, _localStream!);
    }

    _pc!.onTrack = (event) {
      if (event.streams.isNotEmpty && !_remoteStreams.isClosed) {
        _remoteStreams.add(event.streams.first);
      }
    };

    _pc!.onIceCandidate = (candidat) {
      final pair = _pairId;
      if (pair == null || pair.isEmpty) return;
      realtime.sendCallIceCandidate(
        callId,
        toUserId: pair,
        candidate: encoderCandidat(candidat),
      );
    };

    _pc!.onConnectionState = (etat) {
      switch (etat) {
        case RTCPeerConnectionState.RTCPeerConnectionStateConnected:
          _setState(CallManagerState.connected);
        case RTCPeerConnectionState.RTCPeerConnectionStateFailed:
          _setState(CallManagerState.failed);
        case RTCPeerConnectionState.RTCPeerConnectionStateClosed:
          _setState(CallManagerState.ended);
        default:
          break;
      }
    };

    _brancherSignalisation(realtime);
  }

  /// Applique les messages de signalisation reçus du WebSocket.
  void _brancherSignalisation(RealtimeModule realtime) {
    _abonnements.addAll([
      realtime.onCallOfferReceived.listen((event) async {
        if (event.callId != _callId) return;
        _pairId = event.fromUserId;
        await _pc?.setRemoteDescription(
          RTCSessionDescription(event.sdp, 'offer'),
        );
        final reponse = await _pc!.createAnswer();
        await _pc!.setLocalDescription(reponse);
        realtime.sendCallAnswer(
          event.callId,
          toUserId: event.fromUserId,
          sdp: reponse.sdp ?? '',
        );
      }),
      realtime.onCallAnswerReceived.listen((event) async {
        if (event.callId != _callId) return;
        await _pc?.setRemoteDescription(
          RTCSessionDescription(event.sdp, 'answer'),
        );
      }),
      realtime.onCallIceCandidateReceived.listen((event) async {
        if (event.callId != _callId) return;
        await _pc?.addCandidate(decoderCandidat(event.candidate));
      }),
      realtime.onCallEnded.listen((event) {
        if (event.callId != _callId) return;
        unawaited(hangUp());
      }),
    ]);
  }

  /// Échec de [start] ou [accept] : libère le média et la connexion, et passe
  /// en [CallManagerState.failed]. L'appel reste connu, pour que [hangUp]
  /// puisse encore le clore côté API.
  Future<void> _abandonner() async {
    for (final abonnement in _abonnements) {
      await abonnement.cancel();
    }
    _abonnements.clear();

    for (final piste in _localStream?.getTracks() ?? <MediaStreamTrack>[]) {
      await piste.stop();
    }
    await _localStream?.dispose();
    _localStream = null;

    await _pc?.close();
    _pc = null;
    _pairId = null;

    _setState(CallManagerState.failed);
  }

  /// Raccroche : prévient l'API, coupe le média et libère la connexion.
  Future<void> hangUp() async {
    final callId = _callId;
    if (callId != null) {
      try {
        await sdk.calls.end(callId, userId: userId);
      } on ApiCentralException {
        // L'appel peut déjà être terminé côté serveur : on poursuit le
        // nettoyage local dans tous les cas.
      }
    }

    for (final abonnement in _abonnements) {
      await abonnement.cancel();
    }
    _abonnements.clear();

    for (final piste in _localStream?.getTracks() ?? <MediaStreamTrack>[]) {
      await piste.stop();
    }
    await _localStream?.dispose();
    _localStream = null;

    await _pc?.close();
    _pc = null;
    _callId = null;
    _pairId = null;

    _setState(CallManagerState.ended);
  }

  /// Coupe ou rétablit le micro, localement et côté serveur.
  Future<void> setMicrophoneEnabled(bool enabled) async {
    for (final piste
        in _localStream?.getAudioTracks() ?? <MediaStreamTrack>[]) {
      piste.enabled = enabled;
    }
    final callId = _callId;
    if (callId != null) {
      await sdk.calls.setMuted(callId, userId, muted: !enabled);
    }
  }

  /// Coupe ou rétablit la caméra, localement et côté serveur.
  Future<void> setCameraEnabled(bool enabled) async {
    for (final piste
        in _localStream?.getVideoTracks() ?? <MediaStreamTrack>[]) {
      piste.enabled = enabled;
    }
    final callId = _callId;
    if (callId != null) {
      await sdk.calls.setVideoEnabled(callId, userId, enabled: enabled);
    }
  }

  /// Bascule entre caméra avant et arrière.
  Future<void> switchCamera() async {
    final pistes = _localStream?.getVideoTracks() ?? <MediaStreamTrack>[];
    if (pistes.isEmpty) return;
    await Helper.switchCamera(pistes.first);
  }

  /// Libère les ressources. À appeler quand l'écran d'appel est détruit.
  Future<void> dispose() async {
    await hangUp();
    await _states.close();
    await _remoteStreams.close();
  }
}
