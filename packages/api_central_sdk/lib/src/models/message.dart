import 'package:freezed_annotation/freezed_annotation.dart';

import 'conversation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

/// Nature du contenu d'un message.
enum ContentType {
  @JsonValue('text')
  text,
  @JsonValue('image')
  image,
  @JsonValue('file')
  file,
  @JsonValue('audio')
  audio,
  @JsonValue('video')
  video,
  @JsonValue('location')
  location,
  @JsonValue('system')
  system,
}

/// Pièce jointe d'un message.
@freezed
abstract class Attachment with _$Attachment {
  const factory Attachment({
    required String url,
    required String mimeType,
    String? name,
    int? size,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) =>
      _$AttachmentFromJson(json);
}

/// Réaction apposée à un message.
@freezed
abstract class Reaction with _$Reaction {
  const factory Reaction({
    required String emoji,
    required String userId,
    String? userName,
  }) = _Reaction;

  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);
}

/// Message d'une conversation.
///
/// `replyTo` est volontairement absent : l'API le renvoie sous forme récursive,
/// que la génération freezed gère mal. À traiter si le besoin se confirme.
@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String content,
    required ContentType contentType,
    String? clientMessageId,
    UserInfo? sender,
    Map<String, dynamic>? attachments,
    @Default(<Reaction>[]) List<Reaction> reactions,
    @Default(false) bool isEdited,
    DateTime? editedAt,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
