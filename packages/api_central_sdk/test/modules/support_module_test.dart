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

const _ticket = {
  'id': 't1',
  'ticketNumber': 'TKT-001',
  'user': {'id': 'u1', 'externalUserId': 'ext-1'},
  'subject': 'Problème',
  'status': 'open',
  'priority': 'medium',
};

void main() {
  group('SupportModule', () {
    test('crée un ticket', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _ticket));

      final ticket = await _sdk(adapter).support.createTicket(
            userId: 'u1',
            subject: 'Problème',
            description: 'Détails',
            priority: TicketPriority.medium,
          );

      expect(ticket.ticketNumber, equals('TKT-001'));
      expect(adapter.requests.single.path, equals('/support/tickets'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['user_id'], equals('u1'));
      expect(envoye['priority'], equals('medium'));
    });

    test('filtre la liste des tickets', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'data': [_ticket],
          'pagination': {'page': 1, 'limit': 20, 'total': 1, 'totalPages': 1},
        }),
      );

      final page = await _sdk(adapter)
          .support
          .listTickets(userId: 'u1', status: TicketStatus.open);

      expect(page.data.single.id, equals('t1'));
      expect(adapter.requests.single.queryParameters,
          equals({'user_id': 'u1', 'status': 'open'}));
    });

    test('traduit inProgress en in_progress', () async {
      final adapter =
          FakeAdapter((options, callIndex) => const FakeReply(200, _ticket));

      await _sdk(adapter)
          .support
          .updateStatus('t1', status: TicketStatus.inProgress);

      expect(adapter.requests.single.path, equals('/support/tickets/t1/status'));
      expect(adapter.requests.single.method, equals('PUT'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['status'], equals('in_progress'),
          reason: 'le seul statut dont le nom Dart diffère de la valeur API');
    });

    test('liste les catégories', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, [
          {'id': 'c1', 'name': 'Technique', 'slug': 'technique'},
        ]),
      );

      final categories = await _sdk(adapter).support.listCategories();

      expect(categories.single.slug, equals('technique'));
      expect(adapter.requests.single.path, equals('/support/categories'));
    });

    test('note un article', () async {
      final adapter = FakeAdapter(
          (options, callIndex) => const FakeReply(200, {'success': true}));

      await _sdk(adapter).support.rateArticle('a1', helpful: true);

      expect(adapter.requests.single.path, equals('/support/articles/a1/rate'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye['helpful'], isTrue);
    });

    test('ajoute une réponse à un ticket', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'r1',
          'ticketId': 't1',
          'senderId': 'u1',
          'senderType': 'user',
          'content': 'Merci',
        }),
      );

      final reply = await _sdk(adapter).support.addReply(
            't1',
            senderId: 'u1',
            content: 'Merci',
          );

      expect(reply.senderType, equals(SenderType.user),
          reason: 'senderType est renvoyé par l API, jamais envoyé');
      expect(
          adapter.requests.single.path, equals('/support/tickets/t1/replies'));
      final envoye =
          (adapter.requests.single.data! as Map).cast<String, dynamic>();
      expect(envoye.keys.toSet(), equals({'sender_id', 'content'}),
          reason: "l'API n'accepte que ces deux champs");
    });
  });
}
