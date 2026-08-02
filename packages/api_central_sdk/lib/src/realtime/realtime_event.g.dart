// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConnectedEvent _$ConnectedEventFromJson(Map<String, dynamic> json) =>
    ConnectedEvent(
      socketId: json['socketId'] as String?,
      application: json['application'] as Map<String, dynamic>?,
      user: json['user'] as Map<String, dynamic>?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$ConnectedEventToJson(ConnectedEvent instance) =>
    <String, dynamic>{
      'socketId': instance.socketId,
      'application': instance.application,
      'user': instance.user,
      'type': instance.$type,
    };

ConversationJoinedEvent _$ConversationJoinedEventFromJson(
  Map<String, dynamic> json,
) => ConversationJoinedEvent(
  conversationId: json['conversationId'] as String,
  success: json['success'] as bool? ?? false,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ConversationJoinedEventToJson(
  ConversationJoinedEvent instance,
) => <String, dynamic>{
  'conversationId': instance.conversationId,
  'success': instance.success,
  'type': instance.$type,
};

ConversationLeftEvent _$ConversationLeftEventFromJson(
  Map<String, dynamic> json,
) => ConversationLeftEvent(
  conversationId: json['conversationId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ConversationLeftEventToJson(
  ConversationLeftEvent instance,
) => <String, dynamic>{
  'conversationId': instance.conversationId,
  'type': instance.$type,
};

MessageNewEvent _$MessageNewEventFromJson(Map<String, dynamic> json) =>
    MessageNewEvent(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      content: json['content'] as String,
      senderId: json['senderId'] as String?,
      contentType: json['contentType'] as String?,
      createdAt: json['createdAt'] as String?,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageNewEventToJson(MessageNewEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'content': instance.content,
      'senderId': instance.senderId,
      'contentType': instance.contentType,
      'createdAt': instance.createdAt,
      'participants': instance.participants,
      'type': instance.$type,
    };

MessageUpdatedEvent _$MessageUpdatedEventFromJson(Map<String, dynamic> json) =>
    MessageUpdatedEvent(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      content: json['content'] as String,
      senderId: json['senderId'] as String?,
      contentType: json['contentType'] as String?,
      createdAt: json['createdAt'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageUpdatedEventToJson(
  MessageUpdatedEvent instance,
) => <String, dynamic>{
  'id': instance.id,
  'conversationId': instance.conversationId,
  'content': instance.content,
  'senderId': instance.senderId,
  'contentType': instance.contentType,
  'createdAt': instance.createdAt,
  'type': instance.$type,
};

MessageDeletedEvent _$MessageDeletedEventFromJson(Map<String, dynamic> json) =>
    MessageDeletedEvent(
      id: json['id'] as String,
      conversationId: json['conversationId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageDeletedEventToJson(
  MessageDeletedEvent instance,
) => <String, dynamic>{
  'id': instance.id,
  'conversationId': instance.conversationId,
  'type': instance.$type,
};

MessageReadEvent _$MessageReadEventFromJson(Map<String, dynamic> json) =>
    MessageReadEvent(
      conversationId: json['conversationId'] as String,
      userId: json['userId'] as String,
      lastReadMessageId: json['lastReadMessageId'] as String,
      readAt: json['readAt'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$MessageReadEventToJson(MessageReadEvent instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'userId': instance.userId,
      'lastReadMessageId': instance.lastReadMessageId,
      'readAt': instance.readAt,
      'type': instance.$type,
    };

MessageReactionAddedEvent _$MessageReactionAddedEventFromJson(
  Map<String, dynamic> json,
) => MessageReactionAddedEvent(
  messageId: json['messageId'] as String,
  conversationId: json['conversationId'] as String,
  userId: json['userId'] as String,
  emoji: json['emoji'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$MessageReactionAddedEventToJson(
  MessageReactionAddedEvent instance,
) => <String, dynamic>{
  'messageId': instance.messageId,
  'conversationId': instance.conversationId,
  'userId': instance.userId,
  'emoji': instance.emoji,
  'type': instance.$type,
};

MessageReactionRemovedEvent _$MessageReactionRemovedEventFromJson(
  Map<String, dynamic> json,
) => MessageReactionRemovedEvent(
  messageId: json['messageId'] as String,
  conversationId: json['conversationId'] as String,
  userId: json['userId'] as String,
  emoji: json['emoji'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$MessageReactionRemovedEventToJson(
  MessageReactionRemovedEvent instance,
) => <String, dynamic>{
  'messageId': instance.messageId,
  'conversationId': instance.conversationId,
  'userId': instance.userId,
  'emoji': instance.emoji,
  'type': instance.$type,
};

TypingUpdateEvent _$TypingUpdateEventFromJson(Map<String, dynamic> json) =>
    TypingUpdateEvent(
      conversationId: json['conversationId'] as String,
      userIds:
          (json['userIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$TypingUpdateEventToJson(TypingUpdateEvent instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'userIds': instance.userIds,
      'type': instance.$type,
    };

PresenceUpdateEvent _$PresenceUpdateEventFromJson(Map<String, dynamic> json) =>
    PresenceUpdateEvent(
      userId: json['userId'] as String,
      status: json['status'] as String,
      timestamp: json['timestamp'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$PresenceUpdateEventToJson(
  PresenceUpdateEvent instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'status': instance.status,
  'timestamp': instance.timestamp,
  'type': instance.$type,
};

NotificationNewEvent _$NotificationNewEventFromJson(
  Map<String, dynamic> json,
) => NotificationNewEvent(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  notificationType: json['notificationType'] as String?,
  data: json['data'] as Map<String, dynamic>?,
  createdAt: json['createdAt'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$NotificationNewEventToJson(
  NotificationNewEvent instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'notificationType': instance.notificationType,
  'data': instance.data,
  'createdAt': instance.createdAt,
  'type': instance.$type,
};

NotificationReadEvent _$NotificationReadEventFromJson(
  Map<String, dynamic> json,
) => NotificationReadEvent(
  notificationIds:
      (json['notificationIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  $type: json['type'] as String?,
);

Map<String, dynamic> _$NotificationReadEventToJson(
  NotificationReadEvent instance,
) => <String, dynamic>{
  'notificationIds': instance.notificationIds,
  'type': instance.$type,
};

NotificationAllReadEvent _$NotificationAllReadEventFromJson(
  Map<String, dynamic> json,
) => NotificationAllReadEvent($type: json['type'] as String?);

Map<String, dynamic> _$NotificationAllReadEventToJson(
  NotificationAllReadEvent instance,
) => <String, dynamic>{'type': instance.$type};

PongEvent _$PongEventFromJson(Map<String, dynamic> json) => PongEvent(
  timestamp: json['timestamp'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$PongEventToJson(PongEvent instance) => <String, dynamic>{
  'timestamp': instance.timestamp,
  'type': instance.$type,
};

ErrorEvent _$ErrorEventFromJson(Map<String, dynamic> json) => ErrorEvent(
  code: json['code'] as String?,
  message: json['message'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ErrorEventToJson(ErrorEvent instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'type': instance.$type,
    };

UnknownEvent _$UnknownEventFromJson(Map<String, dynamic> json) => UnknownEvent(
  type: json['type'] as String? ?? '',
  data: json['data'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$UnknownEventToJson(UnknownEvent instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};
