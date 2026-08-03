import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart';

import 'safe_notifier.dart';

/// Liste des conversations d'un utilisateur, tenue à jour en temps réel.
///
/// Reprend le travail que chaque application refait sinon : recharger la liste,
/// remonter la conversation qui reçoit un message, suivre les non-lus.
class ConversationsNotifier extends SafeNotifier {
  ConversationsNotifier({required this.sdk, required this.userId});

  final ApiCentral sdk;
  final String userId;

  List<Conversation> _conversations = [];
  StreamSubscription<RealtimeEvent>? _abonnement;

  List<Conversation> get conversations => List.unmodifiable(_conversations);

  int get totalUnreadCount =>
      _conversations.fold(0, (somme, c) => somme + c.unreadCount);

  /// Charge la liste. En cas d'échec, l'état précédent est conservé.
  Future<void> load() => guard(
        () async {
          final page = await sdk.messaging.listConversations(userId: userId);
          _conversations = _trier(page.data);
        },
        onError: 'Impossible de charger les conversations',
      );

  /// Applique les événements temps réel. À appeler après `connectRealtime`.
  void bindRealtime() {
    final realtime = sdk.realtime;
    if (realtime == null) return;

    unawaited(_abonnement?.cancel());
    _abonnement = realtime.events.listen(_appliquer);
  }

  void _appliquer(RealtimeEvent event) {
    switch (event) {
      case MessageNewEvent():
        _appliquerMessage(event);
      case MessageReadEvent():
        _appliquerLecture(event);
      default:
        break;
    }
  }

  void _appliquerMessage(MessageNewEvent event) {
    final index =
        _conversations.indexWhere((c) => c.id == event.conversationId);
    if (index == -1) return;

    final actuelle = _conversations[index];
    // Un message que j'envoie moi-même ne doit rien incrémenter.
    final deMoi = event.senderId == userId;

    final miseAJour = actuelle.copyWith(
      unreadCount: deMoi ? actuelle.unreadCount : actuelle.unreadCount + 1,
      lastMessageAt: DateTime.tryParse(event.createdAt ?? '') ?? DateTime.now(),
      lastMessage: LastMessagePreview(
        id: event.id,
        content: event.content,
        contentType: ContentType.text,
      ),
    );

    _conversations = [
      miseAJour,
      ..._conversations.where((c) => c.id != event.conversationId),
    ];
    safeNotify();
  }

  void _appliquerLecture(MessageReadEvent event) {
    if (event.userId != userId) return;

    final index =
        _conversations.indexWhere((c) => c.id == event.conversationId);
    if (index == -1) return;

    final copie = [..._conversations];
    copie[index] = copie[index].copyWith(unreadCount: 0);
    _conversations = copie;
    safeNotify();
  }

  List<Conversation> _trier(List<Conversation> liste) {
    final copie = [...liste];
    copie.sort((a, b) {
      final da = a.lastMessageAt ?? a.createdAt;
      final db = b.lastMessageAt ?? b.createdAt;
      if (da == null || db == null) return 0;
      return db.compareTo(da);
    });
    return copie;
  }

  /// Injecte un état de départ. Réservé aux tests.
  @visibleForTesting
  void debugSeed(List<Conversation> liste) {
    _conversations = _trier(liste);
  }

  /// Applique un événement sans passer par le WebSocket. Réservé aux tests.
  @visibleForTesting
  void debugApply(RealtimeEvent event) => _appliquer(event);

  @override
  void dispose() {
    unawaited(_abonnement?.cancel());
    super.dispose();
  }
}
