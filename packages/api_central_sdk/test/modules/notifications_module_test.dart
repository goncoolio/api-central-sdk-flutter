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

void main() {
  group('NotificationsModule', () {
    test('envoie une notification sur /notifications/send', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'n1',
          'type': 'message',
          'title': 'Titre',
          'body': 'Corps',
          'isRead': false,
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      final notification = await _sdk(adapter).notifications.send(
            userId: 'u1',
            notificationType: 'message',
            title: 'Titre',
            body: 'Corps',
          );

      expect(adapter.requests.single.path, equals('/notifications/send'));
      expect(notification.type, equals('message'),
          reason: "l'API sérialise la catégorie sous la clé type");
      expect(notification.isRead, isFalse);
    });

    test('convertit sentCount depuis sent_count', () async {
      final adapter = FakeAdapter(
        (options, callIndex) =>
            const FakeReply(200, {'success': true, 'sent_count': 3}),
      );

      final result = await _sdk(adapter).notifications.sendBulk(
        userIds: ['u1', 'u2', 'u3'],
        notificationType: 'system',
        title: 'Titre',
        body: 'Corps',
      );

      expect(adapter.requests.single.path, equals('/notifications/send-bulk'));
      expect(result.sentCount, equals(3));
    });

    test('liste les notifications avec user_id en query', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'data': <dynamic>[],
          'pagination': {'page': 1, 'limit': 20, 'total': 0, 'totalPages': 0},
        }),
      );

      await _sdk(adapter).notifications.list('u1', unreadOnly: true);

      expect(adapter.requests.single.path, equals('/notifications'));
      expect(adapter.requests.single.queryParameters,
          equals({'user_id': 'u1', 'unread_only': true}));
    });

    test('marque comme lu sans transmettre userId', () async {
      final adapter = FakeAdapter(
        (options, callIndex) =>
            const FakeReply(200, {'success': true, 'updated_count': 2}),
      );

      final result = await _sdk(adapter)
          .notifications
          .markAsRead(notificationIds: ['n1', 'n2']);

      expect(adapter.requests.single.path, equals('/notifications/mark-read'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye.keys.toSet(), equals({'notification_ids'}),
          reason: "l'API n'accepte que notification_ids sur cette route");
      expect(result.updatedCount, equals(2));
    });

    test('marque tout comme lu avec user_id en query et corps vide', () async {
      final adapter = FakeAdapter(
        (options, callIndex) =>
            const FakeReply(200, {'success': true, 'updated_count': 7}),
      );

      await _sdk(adapter).notifications.markAllAsRead('u1');

      expect(
          adapter.requests.single.path, equals('/notifications/mark-all-read'));
      expect(adapter.requests.single.queryParameters, equals({'user_id': 'u1'}));
      expect(adapter.requests.single.data, isNull);
    });

    test('envoie depuis un modèle serveur', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'n1',
          'type': 'message',
          'title': 'Message de Alice',
          'body': 'Alice : Coucou',
          'isRead': false,
          'createdAt': '2026-08-02T10:00:00Z',
        }),
      );

      final notification = await _sdk(adapter).notifications.sendTemplate(
        userId: 'u1',
        templateSlug: 'new_message',
        variables: {'sender': 'Alice', 'preview': 'Coucou'},
      );

      expect(
          adapter.requests.single.path, equals('/notifications/send-template'));
      expect(notification.title, equals('Message de Alice'));
    });
  });
}
