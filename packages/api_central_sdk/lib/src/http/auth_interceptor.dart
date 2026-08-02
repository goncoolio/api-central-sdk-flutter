import 'package:dio/dio.dart';

import '../token_provider.dart';

/// Injecte le token et l'identifiant d'application, puis rejoue une fois
/// la requête après un 401.
///
/// Le rejeu passe par [CachedTokenProvider.invalidate] : les requêtes
/// concurrentes partagent le même rafraîchissement.
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.tokenProvider,
    required this.applicationId,
    required this.dio,
  });

  final CachedTokenProvider tokenProvider;
  final String applicationId;
  final Dio dio;

  static const _dejaRejoue = 'api_central_retried';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await tokenProvider();
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['X-Application-Id'] = applicationId;
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final options = err.requestOptions;
    final estExpire = err.response?.statusCode == 401;
    final dejaRejoue = options.extra[_dejaRejoue] == true;

    if (estExpire && !dejaRejoue) {
      tokenProvider.invalidate();
      options.extra[_dejaRejoue] = true;

      try {
        final reponse = await dio.fetch<dynamic>(options);
        return handler.resolve(reponse);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }

    handler.reject(err);
  }
}
