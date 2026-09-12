import '../http/api_client.dart';
import '../models/stream.dart';

/// Directs : diffusion, spectateurs, commentaires et réactions.
///
/// `POST /live/rtmp/auth` n'est pas exposé : c'est un endpoint appelé par le
/// serveur RTMP, pas par une application.
class LiveModule {
  const LiveModule(this._client);

  final ApiClient _client;

  // --- Cycle de vie --------------------------------------------------------

  /// Crée un direct.
  ///
  /// [settings] est un objet JSON libre que l'API stocke sans l'interpréter
  /// ni le renvoyer dans [LiveStream]. Comme `metadata` ailleurs dans le SDK,
  /// ses clés passent par la conversion snake_case appliquée à tout le corps.
  Future<LiveStream> createStream({
    required String hostId,
    required String title,
    String? description,
    String? thumbnailUrl,
    DateTime? scheduledAt,
    Map<String, dynamic>? settings,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams',
      body: {
        'hostId': hostId,
        'title': title,
        'description': ?description,
        'thumbnailUrl': ?thumbnailUrl,
        'scheduledAt': ?scheduledAt?.toIso8601String(),
        'settings': ?settings,
      },
    );
    return LiveStream.fromJson(json);
  }

  /// Liste les directs, `live` par défaut.
  ///
  /// L'API renvoie ici un tableau nu, sans enveloppe de pagination —
  /// contrairement aux autres listes du SDK. `page` et `limit` restent
  /// transmis et honorés côté serveur. Il n'existe pas de filtre par hôte :
  /// l'API ne lit que le statut et la pagination.
  Future<List<LiveStream>> listStreams({
    StreamStatus? status,
    int? page,
    int? limit,
  }) async {
    final json = await _client.get<List<dynamic>>(
      '/live/streams',
      query: {'status': ?status?.name, 'page': ?page, 'limit': ?limit},
    );
    return json
        .map((e) => LiveStream.fromJson((e! as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<LiveStream> getStream(String streamId) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/live/streams/$streamId',
    );
    return LiveStream.fromJson(json);
  }

  /// Met à jour un direct : seuls les champs fournis sont modifiés.
  ///
  /// Un [settings] fourni remplace les réglages existants en entier, sans
  /// fusion côté serveur.
  Future<LiveStream> updateStream(
    String streamId, {
    String? title,
    String? description,
    String? thumbnailUrl,
    Map<String, dynamic>? settings,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/live/streams/$streamId',
      body: {
        'title': ?title,
        'description': ?description,
        'thumbnailUrl': ?thumbnailUrl,
        'settings': ?settings,
      },
    );
    return LiveStream.fromJson(json);
  }

  Future<LiveStream> startStream(String streamId) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/start',
    );
    return LiveStream.fromJson(json);
  }

  Future<LiveStream> pauseStream(String streamId) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/pause',
    );
    return LiveStream.fromJson(json);
  }

  /// Reprend un direct en pause.
  ///
  /// Il n'existe pas de route dédiée : l'endpoint `start` de l'API accepte les
  /// statuts `scheduled` et `paused`, reprendre revient donc à redémarrer.
  Future<LiveStream> resumeStream(String streamId) => startStream(streamId);

  Future<LiveStream> endStream(String streamId) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/end',
    );
    return LiveStream.fromJson(json);
  }

  // --- Spectateurs ---------------------------------------------------------

  /// Échantillon de spectateurs, avec leur nombre total.
  ///
  /// L'API tire au hasard jusqu'à `limit` spectateurs dans l'ensemble Redis du
  /// direct : la liste n'est ni ordonnée ni paginable, et deux appels peuvent
  /// renvoyer des spectateurs différents. `StreamViewers.viewerCount` reste,
  /// lui, le total exact.
  Future<StreamViewers> getViewers(String streamId, {int? limit}) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/live/streams/$streamId/viewers',
      query: {'limit': ?limit},
    );
    return StreamViewers.fromJson(json);
  }

  Future<StreamViewerCount> joinStream(
    String streamId, {
    required String userId,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/join',
      body: {'userId': userId},
    );
    return StreamViewerCount.fromJson(json);
  }

  Future<StreamViewerCount> leaveStream(
    String streamId, {
    required String userId,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/leave',
      body: {'userId': userId},
    );
    return StreamViewerCount.fromJson(json);
  }

  // --- Commentaires --------------------------------------------------------

  /// Commentaires du direct, du plus récent au plus ancien.
  ///
  /// L'API renvoie ici un tableau nu, sans enveloppe de pagination, mais
  /// honore `page` et `limit` (100 commentaires au maximum par page).
  Future<List<StreamComment>> listComments(
    String streamId, {
    int? page,
    int? limit,
  }) async {
    final json = await _client.get<List<dynamic>>(
      '/live/streams/$streamId/comments',
      query: {'page': ?page, 'limit': ?limit},
    );
    return json
        .map((e) => StreamComment.fromJson((e! as Map).cast<String, dynamic>()))
        .toList();
  }

  /// `content` fait 1 à 500 caractères.
  Future<StreamComment> postComment(
    String streamId, {
    required String userId,
    required String content,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/comments',
      body: {'userId': userId, 'content': content},
    );
    return StreamComment.fromJson(json);
  }

  Future<void> deleteComment(String streamId, String commentId) =>
      _client.delete<Map<String, dynamic>>(
        '/live/streams/$streamId/comments/$commentId',
      );

  Future<void> pinComment(String streamId, String commentId) =>
      _client.post<Map<String, dynamic>>(
        '/live/streams/$streamId/comments/$commentId/pin',
      );

  Future<void> unpinComment(String streamId, String commentId) =>
      _client.post<Map<String, dynamic>>(
        '/live/streams/$streamId/comments/$commentId/unpin',
      );

  // --- Réactions -----------------------------------------------------------

  /// Envoie une réaction.
  ///
  /// Vérifiez [ReactionResult.accepted] : l'API limite chaque utilisateur à une
  /// réaction toutes les 200 ms et rejette les suivantes sans erreur HTTP.
  /// [ReactionResult.retryAfterMs] donne alors le délai à respecter.
  Future<ReactionResult> sendReaction(
    String streamId, {
    required String userId,
    required String emoji,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/live/streams/$streamId/reactions',
      body: {'userId': userId, 'emoji': emoji},
    );
    return ReactionResult.fromJson(json);
  }

  Future<List<ReactionCount>> getReactionCounts(String streamId) async {
    final json = await _client.get<List<dynamic>>(
      '/live/streams/$streamId/reactions',
    );
    return json
        .map((e) => ReactionCount.fromJson((e! as Map).cast<String, dynamic>()))
        .toList();
  }

  Future<StreamStats> getStats(String streamId) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/live/streams/$streamId/stats',
    );
    return StreamStats.fromJson(json);
  }
}
