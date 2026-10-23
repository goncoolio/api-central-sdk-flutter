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
/// [Message.replyTo] est un aperçu d'un seul niveau du message auquel
/// celui-ci répond, quelle que soit la route : le `replyTo` d'un `replyTo`
/// vaut toujours `null`. Si la cible a été supprimée, son contenu et ses
/// pièces jointes arrivent vides. Une application qui affiche un fil de
/// discussion complet recharge chaque message par son identifiant.
@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String content,
    required ContentType contentType,
    String? clientMessageId,
    UserInfo? sender,

    /// Pièces jointes du message.
    ///
    /// L'API renvoie toujours un tableau — vide quand le message n'en porte
    /// aucune — jamais un objet.
    List<Attachment>? attachments,
    Message? replyTo,
    @Default(<Reaction>[]) List<Reaction> reactions,
    @Default(false) bool isEdited,
    DateTime? editedAt,
    @Default(false) bool isDeleted,

    /// Identifiants des utilisateurs qui ont lu ce message.
    ///
    /// Permet de reconstruire les accusés de lecture d'un groupe après une
    /// reconnexion, sans attendre les événements temps réel.
    @Default(<String>[]) List<String> readBy,
    DateTime? createdAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
