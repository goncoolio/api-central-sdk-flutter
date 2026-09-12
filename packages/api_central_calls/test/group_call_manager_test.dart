import 'dart:async';

import 'package:api_central_calls/api_central_calls.dart';
import 'package:api_central_calls/src/group_call_room.dart';
import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/fake_group_call_room.dart';
import 'support/fake_http.dart';
import 'support/fake_realtime_server.dart';

/// Réponse de `GET /calls/call-1/token`, telle que l'API la sérialise.
const _jeton = FakeReply(200, {
  'url': 'wss://sfu.example.test',
  'token': 'jeton-sfu',
  'room': 'call:call-1',
  'identity': 'u1',
});

/// Ces tests remplacent LiveKit par une room simulée : ils couvrent tout ce
/// que décide le gestionnaire (jeton, publication, API, états), pas la
/// connexion au SFU elle-même, qui demande des appareils réels.
void main() {
  late FakeGroupCallRoom room;

  GroupCallManager creerManager(ApiCentral sdk) {
    room = FakeGroupCallRoom();
    return GroupCallManager.withRoomFactory(
      sdk: sdk,
      userId: 'u1',
      roomFactory: () => room,
    );
  }

  /// Gestionnaire déjà connecté à l'appel vidéo `call-1`.
  Future<GroupCallManager> demarre(FakeHttp http) async {
    final manager = creerManager(sdkSimule(http));
    await manager.start('call-1', callType: CallType.video);
    return manager;
  }

  group('GroupCallManager.start', () {
    test('rejoint la room avec l URL et le jeton renvoyés par l API', () async {
      final http = FakeHttp({'GET /calls/call-1/token': _jeton});

      final manager = await demarre(http);

      expect(http.journal, equals(['GET /calls/call-1/token']));
      expect(
        room.url,
        equals('wss://sfu.example.test'),
        reason: "l'URL du SFU vient de l'API, jamais d'une constante",
      );
      expect(room.token, equals('jeton-sfu'));
      expect(room.journal, equals(['connect', 'micro:true', 'camera:true']));
      expect(manager.state, equals(CallManagerState.connected));
      expect(manager.callId, equals('call-1'));
    });

    test('ne publie pas la caméra pour un appel audio', () async {
      final manager = creerManager(
        sdkSimule(FakeHttp({'GET /calls/call-1/token': _jeton})),
      );

      await manager.start('call-1', callType: CallType.audio);

      expect(room.journal, equals(['connect', 'micro:true']));
    });

    test('émet connecting puis connected', () async {
      final manager = creerManager(
        sdkSimule(FakeHttp({'GET /calls/call-1/token': _jeton})),
      );
      final etats = <CallManagerState>[];
      manager.states.listen(etats.add);

      await manager.start('call-1', callType: CallType.audio);
      await Future<void>.delayed(Duration.zero);

      expect(
        etats,
        equals([CallManagerState.connecting, CallManagerState.connected]),
      );
    });

    test('un échec de connexion libère la room et passe en failed', () async {
      final manager = creerManager(
        sdkSimule(FakeHttp({'GET /calls/call-1/token': _jeton})),
      );
      room.erreurConnexion = Exception('SFU injoignable');

      await expectLater(
        manager.start('call-1', callType: CallType.audio),
        throwsException,
      );

      expect(manager.state, equals(CallManagerState.failed));
      expect(room.journal, equals(['connect', 'disconnect', 'dispose']));
    });

    test('un jeton refusé passe en failed sans toucher à la room', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': const FakeReply(403, {
          'message': 'Forbidden',
          'statusCode': 403,
        }),
      });
      final manager = creerManager(sdkSimule(http));

      await expectLater(
        manager.start('call-1', callType: CallType.audio),
        throwsA(isA<ForbiddenException>()),
      );

      expect(room.journal, isEmpty);
      expect(manager.state, equals(CallManagerState.failed));
      expect(manager.callId, isNull, reason: 'un nouvel essai reste possible');
    });

    test('refuse un second appel sans avoir quitté le premier', () async {
      final manager = await demarre(
        FakeHttp({'GET /calls/call-1/token': _jeton}),
      );

      await expectLater(
        manager.start('call-2', callType: CallType.audio),
        throwsStateError,
      );
      expect(manager.callId, equals('call-1'));
    });
  });

  group('GroupCallManager.accept', () {
    test('décroche après avoir rejoint la room et publié le média', () async {
      final appel = appelJson(
        'call-1',
        participantIds: ['u0', 'u1', 'u2'],
        callType: 'audio',
      );
      final http = FakeHttp({
        'GET /calls/call-1': FakeReply(200, appel),
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/answer': FakeReply(200, appel),
      });
      final manager = creerManager(sdkSimule(http));

      await manager.accept('call-1');

      expect(
        http.journal,
        equals([
          'GET /calls/call-1',
          'GET /calls/call-1/token',
          'POST /calls/call-1/answer',
        ]),
        reason: 'décrocher en dernier : sans média, l appel continue de sonner',
      );
      expect(
        http.requests.last.data,
        isNull,
        reason: "l'API prend l'acteur dans le jeton et ne lit aucun corps",
      );
      expect(
        room.journal,
        equals(['connect', 'micro:true']),
        reason: "l'appel est audio",
      );
      expect(manager.state, equals(CallManagerState.connected));
    });

    test('un décroché refusé par l API libère la room', () async {
      final appel = appelJson(
        'call-1',
        participantIds: ['u0', 'u1', 'u2'],
        callType: 'audio',
      );
      final http = FakeHttp({
        'GET /calls/call-1': FakeReply(200, appel),
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/answer': const FakeReply(404, {
          'message': 'Call not found',
          'statusCode': 404,
        }),
      });
      final manager = creerManager(sdkSimule(http));

      await expectLater(
        manager.accept('call-1'),
        throwsA(isA<NotFoundException>()),
      );

      expect(
        room.journal,
        equals(['connect', 'micro:true', 'disconnect', 'dispose']),
      );
      expect(manager.state, equals(CallManagerState.failed));
      expect(manager.callId, isNull);
    });
  });

  group('Participants distants', () {
    test('suit les changements signalés par la room', () async {
      final manager = await demarre(
        FakeHttp({'GET /calls/call-1/token': _jeton}),
      );
      final prochaine = manager.participantsChanges.first;

      room.participantsDistants = const [
        GroupCallParticipant(userId: 'u2', isMicrophoneEnabled: true),
      ];
      room.emettre(GroupCallRoomEvent.participantsChanged);

      expect(
        await prochaine,
        equals(const [
          GroupCallParticipant(userId: 'u2', isMicrophoneEnabled: true),
        ]),
      );
      expect(manager.participants.single.userId, equals('u2'));
    });
  });

  group('Micro et caméra', () {
    test('coupe le micro dans la room et le signale à l API', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': _jeton,
        'PUT /calls/call-1/participants/u1/mute': const FakeReply(200),
      });
      final manager = await demarre(http);

      await manager.setMicrophoneEnabled(false);

      expect(room.journal.last, equals('micro:false'));
      expect(
        http.journal.last,
        equals('PUT /calls/call-1/participants/u1/mute'),
      );
      expect(http.requests.last.data, equals({'muted': true}));
    });

    test('coupe la caméra dans la room et le signale à l API', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': _jeton,
        'PUT /calls/call-1/participants/u1/video': const FakeReply(200),
      });
      final manager = await demarre(http);

      await manager.setCameraEnabled(false);

      expect(room.journal.last, equals('camera:false'));
      expect(
        http.journal.last,
        equals('PUT /calls/call-1/participants/u1/video'),
      );
      expect(http.requests.last.data, equals({'enabled': false}));
    });

    test('switchCamera bascule la caméra de la room', () async {
      final manager = await demarre(
        FakeHttp({'GET /calls/call-1/token': _jeton}),
      );

      await manager.switchCamera();

      expect(room.journal.last, equals('switchCamera'));
    });
  });

  group('Fin d appel', () {
    test('leave quitte l appel côté API puis libère la room', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(200),
      });
      final manager = await demarre(http);

      await manager.leave();

      expect(
        http.journal.last,
        equals('POST /calls/call-1/leave'),
        reason: "quitter laisse l'appel continuer pour les autres",
      );
      expect(http.requests.last.data, isNull);
      expect(room.journal, containsAllInOrder(['disconnect', 'dispose']));
      expect(manager.state, equals(CallManagerState.ended));
      expect(manager.callId, isNull);
      expect(manager.participants, isEmpty);
    });

    test('leave pendant la connexion attend qu elle aboutisse', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(200),
      });
      final manager = creerManager(sdkSimule(http));
      final retenue = room.connexionRetenue = Completer<void>();

      final demarrage = manager.start('call-1', callType: CallType.audio);
      final depart = manager.leave();
      retenue.complete();

      await expectLater(demarrage, completes);
      await depart;
      expect(
        room.journal,
        equals(['connect', 'micro:true', 'disconnect', 'dispose']),
        reason: 'quitter une room à moitié ouverte la laisserait vivre',
      );
      expect(http.journal.last, equals('POST /calls/call-1/leave'));
      expect(manager.state, equals(CallManagerState.ended));
    });

    test('leave libère la room même si l API a déjà clos l appel', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(404, {
          'message': 'Call not found',
          'statusCode': 404,
        }),
      });
      final manager = await demarre(http);

      await expectLater(manager.leave(), completes);

      expect(room.journal.last, equals('dispose'));
      expect(manager.state, equals(CallManagerState.ended));
    });

    test('une room fermée par le serveur termine l appel sans l API', () async {
      final http = FakeHttp({'GET /calls/call-1/token': _jeton});
      final manager = await demarre(http);
      final fin = manager.states.firstWhere(
        (etat) => etat == CallManagerState.ended,
      );

      room.emettre(GroupCallRoomEvent.disconnected);
      await fin;

      expect(http.journal, equals(['GET /calls/call-1/token']));
      expect(room.journal.last, equals('dispose'));
      expect(manager.callId, isNull);
    });

    test('une reconnexion du SFU repasse par connecting', () async {
      final manager = await demarre(
        FakeHttp({'GET /calls/call-1/token': _jeton}),
      );
      final etats = <CallManagerState>[];
      manager.states.listen(etats.add);

      room
        ..emettre(GroupCallRoomEvent.reconnecting)
        ..emettre(GroupCallRoomEvent.reconnected);
      await Future<void>.delayed(Duration.zero);

      expect(
        etats,
        equals([CallManagerState.connecting, CallManagerState.connected]),
      );
    });

    test(
      'une connexion perdue passe en failed, puis leave prévient l API',
      () async {
        final http = FakeHttp({
          'GET /calls/call-1/token': _jeton,
          'POST /calls/call-1/leave': const FakeReply(200),
        });
        final manager = await demarre(http);
        final echec = manager.states.firstWhere(
          (etat) => etat == CallManagerState.failed,
        );

        room.emettre(GroupCallRoomEvent.connectionLost);
        await echec;
        expect(room.journal.last, equals('dispose'));

        await manager.leave();

        expect(
          http.journal.last,
          equals('POST /calls/call-1/leave'),
          reason: "l'API croit encore l'utilisateur dans l'appel",
        );
        expect(manager.state, equals(CallManagerState.ended));
      },
    );

    test('call_ended du serveur libère la room sans rappeler l API', () async {
      final serveur = await FakeRealtimeServer.demarrer();
      addTearDown(serveur.arreter);
      final http = FakeHttp({'GET /calls/call-1/token': _jeton});
      final sdk = sdkSimule(http);
      await sdk.connectRealtime(wsUrl: serveur.url);
      addTearDown(sdk.disconnectRealtime);
      await serveur.connecte;
      final manager = creerManager(sdk);
      await manager.start('call-1', callType: CallType.audio);
      final fin = manager.states.firstWhere(
        (etat) => etat == CallManagerState.ended,
      );

      // L'API l'envoie avec la raison room_closed quand LiveKit signale
      // room_finished, et ended_by_user quand un participant termine l'appel
      // pour tous. Elle ne ferme jamais la room LiveKit elle-même.
      serveur.envoyer({
        'type': 'call_ended',
        'call_id': 'call-1',
        'reason': 'room_closed',
        'duration_seconds': 42,
      });
      await fin.timeout(const Duration(seconds: 5));

      expect(room.journal, containsAllInOrder(['disconnect', 'dispose']));
      expect(http.journal, isNot(contains('POST /calls/call-1/leave')));
      expect(manager.callId, isNull);
    });

    test('dispose quitte l appel et ferme les flux', () async {
      final http = FakeHttp({
        'GET /calls/call-1/token': _jeton,
        'POST /calls/call-1/leave': const FakeReply(200),
      });
      final manager = await demarre(http);

      await manager.dispose();

      expect(http.journal.last, equals('POST /calls/call-1/leave'));
      await expectLater(manager.states.isEmpty, completion(isTrue));
      await expectLater(
        manager.participantsChanges.isEmpty,
        completion(isTrue),
      );
    });
  });
}
