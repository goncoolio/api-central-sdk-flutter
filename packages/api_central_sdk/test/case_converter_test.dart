import 'package:api_central_sdk/src/http/case_converter.dart';
import 'package:test/test.dart';

void main() {
  group('camelToSnake', () {
    test('convertit les identifiants simples', () {
      expect(camelToSnake('userId'), equals('user_id'));
      expect(camelToSnake('notificationType'), equals('notification_type'));
      expect(camelToSnake('id'), equals('id'));
    });

    test('laisse intact ce qui est déjà en snake_case', () {
      expect(camelToSnake('user_id'), equals('user_id'));
    });
  });

  group('snakeToCamel', () {
    test('convertit les identifiants simples', () {
      expect(snakeToCamel('sent_count'), equals('sentCount'));
      expect(snakeToCamel('last_read_message_id'), equals('lastReadMessageId'));
      expect(snakeToCamel('id'), equals('id'));
    });

    test('laisse intact ce qui est déjà en camelCase', () {
      expect(snakeToCamel('sentCount'), equals('sentCount'));
    });
  });

  group('deepToSnakeCase', () {
    test('convertit les clés imbriquées', () {
      final input = {
        'userId': 'u1',
        'notificationType': 'message',
        'nested': {'lastReadAt': '2026-01-01'},
      };

      expect(
          deepToSnakeCase(input),
          equals({
            'user_id': 'u1',
            'notification_type': 'message',
            'nested': {'last_read_at': '2026-01-01'},
          }));
    });

    test('convertit les clés dans les listes', () {
      final input = {
        'userIds': ['a', 'b'],
        'items': [
          {'itemId': 1},
        ],
      };

      expect(
          deepToSnakeCase(input),
          equals({
            'user_ids': ['a', 'b'],
            'items': [
              {'item_id': 1},
            ],
          }));
    });

    test('laisse les valeurs scalaires intactes', () {
      expect(deepToSnakeCase('texte'), equals('texte'));
      expect(deepToSnakeCase(42), equals(42));
      expect(deepToSnakeCase(null), isNull);
    });
  });

  group('deepToCamelCase', () {
    test('convertit une réponse de l API', () {
      final input = {
        'success': true,
        'sent_count': 3,
        'total_users': 10,
      };

      expect(
          deepToCamelCase(input),
          equals({
            'success': true,
            'sentCount': 3,
            'totalUsers': 10,
          }));
    });

    test('convertit une liste racine', () {
      final input = [
        {'emoji': '❤️', 'count': 150},
      ];

      expect(
          deepToCamelCase(input),
          equals([
            {'emoji': '❤️', 'count': 150},
          ]));
    });
  });
}
