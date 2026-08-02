import 'package:freezed_annotation/freezed_annotation.dart';

part 'realtime_event.freezed.dart';
part 'realtime_event.g.dart';

/// Types d'événements reconnus par cette version du SDK.
const _typesConnus = <String>{
  'connected',
  'conversation_joined',
  'conversation_left',
  'message_new',
  'message_updated',
  'message_deleted',
  'message_read',
  'message_reaction_added',
  'message_reaction_removed',
  'typing_update',
  'presence_update',
  'notification_new',
  'notification_read',
  'notification_all_read',
  'pong',
  'error',
  'stream_joined',
  'stream_left',
  'stream_started',
  'stream_paused',
  'stream_ended',
  'stream_viewer_count',
  'stream_viewer_joined',
  'stream_viewer_left',
  'stream_comment_new',
  'stream_reaction_burst',
};

/// Convertit un message brut du WebSocket en [RealtimeEvent].
///
/// Les types non reconnus sont conservés dans [UnknownEvent] avec leur charge
/// utile : une application peut ainsi traiter un événement que le SDK ne type
/// pas encore, sans attendre une nouvelle version.
RealtimeEvent parseRealtimeEvent(Map<String, dynamic> json) {
  final type = json['type'];
  if (type is! String || !_typesConnus.contains(type)) {
    return UnknownEvent(
      type: type is String ? type : '',
      data: Map<String, dynamic>.from(json)..remove('type'),
    );
  }
  return RealtimeEvent.fromJson(json);
}

/// Événement reçu du WebSocket.
///
/// Le serveur émet des objets à tag interne : `{"type": "message_new", ...}`.
/// Les variantes `call_*` et `stream_*` ne sont pas encore typées et tombent
/// dans [UnknownEvent] — les phases 4 et 5 les ajouteront sans casser le
/// pattern matching existant.
@Freezed(unionKey: 'type', fallbackUnion: 'unknown')
sealed class RealtimeEvent with _$RealtimeEvent {
  /// Connexion établie, premier message reçu après l'ouverture.
  @FreezedUnionValue('connected')
  const factory RealtimeEvent.connected({
    String? socketId,
    Map<String, dynamic>? application,
    Map<String, dynamic>? user,
  }) = ConnectedEvent;

  @FreezedUnionValue('conversation_joined')
  const factory RealtimeEvent.conversationJoined({
    required String conversationId,
    @Default(false) bool success,
  }) = ConversationJoinedEvent;

  @FreezedUnionValue('conversation_left')
  const factory RealtimeEvent.conversationLeft({
    required String conversationId,
  }) = ConversationLeftEvent;

  @FreezedUnionValue('message_new')
  const factory RealtimeEvent.messageNew({
    required String id,
    required String conversationId,
    required String content,
    String? senderId,
    String? contentType,
    String? createdAt,
    List<String>? participants,
  }) = MessageNewEvent;

  @FreezedUnionValue('message_updated')
  const factory RealtimeEvent.messageUpdated({
    required String id,
    required String conversationId,
    required String content,
    String? senderId,
    String? contentType,
    String? createdAt,
  }) = MessageUpdatedEvent;

  @FreezedUnionValue('message_deleted')
  const factory RealtimeEvent.messageDeleted({
    required String id,
    required String conversationId,
  }) = MessageDeletedEvent;

  /// Accusé de lecture : permet de passer la simple coche en double.
  @FreezedUnionValue('message_read')
  const factory RealtimeEvent.messageRead({
    required String conversationId,
    required String userId,
    required String lastReadMessageId,
    required String readAt,
  }) = MessageReadEvent;

  @FreezedUnionValue('message_reaction_added')
  const factory RealtimeEvent.messageReactionAdded({
    required String messageId,
    required String conversationId,
    required String userId,
    required String emoji,
  }) = MessageReactionAddedEvent;

  @FreezedUnionValue('message_reaction_removed')
  const factory RealtimeEvent.messageReactionRemoved({
    required String messageId,
    required String conversationId,
    required String userId,
    required String emoji,
  }) = MessageReactionRemovedEvent;

  @FreezedUnionValue('typing_update')
  const factory RealtimeEvent.typingUpdate({
    required String conversationId,
    @Default(<String>[]) List<String> userIds,
  }) = TypingUpdateEvent;

  @FreezedUnionValue('presence_update')
  const factory RealtimeEvent.presenceUpdate({
    required String userId,
    required String status,
    String? timestamp,
  }) = PresenceUpdateEvent;

  @FreezedUnionValue('notification_new')
  const factory RealtimeEvent.notificationNew({
    required String id,
    required String title,
    required String body,
    String? notificationType,
    Map<String, dynamic>? data,
    String? createdAt,
  }) = NotificationNewEvent;

  @FreezedUnionValue('notification_read')
  const factory RealtimeEvent.notificationRead({
    @Default(<String>[]) List<String> notificationIds,
  }) = NotificationReadEvent;

  @FreezedUnionValue('notification_all_read')
  const factory RealtimeEvent.notificationAllRead() = NotificationAllReadEvent;

  @FreezedUnionValue('pong')
  const factory RealtimeEvent.pong({String? timestamp}) = PongEvent;

  @FreezedUnionValue('error')
  const factory RealtimeEvent.errorEvent({
    String? code,
    String? message,
  }) = ErrorEvent;

  // --- Directs -------------------------------------------------------------

  @FreezedUnionValue('stream_joined')
  const factory RealtimeEvent.streamJoined({
    required String streamId,
    @Default(0) int viewerCount,
  }) = StreamJoinedEvent;

  @FreezedUnionValue('stream_left')
  const factory RealtimeEvent.streamLeft({required String streamId}) =
      StreamLeftEvent;

  @FreezedUnionValue('stream_started')
  const factory RealtimeEvent.streamStarted({
    required String streamId,
    required String title,
    String? hostId,
    String? hostName,
  }) = StreamStartedEvent;

  @FreezedUnionValue('stream_paused')
  const factory RealtimeEvent.streamPaused({required String streamId}) =
      StreamPausedEvent;

  @FreezedUnionValue('stream_ended')
  const factory RealtimeEvent.streamEnded({required String streamId}) =
      StreamEndedEvent;

  @FreezedUnionValue('stream_viewer_count')
  const factory RealtimeEvent.streamViewerCount({
    required String streamId,
    @Default(0) int count,
  }) = StreamViewerCountEvent;

  @FreezedUnionValue('stream_viewer_joined')
  const factory RealtimeEvent.streamViewerJoined({
    required String streamId,
    required String userId,
    String? userName,
  }) = StreamViewerJoinedEvent;

  @FreezedUnionValue('stream_viewer_left')
  const factory RealtimeEvent.streamViewerLeft({
    required String streamId,
    required String userId,
  }) = StreamViewerLeftEvent;

  @FreezedUnionValue('stream_comment_new')
  const factory RealtimeEvent.streamCommentNew({
    required String streamId,
    required String commentId,
    required String userId,
    required String content,
    String? userName,
  }) = StreamCommentNewEvent;

  @FreezedUnionValue('stream_reaction_burst')
  const factory RealtimeEvent.streamReactionBurst({
    required String streamId,
    required String emoji,
    @Default(0) int count,
  }) = StreamReactionBurstEvent;

  /// Événement non typé par cette version du SDK.
  @FreezedUnionValue('unknown')
  const factory RealtimeEvent.unknown({
    @Default('') String type,
    @Default(<String, dynamic>{}) Map<String, dynamic> data,
  }) = UnknownEvent;

  factory RealtimeEvent.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventFromJson(json);
}
