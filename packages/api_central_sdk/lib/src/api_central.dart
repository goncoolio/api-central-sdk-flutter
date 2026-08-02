import 'config.dart';
import 'http/api_client.dart';
import 'modules/live_module.dart';
import 'modules/messaging_module.dart';
import 'modules/notifications_module.dart';
import 'modules/support_module.dart';
import 'modules/users_module.dart';
import 'realtime/realtime_module.dart';
import 'realtime/websocket_client.dart';
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
    notifications = NotificationsModule(client);
    support = SupportModule(client);
    live = LiveModule(client);
  }

  final ApiCentralConfig config;
  final CachedTokenProvider _tokenProvider;

  /// Client HTTP partagé par tous les modules.
  late final ApiClient client;

  /// Utilisateurs, appareils et présence.
  late final UsersModule users;

  /// Conversations, messages et réactions.
  late final MessagingModule messaging;

  /// Notifications push et in-app.
  late final NotificationsModule notifications;

  /// Tickets de support et base de connaissances.
  late final SupportModule support;

  /// Directs : diffusion, spectateurs, commentaires.
  late final LiveModule live;

  RealtimeModule? _realtime;

  /// Temps réel. `null` tant que [connectRealtime] n'a pas été appelé.
  RealtimeModule? get realtime => _realtime;

  /// Ouvre la connexion WebSocket.
  ///
  /// Requiert un `wsUrl` dans la configuration, ou en paramètre. Le token vient
  /// du même `TokenProvider` que les appels HTTP.
  Future<RealtimeModule> connectRealtime({String? wsUrl}) async {
    final url = wsUrl ?? config.wsUrl;
    if (url == null) {
      throw StateError(
        'wsUrl est requis : renseignez-le dans ApiCentralConfig ou passez-le ici.',
      );
    }

    final existant = _realtime;
    if (existant != null) {
      await existant.connect();
      return existant;
    }

    final module = RealtimeModule(
      WebSocketClient(url: url, tokenProvider: _tokenProvider),
    );
    _realtime = module;
    await module.connect();
    return module;
  }

  /// Ferme la connexion temps réel et libère les ressources.
  Future<void> disconnectRealtime() async {
    await _realtime?.dispose();
    _realtime = null;
  }

  /// Oublie le token courant. Utile après une déconnexion applicative.
  void invalidateToken() => _tokenProvider.invalidate();
}
