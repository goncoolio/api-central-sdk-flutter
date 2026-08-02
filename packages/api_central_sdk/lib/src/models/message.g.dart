// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Attachment _$AttachmentFromJson(Map<String, dynamic> json) => _Attachment(
  url: json['url'] as String,
  mimeType: json['mimeType'] as String,
  name: json['name'] as String?,
  size: (json['size'] as num?)?.toInt(),
);

Map<String, dynamic> _$AttachmentToJson(_Attachment instance) =>
    <String, dynamic>{
      'url': instance.url,
      'mimeType': instance.mimeType,
      'name': instance.name,
      'size': instance.size,
    };

_Reaction _$ReactionFromJson(Map<String, dynamic> json) => _Reaction(
  emoji: json['emoji'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String?,
);

Map<String, dynamic> _$ReactionToJson(_Reaction instance) => <String, dynamic>{
  'emoji': instance.emoji,
  'userId': instance.userId,
  'userName': instance.userName,
};

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  id: json['id'] as String,
  conversationId: json['conversationId'] as String,
  content: json['content'] as String,
  contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
  clientMessageId: json['clientMessageId'] as String?,
  sender: json['sender'] == null
      ? null
      : UserInfo.fromJson(json['sender'] as Map<String, dynamic>),
  attachments: json['attachments'] as Map<String, dynamic>?,
  replyTo: json['replyTo'] == null
      ? null
      : Message.fromJson(json['replyTo'] as Map<String, dynamic>),
  reactions:
      (json['reactions'] as List<dynamic>?)
          ?.map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Reaction>[],
  isEdited: json['isEdited'] as bool? ?? false,
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  isDeleted: json['isDeleted'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'id': instance.id,
  'conversationId': instance.conversationId,
  'content': instance.content,
  'contentType': _$ContentTypeEnumMap[instance.contentType]!,
  'clientMessageId': instance.clientMessageId,
  'sender': instance.sender?.toJson(),
  'attachments': instance.attachments,
  'replyTo': instance.replyTo?.toJson(),
  'reactions': instance.reactions.map((e) => e.toJson()).toList(),
  'isEdited': instance.isEdited,
  'editedAt': instance.editedAt?.toIso8601String(),
  'isDeleted': instance.isDeleted,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$ContentTypeEnumMap = {
  ContentType.text: 'text',
  ContentType.image: 'image',
  ContentType.file: 'file',
  ContentType.audio: 'audio',
  ContentType.video: 'video',
  ContentType.location: 'location',
  ContentType.system: 'system',
};
