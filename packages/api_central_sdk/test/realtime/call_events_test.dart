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
  group('Événements d appel', () {
    test('call_incoming porte l appelant et le type', () {
      final event = parseRealtimeEvent(const {
        'type': 'call_incoming',
        'callId': 'call-1',
        'callerId': 'u1',
        'callerName': 'Alice',
        'callType': 'video',
      });

      expect(event, isA<CallIncomingEvent>());
      final entrant = event as CallIncomingEvent;
      expect(entrant.callerId, equals('u1'));
      expect(entrant.callType, equals('video'));
    });

    test('call_offer_received porte le SDP', () {
      final event = parseRealtimeEvent(const {
        'type': 'call_offer_received',
        'callId': 'call-1',
        'fromUserId': 'u1',
        'sdp': 'v=0...',
      });

      expect(event, isA<CallOfferReceivedEvent>());
      expect((event as CallOfferReceivedEvent).sdp, equals('v=0...'));
    });

    test('call_ended porte la raison et la durée', () {
      final event = parseRealtimeEvent(const {
        'type': 'call_ended',
        'callId': 'call-1',
        'reason': 'hangup',
        'durationSeconds': 42,
      });

      expect(event, isA<CallEndedEvent>());
      final fin = event as CallEndedEvent;
      expect(fin.reason, equals('hangup'));
      expect(fin.durationSeconds, equals(42));
    });

    test('call_mute_changed suit l état du micro', () {
      final event = parseRealtimeEvent(const {
        'type': 'call_mute_changed',
        'callId': 'call-1',
        'userId': 'u2',
        'isMuted': true,
      });

      expect(event, isA<CallMuteChangedEvent>());
      expect((event as CallMuteChangedEvent).isMuted, isTrue);
    });

    test('call_connected liste les participants', () {
      final event = parseRealtimeEvent(const {
        'type': 'call_connected',
        'callId': 'call-1',
        'participantIds': ['u1', 'u2'],
      });

      expect(event, isA<CallConnectedEvent>());
      expect((event as CallConnectedEvent).participantIds,
          equals(['u1', 'u2']));
    });

    test('aucun événement d appel ne tombe plus en unknown', () {
      const types = [
        'call_joined',
        'call_left',
        'call_incoming',
        'call_answered',
        'call_connected',
        'call_declined',
        'call_ended',
        'call_participant_joined',
        'call_participant_left',
        'call_offer_received',
        'call_answer_received',
        'call_ice_candidate_received',
        'call_mute_changed',
        'call_video_changed',
        'call_screen_share_changed',
      ];

      for (final type in types) {
        final event = parseRealtimeEvent({
          'type': type,
          'callId': 'call-1',
          'userId': 'u1',
          'callerId': 'u1',
          'fromUserId': 'u1',
          'sdp': 'v=0',
          'candidate': 'candidate:1',
        });
        expect(event, isNot(isA<UnknownEvent>()),
            reason: '$type doit être typé');
      }
    });
  });

  group('RealtimeModule et les appels', () {
    test('envoie call_join et mémorise l appel', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();
      canal.envoyes.clear();

      realtime.joinCall('call-1');

      final envoye = jsonDecode(canal.envoyes.single) as Map<String, dynamic>;
      expect(envoye['type'], equals('call_join'));
      expect(envoye['call_id'], equals('call-1'));
      expect(realtime.joinedCalls, equals({'call-1'}));

      await realtime.dispose();
    });

    test('transmet une offre SDP par le WebSocket', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();
      canal.envoyes.clear();

      realtime.sendCallOffer('call-1', toUserId: 'u2', sdp: 'v=0...');

      final envoye = jsonDecode(canal.envoyes.single) as Map<String, dynamic>;
      expect(envoye['type'], equals('call_offer'));
      expect(envoye['to_user_id'], equals('u2'));
      expect(envoye['sdp'], equals('v=0...'));

      await realtime.dispose();
    });

    test('rejoint conversations, directs et appels après reconnexion', () async {
      final canal = FakeChannel();
      final realtime = _realtime(canal);
      await realtime.connect();
      realtime
        ..joinConversation('c1')
        ..joinStream('s1')
        ..joinCall('call-1');
      canal.envoyes.clear();

      realtime.debugSimulerReconnexion();

      final types = canal.envoyes
          .map((m) => (jsonDecode(m) as Map<String, dynamic>)['type'])
          .toSet();

      expect(types,
          equals({'conversation_join', 'stream_join', 'call_join'}));

      await realtime.dispose();
    });
  });
}
