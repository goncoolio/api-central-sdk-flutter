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

const _call = {
  'id': 'call-1',
  'initiator': {'id': 'u1', 'externalUserId': 'ext-1'},
  'callType': 'video',
  'status': 'ringing',
  'participants': <dynamic>[],
  'participantCount': 2,
  'encryptionEnabled': false,
};

void main() {
  group('CallsModule', () {
    test('initie un appel', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _call));

      final call = await _sdk(adapter).calls.initiate(
        participantIds: ['u2'],
        callType: CallType.video,
      );

      expect(call.callType, equals(CallType.video));
      expect(call.status, equals(CallStatus.ringing));
      expect(adapter.requests.single.path, equals('/calls'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['call_type'], equals('video'));
      expect(envoye['participant_ids'], equals(['u2']));
    });

    test('sérialise screenShare en screen_share', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _call));

      await _sdk(adapter).calls.initiate(
        participantIds: ['u2'],
        callType: CallType.screenShare,
      );

      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['call_type'], equals('screen_share'));
    });

    test('lit un statut on_hold', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'call-1',
          'initiator': {'id': 'u1', 'externalUserId': 'ext-1'},
          'callType': 'audio',
          'status': 'on_hold',
          'participants': <dynamic>[],
          'participantCount': 2,
          'encryptionEnabled': false,
        }),
      );

      final call = await _sdk(adapter).calls.get('call-1');

      expect(call.status, equals(CallStatus.onHold));
    });

    test('normalise urls quand le serveur renvoie une chaîne', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'iceServers': [
            {
              'urls': 'turn:turn.example.com:3478',
              'username': 'u',
              'credential': 'c',
            },
            {
              'urls': ['stun:stun.l.google.com:19302'],
            },
          ],
          'callId': 'call-1',
          'ttl': 86400,
        }),
      );

      final reponse = await _sdk(adapter).calls.getIceServers('call-1');

      expect(reponse.iceServers.first.urls,
          equals(['turn:turn.example.com:3478']),
          reason: 'une chaîne seule devient une liste à un élément');
      expect(reponse.iceServers.last.urls,
          equals(['stun:stun.l.google.com:19302']));
      expect(reponse.ttl, equals(86400));
    });

    test('lit l historique sans paramètre utilisateur', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'calls': <dynamic>[],
          'total': 0,
          'hasMore': false,
        }),
      );

      final historique =
          await _sdk(adapter).calls.listHistory(page: 1, limit: 20);

      expect(historique.hasMore, isFalse);
      expect(adapter.requests.single.queryParameters,
          equals({'page': 1, 'limit': 20}),
          reason: "l'utilisateur vient du token");
    });

    test('envoie une offre SDP', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).calls.sendOffer(
            'call-1',
            toUserId: 'u2',
            sdp: 'v=0...',
          );

      expect(adapter.requests.single.path, equals('/calls/call-1/offer'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['to_user_id'], equals('u2'));
      expect(envoye['sdp_type'], equals('offer'));
    });

    test('coupe le micro d un participant', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).calls.setMuted('call-1', 'u2', muted: true);

      expect(adapter.requests.single.path,
          equals('/calls/call-1/participants/u2/mute'));
      expect(adapter.requests.single.method, equals('PUT'));
    });
  });
}
