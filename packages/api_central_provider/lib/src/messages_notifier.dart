import 'dart:async';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter/foundation.dart';

import 'safe_notifier.dart';

/// Messages d'une conversation, du plus ancien au plus récent.
///
/// Gère la pagination par curseur — l'API renvoie les messages du plus récent
/// au plus ancien, l'affichage les veut dans l'autre sens.
class MessagesNotifier extends SafeNotifier {
  MessagesNotifier({
    required this.sdk,
    required this.conversationId,
    required this.userId,
  });

  final ApiCentral sdk;
  final String conversationId;
  final String userId;

  List<Message> _messages = [];
  String? _curseur;
  bool _hasMore = false;
  StreamSubscription<RealtimeEvent>? _abonnement;

  List<Message> get messages => List.unmodifiable(_messages);

  /// Reste-t-il des messages plus anciens à charger ?
  bool get hasMore => _hasMore;

  Future<void> load() => guard(
        () async {
          final page = await sdk.messaging.listMessages(conversationId);
          _messages = page.data.reversed.toList();
          _curseur = page.pagination.nextCursor;
          _hasMore = page.pagination.hasMore;
        },
        onError: 'Impossible de charger les messages',
      );

  /// Charge la page précédente, à appeler en haut de liste.
  Future<void> loadMore() async {
    if (!_hasMore || _curseur == null) return;
    await guard(
      () async {
        final page =
            await sdk.messaging.listMessages(conversationId, cursor: _curseur);
        _messages = [...page.data.reversed, ..._messages];
        _curseur = page.pagination.nextCursor;
        _hasMore = page.pagination.hasMore;
      },
      onError: 'Impossible de charger les messages précédents',
    );
  }

  /// Envoie un message. La liste se met à jour à la réponse du serveur, puis
  /// l'écho temps réel est ignoré grâce au dédoublonnage par identifiant.
  Future<void> send(String content) => guard(
        () async {
          final message = await sdk.messaging.sendMessage(
            conversationId,
            senderId: userId,
            content: content,
          );
          _ajouter(message);
        },
        onError: "Impossible d'envoyer le message",
      );

  void bindRealtime() {
    final realtime = sdk.realtime;
    if (realtime == null) return;

    unawaited(_abonnement?.cancel());
    _abonnement = realtime.events.listen(_appliquer);
  }

  void _appliquer(RealtimeEvent event) {
    switch (event) {
      case MessageNewEvent():
        _appliquerNouveau(event);
      case MessageDeletedEvent():
        _appliquerSuppression(event);
      default:
        break;
    }
  }

  void _appliquerNouveau(MessageNewEvent event) {
    if (event.conversationId != conversationId) return;
    _ajouter(Message(
      id: event.id,
      conversationId: event.conversationId,
      content: event.content,
      contentType: ContentType.text,
      createdAt: DateTime.tryParse(event.createdAt ?? ''),
    ));
  }

  void _appliquerSuppression(MessageDeletedEvent event) {
    if (event.conversationId != conversationId) return;
    final avant = _messages.length;
    _messages = _messages.where((m) => m.id != event.id).toList();
    if (_messages.length != avant) safeNotify();
  }

  /// Ajoute sans dupliquer : l'écho WebSocket d'un envoi porte le même
  /// identifiant que la réponse REST.
  void _ajouter(Message message) {
    if (_messages.any((m) => m.id == message.id)) return;
    _messages = [..._messages, message];
    safeNotify();
  }

  @visibleForTesting
  void debugSeed(List<Message> liste) {
    _messages = [...liste];
  }

  @visibleForTesting
  void debugApply(RealtimeEvent event) => _appliquer(event);

  @override
  void dispose() {
    unawaited(_abonnement?.cancel());
    super.dispose();
  }
}
