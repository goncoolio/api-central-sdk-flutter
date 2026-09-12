import 'dart:convert';

import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'support/fake_http.dart';
import 'support/fake_peer_connection.dart';
import 'support/fake_realtime_server.dart';

/// La signalisation d'un appel à deux passe par le WebSocket : les routes REST
/// `offer`, `answer-sdp` et `ice-candidate` de l'API stockent le signal et le
/// publient sur un canal Redis sans abonné, sans jamais le relayer au pair.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeRealtimeServer serveur;
  late FakeHttp http;
  late FakePeerConnection pc;

  Future<CallManager> monter({
    List<String> participants = const ['u1', 'u2'],
    bool tempsReel = true,
    Future<MediaStream> Function(Map<String, dynamic>)? media,
  }) async {
    http = FakeHttp({
      'GET /calls/call-1': FakeReply(
        200,
        appelJson('call-1', participantIds: participants),
      ),
      'GET /calls/call-1/ice-servers': const FakeReply(200, {
        'ice_servers': <dynamic>[],
        'call_id': 'call-1',
        'ttl': 86400,
      }),
      'POST /calls/call-1/answer': FakeReply(
        200,
        appelJson('call-1', participantIds: participants),
      ),
      'POST /calls/call-1/end': FakeReply(
        200,
        appelJson('call-1', participantIds: participants),
      ),
    });
    final sdk = sdkSimule(http);
    if (tempsReel) {
      serveur = await FakeRealtimeServer.demarrer();
      addTearDown(serveur.arreter);
      await sdk.connectRealtime(wsUrl: serveur.url);
      addTearDown(sdk.disconnectRealtime);
      await serveur.connecte;
    }
    pc = FakePeerConnection();
    final manager = CallManager.withFactories(
      sdk: sdk,
      userId: 'u1',
      peerConnectionFactory: (_) async => pc,
      localMediaFactory: media ?? (_) async => FakeMediaStream(),
    );
    addTearDown(manager.dispose);
    return manager;
  }

  group('Signalisation par WebSocket', () {
    test(
      'start envoie l offre au pair, sans requête REST de signalisation',
      () async {
        final manager = await monter();

        await manager.start('call-1', callType: CallType.audio);
        final offre = await serveur.attendre('call_offer');

        expect(offre['call_id'], equals('call-1'));
        expect(offre['to_user_id'], equals('u2'));
        expect(offre['sdp'], equals('sdp-offre'));
        expect(pc.descriptionLocale?.type, equals('offer'));
        expect(
          http.journal.where((ligne) => ligne.contains('offer')),
          isEmpty,
          reason: "l'API ne relaie pas les signaux envoyés en REST",
        );
      },
    );

    test('une offre reçue déclenche une réponse par le WebSocket', () async {
      final manager = await monter();
      await manager.accept('call-1');

      serveur.envoyer({
        'type': 'call_offer_received',
        'call_id': 'call-1',
        'from_user_id': 'u2',
        'sdp': 'sdp-distant',
      });
      final reponse = await serveur.attendre('call_answer');

      expect(reponse['to_user_id'], equals('u2'));
      expect(reponse['sdp'], equals('sdp-reponse'));
      expect(pc.descriptionDistante?.sdp, equals('sdp-distant'));
      expect(pc.descriptionDistante?.type, equals('offer'));
      expect(
        http.journal.where((ligne) => ligne.contains('answer-sdp')),
        isEmpty,
      );
    });

    test('un candidat local part en JSON, avec son mid et son index', () async {
      final manager = await monter();
      await manager.start('call-1', callType: CallType.audio);
      await serveur.attendre('call_offer');

      pc.onIceCandidate!(
        RTCIceCandidate('candidate:1 1 UDP 2 1.2.3.4 5 typ host', 'audio', 0),
      );
      final message = await serveur.attendre('call_ice_candidate');

      expect(message['to_user_id'], equals('u2'));
      expect(
        jsonDecode(message['candidate'] as String),
        equals({
          'candidate': 'candidate:1 1 UDP 2 1.2.3.4 5 typ host',
          'sdpMid': 'audio',
          'sdpMLineIndex': 0,
        }),
      );
    });

    test('un candidat reçu garde son mid et son index', () async {
      final manager = await monter();
      await manager.accept('call-1');

      serveur.envoyer({
        'type': 'call_ice_candidate_received',
        'call_id': 'call-1',
        'from_user_id': 'u2',
        'candidate': jsonEncode({
          'candidate': 'candidate:2 1 UDP 2 5.6.7.8 9 typ srflx',
          'sdpMid': 'video',
          'sdpMLineIndex': 1,
        }),
      });
      await _attendreQue(() => pc.candidatsAjoutes.isNotEmpty);

      final candidat = pc.candidatsAjoutes.single;
      expect(candidat.candidate, contains('typ srflx'));
      expect(candidat.sdpMid, equals('video'));
      expect(candidat.sdpMLineIndex, equals(1));
    });
  });

  group('Échecs au démarrage', () {
    test('sans temps réel, start échoue avant le média', () async {
      final manager = await monter(tempsReel: false);

      await expectLater(
        manager.start('call-1', callType: CallType.audio),
        throwsA(
          isA<StateError>().having(
            (e) => e.message,
            'message',
            contains('connectRealtime'),
          ),
        ),
      );
      expect(manager.state, equals(CallManagerState.failed));
      expect(
        http.journal,
        equals(['GET /calls/call-1']),
        reason: 'ni serveurs ICE, ni média',
      );
    });

    test('un média refusé passe en failed et ferme la connexion', () async {
      final manager = await monter(
        media: (_) async => throw StateError('permission micro refusée'),
      );

      await expectLater(
        manager.start('call-1', callType: CallType.audio),
        throwsA(isA<StateError>()),
      );
      expect(manager.state, equals(CallManagerState.failed));
      expect(pc.fermee, isTrue);
      expect(manager.localStream, isNull);
    });
  });
}

/// Attend qu'une condition devienne vraie, le temps que l'événement traverse
/// le WebSocket puis le SDK.
Future<void> _attendreQue(
  bool Function() condition, {
  Duration limite = const Duration(seconds: 5),
}) async {
  final fin = DateTime.now().add(limite);
  while (!condition()) {
    if (DateTime.now().isAfter(fin)) fail('condition non satisfaite à temps');
    await Future<void>.delayed(const Duration(milliseconds: 10));
  }
}
