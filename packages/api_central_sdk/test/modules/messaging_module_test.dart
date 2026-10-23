import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

import '../support/fake_adapter.dart';

ApiCentral _sdk(FakeAdapter adapter) {
  final sdk = ApiCentral(
    config: const ApiCentralConfig(
      baseUrl: 'https://api.test/s2s/v1',
      applicationId: 'app-42',
    ),
    tokenProvider: () async => 'jwt-1',
  );
  sdk.client.dio.httpClientAdapter = adapter;
  return sdk;
}

const _conversation = {
  'id': 'c1',
  'type': 'direct',
  'participants': <dynamic>[],
  'unreadCount': 0,
  'createdAt': '2026-08-02T10:00:00Z',
};

void main() {
  group('MessagingModule', () {
    test('crée une conversation', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, _conversation));

      final conversation = await _sdk(adapter).messaging.createConversation(
        type: ConversationType.direct,
        participantIds: ['u1', 'u2'],
      );

      expect(conversation.type, equals(ConversationType.direct));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['conversation_type'], equals('direct'));
      expect(envoye['participant_ids'], equals(['u1', 'u2']));
    });

    test('liste les messages avec pagination par curseur', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'data': [
            {
              'id': 'm1',
              'conversationId': 'c1',
              'content': 'Salut',
              'contentType': 'text',
              'createdAt': '2026-08-02T10:00:00Z',
            },
          ],
          'pagination': {'hasMore': true, 'nextCursor': 'm1'},
        }),
      );

      final page = await _sdk(adapter)
          .messaging
          .listMessages('c1', cursor: 'm0', limit: 50);

      expect(page.data.single.content, equals('Salut'));
      expect(page.pagination.nextCursor, equals('m1'));
      expect(adapter.requests.single.queryParameters,
          equals({'cursor': 'm0', 'limit': 50}));
    });

    test('envoie un message avec le timeout étendu', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'm1',
          'conversationId': 'c1',
          'content': 'Bonjour',
          'contentType': 'text',
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      await _sdk(adapter).messaging.sendMessage(
            'c1',
            senderId: 'u1',
            content: 'Bonjour',
          );

      expect(adapter.requests.single.receiveTimeout,
          equals(const Duration(seconds: 45)),
          reason: 'les messages peuvent porter des médias');
    });

    test('lit les pièces jointes et les accusés de lecture', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'm1',
          'conversationId': 'c1',
          'content': 'Voici le plan',
          'contentType': 'file',
          'attachments': [
            {
              'url': 'https://cdn.test/plan.pdf',
              'mimeType': 'application/pdf',
              'name': 'plan.pdf',
              'size': 2048,
            },
          ],
          'readBy': ['u2', 'u3'],
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      final message = await _sdk(adapter).messaging.getMessage('m1');

      expect(
        message.attachments!.single.url,
        equals('https://cdn.test/plan.pdf'),
        reason: "l'API renvoie un tableau de pièces jointes, pas un objet",
      );
      expect(message.readBy, equals(['u2', 'u3']));
    });

    test('un message sans pièce jointe arrive avec un tableau vide', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'm1',
          'conversationId': 'c1',
          'content': 'Salut',
          'contentType': 'text',
          'attachments': <dynamic>[],
          'readBy': <dynamic>[],
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      final message = await _sdk(adapter).messaging.getMessage('m1');

      expect(message.attachments, isEmpty);
      expect(message.readBy, isEmpty);
    });

    test('sendMessage transmet les mentions', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'm1',
          'conversationId': 'c1',
          'content': 'Salut @u2',
          'contentType': 'text',
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      await _sdk(adapter).messaging.sendMessage(
        'c1',
        senderId: 'u1',
        content: 'Salut @u2',
        mentions: ['u2'],
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(
        envoye['mentions'],
        equals(['u2']),
        reason: 'sans mentions, les participants réglés sur « mentions » ne '
            'reçoivent aucune notification',
      );
    });

    test('sendMessage transmet replyToId et lit l aperçu reply_to', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'm2',
          'conversation_id': 'c1',
          'content': 'Oui',
          'content_type': 'text',
          'reply_to': {
            'id': 'm1',
            'conversation_id': 'c1',
            'content': 'On se voit demain ?',
            'content_type': 'text',
            'reply_to': null,
            'reactions': <dynamic>[],
            'is_edited': false,
            'is_deleted': false,
            'read_by': <dynamic>[],
            'created_at': '2026-10-23T09:00:00Z',
          },
          'reactions': <dynamic>[],
          'is_edited': false,
          'is_deleted': false,
          'read_by': <dynamic>[],
          'created_at': '2026-10-23T10:00:00Z',
        }),
      );

      final message = await _sdk(adapter).messaging.sendMessage(
        'c1',
        senderId: 'u1',
        content: 'Oui',
        replyToId: 'm1',
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(envoye['reply_to_id'], equals('m1'));
      expect(message.replyTo?.id, equals('m1'));
      expect(message.replyTo?.content, equals('On se voit demain ?'));
      expect(message.replyTo?.replyTo, isNull,
          reason: "l'aperçu s'arrête au premier niveau");
    });

    test('reply_to null quand le message ne répond à rien', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'm3',
          'conversation_id': 'c1',
          'content': 'Salut',
          'content_type': 'text',
          'reply_to': null,
          'created_at': '2026-10-23T10:00:00Z',
        }),
      );

      final message = await _sdk(adapter).messaging.sendMessage(
        'c1',
        senderId: 'u1',
        content: 'Salut',
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(envoye.containsKey('reply_to_id'), isFalse);
      expect(message.replyTo, isNull);
    });

    test('addParticipant transmet l acteur exigé par l API', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {'success': true}),
      );

      await _sdk(adapter).messaging.addParticipant(
        'c1',
        userId: 'u2',
        actorId: 'u1',
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(
        envoye['actor_id'],
        equals('u1'),
        reason: "l'API exige actor_id et refuse la requête sans lui (422)",
      );
    });

    test('removeParticipant passe l acteur en paramètre de requête', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {'success': true}),
      );

      await _sdk(
        adapter,
      ).messaging.removeParticipant('c1', 'u2', actorId: 'u1');

      expect(
        adapter.requests.single.queryParameters,
        equals({'actor_id': 'u1'}),
        reason: "l'API lit actor_id en query et refuse la requête sans lui",
      );
    });

    test('listConversations transmet l utilisateur exigé par l API', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'data': [_conversation],
          'pagination': {'total': 1, 'page': 1, 'limit': 20, 'totalPages': 1},
        }),
      );

      await _sdk(adapter).messaging.listConversations(userId: 'u1');

      expect(
        adapter.requests.single.queryParameters['user_id'],
        equals('u1'),
        reason: "l'API refuse la liste sans user_id (400)",
      );
    });

    test('updateConversation lit le type du modèle de domaine', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'c1',
          'conversationType': 'group',
          'title': 'Chantier',
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      final conversation = await _sdk(
        adapter,
      ).messaging.updateConversation('c1', title: 'Chantier');

      expect(
        conversation.type,
        equals(ConversationType.group),
        reason: 'cette route renvoie conversationType, non type comme les '
            'autres',
      );
      expect(conversation.title, equals('Chantier'));
    });

    test('updateParticipantSettings coupe une conversation', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'p1',
          'conversationId': 'c1',
          'userId': 'u2',
          'role': 'member',
          'isMuted': true,
          'notificationPreference': 'mentions',
          'joinedAt': '2026-08-02T10:00:00Z',
        }),
      );

      final reglages = await _sdk(adapter).messaging.updateParticipantSettings(
        'c1',
        'u2',
        isMuted: true,
        notificationPreference: NotificationPreference.mentions,
      );

      expect(reglages.isMuted, isTrue);
      expect(
        reglages.notificationPreference,
        equals(NotificationPreference.mentions),
      );
      expect(
        adapter.requests.single.path,
        equals('/messaging/conversations/c1/participants/u2/settings'),
      );
      expect(adapter.requests.single.method, equals('PUT'));
      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(envoye['is_muted'], isTrue);
      expect(envoye['notification_preference'], equals('mentions'));
    });

    test('retire une réaction en encodant l emoji', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter)
          .messaging
          .removeReaction('m1', userId: 'u1', emoji: '👍');

      expect(
          adapter.requests.single.path,
          equals(
              '/messaging/messages/m1/reactions/${Uri.encodeComponent('👍')}'));
      expect(adapter.requests.single.queryParameters, equals({'user_id': 'u1'}));
    });

    test('marque comme lu en transmettant le messageId', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter)
          .messaging
          .markAsRead('c1', userId: 'u2', messageId: 'm1');

      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['message_id'], equals('m1'),
          reason:
              "l'API ne diffuse l'accusé de lecture que si messageId est fourni");
    });
  });
}
