import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_http.dart';

/// Ces tests couvrent ce qui est vérifiable sans appareil : la machine à états
/// et la libération des ressources. La signalisation elle-même est couverte
/// par `call_signaling_test.dart`, qui injecte des doublures natives. La négociation WebRTC elle-même demande
/// deux appareils, des permissions accordées et un serveur TURN joignable —
/// elle se valide à la main.
void main() {
  // flutter_webrtc passe par les canaux de plateforme dès la création d'une
  // RTCPeerConnection : sans binding, l'erreur tomberait hors du test.
  TestWidgetsFlutterBinding.ensureInitialized();

  ApiCentral creerSdk() => ApiCentral(
    config: const ApiCentralConfig(
      baseUrl: 'https://api.test/s2s/v1',
      applicationId: 'app-42',
    ),
    tokenProvider: () async => 'jwt-1',
  );

  group('CallManager', () {
    test('démarre à l état idle, sans média ni appel', () {
      final manager = CallManager(sdk: creerSdk(), userId: 'u1');

      expect(manager.state, equals(CallManagerState.idle));
      expect(manager.localStream, isNull);
      expect(manager.callId, isNull);
    });

    test('hangUp sans appel en cours ne lève pas', () async {
      final manager = CallManager(sdk: creerSdk(), userId: 'u1');

      await expectLater(manager.hangUp(), completes);
      expect(manager.state, equals(CallManagerState.ended));
    });

    test('émet les changements d état', () async {
      final manager = CallManager(sdk: creerSdk(), userId: 'u1');
      final etats = <CallManagerState>[];
      final abonnement = manager.states.listen(etats.add);

      await manager.hangUp();
      await Future<void>.delayed(Duration.zero);

      expect(etats, contains(CallManagerState.ended));
      await abonnement.cancel();
    });

    test('setMicrophoneEnabled hors appel ne lève pas', () async {
      final manager = CallManager(sdk: creerSdk(), userId: 'u1');

      await expectLater(manager.setMicrophoneEnabled(false), completes);
    });

    test('switchCamera sans piste vidéo ne lève pas', () async {
      final manager = CallManager(sdk: creerSdk(), userId: 'u1');

      await expectLater(manager.switchCamera(), completes);
    });

    test('dispose ferme les flux', () async {
      final manager = CallManager(sdk: creerSdk(), userId: 'u1');
      await manager.dispose();

      await expectLater(manager.states.isEmpty, completion(isTrue));
      await expectLater(manager.remoteStreams.isEmpty, completion(isTrue));
    });
  });

  group('CallManager et les appels de groupe', () {
    test('refuse un appel à trois avant tout accès au média', () async {
      final http = FakeHttp({
        'GET /calls/call-1': FakeReply(
          200,
          appelJson('call-1', participantIds: ['u1', 'u2', 'u3']),
        ),
      });
      final manager = CallManager(sdk: sdkSimule(http), userId: 'u1');

      await expectLater(
        manager.start('call-1', callType: CallType.video),
        throwsA(
          isA<UnsupportedError>().having(
            (e) => e.message,
            'message',
            contains('GroupCallManager'),
          ),
        ),
      );
      expect(
        http.journal,
        equals(['GET /calls/call-1']),
        reason: 'ni serveurs ICE, ni média, ni offre SDP',
      );
      expect(manager.state, equals(CallManagerState.failed));
      expect(manager.callId, isNull);
    });

    test('accept refuse aussi un appel de groupe, sans décrocher', () async {
      final http = FakeHttp({
        'GET /calls/call-1': FakeReply(
          200,
          appelJson('call-1', participantIds: ['u0', 'u1', 'u2']),
        ),
      });
      final manager = CallManager(sdk: sdkSimule(http), userId: 'u1');

      await expectLater(
        manager.accept('call-1'),
        throwsA(isA<UnsupportedError>()),
      );
      expect(
        http.journal,
        equals(['GET /calls/call-1']),
        reason: 'pas de POST answer',
      );
    });
  });
}
