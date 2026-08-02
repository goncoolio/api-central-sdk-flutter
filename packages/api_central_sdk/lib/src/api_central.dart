import 'config.dart';
import 'http/api_client.dart';
import 'modules/messaging_module.dart';
import 'modules/users_module.dart';
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
    users = UsersModule(client);
    messaging = MessagingModule(client);
  }

  final ApiCentralConfig config;
  final CachedTokenProvider _tokenProvider;

  /// Client HTTP partagé par tous les modules.
  late final ApiClient client;

  /// Utilisateurs, appareils et présence.
  late final UsersModule users;

  /// Conversations, messages et réactions.
  late final MessagingModule messaging;

  /// Oublie le token courant. Utile après une déconnexion applicative.
  void invalidateToken() => _tokenProvider.invalidate();
}
