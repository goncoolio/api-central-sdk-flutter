import 'dart:convert';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

import '../support/fake_channel.dart';

WebSocketClient _client(
  FakeChannel Function() fabrique, {
  Duration? retry,
}) =>
    WebSocketClient(
      url: 'ws://api.test/events',
      tokenProvider: CachedTokenProvider(inner: () async => 'jwt-1'),
      baseRetryDelay: retry ?? const Duration(seconds: 1),
      channelFactory: (uri) => fabrique(),
    );

void main() {
  group('WebSocketClient', () {
    test('se connecte et passe à l état connected', () async {
      final canal = FakeChannel();
      final client = _client(() => canal);

      await client.connect();

      expect(client.state, equals(ConnectionState.connected));
      await client.dispose();
    });

    test('place le token dans l URL de connexion', () async {
      Uri? uriUtilisee;
      final client = WebSocketClient(
        url: 'ws://api.test/events',
        tokenProvider: CachedTokenProvider(inner: () async => 'jwt-secret'),
        channelFactory: (uri) {
          uriUtilisee = uri;
          return FakeChannel();
        },
      );

      await client.connect();

      expect(uriUtilisee?.queryParameters['token'], equals('jwt-secret'));
      await client.dispose();
    });

    test('convertit les clés reçues en camelCase', () async {
      final canal = FakeChannel();
      final client = _client(() => canal);
      await client.connect();

      final recu = client.events.first;
      canal.recevoir({
        'type': 'message_read',
        'conversation_id': 'c1',
        'user_id': 'u2',
        'last_read_message_id': 'm1',
        'read_at': '2026-08-02T10:00:00Z',
      });

      final event = await recu;
      expect(event, isA<MessageReadEvent>());
      expect((event as MessageReadEvent).lastReadMessageId, equals('m1'));

      await client.dispose();
    });

    test('met en file les envois faits avant la connexion', () async {
      final canal = FakeChannel();
      final client = _client(() => canal);

      client.send('conversation_join', {'conversationId': 'c1'});
      expect(canal.envoyes, isEmpty);

      await client.connect();

      expect(canal.envoyes, hasLength(1));
      final envoye = jsonDecode(canal.envoyes.single) as Map<String, dynamic>;
      expect(envoye['type'], equals('conversation_join'));
      expect(envoye['conversation_id'], equals('c1'),
          reason: 'les clés sortantes passent en snake_case');

      await client.dispose();
    });

    test('se reconnecte après une coupure', () async {
      var canaux = 0;
      final client = _client(
        () {
          canaux++;
          return FakeChannel();
        },
        retry: const Duration(milliseconds: 10),
      );

      await client.connect();
      expect(canaux, equals(1));

      client.debugSimulerCoupure();
      await Future<void>.delayed(const Duration(milliseconds: 80));

      expect(canaux, greaterThanOrEqualTo(2),
          reason: 'une coupure doit déclencher une reconnexion');
      await client.dispose();
    });

    test('ne se reconnecte pas après un disconnect explicite', () async {
      var canaux = 0;
      final client = _client(
        () {
          canaux++;
          return FakeChannel();
        },
        retry: const Duration(milliseconds: 10),
      );

      await client.connect();
      await client.disconnect();
      await Future<void>.delayed(const Duration(milliseconds: 60));

      expect(canaux, equals(1));
      expect(client.state, equals(ConnectionState.disconnected));
      await client.dispose();
    });

    test('ignore un message non JSON sans planter', () async {
      final canal = FakeChannel();
      final client = _client(() => canal);
      await client.connect();

      final recus = <RealtimeEvent>[];
      client.events.listen(recus.add);

      canal
        ..recevoir({'type': 'pong', 'timestamp': 'x'})
        ..recevoir({'type': 'pong', 'timestamp': 'y'});
      await Future<void>.delayed(Duration.zero);

      expect(recus, hasLength(2));
      await client.dispose();
    });
  });
}
