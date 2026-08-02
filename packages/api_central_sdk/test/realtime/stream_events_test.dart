import 'dart:convert';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

import '../support/fake_channel.dart';

RealtimeModule _realtime(FakeChannel canal) => RealtimeModule(
      WebSocketClient(
        url: 'ws://api.test/events',
        tokenProvider: CachedTokenProvider(inner: () async => 'jwt-1'),
        channelFactory: (uri) => canal,
      ),
    );

void main() {
  group('Événements de direct', () {
    test('stream_started n est plus un UnknownEvent', () {
      final event = parseRealtimeEvent(const {
        'type': 'stream_started',
        'streamId': 's1',
        'hostId': 'u1',
        'title': 'Mon direct',
      });

      expect(event, isA<StreamStartedEvent>());
      expect((event as StreamStartedEvent).title, equals('Mon direct'));
    });

    test('stream_comment_new porte son contenu', () {
      final event = parseRealtimeEvent(const {
        'type': 'stream_comment_new',
        'streamId': 's1',
        'commentId': 'cm1',
        'userId': 'u2',
        'userName': 'Bob',
        'content': 'Super !',
      });

      expect(event, isA<StreamCommentNewEvent>());
      expect((event as StreamCommentNewEvent).content, equals('Super !'));
    });

    test('stream_viewer_count suit l audience', () {
      final event = parseRealtimeEvent(const {
        'type': 'stream_viewer_count',
        'streamId': 's1',
        'count': 42,
      });

      expect(event, isA<StreamViewerCountEvent>());
      expect((event as StreamViewerCountEvent).count, equals(42));
    });

    test('stream_reaction_burst porte emoji et compteur', () {
      final event = parseRealtimeEvent(const {
        'type': 'stream_reaction_burst',
        'streamId': 's1',
        'emoji': '🔥',
        'count': 12,
      });

      expect(event, isA<StreamReactionBurstEvent>());
      final burst = event as StreamReactionBurstEvent;
      expect(burst.emoji, equals('🔥'));
      expect(burst.count, equals(12));
    });

    test('un type inconnu du SDK reste en unknown', () {
      final event = parseRealtimeEvent(const {
        'type': 'evenement_futur',
        'donnee': 'x',
      });

      expect(event, isA<UnknownEvent>(),
          reason: 'le repli protège des évolutions du protocole');
    });
  });

  group('RealtimeModule et les directs', () {
    test('envoie stream_join et mémorise le direct', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();
      canal.envoyes.clear();

      realtime.joinStream('s1');

      final envoye = jsonDecode(canal.envoyes.single) as Map<String, dynamic>;
      expect(envoye['type'], equals('stream_join'));
      expect(envoye['stream_id'], equals('s1'));
      expect(realtime.joinedStreams, equals({'s1'}));

      await realtime.dispose();
    });

    test('rejoint conversations et directs après reconnexion', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();
      realtime
        ..joinConversation('c1')
        ..joinStream('s1');
      canal.envoyes.clear();

      realtime.debugSimulerReconnexion();

      final envoyes = canal.envoyes
          .map((m) => jsonDecode(m) as Map<String, dynamic>)
          .toList();

      expect(
          envoyes.where((m) => m['type'] == 'conversation_join').single[
              'conversation_id'],
          equals('c1'));
      expect(
          envoyes.where((m) => m['type'] == 'stream_join').single['stream_id'],
          equals('s1'));

      await realtime.dispose();
    });

    test('leaveStream retire le direct de la mémoire', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();

      realtime
        ..joinStream('s1')
        ..joinStream('s2')
        ..leaveStream('s1');

      expect(realtime.joinedStreams, equals({'s2'}));
      await realtime.dispose();
    });
  });
}
