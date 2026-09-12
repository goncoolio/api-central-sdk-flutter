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

  /// Liste les directs.
  ///
  /// L'API renvoie ici un tableau nu, sans enveloppe de pagination —
  /// contrairement aux autres listes du SDK. `page` et `limit` restent
  /// transmis et honorés côté serveur.
  Future<List<LiveStream>> listStreams({
    StreamStatus? status,
    String? hostId,
    int? page,
    int? limit,
  }) async {
    final json = await _client.get<List<dynamic>>(
      '/live/streams',
      query: {
        'status': ?status?.name,
        'hostId': ?hostId,
        'page': ?page,
        'limit': ?limit,
      },
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

  Future<StreamViewers> getViewers(
    String streamId, {
    int? page,
    int? limit,
  }) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/live/streams/$streamId/viewers',
      query: {'page': ?page, 'limit': ?limit},
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

  Future<List<StreamComment>> listComments(
    String streamId, {
    int? limit,
  }) async {
    final json = await _client.get<List<dynamic>>(
      '/live/streams/$streamId/comments',
      query: {'limit': ?limit},
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
  /// réaction toutes les 200 ms et rejette silencieusement les suivantes.
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
