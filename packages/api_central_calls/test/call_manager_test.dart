import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

/// Ces tests couvrent ce qui est vérifiable sans appareil : la machine à états
/// et la libération des ressources. La négociation WebRTC elle-même demande
/// deux appareils, des permissions accordées et un serveur TURN joignable —
/// elle se valide à la main.
void main() {
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
}
