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

MessageDeliveredEvent _$MessageDeliveredEventFromJson(
  Map<String, dynamic> json,
) => MessageDeliveredEvent(
  conversationId: json['conversationId'] as String,
  userId: json['userId'] as String,
  deliveredAt: json['deliveredAt'] as String,
  messageIds:
      (json['messageIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  $type: json['type'] as String?,
);

Map<String, dynamic> _$MessageDeliveredEventToJson(
  MessageDeliveredEvent instance,
) => <String, dynamic>{
  'conversationId': instance.conversationId,
  'userId': instance.userId,
  'deliveredAt': instance.deliveredAt,
  'messageIds': instance.messageIds,
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

PresenceStatusEvent _$PresenceStatusEventFromJson(Map<String, dynamic> json) =>
    PresenceStatusEvent(
      statuses:
          (json['statuses'] as List<dynamic>?)
              ?.map(
                (e) => PresenceStatusItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <PresenceStatusItem>[],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$PresenceStatusEventToJson(
  PresenceStatusEvent instance,
) => <String, dynamic>{
  'statuses': instance.statuses.map((e) => e.toJson()).toList(),
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

StatsEvent _$StatsEventFromJson(Map<String, dynamic> json) => StatsEvent(
  totalConnections: (json['totalConnections'] as num?)?.toInt() ?? 0,
  applications: (json['applications'] as num?)?.toInt() ?? 0,
  usersOnline: (json['usersOnline'] as num?)?.toInt() ?? 0,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$StatsEventToJson(StatsEvent instance) =>
    <String, dynamic>{
      'totalConnections': instance.totalConnections,
      'applications': instance.applications,
      'usersOnline': instance.usersOnline,
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

StreamJoinedEvent _$StreamJoinedEventFromJson(Map<String, dynamic> json) =>
    StreamJoinedEvent(
      streamId: json['streamId'] as String,
      viewerCount: (json['viewerCount'] as num?)?.toInt() ?? 0,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$StreamJoinedEventToJson(StreamJoinedEvent instance) =>
    <String, dynamic>{
      'streamId': instance.streamId,
      'viewerCount': instance.viewerCount,
      'type': instance.$type,
    };

StreamLeftEvent _$StreamLeftEventFromJson(Map<String, dynamic> json) =>
    StreamLeftEvent(
      streamId: json['streamId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$StreamLeftEventToJson(StreamLeftEvent instance) =>
    <String, dynamic>{'streamId': instance.streamId, 'type': instance.$type};

StreamStartedEvent _$StreamStartedEventFromJson(Map<String, dynamic> json) =>
    StreamStartedEvent(
      streamId: json['streamId'] as String,
      title: json['title'] as String,
      hostId: json['hostId'] as String?,
      hostName: json['hostName'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$StreamStartedEventToJson(StreamStartedEvent instance) =>
    <String, dynamic>{
      'streamId': instance.streamId,
      'title': instance.title,
      'hostId': instance.hostId,
      'hostName': instance.hostName,
      'type': instance.$type,
    };

StreamPausedEvent _$StreamPausedEventFromJson(Map<String, dynamic> json) =>
    StreamPausedEvent(
      streamId: json['streamId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$StreamPausedEventToJson(StreamPausedEvent instance) =>
    <String, dynamic>{'streamId': instance.streamId, 'type': instance.$type};

StreamEndedEvent _$StreamEndedEventFromJson(Map<String, dynamic> json) =>
    StreamEndedEvent(
      streamId: json['streamId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$StreamEndedEventToJson(StreamEndedEvent instance) =>
    <String, dynamic>{'streamId': instance.streamId, 'type': instance.$type};

StreamViewerCountEvent _$StreamViewerCountEventFromJson(
  Map<String, dynamic> json,
) => StreamViewerCountEvent(
  streamId: json['streamId'] as String,
  count: (json['count'] as num?)?.toInt() ?? 0,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$StreamViewerCountEventToJson(
  StreamViewerCountEvent instance,
) => <String, dynamic>{
  'streamId': instance.streamId,
  'count': instance.count,
  'type': instance.$type,
};

StreamViewerJoinedEvent _$StreamViewerJoinedEventFromJson(
  Map<String, dynamic> json,
) => StreamViewerJoinedEvent(
  streamId: json['streamId'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$StreamViewerJoinedEventToJson(
  StreamViewerJoinedEvent instance,
) => <String, dynamic>{
  'streamId': instance.streamId,
  'userId': instance.userId,
  'userName': instance.userName,
  'type': instance.$type,
};

StreamViewerLeftEvent _$StreamViewerLeftEventFromJson(
  Map<String, dynamic> json,
) => StreamViewerLeftEvent(
  streamId: json['streamId'] as String,
  userId: json['userId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$StreamViewerLeftEventToJson(
  StreamViewerLeftEvent instance,
) => <String, dynamic>{
  'streamId': instance.streamId,
  'userId': instance.userId,
  'type': instance.$type,
};

StreamCommentNewEvent _$StreamCommentNewEventFromJson(
  Map<String, dynamic> json,
) => StreamCommentNewEvent(
  streamId: json['streamId'] as String,
  commentId: json['commentId'] as String,
  userId: json['userId'] as String,
  content: json['content'] as String,
  userName: json['userName'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$StreamCommentNewEventToJson(
  StreamCommentNewEvent instance,
) => <String, dynamic>{
  'streamId': instance.streamId,
  'commentId': instance.commentId,
  'userId': instance.userId,
  'content': instance.content,
  'userName': instance.userName,
  'type': instance.$type,
};

StreamReactionBurstEvent _$StreamReactionBurstEventFromJson(
  Map<String, dynamic> json,
) => StreamReactionBurstEvent(
  streamId: json['streamId'] as String,
  emoji: json['emoji'] as String,
  count: (json['count'] as num?)?.toInt() ?? 0,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$StreamReactionBurstEventToJson(
  StreamReactionBurstEvent instance,
) => <String, dynamic>{
  'streamId': instance.streamId,
  'emoji': instance.emoji,
  'count': instance.count,
  'type': instance.$type,
};

CallJoinedEvent _$CallJoinedEventFromJson(Map<String, dynamic> json) =>
    CallJoinedEvent(
      callId: json['callId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallJoinedEventToJson(CallJoinedEvent instance) =>
    <String, dynamic>{'callId': instance.callId, 'type': instance.$type};

CallLeftEvent _$CallLeftEventFromJson(Map<String, dynamic> json) =>
    CallLeftEvent(
      callId: json['callId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallLeftEventToJson(CallLeftEvent instance) =>
    <String, dynamic>{'callId': instance.callId, 'type': instance.$type};

CallIncomingEvent _$CallIncomingEventFromJson(Map<String, dynamic> json) =>
    CallIncomingEvent(
      callId: json['callId'] as String,
      callerId: json['callerId'] as String,
      callerName: json['callerName'] as String?,
      callType: json['callType'] as String?,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallIncomingEventToJson(CallIncomingEvent instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'callerId': instance.callerId,
      'callerName': instance.callerName,
      'callType': instance.callType,
      'type': instance.$type,
    };

CallAnsweredEvent _$CallAnsweredEventFromJson(Map<String, dynamic> json) =>
    CallAnsweredEvent(
      callId: json['callId'] as String,
      userId: json['userId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallAnsweredEventToJson(CallAnsweredEvent instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'userId': instance.userId,
      'type': instance.$type,
    };

CallConnectedEvent _$CallConnectedEventFromJson(Map<String, dynamic> json) =>
    CallConnectedEvent(
      callId: json['callId'] as String,
      participantIds:
          (json['participantIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallConnectedEventToJson(CallConnectedEvent instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'participantIds': instance.participantIds,
      'type': instance.$type,
    };

CallDeclinedEvent _$CallDeclinedEventFromJson(Map<String, dynamic> json) =>
    CallDeclinedEvent(
      callId: json['callId'] as String,
      userId: json['userId'] as String,
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallDeclinedEventToJson(CallDeclinedEvent instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'userId': instance.userId,
      'type': instance.$type,
    };

CallEndedEvent _$CallEndedEventFromJson(Map<String, dynamic> json) =>
    CallEndedEvent(
      callId: json['callId'] as String,
      reason: json['reason'] as String?,
      durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
      $type: json['type'] as String?,
    );

Map<String, dynamic> _$CallEndedEventToJson(CallEndedEvent instance) =>
    <String, dynamic>{
      'callId': instance.callId,
      'reason': instance.reason,
      'durationSeconds': instance.durationSeconds,
      'type': instance.$type,
    };

CallParticipantJoinedEvent _$CallParticipantJoinedEventFromJson(
  Map<String, dynamic> json,
) => CallParticipantJoinedEvent(
  callId: json['callId'] as String,
  userId: json['userId'] as String,
  userName: json['userName'] as String?,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallParticipantJoinedEventToJson(
  CallParticipantJoinedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'userId': instance.userId,
  'userName': instance.userName,
  'type': instance.$type,
};

CallParticipantLeftEvent _$CallParticipantLeftEventFromJson(
  Map<String, dynamic> json,
) => CallParticipantLeftEvent(
  callId: json['callId'] as String,
  userId: json['userId'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallParticipantLeftEventToJson(
  CallParticipantLeftEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'userId': instance.userId,
  'type': instance.$type,
};

CallOfferReceivedEvent _$CallOfferReceivedEventFromJson(
  Map<String, dynamic> json,
) => CallOfferReceivedEvent(
  callId: json['callId'] as String,
  fromUserId: json['fromUserId'] as String,
  sdp: json['sdp'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallOfferReceivedEventToJson(
  CallOfferReceivedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'fromUserId': instance.fromUserId,
  'sdp': instance.sdp,
  'type': instance.$type,
};

CallAnswerReceivedEvent _$CallAnswerReceivedEventFromJson(
  Map<String, dynamic> json,
) => CallAnswerReceivedEvent(
  callId: json['callId'] as String,
  fromUserId: json['fromUserId'] as String,
  sdp: json['sdp'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallAnswerReceivedEventToJson(
  CallAnswerReceivedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'fromUserId': instance.fromUserId,
  'sdp': instance.sdp,
  'type': instance.$type,
};

CallIceCandidateReceivedEvent _$CallIceCandidateReceivedEventFromJson(
  Map<String, dynamic> json,
) => CallIceCandidateReceivedEvent(
  callId: json['callId'] as String,
  fromUserId: json['fromUserId'] as String,
  candidate: json['candidate'] as String,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallIceCandidateReceivedEventToJson(
  CallIceCandidateReceivedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'fromUserId': instance.fromUserId,
  'candidate': instance.candidate,
  'type': instance.$type,
};

CallMuteChangedEvent _$CallMuteChangedEventFromJson(
  Map<String, dynamic> json,
) => CallMuteChangedEvent(
  callId: json['callId'] as String,
  userId: json['userId'] as String,
  isMuted: json['isMuted'] as bool? ?? false,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallMuteChangedEventToJson(
  CallMuteChangedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'userId': instance.userId,
  'isMuted': instance.isMuted,
  'type': instance.$type,
};

CallVideoChangedEvent _$CallVideoChangedEventFromJson(
  Map<String, dynamic> json,
) => CallVideoChangedEvent(
  callId: json['callId'] as String,
  userId: json['userId'] as String,
  isVideoEnabled: json['isVideoEnabled'] as bool? ?? false,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallVideoChangedEventToJson(
  CallVideoChangedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'userId': instance.userId,
  'isVideoEnabled': instance.isVideoEnabled,
  'type': instance.$type,
};

CallScreenShareChangedEvent _$CallScreenShareChangedEventFromJson(
  Map<String, dynamic> json,
) => CallScreenShareChangedEvent(
  callId: json['callId'] as String,
  userId: json['userId'] as String,
  isScreenSharing: json['isScreenSharing'] as bool? ?? false,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$CallScreenShareChangedEventToJson(
  CallScreenShareChangedEvent instance,
) => <String, dynamic>{
  'callId': instance.callId,
  'userId': instance.userId,
  'isScreenSharing': instance.isScreenSharing,
  'type': instance.$type,
};

UnknownEvent _$UnknownEventFromJson(Map<String, dynamic> json) => UnknownEvent(
  type: json['type'] as String? ?? '',
  data: json['data'] as Map<String, dynamic>? ?? const <String, dynamic>{},
);

Map<String, dynamic> _$UnknownEventToJson(UnknownEvent instance) =>
    <String, dynamic>{'type': instance.type, 'data': instance.data};
