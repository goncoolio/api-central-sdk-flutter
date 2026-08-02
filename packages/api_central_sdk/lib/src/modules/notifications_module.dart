import '../http/api_client.dart';
import '../models/notification.dart';
import '../models/pagination.dart';

/// Notifications push et in-app.
///
/// Les modèles de notification sont gérés côté serveur : le SDK peut envoyer
/// depuis un slug existant, mais ne peut ni en créer ni en modifier.
class NotificationsModule {
  const NotificationsModule(this._client);

  final ApiClient _client;

  /// `notificationType` fait 1 à 100 caractères, `title` 1 à 255, `body` 1 à
  /// 1000. Les trois sont obligatoires.
  ///
  /// Le type accepte toute chaîne : les valeurs namespacées comme
  /// `news:meteo` sont valides.
  Future<AppNotification> send({
    required String userId,
    required String notificationType,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    List<String>? channels,
  }) async {
    final json =
        await _client.post<Map<String, dynamic>>('/notifications/send', body: {
      'userId': userId,
      'notificationType': notificationType,
      'title': title,
      'body': body,
      'data': ?data,
      'channels': ?channels,
    });
    return AppNotification.fromJson(json);
  }

  Future<BulkSendResult> sendBulk({
    required List<String> userIds,
    required String notificationType,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    List<String>? channels,
  }) async {
    final json = await _client
        .post<Map<String, dynamic>>('/notifications/send-bulk', body: {
      'userIds': userIds,
      'notificationType': notificationType,
      'title': title,
      'body': body,
      'data': ?data,
      'channels': ?channels,
    });
    return BulkSendResult.fromJson(json);
  }

  /// Diffuse à **tous** les utilisateurs de l'application.
  Future<BroadcastResult> broadcast({
    required String notificationType,
    required String title,
    required String body,
    Map<String, dynamic>? data,
    List<String>? channels,
  }) async {
    final json = await _client
        .post<Map<String, dynamic>>('/notifications/broadcast', body: {
      'notificationType': notificationType,
      'title': title,
      'body': body,
      'data': ?data,
      'channels': ?channels,
    });
    return BroadcastResult.fromJson(json);
  }

  /// Envoie une notification construite depuis un modèle serveur.
  Future<AppNotification> sendTemplate({
    required String userId,
    required String templateSlug,
    Map<String, dynamic>? variables,
    Map<String, dynamic>? data,
  }) async {
    final json = await _client
        .post<Map<String, dynamic>>('/notifications/send-template', body: {
      'userId': userId,
      'templateSlug': templateSlug,
      'variables': ?variables,
      'data': ?data,
    });
    return AppNotification.fromJson(json);
  }

  Future<PaginatedResponse<AppNotification>> list(
    String userId, {
    bool? unreadOnly,
    int? page,
    int? limit,
  }) async {
    final json =
        await _client.get<Map<String, dynamic>>('/notifications', query: {
      'userId': userId,
      'unreadOnly': ?unreadOnly,
      'page': ?page,
      'limit': ?limit,
    });
    return PaginatedResponse<AppNotification>.fromJson(
      json,
      (item) => AppNotification.fromJson(item! as Map<String, dynamic>),
    );
  }

  Future<int> getUnreadCount(String userId) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/notifications/unread-count',
      query: {'userId': userId},
    );
    return (json['count'] as num?)?.toInt() ?? 0;
  }

  /// L'API n'attend que les identifiants : le destinataire est déduit.
  Future<MarkReadResult> markAsRead({
    required List<String> notificationIds,
  }) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/notifications/mark-read',
      body: {'notificationIds': notificationIds},
    );
    return MarkReadResult.fromJson(json);
  }

  /// L'utilisateur passe en paramètre de requête, le corps reste vide.
  Future<MarkReadResult> markAllAsRead(String userId) async {
    final json = await _client.post<Map<String, dynamic>>(
      '/notifications/mark-all-read',
      query: {'userId': userId},
    );
    return MarkReadResult.fromJson(json);
  }

  Future<void> delete(String notificationId) =>
      _client.delete<Map<String, dynamic>>('/notifications/$notificationId');
}
