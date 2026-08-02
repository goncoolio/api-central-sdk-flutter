/// Erreur renvoyée par l'API Central S2S ou par la couche réseau.
///
/// L'API répond `{ message, statusCode, error, details? }`.
sealed class ApiCentralException implements Exception {
  const ApiCentralException(
    this.message, {
    this.statusCode,
    this.error,
    this.details,
  });

  final String message;
  final int? statusCode;
  final String? error;
  final Map<String, dynamic>? details;

  /// Construit l'exception typée correspondant au code HTTP.
  static ApiCentralException fromResponse(int statusCode, Object? body) {
    final map = body is Map<String, dynamic> ? body : const <String, dynamic>{};
    final message = (map['message'] as String?) ?? 'HTTP $statusCode';
    final error = map['error'] as String?;
    final details = map['details'] as Map<String, dynamic>?;

    return switch (statusCode) {
      401 => UnauthorizedException(message,
          statusCode: statusCode, error: error, details: details),
      403 => ForbiddenException(message,
          statusCode: statusCode, error: error, details: details),
      404 => NotFoundException(message,
          statusCode: statusCode, error: error, details: details),
      409 => ConflictException(message,
          statusCode: statusCode, error: error, details: details),
      429 => RateLimitException(message,
          statusCode: statusCode, error: error, details: details),
      >= 400 && < 500 => ValidationException(message,
          statusCode: statusCode, error: error, details: details),
      _ => ServerException(message,
          statusCode: statusCode, error: error, details: details),
    };
  }

  @override
  String toString() => '$runtimeType($statusCode): $message';
}

/// 401 — token absent, invalide ou expiré.
final class UnauthorizedException extends ApiCentralException {
  const UnauthorizedException(super.message,
      {super.statusCode, super.error, super.details});
}

/// 403 — token valide mais droits insuffisants.
final class ForbiddenException extends ApiCentralException {
  const ForbiddenException(super.message,
      {super.statusCode, super.error, super.details});
}

/// 404 — ressource inexistante.
final class NotFoundException extends ApiCentralException {
  const NotFoundException(super.message,
      {super.statusCode, super.error, super.details});
}

/// 409 — conflit, par exemple un slug déjà pris.
final class ConflictException extends ApiCentralException {
  const ConflictException(super.message,
      {super.statusCode, super.error, super.details});
}

/// 400 et autres 4xx — échec de validation. `details` porte les champs fautifs.
final class ValidationException extends ApiCentralException {
  const ValidationException(super.message,
      {super.statusCode, super.error, super.details});
}

/// 429 — quota dépassé.
final class RateLimitException extends ApiCentralException {
  const RateLimitException(super.message,
      {super.statusCode, super.error, super.details});
}

/// 5xx — erreur serveur.
final class ServerException extends ApiCentralException {
  const ServerException(super.message,
      {super.statusCode, super.error, super.details});
}

/// Aucune réponse HTTP : timeout, DNS, appareil hors ligne.
///
/// Distincte des erreurs API : sur mobile, la perte de réseau est un cas
/// nominal qui appelle un retry, pas un message d'erreur.
final class NetworkException extends ApiCentralException {
  const NetworkException(super.message, {super.details});
}
