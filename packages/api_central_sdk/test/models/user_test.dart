import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('User', () {
    test('se désérialise depuis une réponse déjà convertie en camelCase', () {
      final user = User.fromJson(const {
        'id': 'u1',
        'externalUserId': 'ext-1',
        'displayName': 'Alice',
        'avatarUrl': null,
        'createdAt': '2026-08-02T10:00:00Z',
      });

      expect(user.id, equals('u1'));
      expect(user.externalUserId, equals('ext-1'));
      expect(user.displayName, equals('Alice'));
      expect(user.avatarUrl, isNull);
      expect(user.createdAt, equals(DateTime.parse('2026-08-02T10:00:00Z')));
    });

    test('supporte l égalité de valeur', () {
      const a = User(id: 'u1', externalUserId: 'ext-1');
      const b = User(id: 'u1', externalUserId: 'ext-1');

      expect(a, equals(b));
    });

    test('désérialise les champs complets', () {
      final user = User.fromJson(const {
        'id': 'u1',
        'applicationId': 'app-42',
        'externalUserId': 'ext-1',
        'displayName': 'Alice',
        'email': 'alice@example.com',
        'metadata': {'role': 'admin'},
        'lastSeenAt': '2026-08-02T09:00:00Z',
        'createdAt': '2026-08-01T10:00:00Z',
        'updatedAt': '2026-08-02T09:00:00Z',
      });

      expect(user.applicationId, equals('app-42'));
      expect(user.email, equals('alice@example.com'));
      expect(user.metadata, equals({'role': 'admin'}));
      expect(user.lastSeenAt, equals(DateTime.parse('2026-08-02T09:00:00Z')));
    });

    test('copyWith remplace un champ sans toucher aux autres', () {
      const a = User(id: 'u1', externalUserId: 'ext-1', displayName: 'Alice');
      final b = a.copyWith(displayName: 'Bob');

      expect(b.displayName, equals('Bob'));
      expect(b.id, equals('u1'));
    });
  });
}
