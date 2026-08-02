import 'package:dio/dio.dart';

import '../config.dart';
import '../exceptions.dart';
import '../token_provider.dart';
import 'auth_interceptor.dart';
import 'case_interceptor.dart';

/// Client HTTP de l'API Central S2S.
///
/// Assemble dio, les intercepteurs et la traduction des erreurs. Les modules
/// métier ne manipulent que cette classe.
class ApiClient {
  ApiClient({
    required this.config,
    required CachedTokenProvider tokenProvider,
    Dio? dio,
  }) : dio = dio ?? Dio() {
    this.dio.options
      ..baseUrl = config.baseUrl
      ..connectTimeout = config.connectTimeout
      ..receiveTimeout = config.receiveTimeout
      ..headers.addAll({
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

    this.dio.interceptors.addAll([
      CaseInterceptor(),
      AuthInterceptor(
        tokenProvider: tokenProvider,
        applicationId: config.applicationId,
        dio: this.dio,
      ),
    ]);
  }

  final ApiCentralConfig config;
  final Dio dio;

  /// Les envois de médias transitent par `/messaging/` et demandent plus de temps.
  Options? _options(String path) {
    if (!path.startsWith('/messaging/')) return null;
    return Options(
      receiveTimeout: config.messagingTimeout,
      sendTimeout: config.messagingTimeout,
    );
  }

  Future<T> _run<T>(Future<Response<dynamic>> Function() request) async {
    try {
      final response = await request();
      return response.data as T;
    } on DioException catch (e) {
      throw _traduire(e);
    }
  }

  ApiCentralException _traduire(DioException e) {
    final statusCode = e.response?.statusCode;
    if (statusCode != null) {
      return ApiCentralException.fromResponse(statusCode, e.response?.data);
    }
    return NetworkException(
      switch (e.type) {
        DioExceptionType.connectionTimeout => 'Délai de connexion dépassé',
        DioExceptionType.receiveTimeout => 'Délai de réception dépassé',
        DioExceptionType.sendTimeout => "Délai d'envoi dépassé",
        DioExceptionType.connectionError => 'Connexion impossible',
        DioExceptionType.cancel => 'Requête annulée',
        _ => e.message ?? 'Erreur réseau',
      },
    );
  }

  Future<T> get<T>(String path, {Map<String, dynamic>? query}) => _run<T>(
        () => dio.get<dynamic>(
          path,
          queryParameters: query,
          options: _options(path),
        ),
      );

  Future<T> post<T>(String path, {Object? body, Map<String, dynamic>? query}) =>
      _run<T>(
        () => dio.post<dynamic>(
          path,
          data: body,
          queryParameters: query,
          options: _options(path),
        ),
      );

  Future<T> put<T>(String path, {Object? body}) => _run<T>(
        () => dio.put<dynamic>(path, data: body, options: _options(path)),
      );

  Future<T> delete<T>(String path, {Map<String, dynamic>? query}) => _run<T>(
        () => dio.delete<dynamic>(
          path,
          queryParameters: query,
          options: _options(path),
        ),
      );
}
