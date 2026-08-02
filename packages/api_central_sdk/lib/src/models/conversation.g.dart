// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
  id: json['id'] as String,
  externalUserId: json['externalUserId'] as String,
  displayName: json['displayName'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'externalUserId': instance.externalUserId,
  'displayName': instance.displayName,
  'avatarUrl': instance.avatarUrl,
};

_Participant _$ParticipantFromJson(Map<String, dynamic> json) => _Participant(
  id: json['id'] as String,
  user: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
  role: $enumDecode(_$ParticipantRoleEnumMap, json['role']),
  joinedAt: json['joinedAt'] == null
      ? null
      : DateTime.parse(json['joinedAt'] as String),
  isMuted: json['isMuted'] as bool? ?? false,
);

Map<String, dynamic> _$ParticipantToJson(_Participant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'role': _$ParticipantRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt?.toIso8601String(),
      'isMuted': instance.isMuted,
    };

const _$ParticipantRoleEnumMap = {
  ParticipantRole.admin: 'admin',
  ParticipantRole.member: 'member',
  ParticipantRole.readonly: 'readonly',
};

_LastMessagePreview _$LastMessagePreviewFromJson(Map<String, dynamic> json) =>
    _LastMessagePreview(
      id: json['id'] as String,
      content: json['content'] as String,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      sender: json['sender'] == null
          ? null
          : UserInfo.fromJson(json['sender'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$LastMessagePreviewToJson(_LastMessagePreview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'sender': instance.sender?.toJson(),
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

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      type: $enumDecode(_$ConversationTypeEnumMap, json['type']),
      applicationId: json['applicationId'] as String?,
      title: json['title'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      lastMessage: json['lastMessage'] == null
          ? null
          : LastMessagePreview.fromJson(
              json['lastMessage'] as Map<String, dynamic>,
            ),
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map((e) => Participant.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Participant>[],
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ConversationTypeEnumMap[instance.type]!,
      'applicationId': instance.applicationId,
      'title': instance.title,
      'avatarUrl': instance.avatarUrl,
      'metadata': instance.metadata,
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'lastMessage': instance.lastMessage?.toJson(),
      'participants': instance.participants.map((e) => e.toJson()).toList(),
      'unreadCount': instance.unreadCount,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$ConversationTypeEnumMap = {
  ConversationType.direct: 'direct',
  ConversationType.group: 'group',
  ConversationType.channel: 'channel',
};
