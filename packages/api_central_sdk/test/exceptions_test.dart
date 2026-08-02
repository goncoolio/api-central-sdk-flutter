import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('ApiCentralException.fromResponse', () {
    test('mappe 401 sur UnauthorizedException', () {
      final e = ApiCentralException.fromResponse(401, {
        'message': 'Invalid token',
        'statusCode': 401,
        'error': 'Unauthorized',
      });

      expect(e, isA<UnauthorizedException>());
      expect(e.message, equals('Invalid token'));
      expect(e.statusCode, equals(401));
    });

    test('mappe 404 sur NotFoundException', () {
      final e = ApiCentralException.fromResponse(404, {
        'message': 'User not found',
        'statusCode': 404,
        'error': 'Not Found',
      });

      expect(e, isA<NotFoundException>());
      expect(e.message, equals('User not found'));
    });

    test('mappe 400 sur ValidationException en conservant details', () {
      final e = ApiCentralException.fromResponse(400, {
        'message': 'Validation failed',
        'statusCode': 400,
        'error': 'Bad Request',
        'details': {'title': 'length is lower than 1'},
      });

      expect(e, isA<ValidationException>());
      expect(e.details, equals({'title': 'length is lower than 1'}));
    });

    test('mappe 429 sur RateLimitException', () {
      final e = ApiCentralException.fromResponse(429, {
        'message': 'Too many requests',
        'statusCode': 429,
        'error': 'Too Many Requests',
      });

      expect(e, isA<RateLimitException>());
    });

    test('mappe 500 sur ServerException', () {
      final e = ApiCentralException.fromResponse(500, {
        'message': 'An internal error occurred',
        'statusCode': 500,
        'error': 'Internal Server Error',
      });

      expect(e, isA<ServerException>());
    });

    test('tolère un corps non conforme', () {
      final e = ApiCentralException.fromResponse(503, 'Service Unavailable');

      expect(e, isA<ServerException>());
      expect(e.statusCode, equals(503));
      expect(e.message, isNotEmpty);
    });
  });
}
