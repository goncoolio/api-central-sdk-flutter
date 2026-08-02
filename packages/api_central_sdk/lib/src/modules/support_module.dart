import '../http/api_client.dart';
import '../models/article.dart';
import '../models/pagination.dart';
import '../models/ticket.dart';

/// Tickets de support et base de connaissances.
///
/// La gestion des catégories et des articles est réservée aux back-offices :
/// une application cliente lit les articles et crée des tickets.
class SupportModule {
  const SupportModule(this._client);

  final ApiClient _client;

  // --- Tickets -------------------------------------------------------------

  /// `subject` fait 1 à 255 caractères, `description` au plus 5000.
  Future<Ticket> createTicket({
    required String userId,
    required String subject,
    String? description,
    String? categoryId,
    TicketPriority? priority,
    List<String>? tags,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/support/tickets', body: {
      'userId': userId,
      'subject': subject,
      'description': ?description,
      'categoryId': ?categoryId,
      'priority': ?priority?.name,
      'tags': ?tags,
    });
    return Ticket.fromJson(json);
  }

  Future<PaginatedResponse<Ticket>> listTickets({
    String? userId,
    TicketStatus? status,
    TicketPriority? priority,
    String? categoryId,
    String? assignedToId,
    int? page,
    int? limit,
  }) async {
    final json =
        await _client.get<Map<String, dynamic>>('/support/tickets', query: {
      'userId': ?userId,
      'status': ?statusVersApi(status),
      'priority': ?priority?.name,
      'categoryId': ?categoryId,
      'assignedToId': ?assignedToId,
      'page': ?page,
      'limit': ?limit,
    });
    return PaginatedResponse<Ticket>.fromJson(
      json,
      (item) => Ticket.fromJson(item! as Map<String, dynamic>),
    );
  }

  Future<Ticket> getTicket(String ticketId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/support/tickets/$ticketId');
    return Ticket.fromJson(json);
  }

  Future<Ticket> updateTicket(
    String ticketId, {
    String? subject,
    String? description,
    TicketPriority? priority,
    String? categoryId,
    List<String>? tags,
  }) async {
    final json = await _client
        .put<Map<String, dynamic>>('/support/tickets/$ticketId', body: {
      'subject': ?subject,
      'description': ?description,
      'priority': ?priority?.name,
      'categoryId': ?categoryId,
      'tags': ?tags,
    });
    return Ticket.fromJson(json);
  }

  Future<Ticket> assignTicket(
    String ticketId, {
    required String assignedToId,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/support/tickets/$ticketId/assign',
      body: {'assignedToId': assignedToId},
    );
    return Ticket.fromJson(json);
  }

  Future<Ticket> updateStatus(
    String ticketId, {
    required TicketStatus status,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/support/tickets/$ticketId/status',
      body: {'status': statusVersApi(status)},
    );
    return Ticket.fromJson(json);
  }

  Future<PaginatedResponse<TicketReply>> listReplies(
    String ticketId, {
    int? page,
    int? limit,
  }) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/support/tickets/$ticketId/replies',
      query: {'page': ?page, 'limit': ?limit},
    );
    return PaginatedResponse<TicketReply>.fromJson(
      json,
      (item) => TicketReply.fromJson(item! as Map<String, dynamic>),
    );
  }

  Future<TicketReply> addReply(
    String ticketId, {
    required String senderId,
    required String content,
    SenderType? senderType,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/support/tickets/$ticketId/replies',
      body: {
        'senderId': senderId,
        'content': content,
        'senderType': ?senderType?.name,
      },
    );
    return TicketReply.fromJson(json);
  }

  // --- Catégories ----------------------------------------------------------

  Future<List<SupportCategory>> listCategories() async {
    final json = await _client.get<List<dynamic>>('/support/categories');
    return json
        .map((e) =>
            SupportCategory.fromJson((e! as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<SupportCategory> createCategory({
    required String name,
    String? slug,
    String? description,
    String? icon,
    String? parentId,
    int? sortOrder,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/support/categories', body: {
      'name': name,
      'slug': ?slug,
      'description': ?description,
      'icon': ?icon,
      'parentId': ?parentId,
      'sortOrder': ?sortOrder,
    });
    return SupportCategory.fromJson(json);
  }

  Future<SupportCategory> updateCategory(
    String categoryId, {
    String? name,
    String? description,
    String? icon,
    int? sortOrder,
    bool? isActive,
  }) async {
    final json = await _client
        .put<Map<String, dynamic>>('/support/categories/$categoryId', body: {
      'name': ?name,
      'description': ?description,
      'icon': ?icon,
      'sortOrder': ?sortOrder,
      'isActive': ?isActive,
    });
    return SupportCategory.fromJson(json);
  }

  Future<void> deleteCategory(String categoryId) =>
      _client.delete<Map<String, dynamic>>('/support/categories/$categoryId');

  // --- Base de connaissances ----------------------------------------------

  Future<PaginatedResponse<KnowledgeArticle>> listArticles({
    String? categoryId,
    String? search,
    bool? publishedOnly,
    int? page,
    int? limit,
  }) async {
    final json =
        await _client.get<Map<String, dynamic>>('/support/articles', query: {
      'categoryId': ?categoryId,
      'search': ?search,
      'publishedOnly': ?publishedOnly,
      'page': ?page,
      'limit': ?limit,
    });
    return PaginatedResponse<KnowledgeArticle>.fromJson(
      json,
      (item) => KnowledgeArticle.fromJson(item! as Map<String, dynamic>),
    );
  }

  Future<KnowledgeArticle> getArticle(String articleId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/support/articles/$articleId');
    return KnowledgeArticle.fromJson(json);
  }

  /// `content` fait 1 à 50000 caractères.
  Future<KnowledgeArticle> createArticle({
    required String title,
    required String content,
    String? slug,
    String? categoryId,
    ContentFormat? contentFormat,
    List<String>? tags,
    bool? isPublished,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/support/articles', body: {
      'title': title,
      'content': content,
      'slug': ?slug,
      'categoryId': ?categoryId,
      'contentFormat': ?contentFormat?.name,
      'tags': ?tags,
      'isPublished': ?isPublished,
    });
    return KnowledgeArticle.fromJson(json);
  }

  Future<KnowledgeArticle> updateArticle(
    String articleId, {
    String? title,
    String? content,
    String? categoryId,
    List<String>? tags,
    bool? isPublished,
  }) async {
    final json = await _client
        .put<Map<String, dynamic>>('/support/articles/$articleId', body: {
      'title': ?title,
      'content': ?content,
      'categoryId': ?categoryId,
      'tags': ?tags,
      'isPublished': ?isPublished,
    });
    return KnowledgeArticle.fromJson(json);
  }

  Future<void> deleteArticle(String articleId) =>
      _client.delete<Map<String, dynamic>>('/support/articles/$articleId');

  /// Indique si l'article a été utile. Alimente `helpfulCount`.
  Future<void> rateArticle(String articleId, {required bool helpful}) =>
      _client.post<Map<String, dynamic>>(
        '/support/articles/$articleId/rate',
        body: {'helpful': helpful},
      );
}

/// `inProgress` se sérialise `in_progress`, contrairement aux autres statuts
/// dont le nom Dart correspond déjà à la valeur attendue par l'API.
String? statusVersApi(TicketStatus? status) => switch (status) {
      null => null,
      TicketStatus.inProgress => 'in_progress',
      _ => status.name,
    };
