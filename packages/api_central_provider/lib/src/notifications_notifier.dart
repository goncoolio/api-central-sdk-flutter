import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart';

import 'safe_notifier.dart';

/// Notifications d'un utilisateur et compteur de non-lues.
///
/// Le compteur alimente typiquement un badge : il se met à jour à la réception
/// sans recharger la liste.
class NotificationsNotifier extends SafeNotifier {
  NotificationsNotifier({required this.sdk, required this.userId});

  final ApiCentral sdk;
  final String userId;

  List<AppNotification> _notifications = [];
  StreamSubscription<RealtimeEvent>? _abonnement;

  List<AppNotification> get notifications => List.unmodifiable(_notifications);

  int get unreadCount => _notifications.where((n) => !n.isRead).length;

  Future<void> load() => guard(
        () async {
          final page = await sdk.notifications.list(userId, limit: 50);
          _notifications = page.data;
        },
        onError: 'Impossible de charger les notifications',
      );

  Future<void> markAllRead() => guard(
        () async {
          await sdk.notifications.markAllAsRead(userId);
          _notifications =
              _notifications.map((n) => n.copyWith(isRead: true)).toList();
        },
        onError: 'Impossible de tout marquer comme lu',
      );

  void bindRealtime() {
    final realtime = sdk.realtime;
    if (realtime == null) return;

    unawaited(_abonnement?.cancel());
    _abonnement = realtime.events.listen(_appliquer);
  }

  void _appliquer(RealtimeEvent event) {
    switch (event) {
      case NotificationNewEvent():
        _notifications = [
          AppNotification(
            id: event.id,
            type: event.notificationType ?? '',
            title: event.title,
            body: event.body,
            data: event.data,
            createdAt: DateTime.tryParse(event.createdAt ?? ''),
          ),
          ..._notifications,
        ];
        safeNotify();
      case NotificationReadEvent():
        _notifications = _notifications
            .map((n) => event.notificationIds.contains(n.id)
                ? n.copyWith(isRead: true)
                : n)
            .toList();
        safeNotify();
      case NotificationAllReadEvent():
        _notifications =
            _notifications.map((n) => n.copyWith(isRead: true)).toList();
        safeNotify();
      default:
        break;
    }
  }

  @visibleForTesting
  void debugSeed(List<AppNotification> liste) {
    _notifications = [...liste];
  }

  @visibleForTesting
  void debugApply(RealtimeEvent event) => _appliquer(event);

  @override
  void dispose() {
    unawaited(_abonnement?.cancel());
    super.dispose();
  }
}
