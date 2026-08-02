import '../http/api_client.dart';
import '../models/conversation.dart';
import '../models/message.dart';
import '../models/pagination.dart';

/// Conversations, messages, réactions et accusés de lecture.
class MessagingModule {
  const MessagingModule(this._client);

  final ApiClient _client;

  // --- Conversations -------------------------------------------------------

  Future<Conversation> createConversation({
    required ConversationType type,
    required List<String> participantIds,
    String? title,
    String? avatarUrl,
    String? createdById,
  }) async {
    final json = await _client
        .post<Map<String, dynamic>>('/messaging/conversations', body: {
      'conversationType': type.name,
      'participantIds': participantIds,
      'title': ?title,
      'avatarUrl': ?avatarUrl,
      'createdById': ?createdById,
    });
    return Conversation.fromJson(json);
  }

  Future<PaginatedResponse<Conversation>> listConversations({
    String? userId,
    int? page,
    int? limit,
  }) async {
    final json = await _client
        .get<Map<String, dynamic>>('/messaging/conversations', query: {
      'userId': ?userId,
      'page': ?page,
      'limit': ?limit,
    });
    return PaginatedResponse<Conversation>.fromJson(
      json,
      (item) => Conversation.fromJson(item! as Map<String, dynamic>),
    );
  }

  Future<Conversation> getConversation(String conversationId,
      {String? userId}) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/messaging/conversations/$conversationId',
      query: {'userId': ?userId},
    );
    return Conversation.fromJson(json);
  }

  Future<Conversation> updateConversation(
    String conversationId, {
    String? title,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/messaging/conversations/$conversationId',
      body: {
        'title': ?title,
        'avatarUrl': ?avatarUrl,
        'metadata': ?metadata,
      },
    );
    return Conversation.fromJson(json);
  }

  Future<void> deleteConversation(String conversationId) =>
      _client.delete<Map<String, dynamic>>(
          '/messaging/conversations/$conversationId');

  // --- Participants --------------------------------------------------------

  Future<void> addParticipant(
    String conversationId, {
    required String userId,
    ParticipantRole? role,
  }) =>
      _client.post<Map<String, dynamic>>(
        '/messaging/conversations/$conversationId/participants',
        body: {
          'userId': userId,
          'role': ?role?.name,
        },
      );

  Future<List<Participant>> listParticipants(String conversationId) async {
    final json = await _client.get<List<dynamic>>(
        '/messaging/conversations/$conversationId/participants');
    return json
        .map((e) => Participant.fromJson((e! as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<void> removeParticipant(String conversationId, String userId) =>
      _client.delete<Map<String, dynamic>>(
        '/messaging/conversations/$conversationId/participants/$userId',
      );

  // --- Messages ------------------------------------------------------------

  /// `content` fait 1 à 10000 caractères.
  ///
  /// `clientMessageId` permet à l'application de rapprocher le message renvoyé
  /// de celui affiché en optimiste.
  Future<Message> sendMessage(
    String conversationId, {
    required String senderId,
    required String content,
    ContentType? contentType,
    String? clientMessageId,
    List<Attachment>? attachments,
    String? replyToId,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/messaging/conversations/$conversationId/messages',
      body: {
        'senderId': senderId,
        'content': content,
        'contentType': ?contentType?.name,
        'clientMessageId': ?clientMessageId,
        'attachments': ?attachments?.map((a) => a.toJson()).toList(),
        'replyToId': ?replyToId,
      },
    );
    return Message.fromJson(json);
  }

  Future<CursorResponse<Message>> listMessages(
    String conversationId, {
    String? cursor,
    int? limit,
  }) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/messaging/conversations/$conversationId/messages',
      query: {
        'cursor': ?cursor,
        'limit': ?limit,
      },
    );
    return CursorResponse<Message>.fromJson(
      json,
      (item) => Message.fromJson(item! as Map<String, dynamic>),
    );
  }

  Future<Message> getMessage(String messageId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/messaging/messages/$messageId');
    return Message.fromJson(json);
  }

  Future<Message> editMessage(String messageId,
      {required String content}) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/messaging/messages/$messageId',
      body: {'content': content},
    );
    return Message.fromJson(json);
  }

  Future<void> deleteMessage(String messageId) =>
      _client.delete<Map<String, dynamic>>('/messaging/messages/$messageId');

  // --- Réactions -----------------------------------------------------------

  /// `emoji` fait 1 à 10 caractères.
  Future<void> addReaction(
    String messageId, {
    required String userId,
    required String emoji,
  }) =>
      _client.post<Map<String, dynamic>>(
        '/messaging/messages/$messageId/reactions',
        body: {'userId': userId, 'emoji': emoji},
      );

  Future<void> removeReaction(
    String messageId, {
    required String userId,
    required String emoji,
  }) =>
      _client.delete<Map<String, dynamic>>(
        '/messaging/messages/$messageId/reactions/${Uri.encodeComponent(emoji)}',
        query: {'userId': userId},
      );

  // --- Indicateurs ---------------------------------------------------------

  Future<void> sendTyping(String conversationId, {required String userId}) =>
      _client.post<Map<String, dynamic>>(
        '/messaging/conversations/$conversationId/typing',
        body: {'userId': userId},
      );

  /// Marque la conversation comme lue.
  ///
  /// L'API ne diffuse l'événement `message_read` que si [messageId] est fourni :
  /// sans lui, les autres participants ne verront pas la double coche.
  Future<void> markAsRead(
    String conversationId, {
    required String userId,
    String? messageId,
  }) =>
      _client.post<Map<String, dynamic>>(
        '/messaging/conversations/$conversationId/read',
        body: {
          'userId': userId,
          'messageId': ?messageId,
        },
      );
}
