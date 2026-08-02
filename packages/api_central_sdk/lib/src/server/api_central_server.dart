import 'package:dio/dio.dart';

import '../config.dart';
import '../exceptions.dart';

/// Token d'application, obtenu à partir des credentials.
class AppToken {
  const AppToken({required this.accessToken, required this.expiresIn});

  final String accessToken;
  final int expiresIn;
}

/// Accès aux credentials de l'API Central S2S.
///
/// **Réservé aux backends.** Cette classe n'est pas exportée par
/// `package:api_central_sdk/api_central_sdk.dart` : elle exige `api_key` et
/// `api_secret`, qui ne doivent jamais être embarqués dans une application
/// mobile. Une app obtient son token auprès de son propre backend.
class ApiCentralServer {
  ApiCentralServer({
    required this.config,
    required this.apiKey,
    required this.apiSecret,
    Dio? dio,
  }) : _dio = dio ?? Dio(BaseOptions(baseUrl: config.baseUrl));

  final ApiCentralConfig config;
  final String apiKey;
  final String apiSecret;
  final Dio _dio;

  String? _appToken;

  /// `POST /auth/token` — jeton d'application, valable 1 h.
  Future<AppToken> authenticate() async {
    final response = await _post('/auth/token', {
      'api_key': apiKey,
      'api_secret': apiSecret,
    });

    final accessToken = response['access_token'] as String?;
    if (accessToken == null) {
      throw const UnauthorizedException("Réponse sans champ 'access_token'");
    }
    _appToken = accessToken;

    return AppToken(
      accessToken: accessToken,
      expiresIn: (response['expires_in'] as num?)?.toInt() ?? 3600,
    );
  }

  /// `POST /auth/user-token` — jeton utilisateur, valable 24 h.
  ///
  /// C'est ce token que le backend transmet à l'application mobile.
  Future<String> userToken(String userId) async {
    final token = _appToken ?? (await authenticate()).accessToken;

    final response = await _post(
      '/auth/user-token',
      {'user_id': userId},
      token: token,
    );

    final socketToken = response['socket_token'] as String?;
    if (socketToken == null) {
      throw const UnauthorizedException("Réponse sans champ 'socket_token'");
    }
    return socketToken;
  }

  Future<Map<String, dynamic>> _post(
    String path,
    Map<String, dynamic> body, {
    String? token,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        path,
        data: body,
        options: Options(
          headers: {
            if (token != null) 'Authorization': 'Bearer $token',
            'X-Application-Id': config.applicationId,
          },
        ),
      );
      return (response.data! as Map).cast<String, dynamic>();
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        throw ApiCentralException.fromResponse(statusCode, e.response?.data);
      }
      throw NetworkException(e.message ?? 'Erreur réseau');
    }
  }
}
