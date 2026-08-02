import 'dart:convert';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

import '../support/fake_channel.dart';

void main() {
  group('RealtimeModule', () {
    late FakeChannel canal;
    late RealtimeModule realtime;

    setUp(() {
      canal = FakeChannel();
      realtime = RealtimeModule(
        WebSocketClient(
          url: 'ws://api.test/events',
          tokenProvider: CachedTokenProvider(inner: () async => 'jwt-1'),
          channelFactory: (uri) => canal,
        ),
      );
    });

    tearDown(() => realtime.dispose());

    test('mémorise les conversations rejointes', () async {
      await realtime.connect();

      realtime
        ..joinConversation('c1')
        ..joinConversation('c2')
        ..leaveConversation('c1');

      expect(realtime.joinedConversations, equals({'c2'}));
    });

    test('filtre les événements par type', () async {
      await realtime.connect();

      final recu = realtime.onMessageRead.first;
      canal
        ..recevoir({
          'type': 'typing_update',
          'conversation_id': 'c1',
          'user_ids': ['u1'],
        })
        ..recevoir({
          'type': 'message_read',
          'conversation_id': 'c1',
          'user_id': 'u2',
          'last_read_message_id': 'm1',
          'read_at': '2026-08-02T10:00:00Z',
        });

      final event = await recu;
      expect(event.lastReadMessageId, equals('m1'),
          reason: 'typing_update ne doit pas passer le filtre');
    });

    test('envoie conversation_join sur le canal', () async {
      await realtime.connect();
      canal.envoyes.clear();

      realtime.joinConversation('c1');

      final envoye = jsonDecode(canal.envoyes.single) as Map<String, dynamic>;
      expect(envoye['type'], equals('conversation_join'));
      expect(envoye['conversation_id'], equals('c1'));
    });

    test('rejoint automatiquement les rooms après reconnexion', () async {
      await realtime.connect();
      realtime
        ..joinConversation('c1')
        ..joinConversation('c2');
      canal.envoyes.clear();

      realtime.debugSimulerReconnexion();

      final rejoints = canal.envoyes
          .map((m) => jsonDecode(m) as Map<String, dynamic>)
          .where((m) => m['type'] == 'conversation_join')
          .map((m) => m['conversation_id'])
          .toSet();

      expect(rejoints, equals({'c1', 'c2'}),
          reason: 'sans re-join, l application cesse de recevoir ses messages');
    });

    test('acknowledgeDelivery signale les messages reçus', () async {
      await realtime.connect();
      await Future<void>.delayed(Duration.zero);
      canal.envoyes.clear();

      realtime.acknowledgeDelivery('c1', ['m1', 'm2']);

      final envoye = jsonDecode(canal.envoyes.single) as Map<String, dynamic>;
      expect(envoye['type'], equals('message_delivered'));
      expect(envoye['conversation_id'], equals('c1'));
      expect(envoye['message_ids'], equals(['m1', 'm2']));
    });

    test('onMessageDelivered filtre les accusés de remise', () async {
      await realtime.connect();

      final recu = realtime.onMessageDelivered.first;
      canal.recevoir({
        'type': 'message_delivered',
        'conversation_id': 'c1',
        'user_id': 'u2',
        'message_ids': ['m1'],
        'delivered_at': '2026-08-02T10:00:00Z',
      });

      final event = await recu;
      expect(event.messageIds, equals(['m1']));
    });

    test('on<T>() filtre sur un type arbitraire', () async {
      await realtime.connect();

      final recu = realtime.on<ConversationJoinedEvent>().first;
      canal.recevoir({
        'type': 'conversation_joined',
        'conversation_id': 'c1',
        'success': true,
      });

      final event = await recu;
      expect(event.conversationId, equals('c1'));
    });

    test('envoie les indicateurs de saisie', () async {
      await realtime.connect();
      canal.envoyes.clear();

      realtime
        ..startTyping('c1')
        ..stopTyping('c1');

      final types = canal.envoyes
          .map((m) => (jsonDecode(m) as Map<String, dynamic>)['type'])
          .toList();

      expect(types, equals(['typing_start', 'typing_stop']));
    });
  });
}
