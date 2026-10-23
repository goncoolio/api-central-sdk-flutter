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

  /// Conversations d'un utilisateur.
  ///
  /// [userId] est exigé par l'API, qui refuse la requête sans lui (400) : la
  /// liste est toujours celle d'un utilisateur, jamais celle de l'application.
  Future<PaginatedResponse<Conversation>> listConversations({
    required String userId,
    int? page,
    int? limit,
  }) async {
    final json = await _client
        .get<Map<String, dynamic>>('/messaging/conversations', query: {
      'userId': userId,
      'page': ?page,
      'limit': ?limit,
    });
    return PaginatedResponse<Conversation>.fromJson(
      json,
      (item) => Conversation.fromJson(item! as Map<String, dynamic>),
    );
  }

  /// Détail d'une conversation, vu par un utilisateur.
  ///
  /// [userId] est exigé par l'API (400 sans lui) : il sert à calculer le
  /// nombre de messages non lus renvoyé avec la conversation. Avec un token
  /// utilisateur, une conversation dont il n'est pas participant renvoie 403.
  Future<Conversation> getConversation(
    String conversationId, {
    required String userId,
  }) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/messaging/conversations/$conversationId',
      query: {'userId': userId},
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
    // Cette route renvoie le modèle de domaine : la nature de la conversation
    // y arrive sous `conversationType`, alors que les autres routes la
    // sérialisent sous `type`. La conversation renvoyée ne porte ni
    // participants, ni dernier message, ni compteur de non-lus.
    return Conversation.fromJson({
      'type': json['conversationType'],
      ...json,
    });
  }

  Future<void> deleteConversation(String conversationId) =>
      _client.delete<Map<String, dynamic>>(
          '/messaging/conversations/$conversationId');

  // --- Participants --------------------------------------------------------

  /// Ajoute un participant à une conversation.
  ///
  /// [actorId] est exigé par l'API (422 sans lui) et doit être administrateur
  /// de la conversation.
  Future<void> addParticipant(
    String conversationId, {
    required String userId,
    required String actorId,
    ParticipantRole? role,
  }) =>
      _client.post<Map<String, dynamic>>(
        '/messaging/conversations/$conversationId/participants',
        body: {
          'userId': userId,
          'actorId': actorId,
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

  /// Retire un participant d'une conversation.
  ///
  /// [actorId] est exigé par l'API en paramètre de requête (400 sans lui) et
  /// doit être administrateur de la conversation.
  Future<void> removeParticipant(
    String conversationId,
    String userId, {
    required String actorId,
  }) => _client.delete<Map<String, dynamic>>(
    '/messaging/conversations/$conversationId/participants/$userId',
    query: {'actorId': actorId},
  );

  /// Règle les notifications d'un participant pour une conversation.
  ///
  /// Seuls les champs fournis changent. Avec un token utilisateur, l'appel
  /// porte sur la conversation de l'appelant : une conversation dont il n'est
  /// pas participant renvoie 403.
  Future<ParticipantSettings> updateParticipantSettings(
    String conversationId,
    String userId, {
    bool? isMuted,
    NotificationPreference? notificationPreference,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/messaging/conversations/$conversationId/participants/$userId/settings',
      body: {
        'isMuted': ?isMuted,
        'notificationPreference': ?notificationPreference?.name,
      },
    );
    return ParticipantSettings.fromJson(json);
  }

  // --- Messages ------------------------------------------------------------

  /// `content` fait 1 à 10000 caractères.
  ///
  /// `clientMessageId` permet à l'application de rapprocher le message renvoyé
  /// de celui affiché en optimiste.
  ///
  /// `replyToId` désigne le message auquel celui-ci répond ; l'API répond 400
  /// si la cible est absente, supprimée ou d'une autre conversation. Le
  /// message renvoyé en porte l'aperçu dans [Message.replyTo].
  ///
  /// `mentions` porte les identifiants des utilisateurs mentionnés : sans lui,
  /// les participants réglés sur [NotificationPreference.mentions] ne reçoivent
  /// aucune notification pour ce message.
  Future<Message> sendMessage(
    String conversationId, {
    required String senderId,
    required String content,
    ContentType? contentType,
    String? clientMessageId,
    List<Attachment>? attachments,
    String? replyToId,
    List<String>? mentions,
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
        'mentions': ?mentions,
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
