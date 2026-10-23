import 'package:api_central_provider/api_central_provider.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

ApiCentral _sdk() => ApiCentral(
      config: const ApiCentralConfig(
        baseUrl: 'https://api.test/s2s/v1',
        applicationId: 'app-42',
      ),
      tokenProvider: () async => 'jwt-1',
    );

Conversation _conv(String id, {int unread = 0}) => Conversation(
      id: id,
      type: ConversationType.direct,
      unreadCount: unread,
    );

Message _msg(String id, String contenu) => Message(
      id: id,
      conversationId: 'c1',
      content: contenu,
      contentType: ContentType.text,
    );

AppNotification _notif(String id, {bool lue = false}) => AppNotification(
      id: id,
      type: 'message',
      title: 'Titre',
      body: 'Corps',
      isRead: lue,
    );

void main() {
  group('ConversationsNotifier', () {
    test('démarre vide et sans erreur', () {
      final n = ConversationsNotifier(sdk: _sdk(), userId: 'u1');

      expect(n.conversations, isEmpty);
      expect(n.totalUnreadCount, isZero);
      expect(n.errorMessage, isNull);
      n.dispose();
    });

    test('additionne les non-lus', () {
      final n = ConversationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_conv('c1', unread: 3), _conv('c2', unread: 2)]);

      expect(n.totalUnreadCount, equals(5));
      n.dispose();
    });

    test('un message entrant remonte la conversation et incrémente', () {
      final n = ConversationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_conv('c1'), _conv('c2')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm1',
        conversationId: 'c2',
        content: 'Coucou',
        senderId: 'u2',
      ));

      expect(n.conversations.first.id, equals('c2'),
          reason: 'la conversation active remonte en tête');
      expect(n.conversations.first.unreadCount, equals(1));
      n.dispose();
    });

    test('un message que j envoie ne compte pas comme non lu', () {
      final n = ConversationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_conv('c1')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm1',
        conversationId: 'c1',
        content: 'Écrit par moi',
        senderId: 'u1',
      ));

      expect(n.conversations.first.unreadCount, isZero);
      n.dispose();
    });

    test('un accusé de lecture remet le compteur à zéro', () {
      final n = ConversationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_conv('c1', unread: 7)]);

      n.debugApply(const RealtimeEvent.messageRead(
        conversationId: 'c1',
        userId: 'u1',
        lastReadMessageId: 'm9',
        readAt: '2026-08-03T10:00:00Z',
      ));

      expect(n.conversations.first.unreadCount, isZero);
      n.dispose();
    });

    test('ignore un événement pour une conversation inconnue', () {
      final n = ConversationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_conv('c1')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm1',
        conversationId: 'inconnue',
        content: 'x',
      ));

      expect(n.conversations, hasLength(1));
      n.dispose();
    });
  });

  group('MessagesNotifier', () {
    MessagesNotifier creer() => MessagesNotifier(
          sdk: _sdk(),
          conversationId: 'c1',
          userId: 'u1',
        );

    test('démarre vide', () {
      final n = creer();

      expect(n.messages, isEmpty);
      expect(n.hasMore, isFalse);
      n.dispose();
    });

    test('un message entrant s ajoute à la fin', () {
      final n = creer()..debugSeed([_msg('m1', 'Premier')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm2',
        conversationId: 'c1',
        content: 'Deuxième',
      ));

      expect(
          n.messages.map((m) => m.content), equals(['Premier', 'Deuxième']));
      n.dispose();
    });

    test('une réponse entrante reprend l aperçu du message cité', () {
      final n = creer()..debugSeed([_msg('m1', 'On se voit demain ?')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm2',
        conversationId: 'c1',
        content: 'Oui',
        clientMessageId: 'local-42',
        replyToId: 'm1',
      ));

      final reponse = n.messages.last;
      expect(reponse.replyTo?.id, equals('m1'));
      expect(reponse.replyTo?.content, equals('On se voit demain ?'));
      expect(reponse.clientMessageId, equals('local-42'));
      n.dispose();
    });

    test('une réponse à un message absent garde son identifiant seul', () {
      final n = creer()..debugSeed([_msg('m1', 'Premier')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm3',
        conversationId: 'c1',
        content: 'Oui',
        replyToId: 'ancien',
      ));

      expect(n.messages.last.replyTo?.id, equals('ancien'),
          reason: "l'application peut recharger l'aperçu par son identifiant");
      expect(n.messages.last.replyTo?.content, isEmpty);
      n.dispose();
    });

    test('ignore un message d une autre conversation', () {
      final n = creer()..debugSeed([_msg('m1', 'Premier')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm2',
        conversationId: 'autre',
        content: 'Ailleurs',
      ));

      expect(n.messages, hasLength(1));
      n.dispose();
    });

    test('ne duplique pas un message déjà présent', () {
      final n = creer()..debugSeed([_msg('m1', 'Premier')]);

      n.debugApply(const RealtimeEvent.messageNew(
        id: 'm1',
        conversationId: 'c1',
        content: 'Premier',
      ));

      expect(n.messages, hasLength(1),
          reason: "l'écho d'un envoi ne doit pas apparaître deux fois");
      n.dispose();
    });

    test('une suppression retire le message', () {
      final n = creer()..debugSeed([_msg('m1', 'A'), _msg('m2', 'B')]);

      n.debugApply(const RealtimeEvent.messageDeleted(
        id: 'm1',
        conversationId: 'c1',
      ));

      expect(n.messages.map((m) => m.id), equals(['m2']));
      n.dispose();
    });
  });

  group('NotificationsNotifier', () {
    test('compte les non-lues', () {
      final n = NotificationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_notif('n1'), _notif('n2', lue: true), _notif('n3')]);

      expect(n.unreadCount, equals(2));
      n.dispose();
    });

    test('une notification entrante arrive en tête', () {
      final n = NotificationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_notif('n1')]);

      n.debugApply(const RealtimeEvent.notificationNew(
        id: 'n2',
        title: 'Nouvelle',
        body: 'Corps',
      ));

      expect(n.notifications.first.id, equals('n2'));
      expect(n.unreadCount, equals(2));
      n.dispose();
    });

    test('notification_all_read remet tout à zéro', () {
      final n = NotificationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_notif('n1'), _notif('n2')]);

      n.debugApply(const RealtimeEvent.notificationAllRead());

      expect(n.unreadCount, isZero);
      n.dispose();
    });

    test('notification_read ne marque que les identifiants visés', () {
      final n = NotificationsNotifier(sdk: _sdk(), userId: 'u1')
        ..debugSeed([_notif('n1'), _notif('n2')]);

      n.debugApply(const RealtimeEvent.notificationRead(
        notificationIds: ['n1'],
      ));

      expect(n.unreadCount, equals(1));
      n.dispose();
    });
  });

  group('ConnectionNotifier', () {
    test('démarre déconnecté', () {
      final n = ConnectionNotifier(sdk: _sdk());

      expect(n.state, equals(ConnectionState.disconnected));
      expect(n.isConnected, isFalse);
      n.dispose();
    });

    test('suit les changements d état', () {
      final n = ConnectionNotifier(sdk: _sdk());
      var notifications = 0;
      n.addListener(() => notifications++);

      n.debugSetState(ConnectionState.connected);

      expect(n.isConnected, isTrue);
      expect(notifications, equals(1));
      n.dispose();
    });
  });
}
