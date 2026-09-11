import 'dart:async';

import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_group_call_room.dart';
import 'support/fake_http.dart';

/// Réponse de `GET /calls/call-1/token`, telle que l'API la sérialise.
const _jeton = FakeReply(200, {
  'url': 'wss://sfu.example.test',
  'token': 'jeton-sfu',
  'room': 'call:call-1',
  'identity': 'u1',
});

/// Réponse de `GET /calls/call-1/ice-servers`.
const _serveursIce = FakeReply(200, {
  'ice_servers': <dynamic>[],
  'call_id': 'call-1',
  'ttl': 86400,
});

/// Appel de groupe (trois participants) tel que `GET /calls/call-1` le
/// renvoie.
FakeReply _appelDeGroupe({String callType = 'video'}) => FakeReply(
  200,
  appelJson('call-1', participantIds: ['u0', 'u1', 'u2'], callType: callType),
);

/// Appel à deux tel que `GET /calls/call-1` le renvoie.
FakeReply _appelADeux() =>
    FakeReply(200, appelJson('call-1', participantIds: ['u0', 'u1']));

/// Le chemin LiveKit passe par une room simulée. Le chemin P2P garde le vrai
/// CallManager : faute de plugin natif, il échoue à la création de la
/// RTCPeerConnection, et ces tests vérifient seulement qu'il a été choisi.
void main() {
  // flutter_webrtc passe par les canaux de plateforme : sans binding, son
  // erreur tomberait hors du test.
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeGroupCallRoom room;
  late int roomsCreees;

  CallSession creerSession(FakeHttp http) {
    room = FakeGroupCallRoom();
    roomsCreees = 0;
    return CallSession.withRoomFactory(
      sdk: sdkSimule(http),
      userId: 'u1',
      roomFactory: () {
        roomsCreees++;
        return room;
      },
    );
  }

  group('CallSession, appel de groupe', () {
    test('start passe par LiveKit dès trois participants', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelDeGroupe(),
        'GET /calls/call-1/token': _jeton,
      });
      final session = creerSession(http);

      final mode = await session.start('call-1', callType: CallType.video);

      expect(mode, equals(CallMode.group));
      expect(session.mode, equals(CallMode.group));
      expect(
        http.journal,
        equals(['GET /calls/call-1', 'GET /calls/call-1/token']),
        reason: "l'appel n'est chargé qu'une fois",
      );
      expect(room.journal, equals(['connect', 'micro:true', 'camera:true']));
      expect(session.state, equals(CallManagerState.connected));
      expect(session.callId, equals('call-1'));
    });

    test('accept décroche un appel de groupe par LiveKit', () async {
      final appel = _appelDeGroupe(callType: 'audio');
      final http = FakeHttp({
        'GET /calls/call-1': appel,
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/answer': appel,
      });
      final session = creerSession(http);

      expect(await session.accept('call-1'), equals(CallMode.group));

      expect(
        http.journal,
        equals([
          'GET /calls/call-1',
          'GET /calls/call-1/token',
          'POST /calls/call-1/answer',
        ]),
        reason: "l'appel n'est chargé qu'une fois",
      );
      expect(room.journal, equals(['connect', 'micro:true']));
    });

    test('relaie connecting puis connected', () async {
      final session = creerSession(
        FakeHttp({
          'GET /calls/call-1': _appelDeGroupe(),
          'GET /calls/call-1/token': _jeton,
        }),
      );
      final etats = <CallManagerState>[];
      session.states.listen(etats.add);

      await session.start('call-1', callType: CallType.audio);
      await Future<void>.delayed(Duration.zero);

      expect(
        etats,
        equals([CallManagerState.connecting, CallManagerState.connected]),
      );
    });

    test('délègue micro et caméra au gestionnaire de groupe', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelDeGroupe(),
        'GET /calls/call-1/token': _jeton,
        'PUT /calls/call-1/participants/u1/mute': const FakeReply(200),
        'PUT /calls/call-1/participants/u1/video': const FakeReply(200),
      });
      final session = creerSession(http);
      await session.start('call-1', callType: CallType.video);

      await session.setMicrophoneEnabled(false);
      await session.setCameraEnabled(false);
      await session.switchCamera();

      expect(
        room.journal,
        containsAllInOrder(['micro:false', 'camera:false', 'switchCamera']),
      );
      expect(
        http.journal,
        containsAllInOrder([
          'PUT /calls/call-1/participants/u1/mute',
          'PUT /calls/call-1/participants/u1/video',
        ]),
      );
    });

    test('hangUp quitte l appel sans le terminer pour les autres', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelDeGroupe(),
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(200),
      });
      final session = creerSession(http);
      await session.start('call-1', callType: CallType.audio);

      await session.hangUp();

      expect(http.journal.last, equals('POST /calls/call-1/leave'));
      expect(http.journal, isNot(contains('POST /calls/call-1/end')));
      expect(room.journal.last, equals('dispose'));
      expect(session.state, equals(CallManagerState.ended));
      expect(session.callId, isNull);
    });

    test('hangUp pendant la connexion attend qu elle aboutisse', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelDeGroupe(),
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(200),
      });
      final session = creerSession(http);
      final retenue = room.connexionRetenue = Completer<void>();

      final demarrage = session.start('call-1', callType: CallType.audio);
      final raccrochage = session.hangUp();
      retenue.complete();

      await expectLater(demarrage, completion(equals(CallMode.group)));
      await raccrochage;
      expect(http.journal.last, equals('POST /calls/call-1/leave'));
      expect(room.journal.last, equals('dispose'));
      expect(session.state, equals(CallManagerState.ended));
    });
  });

  group('CallSession, appel à deux', () {
    test('start garde le P2P, sans LiveKit', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelADeux(),
        'GET /calls/call-1/ice-servers': _serveursIce,
      });
      final session = creerSession(http);

      await expectLater(
        session.start('call-1', callType: CallType.audio),
        throwsA(isNot(isA<UnsupportedError>())),
      );

      expect(session.mode, equals(CallMode.p2p));
      expect(
        http.journal,
        equals(['GET /calls/call-1', 'GET /calls/call-1/ice-servers']),
        reason: "l'appel n'est chargé qu'une fois, puis CallManager enchaîne",
      );
      expect(roomsCreees, equals(0));
    });

    test('accept garde le P2P, sans LiveKit', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelADeux(),
        'GET /calls/call-1/ice-servers': _serveursIce,
      });
      final session = creerSession(http);

      await expectLater(
        session.accept('call-1'),
        throwsA(isNot(isA<UnsupportedError>())),
      );

      expect(session.mode, equals(CallMode.p2p));
      expect(
        http.journal,
        equals(['GET /calls/call-1', 'GET /calls/call-1/ice-servers']),
      );
      expect(roomsCreees, equals(0));
    });
  });

  group('CallSession, cycle de vie', () {
    test('ne choisit aucun mode avant le premier appel', () {
      final session = creerSession(FakeHttp(const {}));

      expect(session.mode, isNull);
      expect(session.state, equals(CallManagerState.idle));
      expect(session.callId, isNull);
      expect(session.localStream, isNull);
    });

    test('un appel introuvable passe en failed sans choisir de mode', () async {
      final session = creerSession(FakeHttp(const {}));

      await expectLater(
        session.start('call-1', callType: CallType.audio),
        throwsA(isA<NotFoundException>()),
      );

      expect(session.mode, isNull);
      expect(session.state, equals(CallManagerState.failed));
      expect(session.callId, isNull);
    });

    test('refuse un second appel sans avoir raccroché le premier', () async {
      final session = creerSession(
        FakeHttp({
          'GET /calls/call-1': _appelDeGroupe(),
          'GET /calls/call-1/token': _jeton,
        }),
      );
      await session.start('call-1', callType: CallType.audio);

      await expectLater(
        session.start('call-2', callType: CallType.audio),
        throwsStateError,
      );
      expect(session.callId, equals('call-1'));
    });

    test('dispose raccroche et ferme les flux', () async {
      final http = FakeHttp({
        'GET /calls/call-1': _appelDeGroupe(),
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(200),
      });
      final session = creerSession(http);
      await session.start('call-1', callType: CallType.audio);

      await session.dispose();

      expect(http.journal.last, equals('POST /calls/call-1/leave'));
      await expectLater(session.states.isEmpty, completion(isTrue));
    });
  });
}
