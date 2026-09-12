import '../http/api_client.dart';
import '../models/call.dart';

/// Appels audio et vidéo : cycle de vie, participants et signalisation WebRTC.
///
/// Ce module ne manipule aucun média : il ne fait que parler à l'API. Le
/// pilotage du média vit dans le package `api_central_calls` : `flutter_webrtc`
/// pour les appels à deux, `livekit_client` pour les appels de groupe.
class CallsModule {
  const CallsModule(this._client);

  final ApiClient _client;

  // --- Cycle de vie --------------------------------------------------------

  Future<Call> initiate({
    required List<String> participantIds,
    required CallType callType,
    String? conversationId,
    bool? encryptionEnabled,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/calls',
      body: {
        'participantIds': participantIds,
        'callType': typeVersApi(callType),
        'conversationId': ?conversationId,
        'encryptionEnabled': ?encryptionEnabled,
      },
    );
    return Call.fromJson(json);
  }

  Future<Call> get(String callId) async {
    final json = await _client.get<Map<String, dynamic>>('/calls/$callId');
    return Call.fromJson(json);
  }

  /// Décroche l'appel, pour l'utilisateur du token.
  ///
  /// Ces quatre actions — décrocher, refuser, terminer, quitter — sont
  /// réservées au token utilisateur : l'API prend l'acteur dans le token et ne
  /// lit aucun corps. Avec un token d'application, elle répond 400.
  Future<Call> answer(String callId) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/calls/$callId/answer',
    );
    return Call.fromJson(json);
  }

  /// Refuse un appel entrant, pour l'utilisateur du token.
  ///
  /// L'API accuse réception par `{success: true}` : elle ne renvoie pas
  /// l'appel. Rechargez-le avec [get] si son état vous intéresse.
  Future<void> decline(String callId) =>
      _client.post<Map<String, dynamic>>('/calls/$callId/decline');

  /// Termine l'appel pour tous, à la demande de l'utilisateur du token.
  Future<Call> end(String callId) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/calls/$callId/end',
    );
    return Call.fromJson(json);
  }

  /// Quitte l'appel, qui continue pour les autres participants.
  ///
  /// L'API accuse réception par `{success: true}` : elle ne renvoie pas
  /// l'appel.
  Future<void> leave(String callId) =>
      _client.post<Map<String, dynamic>>('/calls/$callId/leave');

  // --- Participants --------------------------------------------------------

  Future<void> addParticipant(String callId, {required String userId}) =>
      _client.post<Map<String, dynamic>>(
        '/calls/$callId/participants',
        body: {'userId': userId},
      );

  Future<void> removeParticipant(String callId, String userId) => _client
      .delete<Map<String, dynamic>>('/calls/$callId/participants/$userId');

  /// Coupe ou rétablit le micro d'un participant.
  ///
  /// Renvoie l'état appliqué par l'API, qui le rediffuse aux autres
  /// participants par l'événement `call_participant_muted`.
  Future<bool> setMuted(
    String callId,
    String userId, {
    required bool muted,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/calls/$callId/participants/$userId/mute',
      body: {'muted': muted},
    );
    return (json['muted'] as bool?) ?? muted;
  }

  /// Active ou coupe la caméra d'un participant, et renvoie l'état appliqué.
  Future<bool> setVideoEnabled(
    String callId,
    String userId, {
    required bool enabled,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/calls/$callId/participants/$userId/video',
      body: {'enabled': enabled},
    );
    return (json['videoEnabled'] as bool?) ?? enabled;
  }

  /// Démarre ou arrête le partage d'écran, et renvoie l'état appliqué.
  Future<bool> setScreenSharing(
    String callId,
    String userId, {
    required bool sharing,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/calls/$callId/participants/$userId/screen',
      body: {'sharing': sharing},
    );
    return (json['screenSharing'] as bool?) ?? sharing;
  }

  // --- Historique ----------------------------------------------------------

  /// Historique de l'utilisateur du token. Requiert un token utilisateur.
  Future<CallHistory> listHistory({int? page, int? limit}) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/calls/history',
      query: {'page': ?page, 'limit': ?limit},
    );
    return CallHistory.fromJson(json);
  }

  // --- Signalisation WebRTC ------------------------------------------------

  /// Serveurs STUN/TURN à passer à la `RTCPeerConnection`.
  Future<IceServersResponse> getIceServers(String callId) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/calls/$callId/ice-servers',
    );
    return IceServersResponse.fromJson(json);
  }

  Future<void> sendOffer(
    String callId, {
    required String toUserId,
    required String sdp,
    String sdpType = 'offer',
  }) => _client.post<Map<String, dynamic>>(
    '/calls/$callId/offer',
    body: {'toUserId': toUserId, 'sdp': sdp, 'sdpType': sdpType},
  );

  Future<void> sendAnswer(
    String callId, {
    required String toUserId,
    required String sdp,
    String sdpType = 'answer',
  }) => _client.post<Map<String, dynamic>>(
    '/calls/$callId/answer-sdp',
    body: {'toUserId': toUserId, 'sdp': sdp, 'sdpType': sdpType},
  );

  Future<void> sendIceCandidate(
    String callId, {
    required String toUserId,
    required String candidate,
    String? sdpMid,
    int? sdpMLineIndex,
  }) => _client.post<Map<String, dynamic>>(
    '/calls/$callId/ice-candidate',
    body: {
      'toUserId': toUserId,
      'candidate': candidate,
      'sdpMid': ?sdpMid,
      'sdpMLineIndex': ?sdpMLineIndex,
    },
  );

  // --- LiveKit (appels de groupe) -----------------------------------------

  /// Jeton pour rejoindre la room LiveKit (SFU) de l'appel.
  ///
  /// Requiert un token utilisateur : avec un token d'application, l'API répond
  /// 400 (`ValidationException`). Un utilisateur qui ne participe pas à
  /// l'appel reçoit 403 (`ForbiddenException`), un appel inconnu donne 404, et
  /// un serveur sans LiveKit configuré 400 (`ValidationException`).
  ///
  /// Se connecter à [LiveKitToken.url], jamais à une URL codée en dur.
  /// `GroupCallManager`, dans `api_central_calls`, s'en charge.
  Future<LiveKitToken> getLiveKitToken(String callId) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/calls/$callId/token',
    );
    return LiveKitToken.fromJson(json);
  }
}

/// `screenShare` se sérialise `screen_share` ; les autres types suivent leur nom.
String typeVersApi(CallType type) => switch (type) {
  CallType.screenShare => 'screen_share',
  _ => type.name,
};
