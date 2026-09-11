import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Serveur WebSocket local qui se fait passer pour l'API.
///
/// Le SDK s'y connecte comme en production, par `connectRealtime`, et le test
/// y pousse les événements de son choix : un `call_ended`, par exemple.
class FakeRealtimeServer {
  FakeRealtimeServer._(this._serveur);

  final HttpServer _serveur;
  final List<WebSocket> _sockets = [];
  final Completer<void> _connecte = Completer<void>();

  static Future<FakeRealtimeServer> demarrer() async {
    final serveur = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final faux = FakeRealtimeServer._(serveur);
    serveur.listen(faux._accepter);
    return faux;
  }

  Future<void> _accepter(HttpRequest requete) async {
    final socket = await WebSocketTransformer.upgrade(requete);
    _sockets.add(socket);
    // Les messages du client (ping, join) n'intéressent pas ces tests.
    socket.listen((_) {}, onError: (Object _) {});
    if (!_connecte.isCompleted) _connecte.complete();
  }

  /// URL à passer à `connectRealtime`.
  String get url => 'ws://127.0.0.1:${_serveur.port}/events';

  /// Complété dès qu'un client est connecté.
  Future<void> get connecte => _connecte.future;

  /// Pousse un événement, à écrire comme l'API le sérialise (snake_case).
  void envoyer(Map<String, dynamic> evenement) {
    final texte = jsonEncode(evenement);
    for (final socket in _sockets) {
      socket.add(texte);
    }
  }

  Future<void> arreter() async {
    for (final socket in _sockets) {
      await socket.close();
    }
    await _serveur.close(force: true);
  }
}
