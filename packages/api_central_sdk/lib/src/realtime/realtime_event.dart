import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/presence.dart';

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
  'message_delivered',
  'message_read',
  'message_reaction_added',
  'message_reaction_removed',
  'typing_update',
  'presence_update',
  'presence_status',
  'notification_new',
  'notification_read',
  'notification_all_read',
  'pong',
  'stats',
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
  'call_joined',
  'call_left',
  'call_incoming',
  'call_answered',
  'call_connected',
  'call_declined',
  'call_ended',
  'call_participant_joined',
  'call_participant_left',
  'call_offer_received',
  'call_answer_received',
  'call_ice_candidate_received',
  'call_mute_changed',
  'call_video_changed',
  'call_screen_share_changed',
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
/// Chaque événement de l'API a sa variante ; un type qu'introduirait une
/// version ultérieure du serveur tombe dans [UnknownEvent] au lieu de lever.
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

  /// Accusé de remise : le client du destinataire a reçu ces messages.
  ///
  /// C'est la simple coche, que [MessageReadEvent] fait passer en double.
  /// L'application le déclenche en appelant `acknowledgeDelivery` à réception.
  @FreezedUnionValue('message_delivered')
  const factory RealtimeEvent.messageDelivered({
    required String conversationId,
    required String userId,
    required String deliveredAt,
    @Default(<String>[]) List<String> messageIds,
  }) = MessageDeliveredEvent;

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

  /// Réponse à `presence_subscribe` : l'état courant de chaque utilisateur
  /// demandé, en un seul événement.
  @FreezedUnionValue('presence_status')
  const factory RealtimeEvent.presenceStatus({
    @Default(<PresenceStatusItem>[]) List<PresenceStatusItem> statuses,
  }) = PresenceStatusEvent;

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

  /// Statistiques de connexion, en réponse à `requestStats`.
  ///
  /// Le serveur ne répond qu'aux tokens d'application : une application
  /// connectée avec un token utilisateur ne reçoit jamais cet événement.
  @FreezedUnionValue('stats')
  const factory RealtimeEvent.stats({
    @Default(0) int totalConnections,
    @Default(0) int applications,
    @Default(0) int usersOnline,
  }) = StatsEvent;

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

  // --- Appels --------------------------------------------------------------

  @FreezedUnionValue('call_joined')
  const factory RealtimeEvent.callJoined({required String callId}) =
      CallJoinedEvent;

  @FreezedUnionValue('call_left')
  const factory RealtimeEvent.callLeft({required String callId}) =
      CallLeftEvent;

  /// Appel entrant : c'est cet événement qui déclenche l'écran de sonnerie.
  @FreezedUnionValue('call_incoming')
  const factory RealtimeEvent.callIncoming({
    required String callId,
    required String callerId,
    String? callerName,
    String? callType,
  }) = CallIncomingEvent;

  @FreezedUnionValue('call_answered')
  const factory RealtimeEvent.callAnswered({
    required String callId,
    required String userId,
  }) = CallAnsweredEvent;

  @FreezedUnionValue('call_connected')
  const factory RealtimeEvent.callConnected({
    required String callId,
    @Default(<String>[]) List<String> participantIds,
  }) = CallConnectedEvent;

  @FreezedUnionValue('call_declined')
  const factory RealtimeEvent.callDeclined({
    required String callId,
    required String userId,
  }) = CallDeclinedEvent;

  @FreezedUnionValue('call_ended')
  const factory RealtimeEvent.callEnded({
    required String callId,
    String? reason,
    int? durationSeconds,
  }) = CallEndedEvent;

  @FreezedUnionValue('call_participant_joined')
  const factory RealtimeEvent.callParticipantJoined({
    required String callId,
    required String userId,
    String? userName,
  }) = CallParticipantJoinedEvent;

  @FreezedUnionValue('call_participant_left')
  const factory RealtimeEvent.callParticipantLeft({
    required String callId,
    required String userId,
  }) = CallParticipantLeftEvent;

  /// Offre SDP reçue : à passer à `setRemoteDescription`.
  @FreezedUnionValue('call_offer_received')
  const factory RealtimeEvent.callOfferReceived({
    required String callId,
    required String fromUserId,
    required String sdp,
  }) = CallOfferReceivedEvent;

  @FreezedUnionValue('call_answer_received')
  const factory RealtimeEvent.callAnswerReceived({
    required String callId,
    required String fromUserId,
    required String sdp,
  }) = CallAnswerReceivedEvent;

  @FreezedUnionValue('call_ice_candidate_received')
  const factory RealtimeEvent.callIceCandidateReceived({
    required String callId,
    required String fromUserId,
    required String candidate,
  }) = CallIceCandidateReceivedEvent;

  @FreezedUnionValue('call_mute_changed')
  const factory RealtimeEvent.callMuteChanged({
    required String callId,
    required String userId,
    @Default(false) bool isMuted,
  }) = CallMuteChangedEvent;

  @FreezedUnionValue('call_video_changed')
  const factory RealtimeEvent.callVideoChanged({
    required String callId,
    required String userId,
    @Default(false) bool isVideoEnabled,
  }) = CallVideoChangedEvent;

  @FreezedUnionValue('call_screen_share_changed')
  const factory RealtimeEvent.callScreenShareChanged({
    required String callId,
    required String userId,
    @Default(false) bool isScreenSharing,
  }) = CallScreenShareChangedEvent;

  /// Événement non typé par cette version du SDK.
  @FreezedUnionValue('unknown')
  const factory RealtimeEvent.unknown({
    @Default('') String type,
    @Default(<String, dynamic>{}) Map<String, dynamic> data,
  }) = UnknownEvent;

  factory RealtimeEvent.fromJson(Map<String, dynamic> json) =>
      _$RealtimeEventFromJson(json);
}
