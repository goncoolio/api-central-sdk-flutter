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

/// `presence_status` tel que l'API le sérialise sur le fil (serde,
/// snake_case), avant la conversion de casse du client WebSocket.
const _presenceStatusBrut = <String, dynamic>{
  'type': 'presence_status',
  'statuses': [
    {'user_id': '0191c7a2-5d7e-7c3a-9f1e-3b2a1c0d4e5f', 'status': 'online'},
    {'user_id': '0191c7a2-5d7e-7c3a-9f1e-3b2a1c0d4e60', 'status': 'offline'},
  ],
};

/// `stats` tel que l'API le sérialise sur le fil.
const _statsBrut = <String, dynamic>{
  'type': 'stats',
  'total_connections': 42,
  'applications': 3,
  'users_online': 17,
};

void main() {
  group('presence_status', () {
    test('porte la liste des statuts', () {
      final event = parseRealtimeEvent(const {
        'type': 'presence_status',
        'statuses': [
          {'userId': 'u1', 'status': 'online'},
          {'userId': 'u2', 'status': 'away'},
        ],
      });

      expect(event, isA<PresenceStatusEvent>());
      final statuts = (event as PresenceStatusEvent).statuses;
      expect(statuts.map((s) => s.userId), equals(['u1', 'u2']));
      expect(statuts.last.status, equals('away'));
    });

    test('accepte une liste vide', () {
      final event = parseRealtimeEvent(const {
        'type': 'presence_status',
        'statuses': <dynamic>[],
      });

      expect((event as PresenceStatusEvent).statuses, isEmpty);
    });

    test('onPresenceStatus reçoit la réponse telle qu elle circule', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();

      final recu = realtime.onPresenceStatus.first;
      canal.recevoir(_presenceStatusBrut);

      final event = await recu;
      expect(event.statuses, hasLength(2));
      expect(
        event.statuses.first.userId,
        equals('0191c7a2-5d7e-7c3a-9f1e-3b2a1c0d4e5f'),
        reason: 'user_id arrive en snake_case et doit être converti',
      );
      expect(event.statuses.first.status, equals('online'));

      await realtime.dispose();
    });
  });

  group('stats', () {
    test('porte les compteurs de connexion', () {
      final event = parseRealtimeEvent(const {
        'type': 'stats',
        'totalConnections': 42,
        'applications': 3,
        'usersOnline': 17,
      });

      expect(event, isA<StatsEvent>());
      final stats = event as StatsEvent;
      expect(stats.totalConnections, equals(42));
      expect(stats.applications, equals(3));
      expect(stats.usersOnline, equals(17));
    });

    test('onStats reçoit la réponse telle qu elle circule', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();

      final recu = realtime.onStats.first;
      canal.recevoir(_statsBrut);

      final event = await recu;
      expect(event.totalConnections, equals(42));
      expect(event.usersOnline, equals(17));

      await realtime.dispose();
    });

    test('requestStats demande les statistiques au serveur', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();
      await Future<void>.delayed(Duration.zero);
      canal.envoyes.clear();

      realtime.requestStats();

      expect(jsonDecode(canal.envoyes.single), equals({'type': 'stats'}));

      await realtime.dispose();
    });
  });
}
