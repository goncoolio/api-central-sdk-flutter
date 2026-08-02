import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

/// Nature d'une conversation.
enum ConversationType {
  @JsonValue('direct')
  direct,
  @JsonValue('group')
  group,
  @JsonValue('channel')
  channel,
}

/// Rôle d'un participant dans une conversation.
enum ParticipantRole {
  @JsonValue('admin')
  admin,
  @JsonValue('member')
  member,
  @JsonValue('readonly')
  readonly,
}

/// Forme compacte d'un utilisateur, telle qu'imbriquée dans les réponses.
@freezed
abstract class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required String externalUserId,
    String? displayName,
    String? avatarUrl,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

/// Participant d'une conversation.
@freezed
abstract class Participant with _$Participant {
  const factory Participant({
    required String id,
    required UserInfo user,
    required ParticipantRole role,
    DateTime? joinedAt,
    @Default(false) bool isMuted,
  }) = _Participant;

  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

/// Aperçu du dernier message, affiché dans une liste de conversations.
@freezed
abstract class LastMessagePreview with _$LastMessagePreview {
  const factory LastMessagePreview({
    required String id,
    required String content,
    required ContentType contentType,
    UserInfo? sender,
    DateTime? createdAt,
  }) = _LastMessagePreview;

  factory LastMessagePreview.fromJson(Map<String, dynamic> json) =>
      _$LastMessagePreviewFromJson(json);
}

/// Conversation.
///
/// L'API sérialise la nature de la conversation sous la clé `type`, pas
/// `conversationType`.
@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required ConversationType type,
    String? applicationId,
    String? title,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
    DateTime? lastMessageAt,
    LastMessagePreview? lastMessage,
    @Default(<Participant>[]) List<Participant> participants,
    @Default(0) int unreadCount,
    DateTime? createdAt,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
