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

const _stream = {
  'id': 's1',
  'host': {'id': 'u1', 'externalUserId': 'ext-1'},
  'title': 'Mon direct',
  'status': 'live',
  'viewerCount': 12,
  'peakViewerCount': 30,
  'totalReactions': 5,
  'totalComments': 3,
};

void main() {
  group('LiveModule', () {
    test('crée un stream', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _stream));

      final stream = await _sdk(adapter).live.createStream(
            hostId: 'u1',
            title: 'Mon direct',
          );

      expect(stream.status, equals(StreamStatus.live));
      expect(adapter.requests.single.path, equals('/live/streams'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['host_id'], equals('u1'));
    });

    test('accepte un stream sans clé de diffusion', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _stream));

      final stream = await _sdk(adapter).live.getStream('s1');

      expect(stream.streamKey, isNull,
          reason: "l'API masque la clé aux spectateurs");
      expect(stream.viewerCount, equals(12));
    });

    test('reconnaît le statut archived', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 's1',
          'host': {'id': 'u1', 'externalUserId': 'ext-1'},
          'title': 'Ancien direct',
          'status': 'archived',
        }),
      );

      final stream = await _sdk(adapter).live.getStream('s1');

      expect(stream.status, equals(StreamStatus.archived));
    });

    test('resumeStream passe par la route start', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _stream));

      await _sdk(adapter).live.resumeStream('s1');

      expect(adapter.requests.single.path, equals('/live/streams/s1/start'),
          reason: "l'API n'a pas de route resume : start accepte un stream en pause");
    });

    test('rejoint un stream', () async {
      final adapter = FakeAdapter(
        (options, callIndex) =>
            const FakeReply(200, {'streamId': 's1', 'viewerCount': 13}),
      );

      final resultat = await _sdk(adapter).live.joinStream('s1', userId: 'u2');

      expect(resultat.viewerCount, equals(13));
      expect(adapter.requests.single.path, equals('/live/streams/s1/join'));
    });

    test('expose le rejet d une réaction limitée en débit', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'accepted': false,
          'message': 'Rate limited, try again later',
        }),
      );

      final resultat =
          await _sdk(adapter).live.sendReaction('s1', userId: 'u2', emoji: '❤️');

      expect(resultat.accepted, isFalse,
          reason: 'une réaction par utilisateur toutes les 200 ms');
    });

    test('lit les compteurs de réactions', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, [
          {'emoji': '❤️', 'count': 150},
        ]),
      );

      final compteurs = await _sdk(adapter).live.getReactionCounts('s1');

      expect(compteurs.single.count, equals(150));
      expect(adapter.requests.single.path, equals('/live/streams/s1/reactions'));
    });

    test('épingle un commentaire', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).live.pinComment('s1', 'cm1');

      expect(adapter.requests.single.path,
          equals('/live/streams/s1/comments/cm1/pin'));
    });

    test('lit les statistiques avec leurs réactions', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'streamId': 's1',
          'viewerCount': 10,
          'peakViewerCount': 25,
          'totalComments': 7,
          'totalReactions': 40,
          'reactionsByEmoji': [
            {'emoji': '🔥', 'count': 40},
          ],
          'durationSeconds': 3600,
        }),
      );

      final stats = await _sdk(adapter).live.getStats('s1');

      expect(stats.reactionsByEmoji.single.emoji, equals('🔥'));
      expect(stats.durationSeconds, equals(3600));
    });
  });
}
