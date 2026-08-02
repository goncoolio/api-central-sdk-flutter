/// Configuration d'une instance `ApiCentral`.
///
/// Ne contient jamais de credentials : le token est fourni par un
/// `TokenProvider` que l'application implémente.
class ApiCentralConfig {
  const ApiCentralConfig({
    required this.baseUrl,
    required this.applicationId,
    this.wsUrl,
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 15),
    this.messagingTimeout = const Duration(seconds: 45),
  });

  /// Racine de l'API, par exemple `https://acr-s2s.cmdcall.com/s2s/v1`.
  final String baseUrl;

  /// Identifiant de l'application, envoyé dans l'en-tête `X-Application-Id`.
  final String applicationId;

  /// URL du WebSocket, par exemple `wss://acr-s2s.cmdcall.com/events`.
  /// Requis seulement pour le temps réel (phase 3).
  final String? wsUrl;

  final Duration connectTimeout;
  final Duration receiveTimeout;

  /// Timeout étendu pour `/messaging/`, où transitent les médias.
  final Duration messagingTimeout;
}
