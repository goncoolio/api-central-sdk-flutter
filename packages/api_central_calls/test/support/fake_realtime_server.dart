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

  /// Messages reçus du client, décodés, dans l'ordre.
  final List<Map<String, dynamic>> messages = [];
  final Map<String, Completer<Map<String, dynamic>>> _attentes = {};

  static Future<FakeRealtimeServer> demarrer() async {
    final serveur = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final faux = FakeRealtimeServer._(serveur);
    serveur.listen(faux._accepter);
    return faux;
  }

  Future<void> _accepter(HttpRequest requete) async {
    final socket = await WebSocketTransformer.upgrade(requete);
    _sockets.add(socket);
    socket.listen(_recevoir, onError: (Object _) {});
    if (!_connecte.isCompleted) _connecte.complete();
  }

  void _recevoir(dynamic message) {
    if (message is! String) return;
    final decode = jsonDecode(message);
    if (decode is! Map<String, dynamic>) return;
    messages.add(decode);
    final type = decode['type'];
    if (type is String) _attentes.remove(type)?.complete(decode);
  }

  /// Attend le premier message d'un type donné, déjà reçu ou à venir.
  Future<Map<String, dynamic>> attendre(
    String type, {
    Duration limite = const Duration(seconds: 5),
  }) {
    for (final message in messages) {
      if (message['type'] == type) return Future.value(message);
    }
    final attente = _attentes[type] = Completer<Map<String, dynamic>>();
    return attente.future.timeout(limite);
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
