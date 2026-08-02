import 'dart:async';

import 'package:dio/dio.dart';

import 'exceptions.dart';

/// Fournit un token utilisateur pour l'API Central S2S.
///
/// Les credentials (`api_key`, `api_secret`) restent sur le backend de
/// l'application : le SDK ne fait que réclamer un token déjà émis.
typedef TokenProvider = Future<String> Function();

/// Implémentation prête à l'emploi pour les backends qui exposent un endpoint
/// renvoyant `{ "token": "..." }`.
///
/// Les backends dont la route ou le format diffèrent passent leur propre
/// closure à la place.
class HttpTokenProvider {
  HttpTokenProvider({
    required this.endpoint,
    this.headers,
    this.tokenField = 'token',
    Dio? dio,
  }) : _dio = dio ?? Dio();

  final String endpoint;
  final Map<String, String>? headers;

  /// Nom du champ portant le token dans la réponse.
  final String tokenField;

  final Dio _dio;

  Future<String> call() async {
    final Response<dynamic> response;
    try {
      response = await _dio.post<dynamic>(
        endpoint,
        options: Options(headers: headers),
      );
    } on DioException catch (e) {
      throw NetworkException(
        'Impossible de joindre le backend pour obtenir un token : ${e.message}',
      );
    }

    final body = response.data;
    final token = body is Map ? body[tokenField] : null;

    if (token is! String || token.isEmpty) {
      throw UnauthorizedException(
        "Le backend n'a pas renvoyé de champ '$tokenField' exploitable",
        statusCode: response.statusCode,
      );
    }
    return token;
  }
}

/// Met en cache le token et mutualise les demandes concurrentes.
///
/// Sans mutualisation, N requêtes qui échouent en 401 déclenchent N
/// rafraîchissements simultanés.
class CachedTokenProvider {
  CachedTokenProvider({required this.inner});

  final TokenProvider inner;

  String? _token;
  Future<String>? _enCours;

  Future<String> call() {
    final cached = _token;
    if (cached != null) return Future.value(cached);

    final enCours = _enCours;
    if (enCours != null) return enCours;

    final future = inner().then((token) {
      _token = token;
      _enCours = null;
      return token;
    }).onError<Object>((error, stack) {
      _enCours = null;
      Error.throwWithStackTrace(error, stack);
    });

    _enCours = future;
    return future;
  }

  /// Oublie le token courant : le prochain appel en redemandera un.
  void invalidate() => _token = null;
}
