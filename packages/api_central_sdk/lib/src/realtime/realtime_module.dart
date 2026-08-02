import 'dart:async';

import 'realtime_event.dart';
import 'websocket_client.dart';

/// API temps réel de haut niveau.
///
/// Mémorise les conversations rejointes pour les restaurer après une
/// reconnexion : sans cela, l'application cesse silencieusement de recevoir ses
/// messages après une coupure réseau.
class RealtimeModule {
  RealtimeModule(this._client) {
    _abonnementEtat = _client.states.listen((etat) {
      if (etat == ConnectionState.connected) _rejoindreRooms();
    });
  }

  final WebSocketClient _client;
  final Set<String> _conversations = {};
  final Set<String> _streams = {};
  final Set<String> _calls = {};
  StreamSubscription<ConnectionState>? _abonnementEtat;

  /// Conversations actuellement rejointes.
  Set<String> get joinedConversations => Set.unmodifiable(_conversations);

  /// Directs actuellement rejoints.
  Set<String> get joinedStreams => Set.unmodifiable(_streams);

  /// Appels actuellement rejoints.
  Set<String> get joinedCalls => Set.unmodifiable(_calls);

  Stream<RealtimeEvent> get events => _client.events;
  Stream<ConnectionState> get states => _client.states;
  ConnectionState get state => _client.state;

  Future<void> connect() => _client.connect();
  Future<void> disconnect() => _client.disconnect();

  Future<void> dispose() async {
    await _abonnementEtat?.cancel();
    _abonnementEtat = null;
    await _client.dispose();
  }

  // --- Rooms ---------------------------------------------------------------

  void joinConversation(String conversationId) {
    _conversations.add(conversationId);
    _client.send('conversation_join', {'conversationId': conversationId});
  }

  void leaveConversation(String conversationId) {
    _conversations.remove(conversationId);
    _client.send('conversation_leave', {'conversationId': conversationId});
  }

  void _rejoindreRooms() {
    for (final id in _conversations) {
      _client.send('conversation_join', {'conversationId': id});
    }
    for (final id in _streams) {
      _client.send('stream_join', {'streamId': id});
    }
    for (final id in _calls) {
      _client.send('call_join', {'callId': id});
    }
  }

  // --- Appels --------------------------------------------------------------

  void joinCall(String callId) {
    _calls.add(callId);
    _client.send('call_join', {'callId': callId});
  }

  void leaveCall(String callId) {
    _calls.remove(callId);
    _client.send('call_leave', {'callId': callId});
  }

  /// Transmet une offre SDP. Alternative WebSocket à `calls.sendOffer`.
  void sendCallOffer(String callId,
          {required String toUserId, required String sdp}) =>
      _client.send(
          'call_offer', {'callId': callId, 'toUserId': toUserId, 'sdp': sdp});

  void sendCallAnswer(String callId,
          {required String toUserId, required String sdp}) =>
      _client.send(
          'call_answer', {'callId': callId, 'toUserId': toUserId, 'sdp': sdp});

  void sendCallIceCandidate(String callId,
          {required String toUserId, required String candidate}) =>
      _client.send('call_ice_candidate',
          {'callId': callId, 'toUserId': toUserId, 'candidate': candidate});

  // --- Directs -------------------------------------------------------------

  void joinStream(String streamId) {
    _streams.add(streamId);
    _client.send('stream_join', {'streamId': streamId});
  }

  void leaveStream(String streamId) {
    _streams.remove(streamId);
    _client.send('stream_leave', {'streamId': streamId});
  }

  /// Poste un commentaire par le WebSocket, sans passer par REST.
  void sendStreamComment(String streamId, String content) => _client
      .send('stream_comment', {'streamId': streamId, 'content': content});

  /// Envoie une réaction par le WebSocket.
  ///
  /// Contrairement à `live.sendReaction`, aucun accusé n'est renvoyé : le
  /// rate limit de 200 ms par utilisateur s'applique tout de même.
  void sendStreamReaction(String streamId, String emoji) =>
      _client.send('stream_reaction', {'streamId': streamId, 'emoji': emoji});

  // --- Indicateurs ---------------------------------------------------------

  void startTyping(String conversationId) =>
      _client.send('typing_start', {'conversationId': conversationId});

  void stopTyping(String conversationId) =>
      _client.send('typing_stop', {'conversationId': conversationId});

  /// Souscrit aux changements de présence.
  ///
  /// L'API renvoie un objet vide en réponse immédiate — un défaut connu de
  /// `presence_status` côté serveur, qui ne sait pas sérialiser sa liste de
  /// statuts. Les changements ultérieurs arrivent normalement via
  /// [onPresenceUpdate].
  void subscribePresence(List<String> userIds) =>
      _client.send('presence_subscribe', {'userIds': userIds});

  // --- Flux typés ----------------------------------------------------------

  /// Filtre les événements sur un type précis.
  Stream<T> on<T extends RealtimeEvent>() =>
      events.where((e) => e is T).cast<T>();

  Stream<MessageNewEvent> get onMessageNew => on<MessageNewEvent>();
  Stream<MessageUpdatedEvent> get onMessageUpdated => on<MessageUpdatedEvent>();
  Stream<MessageDeletedEvent> get onMessageDeleted => on<MessageDeletedEvent>();

  /// Accusés de lecture : bascule la simple coche en double.
  Stream<MessageReadEvent> get onMessageRead => on<MessageReadEvent>();

  Stream<MessageReactionAddedEvent> get onReactionAdded =>
      on<MessageReactionAddedEvent>();
  Stream<MessageReactionRemovedEvent> get onReactionRemoved =>
      on<MessageReactionRemovedEvent>();
  Stream<TypingUpdateEvent> get onTypingUpdate => on<TypingUpdateEvent>();
  Stream<PresenceUpdateEvent> get onPresenceUpdate => on<PresenceUpdateEvent>();
  Stream<NotificationNewEvent> get onNotificationNew =>
      on<NotificationNewEvent>();
  Stream<ErrorEvent> get onError => on<ErrorEvent>();

  Stream<StreamCommentNewEvent> get onStreamCommentNew =>
      on<StreamCommentNewEvent>();
  Stream<StreamViewerCountEvent> get onStreamViewerCount =>
      on<StreamViewerCountEvent>();
  Stream<StreamEndedEvent> get onStreamEnded => on<StreamEndedEvent>();
  Stream<StreamReactionBurstEvent> get onStreamReactionBurst =>
      on<StreamReactionBurstEvent>();

  Stream<CallIncomingEvent> get onCallIncoming => on<CallIncomingEvent>();
  Stream<CallEndedEvent> get onCallEnded => on<CallEndedEvent>();
  Stream<CallConnectedEvent> get onCallConnected => on<CallConnectedEvent>();
  Stream<CallDeclinedEvent> get onCallDeclined => on<CallDeclinedEvent>();
  Stream<CallOfferReceivedEvent> get onCallOfferReceived =>
      on<CallOfferReceivedEvent>();
  Stream<CallAnswerReceivedEvent> get onCallAnswerReceived =>
      on<CallAnswerReceivedEvent>();
  Stream<CallIceCandidateReceivedEvent> get onCallIceCandidateReceived =>
      on<CallIceCandidateReceivedEvent>();

  /// Réémet les `conversation_join` mémorisés. Réservé aux tests.
  void debugSimulerReconnexion() => _rejoindreRooms();
}
