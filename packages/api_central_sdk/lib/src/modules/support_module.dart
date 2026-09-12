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
    Map<String, dynamic>? metadata,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/support/tickets', body: {
      'userId': userId,
      'subject': subject,
      'description': ?description,
      'categoryId': ?categoryId,
      'priority': ?priority?.name,
      'tags': ?tags,
      'metadata': ?metadata,
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
    Map<String, dynamic>? metadata,
  }) async {
    final json = await _client
        .put<Map<String, dynamic>>('/support/tickets/$ticketId', body: {
      'subject': ?subject,
      'description': ?description,
      'priority': ?priority?.name,
      'categoryId': ?categoryId,
      'tags': ?tags,
      'metadata': ?metadata,
    });
    return Ticket.fromJson(json);
  }

  /// Affecte un ticket à un agent, ou retire l'affectation avec `null`.
  Future<Ticket> assignTicket(
    String ticketId, {
    required String? assignedToId,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/support/tickets/$ticketId/assign',
      body: {'assignedToId': assignedToId},
    );
    return Ticket.fromJson(json);
  }

  /// Change le statut d'un ticket.
  ///
  /// [note] est conservée dans l'historique des statuts du ticket.
  Future<Ticket> updateStatus(
    String ticketId, {
    required TicketStatus status,
    String? note,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/support/tickets/$ticketId/status',
      body: {'status': statusVersApi(status), 'note': ?note},
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

  /// Ajoute une réponse à un ticket.
  ///
  /// `senderType` n'est pas un paramètre : l'API le déduit du contexte et ne
  /// l'accepte qu'en sortie. `content` fait 1 à 10000 caractères.
  Future<TicketReply> addReply(
    String ticketId, {
    required String senderId,
    required String content,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/support/tickets/$ticketId/replies',
      body: {
        'senderId': senderId,
        'content': content,
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

  /// Crée une catégorie de support.
  ///
  /// [slug] est exigé par l'API, qui refuse la requête sans lui (422).
  Future<SupportCategory> createCategory({
    required String name,
    required String slug,
    String? description,
    String? icon,
    String? parentId,
    int? sortOrder,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/support/categories', body: {
      'name': name,
      'slug': slug,
      'description': ?description,
      'icon': ?icon,
      'parentId': ?parentId,
      'sortOrder': ?sortOrder,
    });
    return SupportCategory.fromJson(json);
  }

  /// Remplace une catégorie de support.
  ///
  /// L'API attend ici la même charge qu'à la création — [name] et [slug]
  /// compris — et **crée une nouvelle catégorie** au lieu de modifier
  /// l'existante : la catégorie renvoyée porte un nouvel identifiant, et
  /// l'ancienne reste en place. À réserver aux outils d'administration, en
  /// attendant une vraie mise à jour côté API.
  ///
  /// L'API ne lit pas d'indicateur d'activation sur cette route.
  Future<SupportCategory> updateCategory(
    String categoryId, {
    required String name,
    required String slug,
    String? description,
    String? icon,
    String? parentId,
    int? sortOrder,
  }) async {
    final json = await _client
        .put<Map<String, dynamic>>('/support/categories/$categoryId', body: {
      'name': name,
      'slug': slug,
      'description': ?description,
      'icon': ?icon,
      'parentId': ?parentId,
      'sortOrder': ?sortOrder,
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

  /// Lit un article de la base de connaissances.
  ///
  /// [incrementView] demande à l'API de compter la vue ; sans lui,
  /// `KnowledgeArticle.viewCount` ne bouge jamais.
  Future<KnowledgeArticle> getArticle(
    String articleId, {
    bool incrementView = false,
  }) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/support/articles/$articleId',
      query: {'incrementView': ?(incrementView ? 'true' : null)},
    );
    return KnowledgeArticle.fromJson(json);
  }

  /// `content` fait 1 à 50000 caractères.
  Future<KnowledgeArticle> createArticle({
    required String title,
    required String slug,
    required String content,
    String? categoryId,
    ContentFormat? contentFormat,
    List<String>? tags,
    bool? isPublished,
    String? createdById,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/support/articles', body: {
      'title': title,
      'slug': slug,
      'content': content,
      'categoryId': ?categoryId,
      'contentFormat': ?contentFormat?.name,
      'tags': ?tags,
      'isPublished': ?isPublished,
      'createdById': ?createdById,
    });
    return KnowledgeArticle.fromJson(json);
  }

  /// Met à jour un article : seuls les champs fournis changent.
  Future<KnowledgeArticle> updateArticle(
    String articleId, {
    String? title,
    String? slug,
    String? content,
    String? categoryId,
    ContentFormat? contentFormat,
    List<String>? tags,
    bool? isPublished,
  }) async {
    final json = await _client
        .put<Map<String, dynamic>>('/support/articles/$articleId', body: {
      'title': ?title,
      'slug': ?slug,
      'content': ?content,
      'categoryId': ?categoryId,
      'contentFormat': ?contentFormat?.name,
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
