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
