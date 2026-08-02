import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../http/case_converter.dart';
import '../token_provider.dart';
import 'realtime_event.dart';

/// État de la connexion WebSocket.
enum ConnectionState { disconnected, connecting, connected, reconnecting }

/// Fabrique de canal, injectable pour les tests.
typedef ChannelFactory = WebSocketChannel Function(Uri uri);

/// Client WebSocket bas niveau.
///
/// Gère la connexion, le heartbeat, la reconnexion avec backoff exponentiel et
/// la file d'attente des messages émis hors connexion. Le rejoint automatique
/// des rooms est du ressort de `RealtimeModule`, qui sait lesquelles sont
/// actives.
class WebSocketClient {
  WebSocketClient({
    required this.url,
    required this.tokenProvider,
    this.heartbeatInterval = const Duration(seconds: 30),
    this.baseRetryDelay = const Duration(seconds: 1),
    this.maxRetries = 10,
    ChannelFactory? channelFactory,
  }) : _channelFactory = channelFactory ?? WebSocketChannel.connect;

  final String url;
  final CachedTokenProvider tokenProvider;
  final Duration heartbeatInterval;
  final Duration baseRetryDelay;
  final int maxRetries;
  final ChannelFactory _channelFactory;

  final _events = StreamController<RealtimeEvent>.broadcast();
  final _states = StreamController<ConnectionState>.broadcast();
  final List<String> _fileAttente = [];

  WebSocketChannel? _canal;
  StreamSubscription<dynamic>? _abonnement;
  Timer? _heartbeat;
  Timer? _reconnexion;
  int _tentatives = 0;
  bool _fermetureVoulue = false;
  ConnectionState _state = ConnectionState.disconnected;

  /// Événements reçus du serveur.
  Stream<RealtimeEvent> get events => _events.stream;

  /// Changements d'état de la connexion.
  Stream<ConnectionState> get states => _states.stream;

  ConnectionState get state => _state;

  void _setState(ConnectionState nouveau) {
    if (_state == nouveau) return;
    _state = nouveau;
    if (!_states.isClosed) _states.add(nouveau);
  }

  /// Ouvre la connexion. Le token est demandé au [tokenProvider].
  Future<void> connect() async {
    if (_state == ConnectionState.connected ||
        _state == ConnectionState.connecting) {
      return;
    }

    _fermetureVoulue = false;
    _setState(_tentatives > 0
        ? ConnectionState.reconnecting
        : ConnectionState.connecting);

    final token = await tokenProvider();
    final uri = Uri.parse(url).replace(queryParameters: {'token': token});

    _canal = _channelFactory(uri);
    _abonnement = _canal!.stream.listen(
      _onMessage,
      onDone: _onDone,
      onError: (Object _) => _onDone(),
      cancelOnError: false,
    );

    _tentatives = 0;
    _setState(ConnectionState.connected);
    _demarrerHeartbeat();
    _viderFileAttente();
  }

  /// Ferme la connexion sans reconnexion automatique.
  Future<void> disconnect() async {
    _fermetureVoulue = true;
    _reconnexion?.cancel();
    _heartbeat?.cancel();
    await _abonnement?.cancel();
    _abonnement = null;
    await _canal?.sink.close();
    _canal = null;
    _setState(ConnectionState.disconnected);
  }

  /// Envoie un message. Si la connexion n'est pas établie, il est mis en file
  /// et émis dès la connexion suivante.
  void send(String type, [Map<String, dynamic>? data]) {
    final charge = <String, dynamic>{'type': type, ...?data};
    final texte = jsonEncode(deepToSnakeCase(charge));

    if (_state == ConnectionState.connected && _canal != null) {
      _canal!.sink.add(texte);
    } else {
      _fileAttente.add(texte);
    }
  }

  void _viderFileAttente() {
    if (_canal == null) return;
    for (final message in _fileAttente) {
      _canal!.sink.add(message);
    }
    _fileAttente.clear();
  }

  void _onMessage(dynamic brut) {
    if (brut is! String) return;

    final Object? decode;
    try {
      decode = jsonDecode(brut);
    } on FormatException {
      return;
    }
    if (decode is! Map) return;

    final json = (deepToCamelCase(decode)! as Map).cast<String, dynamic>();
    if (!_events.isClosed) _events.add(parseRealtimeEvent(json));
  }

  void _onDone() {
    _heartbeat?.cancel();
    if (_fermetureVoulue) return;
    _planifierReconnexion();
  }

  void _planifierReconnexion() {
    if (_tentatives >= maxRetries) {
      _setState(ConnectionState.disconnected);
      return;
    }

    _setState(ConnectionState.reconnecting);
    final delai = baseRetryDelay * (1 << _tentatives);
    _tentatives++;

    _reconnexion?.cancel();
    _reconnexion = Timer(delai, () {
      _state = ConnectionState.disconnected; // autorise un nouvel appel
      unawaited(connect());
    });
  }

  void _demarrerHeartbeat() {
    _heartbeat?.cancel();
    _heartbeat = Timer.periodic(heartbeatInterval, (_) => send('ping'));
  }

  /// Simule une coupure réseau. Réservé aux tests.
  void debugSimulerCoupure() => _onDone();

  /// Libère les ressources. Le client n'est plus utilisable ensuite.
  Future<void> dispose() async {
    await disconnect();
    await _events.close();
    await _states.close();
  }
}
