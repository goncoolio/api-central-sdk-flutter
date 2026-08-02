import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('RealtimeEvent.fromJson', () {
    test('reconnaît connected', () {
      final event = RealtimeEvent.fromJson(const {
        'type': 'connected',
        'socketId': 's1',
        'application': {'id': 'app-42', 'slug': 'demo'},
        'user': {'id': 'u1', 'externalId': 'ext-1'},
      });

      expect(event, isA<ConnectedEvent>());
      expect((event as ConnectedEvent).socketId, equals('s1'));
    });

    test('reconnaît message_new', () {
      final event = RealtimeEvent.fromJson(const {
        'type': 'message_new',
        'id': 'm1',
        'conversationId': 'c1',
        'senderId': 'u1',
        'content': 'Bonjour',
        'contentType': 'text',
        'createdAt': '2026-08-02T10:00:00Z',
      });

      expect(event, isA<MessageNewEvent>());
      expect((event as MessageNewEvent).content, equals('Bonjour'));
    });

    test('reconnaît message_read avec tous ses champs', () {
      final event = RealtimeEvent.fromJson(const {
        'type': 'message_read',
        'conversationId': 'c1',
        'userId': 'u2',
        'lastReadMessageId': 'm1',
        'readAt': '2026-08-02T10:00:00Z',
      });

      expect(event, isA<MessageReadEvent>());
      final lu = event as MessageReadEvent;
      expect(lu.userId, equals('u2'));
      expect(lu.lastReadMessageId, equals('m1'));
    });

    test('reconnaît message_delivered', () {
      final event = RealtimeEvent.fromJson(const {
        'type': 'message_delivered',
        'conversationId': 'c1',
        'userId': 'u2',
        'messageIds': ['m1', 'm2'],
        'deliveredAt': '2026-08-02T10:00:00Z',
      });

      expect(event, isA<MessageDeliveredEvent>());
      final remis = event as MessageDeliveredEvent;
      expect(remis.userId, equals('u2'));
      expect(remis.messageIds, equals(['m1', 'm2']));
      expect(remis.deliveredAt, equals('2026-08-02T10:00:00Z'));
    });

    test('reconnaît typing_update', () {
      final event = RealtimeEvent.fromJson(const {
        'type': 'typing_update',
        'conversationId': 'c1',
        'userIds': ['u1', 'u2'],
      });

      expect(event, isA<TypingUpdateEvent>());
      expect((event as TypingUpdateEvent).userIds, equals(['u1', 'u2']));
    });
  });

  group('parseRealtimeEvent', () {
    test('range les événements non typés dans unknown', () {
      // Le SDK type désormais tous les événements de l'API : ce cas couvre une
      // version future du serveur qui en introduirait un nouveau.
      final event = parseRealtimeEvent(const {
        'type': 'evenement_futur',
        'ressourceId': 'r-1',
        'valeur': 42,
      });

      expect(event, isA<UnknownEvent>());
      final inconnu = event as UnknownEvent;
      expect(inconnu.type, equals('evenement_futur'));
      expect(inconnu.data['ressourceId'], equals('r-1'));
      expect(inconnu.data.containsKey('type'), isFalse,
          reason: 'le discriminant est extrait, pas dupliqué dans data');
    });

    test('range un type absent dans unknown sans lever', () {
      final event = parseRealtimeEvent(const {'foo': 'bar'});

      expect(event, isA<UnknownEvent>());
      expect((event as UnknownEvent).type, isEmpty);
    });

    test('délègue les types connus au parsing typé', () {
      final event = parseRealtimeEvent(const {
        'type': 'message_deleted',
        'id': 'm1',
        'conversationId': 'c1',
      });

      expect(event, isA<MessageDeletedEvent>());
    });

    test('permet un pattern matching exhaustif', () {
      // Tous les événements de l'API sont désormais typés : on utilise un type
      // fictif pour vérifier que le repli fonctionne toujours.
      const messages = <Map<String, dynamic>>[
        {'type': 'pong', 'timestamp': '2026-08-02T10:00:00Z'},
        {'type': 'notification_all_read'},
        {'type': 'evenement_futur', 'donnee': 'x'},
      ];

      final libelles = messages.map(parseRealtimeEvent).map((event) =>
          switch (event) {
            PongEvent() => 'pong',
            NotificationAllReadEvent() => 'tout lu',
            UnknownEvent(:final type) => 'inconnu:$type',
            _ => 'autre',
          });

      expect(libelles, equals(['pong', 'tout lu', 'inconnu:evenement_futur']));
    });
  });
}
