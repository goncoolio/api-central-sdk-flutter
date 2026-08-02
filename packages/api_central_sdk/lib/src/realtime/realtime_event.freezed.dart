// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'realtime_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
RealtimeEvent _$RealtimeEventFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'connected':
          return ConnectedEvent.fromJson(
            json
          );
                case 'conversation_joined':
          return ConversationJoinedEvent.fromJson(
            json
          );
                case 'conversation_left':
          return ConversationLeftEvent.fromJson(
            json
          );
                case 'message_new':
          return MessageNewEvent.fromJson(
            json
          );
                case 'message_updated':
          return MessageUpdatedEvent.fromJson(
            json
          );
                case 'message_deleted':
          return MessageDeletedEvent.fromJson(
            json
          );
                case 'message_read':
          return MessageReadEvent.fromJson(
            json
          );
                case 'message_reaction_added':
          return MessageReactionAddedEvent.fromJson(
            json
          );
                case 'message_reaction_removed':
          return MessageReactionRemovedEvent.fromJson(
            json
          );
                case 'typing_update':
          return TypingUpdateEvent.fromJson(
            json
          );
                case 'presence_update':
          return PresenceUpdateEvent.fromJson(
            json
          );
                case 'notification_new':
          return NotificationNewEvent.fromJson(
            json
          );
                case 'notification_read':
          return NotificationReadEvent.fromJson(
            json
          );
                case 'notification_all_read':
          return NotificationAllReadEvent.fromJson(
            json
          );
                case 'pong':
          return PongEvent.fromJson(
            json
          );
                case 'error':
          return ErrorEvent.fromJson(
            json
          );
                case 'stream_joined':
          return StreamJoinedEvent.fromJson(
            json
          );
                case 'stream_left':
          return StreamLeftEvent.fromJson(
            json
          );
                case 'stream_started':
          return StreamStartedEvent.fromJson(
            json
          );
                case 'stream_paused':
          return StreamPausedEvent.fromJson(
            json
          );
                case 'stream_ended':
          return StreamEndedEvent.fromJson(
            json
          );
                case 'stream_viewer_count':
          return StreamViewerCountEvent.fromJson(
            json
          );
                case 'stream_viewer_joined':
          return StreamViewerJoinedEvent.fromJson(
            json
          );
                case 'stream_viewer_left':
          return StreamViewerLeftEvent.fromJson(
            json
          );
                case 'stream_comment_new':
          return StreamCommentNewEvent.fromJson(
            json
          );
                case 'stream_reaction_burst':
          return StreamReactionBurstEvent.fromJson(
            json
          );
        
          default:
            return UnknownEvent.fromJson(
  json
);
        }
      
}

/// @nodoc
mixin _$RealtimeEvent {



  /// Serializes this RealtimeEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RealtimeEvent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeEvent()';
}


}

/// @nodoc
class $RealtimeEventCopyWith<$Res>  {
$RealtimeEventCopyWith(RealtimeEvent _, $Res Function(RealtimeEvent) __);
}


/// Adds pattern-matching-related methods to [RealtimeEvent].
extension RealtimeEventPatterns on RealtimeEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ConnectedEvent value)?  connected,TResult Function( ConversationJoinedEvent value)?  conversationJoined,TResult Function( ConversationLeftEvent value)?  conversationLeft,TResult Function( MessageNewEvent value)?  messageNew,TResult Function( MessageUpdatedEvent value)?  messageUpdated,TResult Function( MessageDeletedEvent value)?  messageDeleted,TResult Function( MessageReadEvent value)?  messageRead,TResult Function( MessageReactionAddedEvent value)?  messageReactionAdded,TResult Function( MessageReactionRemovedEvent value)?  messageReactionRemoved,TResult Function( TypingUpdateEvent value)?  typingUpdate,TResult Function( PresenceUpdateEvent value)?  presenceUpdate,TResult Function( NotificationNewEvent value)?  notificationNew,TResult Function( NotificationReadEvent value)?  notificationRead,TResult Function( NotificationAllReadEvent value)?  notificationAllRead,TResult Function( PongEvent value)?  pong,TResult Function( ErrorEvent value)?  errorEvent,TResult Function( StreamJoinedEvent value)?  streamJoined,TResult Function( StreamLeftEvent value)?  streamLeft,TResult Function( StreamStartedEvent value)?  streamStarted,TResult Function( StreamPausedEvent value)?  streamPaused,TResult Function( StreamEndedEvent value)?  streamEnded,TResult Function( StreamViewerCountEvent value)?  streamViewerCount,TResult Function( StreamViewerJoinedEvent value)?  streamViewerJoined,TResult Function( StreamViewerLeftEvent value)?  streamViewerLeft,TResult Function( StreamCommentNewEvent value)?  streamCommentNew,TResult Function( StreamReactionBurstEvent value)?  streamReactionBurst,TResult Function( UnknownEvent value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ConnectedEvent() when connected != null:
return connected(_that);case ConversationJoinedEvent() when conversationJoined != null:
return conversationJoined(_that);case ConversationLeftEvent() when conversationLeft != null:
return conversationLeft(_that);case MessageNewEvent() when messageNew != null:
return messageNew(_that);case MessageUpdatedEvent() when messageUpdated != null:
return messageUpdated(_that);case MessageDeletedEvent() when messageDeleted != null:
return messageDeleted(_that);case MessageReadEvent() when messageRead != null:
return messageRead(_that);case MessageReactionAddedEvent() when messageReactionAdded != null:
return messageReactionAdded(_that);case MessageReactionRemovedEvent() when messageReactionRemoved != null:
return messageReactionRemoved(_that);case TypingUpdateEvent() when typingUpdate != null:
return typingUpdate(_that);case PresenceUpdateEvent() when presenceUpdate != null:
return presenceUpdate(_that);case NotificationNewEvent() when notificationNew != null:
return notificationNew(_that);case NotificationReadEvent() when notificationRead != null:
return notificationRead(_that);case NotificationAllReadEvent() when notificationAllRead != null:
return notificationAllRead(_that);case PongEvent() when pong != null:
return pong(_that);case ErrorEvent() when errorEvent != null:
return errorEvent(_that);case StreamJoinedEvent() when streamJoined != null:
return streamJoined(_that);case StreamLeftEvent() when streamLeft != null:
return streamLeft(_that);case StreamStartedEvent() when streamStarted != null:
return streamStarted(_that);case StreamPausedEvent() when streamPaused != null:
return streamPaused(_that);case StreamEndedEvent() when streamEnded != null:
return streamEnded(_that);case StreamViewerCountEvent() when streamViewerCount != null:
return streamViewerCount(_that);case StreamViewerJoinedEvent() when streamViewerJoined != null:
return streamViewerJoined(_that);case StreamViewerLeftEvent() when streamViewerLeft != null:
return streamViewerLeft(_that);case StreamCommentNewEvent() when streamCommentNew != null:
return streamCommentNew(_that);case StreamReactionBurstEvent() when streamReactionBurst != null:
return streamReactionBurst(_that);case UnknownEvent() when unknown != null:
return unknown(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ConnectedEvent value)  connected,required TResult Function( ConversationJoinedEvent value)  conversationJoined,required TResult Function( ConversationLeftEvent value)  conversationLeft,required TResult Function( MessageNewEvent value)  messageNew,required TResult Function( MessageUpdatedEvent value)  messageUpdated,required TResult Function( MessageDeletedEvent value)  messageDeleted,required TResult Function( MessageReadEvent value)  messageRead,required TResult Function( MessageReactionAddedEvent value)  messageReactionAdded,required TResult Function( MessageReactionRemovedEvent value)  messageReactionRemoved,required TResult Function( TypingUpdateEvent value)  typingUpdate,required TResult Function( PresenceUpdateEvent value)  presenceUpdate,required TResult Function( NotificationNewEvent value)  notificationNew,required TResult Function( NotificationReadEvent value)  notificationRead,required TResult Function( NotificationAllReadEvent value)  notificationAllRead,required TResult Function( PongEvent value)  pong,required TResult Function( ErrorEvent value)  errorEvent,required TResult Function( StreamJoinedEvent value)  streamJoined,required TResult Function( StreamLeftEvent value)  streamLeft,required TResult Function( StreamStartedEvent value)  streamStarted,required TResult Function( StreamPausedEvent value)  streamPaused,required TResult Function( StreamEndedEvent value)  streamEnded,required TResult Function( StreamViewerCountEvent value)  streamViewerCount,required TResult Function( StreamViewerJoinedEvent value)  streamViewerJoined,required TResult Function( StreamViewerLeftEvent value)  streamViewerLeft,required TResult Function( StreamCommentNewEvent value)  streamCommentNew,required TResult Function( StreamReactionBurstEvent value)  streamReactionBurst,required TResult Function( UnknownEvent value)  unknown,}){
final _that = this;
switch (_that) {
case ConnectedEvent():
return connected(_that);case ConversationJoinedEvent():
return conversationJoined(_that);case ConversationLeftEvent():
return conversationLeft(_that);case MessageNewEvent():
return messageNew(_that);case MessageUpdatedEvent():
return messageUpdated(_that);case MessageDeletedEvent():
return messageDeleted(_that);case MessageReadEvent():
return messageRead(_that);case MessageReactionAddedEvent():
return messageReactionAdded(_that);case MessageReactionRemovedEvent():
return messageReactionRemoved(_that);case TypingUpdateEvent():
return typingUpdate(_that);case PresenceUpdateEvent():
return presenceUpdate(_that);case NotificationNewEvent():
return notificationNew(_that);case NotificationReadEvent():
return notificationRead(_that);case NotificationAllReadEvent():
return notificationAllRead(_that);case PongEvent():
return pong(_that);case ErrorEvent():
return errorEvent(_that);case StreamJoinedEvent():
return streamJoined(_that);case StreamLeftEvent():
return streamLeft(_that);case StreamStartedEvent():
return streamStarted(_that);case StreamPausedEvent():
return streamPaused(_that);case StreamEndedEvent():
return streamEnded(_that);case StreamViewerCountEvent():
return streamViewerCount(_that);case StreamViewerJoinedEvent():
return streamViewerJoined(_that);case StreamViewerLeftEvent():
return streamViewerLeft(_that);case StreamCommentNewEvent():
return streamCommentNew(_that);case StreamReactionBurstEvent():
return streamReactionBurst(_that);case UnknownEvent():
return unknown(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ConnectedEvent value)?  connected,TResult? Function( ConversationJoinedEvent value)?  conversationJoined,TResult? Function( ConversationLeftEvent value)?  conversationLeft,TResult? Function( MessageNewEvent value)?  messageNew,TResult? Function( MessageUpdatedEvent value)?  messageUpdated,TResult? Function( MessageDeletedEvent value)?  messageDeleted,TResult? Function( MessageReadEvent value)?  messageRead,TResult? Function( MessageReactionAddedEvent value)?  messageReactionAdded,TResult? Function( MessageReactionRemovedEvent value)?  messageReactionRemoved,TResult? Function( TypingUpdateEvent value)?  typingUpdate,TResult? Function( PresenceUpdateEvent value)?  presenceUpdate,TResult? Function( NotificationNewEvent value)?  notificationNew,TResult? Function( NotificationReadEvent value)?  notificationRead,TResult? Function( NotificationAllReadEvent value)?  notificationAllRead,TResult? Function( PongEvent value)?  pong,TResult? Function( ErrorEvent value)?  errorEvent,TResult? Function( StreamJoinedEvent value)?  streamJoined,TResult? Function( StreamLeftEvent value)?  streamLeft,TResult? Function( StreamStartedEvent value)?  streamStarted,TResult? Function( StreamPausedEvent value)?  streamPaused,TResult? Function( StreamEndedEvent value)?  streamEnded,TResult? Function( StreamViewerCountEvent value)?  streamViewerCount,TResult? Function( StreamViewerJoinedEvent value)?  streamViewerJoined,TResult? Function( StreamViewerLeftEvent value)?  streamViewerLeft,TResult? Function( StreamCommentNewEvent value)?  streamCommentNew,TResult? Function( StreamReactionBurstEvent value)?  streamReactionBurst,TResult? Function( UnknownEvent value)?  unknown,}){
final _that = this;
switch (_that) {
case ConnectedEvent() when connected != null:
return connected(_that);case ConversationJoinedEvent() when conversationJoined != null:
return conversationJoined(_that);case ConversationLeftEvent() when conversationLeft != null:
return conversationLeft(_that);case MessageNewEvent() when messageNew != null:
return messageNew(_that);case MessageUpdatedEvent() when messageUpdated != null:
return messageUpdated(_that);case MessageDeletedEvent() when messageDeleted != null:
return messageDeleted(_that);case MessageReadEvent() when messageRead != null:
return messageRead(_that);case MessageReactionAddedEvent() when messageReactionAdded != null:
return messageReactionAdded(_that);case MessageReactionRemovedEvent() when messageReactionRemoved != null:
return messageReactionRemoved(_that);case TypingUpdateEvent() when typingUpdate != null:
return typingUpdate(_that);case PresenceUpdateEvent() when presenceUpdate != null:
return presenceUpdate(_that);case NotificationNewEvent() when notificationNew != null:
return notificationNew(_that);case NotificationReadEvent() when notificationRead != null:
return notificationRead(_that);case NotificationAllReadEvent() when notificationAllRead != null:
return notificationAllRead(_that);case PongEvent() when pong != null:
return pong(_that);case ErrorEvent() when errorEvent != null:
return errorEvent(_that);case StreamJoinedEvent() when streamJoined != null:
return streamJoined(_that);case StreamLeftEvent() when streamLeft != null:
return streamLeft(_that);case StreamStartedEvent() when streamStarted != null:
return streamStarted(_that);case StreamPausedEvent() when streamPaused != null:
return streamPaused(_that);case StreamEndedEvent() when streamEnded != null:
return streamEnded(_that);case StreamViewerCountEvent() when streamViewerCount != null:
return streamViewerCount(_that);case StreamViewerJoinedEvent() when streamViewerJoined != null:
return streamViewerJoined(_that);case StreamViewerLeftEvent() when streamViewerLeft != null:
return streamViewerLeft(_that);case StreamCommentNewEvent() when streamCommentNew != null:
return streamCommentNew(_that);case StreamReactionBurstEvent() when streamReactionBurst != null:
return streamReactionBurst(_that);case UnknownEvent() when unknown != null:
return unknown(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? socketId,  Map<String, dynamic>? application,  Map<String, dynamic>? user)?  connected,TResult Function( String conversationId,  bool success)?  conversationJoined,TResult Function( String conversationId)?  conversationLeft,TResult Function( String id,  String conversationId,  String content,  String? senderId,  String? contentType,  String? createdAt,  List<String>? participants)?  messageNew,TResult Function( String id,  String conversationId,  String content,  String? senderId,  String? contentType,  String? createdAt)?  messageUpdated,TResult Function( String id,  String conversationId)?  messageDeleted,TResult Function( String conversationId,  String userId,  String lastReadMessageId,  String readAt)?  messageRead,TResult Function( String messageId,  String conversationId,  String userId,  String emoji)?  messageReactionAdded,TResult Function( String messageId,  String conversationId,  String userId,  String emoji)?  messageReactionRemoved,TResult Function( String conversationId,  List<String> userIds)?  typingUpdate,TResult Function( String userId,  String status,  String? timestamp)?  presenceUpdate,TResult Function( String id,  String title,  String body,  String? notificationType,  Map<String, dynamic>? data,  String? createdAt)?  notificationNew,TResult Function( List<String> notificationIds)?  notificationRead,TResult Function()?  notificationAllRead,TResult Function( String? timestamp)?  pong,TResult Function( String? code,  String? message)?  errorEvent,TResult Function( String streamId,  int viewerCount)?  streamJoined,TResult Function( String streamId)?  streamLeft,TResult Function( String streamId,  String title,  String? hostId,  String? hostName)?  streamStarted,TResult Function( String streamId)?  streamPaused,TResult Function( String streamId)?  streamEnded,TResult Function( String streamId,  int count)?  streamViewerCount,TResult Function( String streamId,  String userId,  String? userName)?  streamViewerJoined,TResult Function( String streamId,  String userId)?  streamViewerLeft,TResult Function( String streamId,  String commentId,  String userId,  String content,  String? userName)?  streamCommentNew,TResult Function( String streamId,  String emoji,  int count)?  streamReactionBurst,TResult Function( String type,  Map<String, dynamic> data)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ConnectedEvent() when connected != null:
return connected(_that.socketId,_that.application,_that.user);case ConversationJoinedEvent() when conversationJoined != null:
return conversationJoined(_that.conversationId,_that.success);case ConversationLeftEvent() when conversationLeft != null:
return conversationLeft(_that.conversationId);case MessageNewEvent() when messageNew != null:
return messageNew(_that.id,_that.conversationId,_that.content,_that.senderId,_that.contentType,_that.createdAt,_that.participants);case MessageUpdatedEvent() when messageUpdated != null:
return messageUpdated(_that.id,_that.conversationId,_that.content,_that.senderId,_that.contentType,_that.createdAt);case MessageDeletedEvent() when messageDeleted != null:
return messageDeleted(_that.id,_that.conversationId);case MessageReadEvent() when messageRead != null:
return messageRead(_that.conversationId,_that.userId,_that.lastReadMessageId,_that.readAt);case MessageReactionAddedEvent() when messageReactionAdded != null:
return messageReactionAdded(_that.messageId,_that.conversationId,_that.userId,_that.emoji);case MessageReactionRemovedEvent() when messageReactionRemoved != null:
return messageReactionRemoved(_that.messageId,_that.conversationId,_that.userId,_that.emoji);case TypingUpdateEvent() when typingUpdate != null:
return typingUpdate(_that.conversationId,_that.userIds);case PresenceUpdateEvent() when presenceUpdate != null:
return presenceUpdate(_that.userId,_that.status,_that.timestamp);case NotificationNewEvent() when notificationNew != null:
return notificationNew(_that.id,_that.title,_that.body,_that.notificationType,_that.data,_that.createdAt);case NotificationReadEvent() when notificationRead != null:
return notificationRead(_that.notificationIds);case NotificationAllReadEvent() when notificationAllRead != null:
return notificationAllRead();case PongEvent() when pong != null:
return pong(_that.timestamp);case ErrorEvent() when errorEvent != null:
return errorEvent(_that.code,_that.message);case StreamJoinedEvent() when streamJoined != null:
return streamJoined(_that.streamId,_that.viewerCount);case StreamLeftEvent() when streamLeft != null:
return streamLeft(_that.streamId);case StreamStartedEvent() when streamStarted != null:
return streamStarted(_that.streamId,_that.title,_that.hostId,_that.hostName);case StreamPausedEvent() when streamPaused != null:
return streamPaused(_that.streamId);case StreamEndedEvent() when streamEnded != null:
return streamEnded(_that.streamId);case StreamViewerCountEvent() when streamViewerCount != null:
return streamViewerCount(_that.streamId,_that.count);case StreamViewerJoinedEvent() when streamViewerJoined != null:
return streamViewerJoined(_that.streamId,_that.userId,_that.userName);case StreamViewerLeftEvent() when streamViewerLeft != null:
return streamViewerLeft(_that.streamId,_that.userId);case StreamCommentNewEvent() when streamCommentNew != null:
return streamCommentNew(_that.streamId,_that.commentId,_that.userId,_that.content,_that.userName);case StreamReactionBurstEvent() when streamReactionBurst != null:
return streamReactionBurst(_that.streamId,_that.emoji,_that.count);case UnknownEvent() when unknown != null:
return unknown(_that.type,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? socketId,  Map<String, dynamic>? application,  Map<String, dynamic>? user)  connected,required TResult Function( String conversationId,  bool success)  conversationJoined,required TResult Function( String conversationId)  conversationLeft,required TResult Function( String id,  String conversationId,  String content,  String? senderId,  String? contentType,  String? createdAt,  List<String>? participants)  messageNew,required TResult Function( String id,  String conversationId,  String content,  String? senderId,  String? contentType,  String? createdAt)  messageUpdated,required TResult Function( String id,  String conversationId)  messageDeleted,required TResult Function( String conversationId,  String userId,  String lastReadMessageId,  String readAt)  messageRead,required TResult Function( String messageId,  String conversationId,  String userId,  String emoji)  messageReactionAdded,required TResult Function( String messageId,  String conversationId,  String userId,  String emoji)  messageReactionRemoved,required TResult Function( String conversationId,  List<String> userIds)  typingUpdate,required TResult Function( String userId,  String status,  String? timestamp)  presenceUpdate,required TResult Function( String id,  String title,  String body,  String? notificationType,  Map<String, dynamic>? data,  String? createdAt)  notificationNew,required TResult Function( List<String> notificationIds)  notificationRead,required TResult Function()  notificationAllRead,required TResult Function( String? timestamp)  pong,required TResult Function( String? code,  String? message)  errorEvent,required TResult Function( String streamId,  int viewerCount)  streamJoined,required TResult Function( String streamId)  streamLeft,required TResult Function( String streamId,  String title,  String? hostId,  String? hostName)  streamStarted,required TResult Function( String streamId)  streamPaused,required TResult Function( String streamId)  streamEnded,required TResult Function( String streamId,  int count)  streamViewerCount,required TResult Function( String streamId,  String userId,  String? userName)  streamViewerJoined,required TResult Function( String streamId,  String userId)  streamViewerLeft,required TResult Function( String streamId,  String commentId,  String userId,  String content,  String? userName)  streamCommentNew,required TResult Function( String streamId,  String emoji,  int count)  streamReactionBurst,required TResult Function( String type,  Map<String, dynamic> data)  unknown,}) {final _that = this;
switch (_that) {
case ConnectedEvent():
return connected(_that.socketId,_that.application,_that.user);case ConversationJoinedEvent():
return conversationJoined(_that.conversationId,_that.success);case ConversationLeftEvent():
return conversationLeft(_that.conversationId);case MessageNewEvent():
return messageNew(_that.id,_that.conversationId,_that.content,_that.senderId,_that.contentType,_that.createdAt,_that.participants);case MessageUpdatedEvent():
return messageUpdated(_that.id,_that.conversationId,_that.content,_that.senderId,_that.contentType,_that.createdAt);case MessageDeletedEvent():
return messageDeleted(_that.id,_that.conversationId);case MessageReadEvent():
return messageRead(_that.conversationId,_that.userId,_that.lastReadMessageId,_that.readAt);case MessageReactionAddedEvent():
return messageReactionAdded(_that.messageId,_that.conversationId,_that.userId,_that.emoji);case MessageReactionRemovedEvent():
return messageReactionRemoved(_that.messageId,_that.conversationId,_that.userId,_that.emoji);case TypingUpdateEvent():
return typingUpdate(_that.conversationId,_that.userIds);case PresenceUpdateEvent():
return presenceUpdate(_that.userId,_that.status,_that.timestamp);case NotificationNewEvent():
return notificationNew(_that.id,_that.title,_that.body,_that.notificationType,_that.data,_that.createdAt);case NotificationReadEvent():
return notificationRead(_that.notificationIds);case NotificationAllReadEvent():
return notificationAllRead();case PongEvent():
return pong(_that.timestamp);case ErrorEvent():
return errorEvent(_that.code,_that.message);case StreamJoinedEvent():
return streamJoined(_that.streamId,_that.viewerCount);case StreamLeftEvent():
return streamLeft(_that.streamId);case StreamStartedEvent():
return streamStarted(_that.streamId,_that.title,_that.hostId,_that.hostName);case StreamPausedEvent():
return streamPaused(_that.streamId);case StreamEndedEvent():
return streamEnded(_that.streamId);case StreamViewerCountEvent():
return streamViewerCount(_that.streamId,_that.count);case StreamViewerJoinedEvent():
return streamViewerJoined(_that.streamId,_that.userId,_that.userName);case StreamViewerLeftEvent():
return streamViewerLeft(_that.streamId,_that.userId);case StreamCommentNewEvent():
return streamCommentNew(_that.streamId,_that.commentId,_that.userId,_that.content,_that.userName);case StreamReactionBurstEvent():
return streamReactionBurst(_that.streamId,_that.emoji,_that.count);case UnknownEvent():
return unknown(_that.type,_that.data);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? socketId,  Map<String, dynamic>? application,  Map<String, dynamic>? user)?  connected,TResult? Function( String conversationId,  bool success)?  conversationJoined,TResult? Function( String conversationId)?  conversationLeft,TResult? Function( String id,  String conversationId,  String content,  String? senderId,  String? contentType,  String? createdAt,  List<String>? participants)?  messageNew,TResult? Function( String id,  String conversationId,  String content,  String? senderId,  String? contentType,  String? createdAt)?  messageUpdated,TResult? Function( String id,  String conversationId)?  messageDeleted,TResult? Function( String conversationId,  String userId,  String lastReadMessageId,  String readAt)?  messageRead,TResult? Function( String messageId,  String conversationId,  String userId,  String emoji)?  messageReactionAdded,TResult? Function( String messageId,  String conversationId,  String userId,  String emoji)?  messageReactionRemoved,TResult? Function( String conversationId,  List<String> userIds)?  typingUpdate,TResult? Function( String userId,  String status,  String? timestamp)?  presenceUpdate,TResult? Function( String id,  String title,  String body,  String? notificationType,  Map<String, dynamic>? data,  String? createdAt)?  notificationNew,TResult? Function( List<String> notificationIds)?  notificationRead,TResult? Function()?  notificationAllRead,TResult? Function( String? timestamp)?  pong,TResult? Function( String? code,  String? message)?  errorEvent,TResult? Function( String streamId,  int viewerCount)?  streamJoined,TResult? Function( String streamId)?  streamLeft,TResult? Function( String streamId,  String title,  String? hostId,  String? hostName)?  streamStarted,TResult? Function( String streamId)?  streamPaused,TResult? Function( String streamId)?  streamEnded,TResult? Function( String streamId,  int count)?  streamViewerCount,TResult? Function( String streamId,  String userId,  String? userName)?  streamViewerJoined,TResult? Function( String streamId,  String userId)?  streamViewerLeft,TResult? Function( String streamId,  String commentId,  String userId,  String content,  String? userName)?  streamCommentNew,TResult? Function( String streamId,  String emoji,  int count)?  streamReactionBurst,TResult? Function( String type,  Map<String, dynamic> data)?  unknown,}) {final _that = this;
switch (_that) {
case ConnectedEvent() when connected != null:
return connected(_that.socketId,_that.application,_that.user);case ConversationJoinedEvent() when conversationJoined != null:
return conversationJoined(_that.conversationId,_that.success);case ConversationLeftEvent() when conversationLeft != null:
return conversationLeft(_that.conversationId);case MessageNewEvent() when messageNew != null:
return messageNew(_that.id,_that.conversationId,_that.content,_that.senderId,_that.contentType,_that.createdAt,_that.participants);case MessageUpdatedEvent() when messageUpdated != null:
return messageUpdated(_that.id,_that.conversationId,_that.content,_that.senderId,_that.contentType,_that.createdAt);case MessageDeletedEvent() when messageDeleted != null:
return messageDeleted(_that.id,_that.conversationId);case MessageReadEvent() when messageRead != null:
return messageRead(_that.conversationId,_that.userId,_that.lastReadMessageId,_that.readAt);case MessageReactionAddedEvent() when messageReactionAdded != null:
return messageReactionAdded(_that.messageId,_that.conversationId,_that.userId,_that.emoji);case MessageReactionRemovedEvent() when messageReactionRemoved != null:
return messageReactionRemoved(_that.messageId,_that.conversationId,_that.userId,_that.emoji);case TypingUpdateEvent() when typingUpdate != null:
return typingUpdate(_that.conversationId,_that.userIds);case PresenceUpdateEvent() when presenceUpdate != null:
return presenceUpdate(_that.userId,_that.status,_that.timestamp);case NotificationNewEvent() when notificationNew != null:
return notificationNew(_that.id,_that.title,_that.body,_that.notificationType,_that.data,_that.createdAt);case NotificationReadEvent() when notificationRead != null:
return notificationRead(_that.notificationIds);case NotificationAllReadEvent() when notificationAllRead != null:
return notificationAllRead();case PongEvent() when pong != null:
return pong(_that.timestamp);case ErrorEvent() when errorEvent != null:
return errorEvent(_that.code,_that.message);case StreamJoinedEvent() when streamJoined != null:
return streamJoined(_that.streamId,_that.viewerCount);case StreamLeftEvent() when streamLeft != null:
return streamLeft(_that.streamId);case StreamStartedEvent() when streamStarted != null:
return streamStarted(_that.streamId,_that.title,_that.hostId,_that.hostName);case StreamPausedEvent() when streamPaused != null:
return streamPaused(_that.streamId);case StreamEndedEvent() when streamEnded != null:
return streamEnded(_that.streamId);case StreamViewerCountEvent() when streamViewerCount != null:
return streamViewerCount(_that.streamId,_that.count);case StreamViewerJoinedEvent() when streamViewerJoined != null:
return streamViewerJoined(_that.streamId,_that.userId,_that.userName);case StreamViewerLeftEvent() when streamViewerLeft != null:
return streamViewerLeft(_that.streamId,_that.userId);case StreamCommentNewEvent() when streamCommentNew != null:
return streamCommentNew(_that.streamId,_that.commentId,_that.userId,_that.content,_that.userName);case StreamReactionBurstEvent() when streamReactionBurst != null:
return streamReactionBurst(_that.streamId,_that.emoji,_that.count);case UnknownEvent() when unknown != null:
return unknown(_that.type,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class ConnectedEvent implements RealtimeEvent {
  const ConnectedEvent({this.socketId, final  Map<String, dynamic>? application, final  Map<String, dynamic>? user, final  String? $type}): _application = application,_user = user,$type = $type ?? 'connected';
  factory ConnectedEvent.fromJson(Map<String, dynamic> json) => _$ConnectedEventFromJson(json);

 final  String? socketId;
 final  Map<String, dynamic>? _application;
 Map<String, dynamic>? get application {
  final value = _application;
  if (value == null) return null;
  if (_application is EqualUnmodifiableMapView) return _application;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _user;
 Map<String, dynamic>? get user {
  final value = _user;
  if (value == null) return null;
  if (_user is EqualUnmodifiableMapView) return _user;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConnectedEventCopyWith<ConnectedEvent> get copyWith => _$ConnectedEventCopyWithImpl<ConnectedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConnectedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConnectedEvent&&(identical(other.socketId, socketId) || other.socketId == socketId)&&const DeepCollectionEquality().equals(other._application, _application)&&const DeepCollectionEquality().equals(other._user, _user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,socketId,const DeepCollectionEquality().hash(_application),const DeepCollectionEquality().hash(_user));

@override
String toString() {
  return 'RealtimeEvent.connected(socketId: $socketId, application: $application, user: $user)';
}


}

/// @nodoc
abstract mixin class $ConnectedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $ConnectedEventCopyWith(ConnectedEvent value, $Res Function(ConnectedEvent) _then) = _$ConnectedEventCopyWithImpl;
@useResult
$Res call({
 String? socketId, Map<String, dynamic>? application, Map<String, dynamic>? user
});




}
/// @nodoc
class _$ConnectedEventCopyWithImpl<$Res>
    implements $ConnectedEventCopyWith<$Res> {
  _$ConnectedEventCopyWithImpl(this._self, this._then);

  final ConnectedEvent _self;
  final $Res Function(ConnectedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? socketId = freezed,Object? application = freezed,Object? user = freezed,}) {
  return _then(ConnectedEvent(
socketId: freezed == socketId ? _self.socketId : socketId // ignore: cast_nullable_to_non_nullable
as String?,application: freezed == application ? _self._application : application // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,user: freezed == user ? _self._user : user // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConversationJoinedEvent implements RealtimeEvent {
  const ConversationJoinedEvent({required this.conversationId, this.success = false, final  String? $type}): $type = $type ?? 'conversation_joined';
  factory ConversationJoinedEvent.fromJson(Map<String, dynamic> json) => _$ConversationJoinedEventFromJson(json);

 final  String conversationId;
@JsonKey() final  bool success;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationJoinedEventCopyWith<ConversationJoinedEvent> get copyWith => _$ConversationJoinedEventCopyWithImpl<ConversationJoinedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationJoinedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationJoinedEvent&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,success);

@override
String toString() {
  return 'RealtimeEvent.conversationJoined(conversationId: $conversationId, success: $success)';
}


}

/// @nodoc
abstract mixin class $ConversationJoinedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $ConversationJoinedEventCopyWith(ConversationJoinedEvent value, $Res Function(ConversationJoinedEvent) _then) = _$ConversationJoinedEventCopyWithImpl;
@useResult
$Res call({
 String conversationId, bool success
});




}
/// @nodoc
class _$ConversationJoinedEventCopyWithImpl<$Res>
    implements $ConversationJoinedEventCopyWith<$Res> {
  _$ConversationJoinedEventCopyWithImpl(this._self, this._then);

  final ConversationJoinedEvent _self;
  final $Res Function(ConversationJoinedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? success = null,}) {
  return _then(ConversationJoinedEvent(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ConversationLeftEvent implements RealtimeEvent {
  const ConversationLeftEvent({required this.conversationId, final  String? $type}): $type = $type ?? 'conversation_left';
  factory ConversationLeftEvent.fromJson(Map<String, dynamic> json) => _$ConversationLeftEventFromJson(json);

 final  String conversationId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationLeftEventCopyWith<ConversationLeftEvent> get copyWith => _$ConversationLeftEventCopyWithImpl<ConversationLeftEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationLeftEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationLeftEvent&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId);

@override
String toString() {
  return 'RealtimeEvent.conversationLeft(conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $ConversationLeftEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $ConversationLeftEventCopyWith(ConversationLeftEvent value, $Res Function(ConversationLeftEvent) _then) = _$ConversationLeftEventCopyWithImpl;
@useResult
$Res call({
 String conversationId
});




}
/// @nodoc
class _$ConversationLeftEventCopyWithImpl<$Res>
    implements $ConversationLeftEventCopyWith<$Res> {
  _$ConversationLeftEventCopyWithImpl(this._self, this._then);

  final ConversationLeftEvent _self;
  final $Res Function(ConversationLeftEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,}) {
  return _then(ConversationLeftEvent(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageNewEvent implements RealtimeEvent {
  const MessageNewEvent({required this.id, required this.conversationId, required this.content, this.senderId, this.contentType, this.createdAt, final  List<String>? participants, final  String? $type}): _participants = participants,$type = $type ?? 'message_new';
  factory MessageNewEvent.fromJson(Map<String, dynamic> json) => _$MessageNewEventFromJson(json);

 final  String id;
 final  String conversationId;
 final  String content;
 final  String? senderId;
 final  String? contentType;
 final  String? createdAt;
 final  List<String>? _participants;
 List<String>? get participants {
  final value = _participants;
  if (value == null) return null;
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageNewEventCopyWith<MessageNewEvent> get copyWith => _$MessageNewEventCopyWithImpl<MessageNewEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageNewEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageNewEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._participants, _participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,content,senderId,contentType,createdAt,const DeepCollectionEquality().hash(_participants));

@override
String toString() {
  return 'RealtimeEvent.messageNew(id: $id, conversationId: $conversationId, content: $content, senderId: $senderId, contentType: $contentType, createdAt: $createdAt, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $MessageNewEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $MessageNewEventCopyWith(MessageNewEvent value, $Res Function(MessageNewEvent) _then) = _$MessageNewEventCopyWithImpl;
@useResult
$Res call({
 String id, String conversationId, String content, String? senderId, String? contentType, String? createdAt, List<String>? participants
});




}
/// @nodoc
class _$MessageNewEventCopyWithImpl<$Res>
    implements $MessageNewEventCopyWith<$Res> {
  _$MessageNewEventCopyWithImpl(this._self, this._then);

  final MessageNewEvent _self;
  final $Res Function(MessageNewEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? content = null,Object? senderId = freezed,Object? contentType = freezed,Object? createdAt = freezed,Object? participants = freezed,}) {
  return _then(MessageNewEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,participants: freezed == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageUpdatedEvent implements RealtimeEvent {
  const MessageUpdatedEvent({required this.id, required this.conversationId, required this.content, this.senderId, this.contentType, this.createdAt, final  String? $type}): $type = $type ?? 'message_updated';
  factory MessageUpdatedEvent.fromJson(Map<String, dynamic> json) => _$MessageUpdatedEventFromJson(json);

 final  String id;
 final  String conversationId;
 final  String content;
 final  String? senderId;
 final  String? contentType;
 final  String? createdAt;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageUpdatedEventCopyWith<MessageUpdatedEvent> get copyWith => _$MessageUpdatedEventCopyWithImpl<MessageUpdatedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageUpdatedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageUpdatedEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,content,senderId,contentType,createdAt);

@override
String toString() {
  return 'RealtimeEvent.messageUpdated(id: $id, conversationId: $conversationId, content: $content, senderId: $senderId, contentType: $contentType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageUpdatedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $MessageUpdatedEventCopyWith(MessageUpdatedEvent value, $Res Function(MessageUpdatedEvent) _then) = _$MessageUpdatedEventCopyWithImpl;
@useResult
$Res call({
 String id, String conversationId, String content, String? senderId, String? contentType, String? createdAt
});




}
/// @nodoc
class _$MessageUpdatedEventCopyWithImpl<$Res>
    implements $MessageUpdatedEventCopyWith<$Res> {
  _$MessageUpdatedEventCopyWithImpl(this._self, this._then);

  final MessageUpdatedEvent _self;
  final $Res Function(MessageUpdatedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? content = null,Object? senderId = freezed,Object? contentType = freezed,Object? createdAt = freezed,}) {
  return _then(MessageUpdatedEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageDeletedEvent implements RealtimeEvent {
  const MessageDeletedEvent({required this.id, required this.conversationId, final  String? $type}): $type = $type ?? 'message_deleted';
  factory MessageDeletedEvent.fromJson(Map<String, dynamic> json) => _$MessageDeletedEventFromJson(json);

 final  String id;
 final  String conversationId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeletedEventCopyWith<MessageDeletedEvent> get copyWith => _$MessageDeletedEventCopyWithImpl<MessageDeletedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDeletedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDeletedEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId);

@override
String toString() {
  return 'RealtimeEvent.messageDeleted(id: $id, conversationId: $conversationId)';
}


}

/// @nodoc
abstract mixin class $MessageDeletedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $MessageDeletedEventCopyWith(MessageDeletedEvent value, $Res Function(MessageDeletedEvent) _then) = _$MessageDeletedEventCopyWithImpl;
@useResult
$Res call({
 String id, String conversationId
});




}
/// @nodoc
class _$MessageDeletedEventCopyWithImpl<$Res>
    implements $MessageDeletedEventCopyWith<$Res> {
  _$MessageDeletedEventCopyWithImpl(this._self, this._then);

  final MessageDeletedEvent _self;
  final $Res Function(MessageDeletedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,}) {
  return _then(MessageDeletedEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageReadEvent implements RealtimeEvent {
  const MessageReadEvent({required this.conversationId, required this.userId, required this.lastReadMessageId, required this.readAt, final  String? $type}): $type = $type ?? 'message_read';
  factory MessageReadEvent.fromJson(Map<String, dynamic> json) => _$MessageReadEventFromJson(json);

 final  String conversationId;
 final  String userId;
 final  String lastReadMessageId;
 final  String readAt;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReadEventCopyWith<MessageReadEvent> get copyWith => _$MessageReadEventCopyWithImpl<MessageReadEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReadEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReadEvent&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.lastReadMessageId, lastReadMessageId) || other.lastReadMessageId == lastReadMessageId)&&(identical(other.readAt, readAt) || other.readAt == readAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,userId,lastReadMessageId,readAt);

@override
String toString() {
  return 'RealtimeEvent.messageRead(conversationId: $conversationId, userId: $userId, lastReadMessageId: $lastReadMessageId, readAt: $readAt)';
}


}

/// @nodoc
abstract mixin class $MessageReadEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $MessageReadEventCopyWith(MessageReadEvent value, $Res Function(MessageReadEvent) _then) = _$MessageReadEventCopyWithImpl;
@useResult
$Res call({
 String conversationId, String userId, String lastReadMessageId, String readAt
});




}
/// @nodoc
class _$MessageReadEventCopyWithImpl<$Res>
    implements $MessageReadEventCopyWith<$Res> {
  _$MessageReadEventCopyWithImpl(this._self, this._then);

  final MessageReadEvent _self;
  final $Res Function(MessageReadEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? userId = null,Object? lastReadMessageId = null,Object? readAt = null,}) {
  return _then(MessageReadEvent(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,lastReadMessageId: null == lastReadMessageId ? _self.lastReadMessageId : lastReadMessageId // ignore: cast_nullable_to_non_nullable
as String,readAt: null == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageReactionAddedEvent implements RealtimeEvent {
  const MessageReactionAddedEvent({required this.messageId, required this.conversationId, required this.userId, required this.emoji, final  String? $type}): $type = $type ?? 'message_reaction_added';
  factory MessageReactionAddedEvent.fromJson(Map<String, dynamic> json) => _$MessageReactionAddedEventFromJson(json);

 final  String messageId;
 final  String conversationId;
 final  String userId;
 final  String emoji;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReactionAddedEventCopyWith<MessageReactionAddedEvent> get copyWith => _$MessageReactionAddedEventCopyWithImpl<MessageReactionAddedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReactionAddedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReactionAddedEvent&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,conversationId,userId,emoji);

@override
String toString() {
  return 'RealtimeEvent.messageReactionAdded(messageId: $messageId, conversationId: $conversationId, userId: $userId, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class $MessageReactionAddedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $MessageReactionAddedEventCopyWith(MessageReactionAddedEvent value, $Res Function(MessageReactionAddedEvent) _then) = _$MessageReactionAddedEventCopyWithImpl;
@useResult
$Res call({
 String messageId, String conversationId, String userId, String emoji
});




}
/// @nodoc
class _$MessageReactionAddedEventCopyWithImpl<$Res>
    implements $MessageReactionAddedEventCopyWith<$Res> {
  _$MessageReactionAddedEventCopyWithImpl(this._self, this._then);

  final MessageReactionAddedEvent _self;
  final $Res Function(MessageReactionAddedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? conversationId = null,Object? userId = null,Object? emoji = null,}) {
  return _then(MessageReactionAddedEvent(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MessageReactionRemovedEvent implements RealtimeEvent {
  const MessageReactionRemovedEvent({required this.messageId, required this.conversationId, required this.userId, required this.emoji, final  String? $type}): $type = $type ?? 'message_reaction_removed';
  factory MessageReactionRemovedEvent.fromJson(Map<String, dynamic> json) => _$MessageReactionRemovedEventFromJson(json);

 final  String messageId;
 final  String conversationId;
 final  String userId;
 final  String emoji;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageReactionRemovedEventCopyWith<MessageReactionRemovedEvent> get copyWith => _$MessageReactionRemovedEventCopyWithImpl<MessageReactionRemovedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageReactionRemovedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageReactionRemovedEvent&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.emoji, emoji) || other.emoji == emoji));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,messageId,conversationId,userId,emoji);

@override
String toString() {
  return 'RealtimeEvent.messageReactionRemoved(messageId: $messageId, conversationId: $conversationId, userId: $userId, emoji: $emoji)';
}


}

/// @nodoc
abstract mixin class $MessageReactionRemovedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $MessageReactionRemovedEventCopyWith(MessageReactionRemovedEvent value, $Res Function(MessageReactionRemovedEvent) _then) = _$MessageReactionRemovedEventCopyWithImpl;
@useResult
$Res call({
 String messageId, String conversationId, String userId, String emoji
});




}
/// @nodoc
class _$MessageReactionRemovedEventCopyWithImpl<$Res>
    implements $MessageReactionRemovedEventCopyWith<$Res> {
  _$MessageReactionRemovedEventCopyWithImpl(this._self, this._then);

  final MessageReactionRemovedEvent _self;
  final $Res Function(MessageReactionRemovedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,Object? conversationId = null,Object? userId = null,Object? emoji = null,}) {
  return _then(MessageReactionRemovedEvent(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TypingUpdateEvent implements RealtimeEvent {
  const TypingUpdateEvent({required this.conversationId, final  List<String> userIds = const <String>[], final  String? $type}): _userIds = userIds,$type = $type ?? 'typing_update';
  factory TypingUpdateEvent.fromJson(Map<String, dynamic> json) => _$TypingUpdateEventFromJson(json);

 final  String conversationId;
 final  List<String> _userIds;
@JsonKey() List<String> get userIds {
  if (_userIds is EqualUnmodifiableListView) return _userIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userIds);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypingUpdateEventCopyWith<TypingUpdateEvent> get copyWith => _$TypingUpdateEventCopyWithImpl<TypingUpdateEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TypingUpdateEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypingUpdateEvent&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other._userIds, _userIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversationId,const DeepCollectionEquality().hash(_userIds));

@override
String toString() {
  return 'RealtimeEvent.typingUpdate(conversationId: $conversationId, userIds: $userIds)';
}


}

/// @nodoc
abstract mixin class $TypingUpdateEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $TypingUpdateEventCopyWith(TypingUpdateEvent value, $Res Function(TypingUpdateEvent) _then) = _$TypingUpdateEventCopyWithImpl;
@useResult
$Res call({
 String conversationId, List<String> userIds
});




}
/// @nodoc
class _$TypingUpdateEventCopyWithImpl<$Res>
    implements $TypingUpdateEventCopyWith<$Res> {
  _$TypingUpdateEventCopyWithImpl(this._self, this._then);

  final TypingUpdateEvent _self;
  final $Res Function(TypingUpdateEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? userIds = null,}) {
  return _then(TypingUpdateEvent(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,userIds: null == userIds ? _self._userIds : userIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class PresenceUpdateEvent implements RealtimeEvent {
  const PresenceUpdateEvent({required this.userId, required this.status, this.timestamp, final  String? $type}): $type = $type ?? 'presence_update';
  factory PresenceUpdateEvent.fromJson(Map<String, dynamic> json) => _$PresenceUpdateEventFromJson(json);

 final  String userId;
 final  String status;
 final  String? timestamp;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceUpdateEventCopyWith<PresenceUpdateEvent> get copyWith => _$PresenceUpdateEventCopyWithImpl<PresenceUpdateEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresenceUpdateEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceUpdateEvent&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status,timestamp);

@override
String toString() {
  return 'RealtimeEvent.presenceUpdate(userId: $userId, status: $status, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $PresenceUpdateEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $PresenceUpdateEventCopyWith(PresenceUpdateEvent value, $Res Function(PresenceUpdateEvent) _then) = _$PresenceUpdateEventCopyWithImpl;
@useResult
$Res call({
 String userId, String status, String? timestamp
});




}
/// @nodoc
class _$PresenceUpdateEventCopyWithImpl<$Res>
    implements $PresenceUpdateEventCopyWith<$Res> {
  _$PresenceUpdateEventCopyWithImpl(this._self, this._then);

  final PresenceUpdateEvent _self;
  final $Res Function(PresenceUpdateEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? status = null,Object? timestamp = freezed,}) {
  return _then(PresenceUpdateEvent(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotificationNewEvent implements RealtimeEvent {
  const NotificationNewEvent({required this.id, required this.title, required this.body, this.notificationType, final  Map<String, dynamic>? data, this.createdAt, final  String? $type}): _data = data,$type = $type ?? 'notification_new';
  factory NotificationNewEvent.fromJson(Map<String, dynamic> json) => _$NotificationNewEventFromJson(json);

 final  String id;
 final  String title;
 final  String body;
 final  String? notificationType;
 final  Map<String, dynamic>? _data;
 Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  String? createdAt;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationNewEventCopyWith<NotificationNewEvent> get copyWith => _$NotificationNewEventCopyWithImpl<NotificationNewEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationNewEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationNewEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.notificationType, notificationType) || other.notificationType == notificationType)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,body,notificationType,const DeepCollectionEquality().hash(_data),createdAt);

@override
String toString() {
  return 'RealtimeEvent.notificationNew(id: $id, title: $title, body: $body, notificationType: $notificationType, data: $data, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $NotificationNewEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $NotificationNewEventCopyWith(NotificationNewEvent value, $Res Function(NotificationNewEvent) _then) = _$NotificationNewEventCopyWithImpl;
@useResult
$Res call({
 String id, String title, String body, String? notificationType, Map<String, dynamic>? data, String? createdAt
});




}
/// @nodoc
class _$NotificationNewEventCopyWithImpl<$Res>
    implements $NotificationNewEventCopyWith<$Res> {
  _$NotificationNewEventCopyWithImpl(this._self, this._then);

  final NotificationNewEvent _self;
  final $Res Function(NotificationNewEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? body = null,Object? notificationType = freezed,Object? data = freezed,Object? createdAt = freezed,}) {
  return _then(NotificationNewEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,notificationType: freezed == notificationType ? _self.notificationType : notificationType // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotificationReadEvent implements RealtimeEvent {
  const NotificationReadEvent({final  List<String> notificationIds = const <String>[], final  String? $type}): _notificationIds = notificationIds,$type = $type ?? 'notification_read';
  factory NotificationReadEvent.fromJson(Map<String, dynamic> json) => _$NotificationReadEventFromJson(json);

 final  List<String> _notificationIds;
@JsonKey() List<String> get notificationIds {
  if (_notificationIds is EqualUnmodifiableListView) return _notificationIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notificationIds);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationReadEventCopyWith<NotificationReadEvent> get copyWith => _$NotificationReadEventCopyWithImpl<NotificationReadEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationReadEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationReadEvent&&const DeepCollectionEquality().equals(other._notificationIds, _notificationIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notificationIds));

@override
String toString() {
  return 'RealtimeEvent.notificationRead(notificationIds: $notificationIds)';
}


}

/// @nodoc
abstract mixin class $NotificationReadEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $NotificationReadEventCopyWith(NotificationReadEvent value, $Res Function(NotificationReadEvent) _then) = _$NotificationReadEventCopyWithImpl;
@useResult
$Res call({
 List<String> notificationIds
});




}
/// @nodoc
class _$NotificationReadEventCopyWithImpl<$Res>
    implements $NotificationReadEventCopyWith<$Res> {
  _$NotificationReadEventCopyWithImpl(this._self, this._then);

  final NotificationReadEvent _self;
  final $Res Function(NotificationReadEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notificationIds = null,}) {
  return _then(NotificationReadEvent(
notificationIds: null == notificationIds ? _self._notificationIds : notificationIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NotificationAllReadEvent implements RealtimeEvent {
  const NotificationAllReadEvent({final  String? $type}): $type = $type ?? 'notification_all_read';
  factory NotificationAllReadEvent.fromJson(Map<String, dynamic> json) => _$NotificationAllReadEventFromJson(json);



@JsonKey(name: 'type')
final String $type;



@override
Map<String, dynamic> toJson() {
  return _$NotificationAllReadEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationAllReadEvent);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RealtimeEvent.notificationAllRead()';
}


}




/// @nodoc
@JsonSerializable()

class PongEvent implements RealtimeEvent {
  const PongEvent({this.timestamp, final  String? $type}): $type = $type ?? 'pong';
  factory PongEvent.fromJson(Map<String, dynamic> json) => _$PongEventFromJson(json);

 final  String? timestamp;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PongEventCopyWith<PongEvent> get copyWith => _$PongEventCopyWithImpl<PongEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PongEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PongEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,timestamp);

@override
String toString() {
  return 'RealtimeEvent.pong(timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $PongEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $PongEventCopyWith(PongEvent value, $Res Function(PongEvent) _then) = _$PongEventCopyWithImpl;
@useResult
$Res call({
 String? timestamp
});




}
/// @nodoc
class _$PongEventCopyWithImpl<$Res>
    implements $PongEventCopyWith<$Res> {
  _$PongEventCopyWithImpl(this._self, this._then);

  final PongEvent _self;
  final $Res Function(PongEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timestamp = freezed,}) {
  return _then(PongEvent(
timestamp: freezed == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ErrorEvent implements RealtimeEvent {
  const ErrorEvent({this.code, this.message, final  String? $type}): $type = $type ?? 'error';
  factory ErrorEvent.fromJson(Map<String, dynamic> json) => _$ErrorEventFromJson(json);

 final  String? code;
 final  String? message;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorEventCopyWith<ErrorEvent> get copyWith => _$ErrorEventCopyWithImpl<ErrorEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ErrorEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ErrorEvent&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message);

@override
String toString() {
  return 'RealtimeEvent.errorEvent(code: $code, message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $ErrorEventCopyWith(ErrorEvent value, $Res Function(ErrorEvent) _then) = _$ErrorEventCopyWithImpl;
@useResult
$Res call({
 String? code, String? message
});




}
/// @nodoc
class _$ErrorEventCopyWithImpl<$Res>
    implements $ErrorEventCopyWith<$Res> {
  _$ErrorEventCopyWithImpl(this._self, this._then);

  final ErrorEvent _self;
  final $Res Function(ErrorEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? message = freezed,}) {
  return _then(ErrorEvent(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamJoinedEvent implements RealtimeEvent {
  const StreamJoinedEvent({required this.streamId, this.viewerCount = 0, final  String? $type}): $type = $type ?? 'stream_joined';
  factory StreamJoinedEvent.fromJson(Map<String, dynamic> json) => _$StreamJoinedEventFromJson(json);

 final  String streamId;
@JsonKey() final  int viewerCount;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamJoinedEventCopyWith<StreamJoinedEvent> get copyWith => _$StreamJoinedEventCopyWithImpl<StreamJoinedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamJoinedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamJoinedEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount);

@override
String toString() {
  return 'RealtimeEvent.streamJoined(streamId: $streamId, viewerCount: $viewerCount)';
}


}

/// @nodoc
abstract mixin class $StreamJoinedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamJoinedEventCopyWith(StreamJoinedEvent value, $Res Function(StreamJoinedEvent) _then) = _$StreamJoinedEventCopyWithImpl;
@useResult
$Res call({
 String streamId, int viewerCount
});




}
/// @nodoc
class _$StreamJoinedEventCopyWithImpl<$Res>
    implements $StreamJoinedEventCopyWith<$Res> {
  _$StreamJoinedEventCopyWithImpl(this._self, this._then);

  final StreamJoinedEvent _self;
  final $Res Function(StreamJoinedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? viewerCount = null,}) {
  return _then(StreamJoinedEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamLeftEvent implements RealtimeEvent {
  const StreamLeftEvent({required this.streamId, final  String? $type}): $type = $type ?? 'stream_left';
  factory StreamLeftEvent.fromJson(Map<String, dynamic> json) => _$StreamLeftEventFromJson(json);

 final  String streamId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamLeftEventCopyWith<StreamLeftEvent> get copyWith => _$StreamLeftEventCopyWithImpl<StreamLeftEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamLeftEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamLeftEvent&&(identical(other.streamId, streamId) || other.streamId == streamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId);

@override
String toString() {
  return 'RealtimeEvent.streamLeft(streamId: $streamId)';
}


}

/// @nodoc
abstract mixin class $StreamLeftEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamLeftEventCopyWith(StreamLeftEvent value, $Res Function(StreamLeftEvent) _then) = _$StreamLeftEventCopyWithImpl;
@useResult
$Res call({
 String streamId
});




}
/// @nodoc
class _$StreamLeftEventCopyWithImpl<$Res>
    implements $StreamLeftEventCopyWith<$Res> {
  _$StreamLeftEventCopyWithImpl(this._self, this._then);

  final StreamLeftEvent _self;
  final $Res Function(StreamLeftEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,}) {
  return _then(StreamLeftEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamStartedEvent implements RealtimeEvent {
  const StreamStartedEvent({required this.streamId, required this.title, this.hostId, this.hostName, final  String? $type}): $type = $type ?? 'stream_started';
  factory StreamStartedEvent.fromJson(Map<String, dynamic> json) => _$StreamStartedEventFromJson(json);

 final  String streamId;
 final  String title;
 final  String? hostId;
 final  String? hostName;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamStartedEventCopyWith<StreamStartedEvent> get copyWith => _$StreamStartedEventCopyWithImpl<StreamStartedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamStartedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamStartedEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.title, title) || other.title == title)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.hostName, hostName) || other.hostName == hostName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,title,hostId,hostName);

@override
String toString() {
  return 'RealtimeEvent.streamStarted(streamId: $streamId, title: $title, hostId: $hostId, hostName: $hostName)';
}


}

/// @nodoc
abstract mixin class $StreamStartedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamStartedEventCopyWith(StreamStartedEvent value, $Res Function(StreamStartedEvent) _then) = _$StreamStartedEventCopyWithImpl;
@useResult
$Res call({
 String streamId, String title, String? hostId, String? hostName
});




}
/// @nodoc
class _$StreamStartedEventCopyWithImpl<$Res>
    implements $StreamStartedEventCopyWith<$Res> {
  _$StreamStartedEventCopyWithImpl(this._self, this._then);

  final StreamStartedEvent _self;
  final $Res Function(StreamStartedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? title = null,Object? hostId = freezed,Object? hostName = freezed,}) {
  return _then(StreamStartedEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String?,hostName: freezed == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamPausedEvent implements RealtimeEvent {
  const StreamPausedEvent({required this.streamId, final  String? $type}): $type = $type ?? 'stream_paused';
  factory StreamPausedEvent.fromJson(Map<String, dynamic> json) => _$StreamPausedEventFromJson(json);

 final  String streamId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamPausedEventCopyWith<StreamPausedEvent> get copyWith => _$StreamPausedEventCopyWithImpl<StreamPausedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamPausedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamPausedEvent&&(identical(other.streamId, streamId) || other.streamId == streamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId);

@override
String toString() {
  return 'RealtimeEvent.streamPaused(streamId: $streamId)';
}


}

/// @nodoc
abstract mixin class $StreamPausedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamPausedEventCopyWith(StreamPausedEvent value, $Res Function(StreamPausedEvent) _then) = _$StreamPausedEventCopyWithImpl;
@useResult
$Res call({
 String streamId
});




}
/// @nodoc
class _$StreamPausedEventCopyWithImpl<$Res>
    implements $StreamPausedEventCopyWith<$Res> {
  _$StreamPausedEventCopyWithImpl(this._self, this._then);

  final StreamPausedEvent _self;
  final $Res Function(StreamPausedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,}) {
  return _then(StreamPausedEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamEndedEvent implements RealtimeEvent {
  const StreamEndedEvent({required this.streamId, final  String? $type}): $type = $type ?? 'stream_ended';
  factory StreamEndedEvent.fromJson(Map<String, dynamic> json) => _$StreamEndedEventFromJson(json);

 final  String streamId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamEndedEventCopyWith<StreamEndedEvent> get copyWith => _$StreamEndedEventCopyWithImpl<StreamEndedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamEndedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamEndedEvent&&(identical(other.streamId, streamId) || other.streamId == streamId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId);

@override
String toString() {
  return 'RealtimeEvent.streamEnded(streamId: $streamId)';
}


}

/// @nodoc
abstract mixin class $StreamEndedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamEndedEventCopyWith(StreamEndedEvent value, $Res Function(StreamEndedEvent) _then) = _$StreamEndedEventCopyWithImpl;
@useResult
$Res call({
 String streamId
});




}
/// @nodoc
class _$StreamEndedEventCopyWithImpl<$Res>
    implements $StreamEndedEventCopyWith<$Res> {
  _$StreamEndedEventCopyWithImpl(this._self, this._then);

  final StreamEndedEvent _self;
  final $Res Function(StreamEndedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,}) {
  return _then(StreamEndedEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamViewerCountEvent implements RealtimeEvent {
  const StreamViewerCountEvent({required this.streamId, this.count = 0, final  String? $type}): $type = $type ?? 'stream_viewer_count';
  factory StreamViewerCountEvent.fromJson(Map<String, dynamic> json) => _$StreamViewerCountEventFromJson(json);

 final  String streamId;
@JsonKey() final  int count;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamViewerCountEventCopyWith<StreamViewerCountEvent> get copyWith => _$StreamViewerCountEventCopyWithImpl<StreamViewerCountEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamViewerCountEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamViewerCountEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,count);

@override
String toString() {
  return 'RealtimeEvent.streamViewerCount(streamId: $streamId, count: $count)';
}


}

/// @nodoc
abstract mixin class $StreamViewerCountEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamViewerCountEventCopyWith(StreamViewerCountEvent value, $Res Function(StreamViewerCountEvent) _then) = _$StreamViewerCountEventCopyWithImpl;
@useResult
$Res call({
 String streamId, int count
});




}
/// @nodoc
class _$StreamViewerCountEventCopyWithImpl<$Res>
    implements $StreamViewerCountEventCopyWith<$Res> {
  _$StreamViewerCountEventCopyWithImpl(this._self, this._then);

  final StreamViewerCountEvent _self;
  final $Res Function(StreamViewerCountEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? count = null,}) {
  return _then(StreamViewerCountEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamViewerJoinedEvent implements RealtimeEvent {
  const StreamViewerJoinedEvent({required this.streamId, required this.userId, this.userName, final  String? $type}): $type = $type ?? 'stream_viewer_joined';
  factory StreamViewerJoinedEvent.fromJson(Map<String, dynamic> json) => _$StreamViewerJoinedEventFromJson(json);

 final  String streamId;
 final  String userId;
 final  String? userName;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamViewerJoinedEventCopyWith<StreamViewerJoinedEvent> get copyWith => _$StreamViewerJoinedEventCopyWithImpl<StreamViewerJoinedEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamViewerJoinedEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamViewerJoinedEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,userId,userName);

@override
String toString() {
  return 'RealtimeEvent.streamViewerJoined(streamId: $streamId, userId: $userId, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $StreamViewerJoinedEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamViewerJoinedEventCopyWith(StreamViewerJoinedEvent value, $Res Function(StreamViewerJoinedEvent) _then) = _$StreamViewerJoinedEventCopyWithImpl;
@useResult
$Res call({
 String streamId, String userId, String? userName
});




}
/// @nodoc
class _$StreamViewerJoinedEventCopyWithImpl<$Res>
    implements $StreamViewerJoinedEventCopyWith<$Res> {
  _$StreamViewerJoinedEventCopyWithImpl(this._self, this._then);

  final StreamViewerJoinedEvent _self;
  final $Res Function(StreamViewerJoinedEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? userId = null,Object? userName = freezed,}) {
  return _then(StreamViewerJoinedEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamViewerLeftEvent implements RealtimeEvent {
  const StreamViewerLeftEvent({required this.streamId, required this.userId, final  String? $type}): $type = $type ?? 'stream_viewer_left';
  factory StreamViewerLeftEvent.fromJson(Map<String, dynamic> json) => _$StreamViewerLeftEventFromJson(json);

 final  String streamId;
 final  String userId;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamViewerLeftEventCopyWith<StreamViewerLeftEvent> get copyWith => _$StreamViewerLeftEventCopyWithImpl<StreamViewerLeftEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamViewerLeftEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamViewerLeftEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,userId);

@override
String toString() {
  return 'RealtimeEvent.streamViewerLeft(streamId: $streamId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $StreamViewerLeftEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamViewerLeftEventCopyWith(StreamViewerLeftEvent value, $Res Function(StreamViewerLeftEvent) _then) = _$StreamViewerLeftEventCopyWithImpl;
@useResult
$Res call({
 String streamId, String userId
});




}
/// @nodoc
class _$StreamViewerLeftEventCopyWithImpl<$Res>
    implements $StreamViewerLeftEventCopyWith<$Res> {
  _$StreamViewerLeftEventCopyWithImpl(this._self, this._then);

  final StreamViewerLeftEvent _self;
  final $Res Function(StreamViewerLeftEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? userId = null,}) {
  return _then(StreamViewerLeftEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamCommentNewEvent implements RealtimeEvent {
  const StreamCommentNewEvent({required this.streamId, required this.commentId, required this.userId, required this.content, this.userName, final  String? $type}): $type = $type ?? 'stream_comment_new';
  factory StreamCommentNewEvent.fromJson(Map<String, dynamic> json) => _$StreamCommentNewEventFromJson(json);

 final  String streamId;
 final  String commentId;
 final  String userId;
 final  String content;
 final  String? userName;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamCommentNewEventCopyWith<StreamCommentNewEvent> get copyWith => _$StreamCommentNewEventCopyWithImpl<StreamCommentNewEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamCommentNewEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamCommentNewEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.content, content) || other.content == content)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,commentId,userId,content,userName);

@override
String toString() {
  return 'RealtimeEvent.streamCommentNew(streamId: $streamId, commentId: $commentId, userId: $userId, content: $content, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $StreamCommentNewEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamCommentNewEventCopyWith(StreamCommentNewEvent value, $Res Function(StreamCommentNewEvent) _then) = _$StreamCommentNewEventCopyWithImpl;
@useResult
$Res call({
 String streamId, String commentId, String userId, String content, String? userName
});




}
/// @nodoc
class _$StreamCommentNewEventCopyWithImpl<$Res>
    implements $StreamCommentNewEventCopyWith<$Res> {
  _$StreamCommentNewEventCopyWithImpl(this._self, this._then);

  final StreamCommentNewEvent _self;
  final $Res Function(StreamCommentNewEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? commentId = null,Object? userId = null,Object? content = null,Object? userName = freezed,}) {
  return _then(StreamCommentNewEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,commentId: null == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class StreamReactionBurstEvent implements RealtimeEvent {
  const StreamReactionBurstEvent({required this.streamId, required this.emoji, this.count = 0, final  String? $type}): $type = $type ?? 'stream_reaction_burst';
  factory StreamReactionBurstEvent.fromJson(Map<String, dynamic> json) => _$StreamReactionBurstEventFromJson(json);

 final  String streamId;
 final  String emoji;
@JsonKey() final  int count;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamReactionBurstEventCopyWith<StreamReactionBurstEvent> get copyWith => _$StreamReactionBurstEventCopyWithImpl<StreamReactionBurstEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamReactionBurstEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamReactionBurstEvent&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,emoji,count);

@override
String toString() {
  return 'RealtimeEvent.streamReactionBurst(streamId: $streamId, emoji: $emoji, count: $count)';
}


}

/// @nodoc
abstract mixin class $StreamReactionBurstEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $StreamReactionBurstEventCopyWith(StreamReactionBurstEvent value, $Res Function(StreamReactionBurstEvent) _then) = _$StreamReactionBurstEventCopyWithImpl;
@useResult
$Res call({
 String streamId, String emoji, int count
});




}
/// @nodoc
class _$StreamReactionBurstEventCopyWithImpl<$Res>
    implements $StreamReactionBurstEventCopyWith<$Res> {
  _$StreamReactionBurstEventCopyWithImpl(this._self, this._then);

  final StreamReactionBurstEvent _self;
  final $Res Function(StreamReactionBurstEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? emoji = null,Object? count = null,}) {
  return _then(StreamReactionBurstEvent(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class UnknownEvent implements RealtimeEvent {
  const UnknownEvent({this.type = '', final  Map<String, dynamic> data = const <String, dynamic>{}}): _data = data;
  factory UnknownEvent.fromJson(Map<String, dynamic> json) => _$UnknownEventFromJson(json);

@JsonKey() final  String type;
 final  Map<String, dynamic> _data;
@JsonKey() Map<String, dynamic> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownEventCopyWith<UnknownEvent> get copyWith => _$UnknownEventCopyWithImpl<UnknownEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnknownEventToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownEvent&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'RealtimeEvent.unknown(type: $type, data: $data)';
}


}

/// @nodoc
abstract mixin class $UnknownEventCopyWith<$Res> implements $RealtimeEventCopyWith<$Res> {
  factory $UnknownEventCopyWith(UnknownEvent value, $Res Function(UnknownEvent) _then) = _$UnknownEventCopyWithImpl;
@useResult
$Res call({
 String type, Map<String, dynamic> data
});




}
/// @nodoc
class _$UnknownEventCopyWithImpl<$Res>
    implements $UnknownEventCopyWith<$Res> {
  _$UnknownEventCopyWithImpl(this._self, this._then);

  final UnknownEvent _self;
  final $Res Function(UnknownEvent) _then;

/// Create a copy of RealtimeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? type = null,Object? data = null,}) {
  return _then(UnknownEvent(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
