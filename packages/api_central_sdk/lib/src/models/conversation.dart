import 'package:freezed_annotation/freezed_annotation.dart';

import 'message.dart';
import 'user_info.dart';

// Ré-exporté pour que les imports existants de conversation.dart continuent
// de voir UserInfo, extrait dans son propre fichier.
export 'user_info.dart';

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

/// Préférence de notification d'un participant pour une conversation.
enum NotificationPreference {
  @JsonValue('all')
  all,
  @JsonValue('mentions')
  mentions,
  @JsonValue('none')
  none,
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

/// Réglages de notification d'un participant, tels que l'API les renvoie
/// après `updateParticipantSettings`.
///
/// Cette route renvoie l'enregistrement de participation : il porte
/// [userId], et non l'utilisateur complet de [Participant].
@freezed
abstract class ParticipantSettings with _$ParticipantSettings {
  const factory ParticipantSettings({
    required String id,
    required String conversationId,
    required String userId,
    required ParticipantRole role,
    @Default(false) bool isMuted,
    @Default(NotificationPreference.all)
    NotificationPreference notificationPreference,
    DateTime? joinedAt,
    DateTime? leftAt,
    DateTime? lastReadAt,
    String? lastReadMessageId,
    DateTime? mutedUntil,
  }) = _ParticipantSettings;

  factory ParticipantSettings.fromJson(Map<String, dynamic> json) =>
      _$ParticipantSettingsFromJson(json);
}

/// Conversation.
///
/// L'API sérialise la nature de la conversation sous la clé `type`, pas
/// `conversationType` — sauf sur la route de mise à jour, qui renvoie le
/// modèle de domaine ; `messaging.updateConversation` traduit cette clé.
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
