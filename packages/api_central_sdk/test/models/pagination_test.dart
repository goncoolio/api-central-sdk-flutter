import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('PaginatedResponse', () {
    test('se désérialise avec une fonction de conversion des éléments', () {
      final page = PaginatedResponse<User>.fromJson(
        const {
          'data': [
            {'id': 'u1', 'externalUserId': 'ext-1'},
          ],
          'pagination': {
            'page': 1,
            'limit': 20,
            'total': 1,
            'totalPages': 1,
          },
        },
        (json) => User.fromJson(json! as Map<String, dynamic>),
      );

      expect(page.data.single.id, equals('u1'));
      expect(page.pagination.total, equals(1));
      expect(page.pagination.totalPages, equals(1));
    });
  });

  group('CursorResponse', () {
    test('expose hasMore et nextCursor', () {
      final page = CursorResponse<User>.fromJson(
        const {
          'data': <dynamic>[],
          'pagination': {'hasMore': true, 'nextCursor': 'm42'},
        },
        (json) => User.fromJson(json! as Map<String, dynamic>),
      );

      expect(page.data, isEmpty);
      expect(page.pagination.hasMore, isTrue);
      expect(page.pagination.nextCursor, equals('m42'));
    });

    test('accepte un curseur absent en fin de liste', () {
      final page = CursorResponse<User>.fromJson(
        const {
          'data': <dynamic>[],
          'pagination': {'hasMore': false},
        },
        (json) => User.fromJson(json! as Map<String, dynamic>),
      );

      expect(page.pagination.hasMore, isFalse);
      expect(page.pagination.nextCursor, isNull);
    });
  });
}
