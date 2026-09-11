import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

/// Appel dont les participants, initiateur en tête, ont ces statuts.
Call _appel(List<ParticipantCallStatus> statuts) => Call(
  id: 'call-1',
  initiator: const UserInfo(id: 'u0', externalUserId: 'ext-0'),
  callType: CallType.video,
  status: CallStatus.ringing,
  participants: [
    for (final (rang, statut) in statuts.indexed)
      CallParticipant(
        id: 'participant-$rang',
        user: UserInfo(id: 'u$rang', externalUserId: 'ext-$rang'),
        status: statut,
      ),
  ],
);

void main() {
  group('CallMode.forCall', () {
    test('garde le P2P pour un appel à deux', () {
      final appel = _appel([
        ParticipantCallStatus.joined,
        ParticipantCallStatus.invited,
      ]);

      expect(CallMode.forCall(appel), equals(CallMode.p2p));
    });

    test('passe par LiveKit dès trois participants, initiateur compris', () {
      final appel = _appel([
        ParticipantCallStatus.joined,
        ParticipantCallStatus.invited,
        ParticipantCallStatus.invited,
      ]);

      expect(CallMode.forCall(appel), equals(CallMode.group));
      expect(CallMode.minGroupParticipants, equals(3));
    });

    test('compte aussi les invités qui ont refusé', () {
      // L'appelant a choisi LiveKit à trois. Un appelé qui décroche après le
      // refus d'un autre invité doit aboutir au même mode : sinon ils ne se
      // retrouvent jamais.
      final appel = _appel([
        ParticipantCallStatus.joined,
        ParticipantCallStatus.declined,
        ParticipantCallStatus.invited,
      ]);

      expect(CallMode.forCall(appel), equals(CallMode.group));
    });

    test('garde le P2P pour un appel sans participant connu', () {
      expect(CallMode.forCall(_appel(const [])), equals(CallMode.p2p));
    });
  });
}
