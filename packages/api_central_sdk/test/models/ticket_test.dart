import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('Ticket', () {
    test('désérialise un ticket complet', () {
      final ticket = Ticket.fromJson(const {
        'id': 't1',
        'ticketNumber': 'TKT-001',
        'user': {'id': 'u1', 'externalUserId': 'ext-1'},
        'subject': 'Problème de connexion',
        'status': 'in_progress',
        'priority': 'high',
        'tags': ['auth', 'urgent'],
        'createdAt': '2026-08-02T10:00:00Z',
      });

      expect(ticket.ticketNumber, equals('TKT-001'));
      expect(ticket.status, equals(TicketStatus.inProgress),
          reason: "l'API sérialise ce statut en snake_case");
      expect(ticket.priority, equals(TicketPriority.high));
      expect(ticket.tags, equals(['auth', 'urgent']));
    });

    test('accepte un ticket sans assignation ni catégorie', () {
      final ticket = Ticket.fromJson(const {
        'id': 't1',
        'ticketNumber': 'TKT-002',
        'user': {'id': 'u1', 'externalUserId': 'ext-1'},
        'subject': 'Question',
        'status': 'open',
        'priority': 'low',
      });

      expect(ticket.assignedTo, isNull);
      expect(ticket.category, isNull);
    });
  });

  group('TicketReply', () {
    test('distingue le type d expéditeur', () {
      final reply = TicketReply.fromJson(const {
        'id': 'r1',
        'ticketId': 't1',
        'senderId': 'a1',
        'senderType': 'admin',
        'senderName': 'Support',
        'content': 'Bonjour, nous regardons.',
        'createdAt': '2026-08-02T10:00:00Z',
      });

      expect(reply.senderType, equals(SenderType.admin));
      expect(reply.content, equals('Bonjour, nous regardons.'));
    });
  });

  group('KnowledgeArticle', () {
    test('utilise markdown par défaut', () {
      final article = KnowledgeArticle.fromJson(const {
        'id': 'a1',
        'title': 'Comment se connecter',
        'slug': 'comment-se-connecter',
        'content': '# Titre',
      });

      expect(article.contentFormat, equals(ContentFormat.markdown));
      expect(article.isPublished, isFalse);
    });
  });
}
