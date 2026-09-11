import 'package:api_central_calls/src/group_call_room.dart';
import 'package:api_central_calls/src/livekit_group_call_room.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:livekit_client/livekit_client.dart' show DisconnectReason;

/// La room LiveKit elle-même demande un SFU et des appareils réels. Seule la
/// traduction des causes de déconnexion, qui décide si l'appel est terminé ou
/// perdu, se vérifie ici.
void main() {
  group('evenementDeDeconnexion', () {
    test('ignore la déconnexion demandée par le gestionnaire', () {
      expect(evenementDeDeconnexion(DisconnectReason.clientInitiated), isNull);
    });

    test('traduit une room fermée ou quittée côté serveur en fin d appel', () {
      for (final raison in [
        DisconnectReason.roomClosed,
        DisconnectReason.roomDeleted,
        DisconnectReason.participantRemoved,
        // Le même utilisateur a rejoint l'appel depuis un autre appareil : il
        // reste dans l'appel, cet appareil seul en sort.
        DisconnectReason.duplicateIdentity,
      ]) {
        expect(
          evenementDeDeconnexion(raison),
          equals(GroupCallRoomEvent.disconnected),
          reason: '$raison',
        );
      }
    });

    test('traduit toute autre cause en connexion perdue', () {
      for (final raison in [
        null,
        DisconnectReason.unknown,
        DisconnectReason.joinFailure,
        DisconnectReason.signalClose,
        DisconnectReason.reconnectAttemptsExceeded,
        DisconnectReason.serverShutdown,
        DisconnectReason.connectionTimeout,
        DisconnectReason.mediaFailure,
      ]) {
        expect(
          evenementDeDeconnexion(raison),
          equals(GroupCallRoomEvent.connectionLost),
          reason: '$raison',
        );
      }
    });
  });
}
