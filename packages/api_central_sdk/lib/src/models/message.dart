import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_info.dart';

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
/// La profondeur de [Message.replyTo] dépend de la route appelée :
/// `getMessage` et `sendMessage` remontent la chaîne complète des réponses,
/// tandis que `listMessages` s'arrête au premier niveau — le `replyTo` d'un
/// `replyTo` y vaut toujours `null`. Une application qui affiche un fil de
/// discussion complet doit donc recharger le message par son identifiant.
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
    Message? replyTo,
    @Default(<Reaction>[]) List<Reaction> reactions,
    @Default(false) bool isEdited,
    DateTime? editedAt,
    @Default(false) bool isDeleted,
    DateTime? createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
