import 'config.dart';
import 'http/api_client.dart';
import 'token_provider.dart';

/// Point d'entrée du SDK côté application.
///
/// Ne connaît aucun credential : le token vient du [TokenProvider] fourni par
/// l'application, qui l'obtient de son propre backend.
class ApiCentral {
  ApiCentral({
    required this.config,
    required TokenProvider tokenProvider,
  }) : _tokenProvider = CachedTokenProvider(inner: tokenProvider) {
    client = ApiClient(config: config, tokenProvider: _tokenProvider);
  }

  final ApiCentralConfig config;
  final CachedTokenProvider _tokenProvider;

  /// Client HTTP partagé par tous les modules.
  late final ApiClient client;

  /// Oublie le token courant. Utile après une déconnexion applicative.
  void invalidateToken() => _tokenProvider.invalidate();
}
