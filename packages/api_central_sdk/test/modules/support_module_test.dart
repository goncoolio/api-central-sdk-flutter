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

    test('createCategory transmet le slug exigé par l API', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'cat-1',
          'name': 'Facturation',
          'slug': 'facturation',
        }),
      );

      await _sdk(
        adapter,
      ).support.createCategory(name: 'Facturation', slug: 'facturation');

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(
        envoye['slug'],
        equals('facturation'),
        reason: "l'API exige le slug et refuse la requête sans lui (422)",
      );
    });

    test('updateCategory transmet nom et slug', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'cat-2',
          'name': 'Paiements',
          'slug': 'paiements',
        }),
      );

      await _sdk(adapter).support.updateCategory(
        'cat-1',
        name: 'Paiements',
        slug: 'paiements',
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(envoye['name'], equals('Paiements'));
      expect(envoye['slug'], equals('paiements'));
    });

    test('createArticle transmet le slug exigé par l API', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'a1',
          'title': 'Premiers pas',
          'slug': 'premiers-pas',
          'content': 'Bienvenue',
        }),
      );

      await _sdk(adapter).support.createArticle(
        title: 'Premiers pas',
        slug: 'premiers-pas',
        content: 'Bienvenue',
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(envoye['slug'], equals('premiers-pas'));
    });

    test('getArticle peut compter la vue', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          'id': 'a1',
          'title': 'Premiers pas',
          'slug': 'premiers-pas',
          'content': 'Bienvenue',
        }),
      );

      await _sdk(adapter).support.getArticle('a1', incrementView: true);

      expect(
        adapter.requests.single.queryParameters,
        equals({'increment_view': 'true'}),
        reason: "sans ce paramètre, l'API ne compte jamais la vue",
      );
    });

    test('assignTicket peut désassigner un ticket', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, _ticket),
      );

      await _sdk(adapter).support.assignTicket('t1', assignedToId: null);

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(
        envoye.containsKey('assigned_to_id'),
        isTrue,
        reason: "l'API accepte null pour retirer l'affectation",
      );
      expect(envoye['assigned_to_id'], isNull);
    });

    test('updateStatus joint une note à l historique', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, _ticket),
      );

      await _sdk(adapter).support.updateStatus(
        't1',
        status: TicketStatus.resolved,
        note: 'Corrigé en 1.2.3',
      );

      final envoye = (adapter.requests.single.data! as Map)
          .cast<String, dynamic>();
      expect(envoye['status'], equals('resolved'));
      expect(envoye['note'], equals('Corrigé en 1.2.3'));
    });

    test('lit la date de dernière modification d un ticket', () async {
      final adapter = FakeAdapter(
        (options, callIndex) => const FakeReply(200, {
          ..._ticket,
          'createdAt': '2026-08-02T10:00:00Z',
          'updatedAt': '2026-08-03T11:30:00Z',
        }),
      );

      final ticket = await _sdk(adapter).support.getTicket('t1');

      expect(
        ticket.updatedAt,
        equals(DateTime.utc(2026, 8, 3, 11, 30)),
      );
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
