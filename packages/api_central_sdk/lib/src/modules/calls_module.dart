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
    final json = await _client.post<Map<String, dynamic>>('/calls', body: {
      'participantIds': participantIds,
      'callType': typeVersApi(callType),
      'conversationId': ?conversationId,
      'encryptionEnabled': ?encryptionEnabled,
    });
    return Call.fromJson(json);
  }

  Future<Call> get(String callId) async {
    final json = await _client.get<Map<String, dynamic>>('/calls/$callId');
    return Call.fromJson(json);
  }

  Future<Call> answer(String callId, {required String userId}) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/calls/$callId/answer',
      body: {'userId': userId},
    );
    return Call.fromJson(json);
  }

  /// Refuse un appel entrant.
  ///
  /// L'API accuse réception par `{success: true}` : elle ne renvoie pas
  /// l'appel. Rechargez-le avec [get] si son état vous intéresse.
  Future<void> decline(String callId, {required String userId}) =>
      _client.post<Map<String, dynamic>>(
        '/calls/$callId/decline',
        body: {'userId': userId},
      );

  Future<Call> end(String callId, {required String userId}) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/calls/$callId/end',
      body: {'userId': userId},
    );
    return Call.fromJson(json);
  }

  /// Quitte l'appel, qui continue pour les autres participants.
  ///
  /// L'API accuse réception par `{success: true}` : elle ne renvoie pas
  /// l'appel.
  Future<void> leave(String callId, {required String userId}) =>
      _client.post<Map<String, dynamic>>(
        '/calls/$callId/leave',
        body: {'userId': userId},
      );

  // --- Participants --------------------------------------------------------

  Future<void> addParticipant(String callId, {required String userId}) =>
      _client.post<Map<String, dynamic>>(
        '/calls/$callId/participants',
        body: {'userId': userId},
      );

  Future<void> removeParticipant(String callId, String userId) =>
      _client
          .delete<Map<String, dynamic>>('/calls/$callId/participants/$userId');

  Future<void> setMuted(String callId, String userId, {required bool muted}) =>
      _client.put<Map<String, dynamic>>(
        '/calls/$callId/participants/$userId/mute',
        body: {'muted': muted},
      );

  Future<void> setVideoEnabled(
    String callId,
    String userId, {
    required bool enabled,
  }) =>
      _client.put<Map<String, dynamic>>(
        '/calls/$callId/participants/$userId/video',
        body: {'enabled': enabled},
      );

  Future<void> setScreenSharing(
    String callId,
    String userId, {
    required bool sharing,
  }) =>
      _client.put<Map<String, dynamic>>(
        '/calls/$callId/participants/$userId/screen',
        body: {'sharing': sharing},
      );

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
    final json =
        await _client.get<Map<String, dynamic>>('/calls/$callId/ice-servers');
    return IceServersResponse.fromJson(json);
  }

  Future<void> sendOffer(
    String callId, {
    required String toUserId,
    required String sdp,
    String sdpType = 'offer',
  }) =>
      _client.post<Map<String, dynamic>>(
        '/calls/$callId/offer',
        body: {'toUserId': toUserId, 'sdp': sdp, 'sdpType': sdpType},
      );

  Future<void> sendAnswer(
    String callId, {
    required String toUserId,
    required String sdp,
    String sdpType = 'answer',
  }) =>
      _client.post<Map<String, dynamic>>(
        '/calls/$callId/answer-sdp',
        body: {'toUserId': toUserId, 'sdp': sdp, 'sdpType': sdpType},
      );

  Future<void> sendIceCandidate(
    String callId, {
    required String toUserId,
    required String candidate,
    String? sdpMid,
    int? sdpMLineIndex,
  }) =>
      _client.post<Map<String, dynamic>>(
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
  /// Requiert un token utilisateur, et que cet utilisateur participe à
  /// l'appel : sinon l'API répond 403 (`ForbiddenException`). Un appel inconnu
  /// donne 404, un serveur sans LiveKit configuré 400 (`ValidationException`).
  ///
  /// Se connecter à [LiveKitToken.url], jamais à une URL codée en dur.
  /// `GroupCallManager`, dans `api_central_calls`, s'en charge.
  Future<LiveKitToken> getLiveKitToken(String callId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/calls/$callId/token');
    return LiveKitToken.fromJson(json);
  }
}

/// `screenShare` se sérialise `screen_share` ; les autres types suivent leur nom.
String typeVersApi(CallType type) => switch (type) {
      CallType.screenShare => 'screen_share',
      _ => type.name,
    };
