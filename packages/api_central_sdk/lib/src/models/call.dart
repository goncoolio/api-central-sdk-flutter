import 'package:freezed_annotation/freezed_annotation.dart';

import 'conversation.dart' show ParticipantRole;
import 'user_info.dart';

part 'call.freezed.dart';
part 'call.g.dart';

/// Nature d'un appel.
enum CallType {
  @JsonValue('audio')
  audio,
  @JsonValue('video')
  video,
  @JsonValue('screen_share')
  screenShare,
}

/// État global d'un appel.
enum CallStatus {
  @JsonValue('initiating')
  initiating,
  @JsonValue('ringing')
  ringing,
  @JsonValue('connected')
  connected,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('ended')
  ended,
  @JsonValue('failed')
  failed,
}

/// État d'un participant dans un appel.
enum ParticipantCallStatus {
  @JsonValue('invited')
  invited,
  @JsonValue('ringing')
  ringing,
  @JsonValue('joined')
  joined,
  @JsonValue('on_hold')
  onHold,
  @JsonValue('left')
  left,
  @JsonValue('declined')
  declined,
  @JsonValue('missed')
  missed,
}

/// Participant d'un appel, avec l'état de ses périphériques.
@freezed
abstract class CallParticipant with _$CallParticipant {
  const factory CallParticipant({
    required String id,
    required UserInfo user,
    required ParticipantCallStatus status,
    ParticipantRole? role,
    @Default(false) bool isMuted,
    @Default(false) bool isVideoEnabled,
    @Default(false) bool isScreenSharing,
    DateTime? joinedAt,
  }) = _CallParticipant;

  factory CallParticipant.fromJson(Map<String, dynamic> json) =>
      _$CallParticipantFromJson(json);
}

/// Appel audio ou vidéo.
@freezed
abstract class Call with _$Call {
  const factory Call({
    required String id,
    required UserInfo initiator,
    required CallType callType,
    required CallStatus status,
    String? conversationId,
    @Default(<CallParticipant>[]) List<CallParticipant> participants,
    @Default(0) int participantCount,
    int? durationSeconds,
    @Default(false) bool encryptionEnabled,
    DateTime? startedAt,
    DateTime? connectedAt,
    DateTime? endedAt,
    DateTime? createdAt,
  }) = _Call;

  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);
}

/// Forme compacte d'un appel, utilisée par l'historique.
///
/// Porte `initiatorId` plutôt qu'un `initiator` complet, et pas de liste de
/// participants.
@freezed
abstract class CallInfo with _$CallInfo {
  const factory CallInfo({
    required String id,
    required CallType callType,
    required CallStatus status,
    String? conversationId,
    String? initiatorId,
    @Default(0) int participantCount,
    int? durationSeconds,
    @Default(false) bool encryptionEnabled,
    DateTime? startedAt,
    DateTime? connectedAt,
    DateTime? endedAt,
  }) = _CallInfo;

  factory CallInfo.fromJson(Map<String, dynamic> json) =>
      _$CallInfoFromJson(json);
}

/// Entrée d'historique : l'appel, les autres participants, et votre statut.
@freezed
abstract class CallHistoryEntry with _$CallHistoryEntry {
  const factory CallHistoryEntry({
    /// Nommé `callInfo` côté Dart : un champ `call` entrerait en collision avec
    /// la méthode `call()` que freezed génère pour `copyWith`. La clé JSON
    /// reste `call`.
    @JsonKey(name: 'call') required CallInfo callInfo,
    @Default(<UserInfo>[]) List<UserInfo> otherParticipants,
    ParticipantCallStatus? yourStatus,
  }) = _CallHistoryEntry;

  factory CallHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$CallHistoryEntryFromJson(json);
}

/// Historique d'appels.
///
/// Pagination par `hasMore`, pas par numéro de page comme le reste de l'API.
@freezed
abstract class CallHistory with _$CallHistory {
  const factory CallHistory({
    @Default(<CallHistoryEntry>[]) List<CallHistoryEntry> calls,
    @Default(0) int total,
    @Default(false) bool hasMore,
  }) = _CallHistory;

  factory CallHistory.fromJson(Map<String, dynamic> json) =>
      _$CallHistoryFromJson(json);
}

List<String> _urlsDepuisJson(Object? valeur) => switch (valeur) {
      final String url => [url],
      final List<dynamic> liste => liste.map((e) => e.toString()).toList(),
      _ => const <String>[],
    };

/// Serveur STUN ou TURN, tel qu'attendu par WebRTC.
///
/// L'API renvoie `urls` tantôt comme une chaîne, tantôt comme une liste selon
/// la configuration : [urls] normalise toujours en liste.
@freezed
abstract class IceServer with _$IceServer {
  const factory IceServer({
    @JsonKey(fromJson: _urlsDepuisJson) required List<String> urls,
    String? username,
    String? credential,
  }) = _IceServer;

  factory IceServer.fromJson(Map<String, dynamic> json) =>
      _$IceServerFromJson(json);
}

/// Serveurs ICE pour un appel, avec leur durée de validité.
@freezed
abstract class IceServersResponse with _$IceServersResponse {
  const factory IceServersResponse({
    @Default(<IceServer>[]) List<IceServer> iceServers,
    String? callId,
    @Default(86400) int ttl,
  }) = _IceServersResponse;

  factory IceServersResponse.fromJson(Map<String, dynamic> json) =>
      _$IceServersResponseFromJson(json);
}
