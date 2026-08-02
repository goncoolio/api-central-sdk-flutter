import 'dart:async';
import 'dart:convert';

import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Canal WebSocket simulé.
///
/// Expose ce que le client envoie et permet d'injecter des messages entrants
/// ou une coupure, ce qu'un vrai serveur ne permettrait pas de piloter dans un
/// test unitaire.
class FakeChannel extends StreamChannelMixin<dynamic>
    implements WebSocketChannel {
  FakeChannel() : _entrants = StreamController<dynamic>.broadcast();

  final StreamController<dynamic> _entrants;

  /// Messages émis par le client, dans l'ordre.
  final List<String> envoyes = [];

  bool ferme = false;

  /// Injecte un message venant du serveur.
  void recevoir(Map<String, dynamic> message) {
    if (!_entrants.isClosed) _entrants.add(jsonEncode(message));
  }

  /// Coupe la connexion côté serveur.
  Future<void> couper() => _entrants.close();

  @override
  Stream<dynamic> get stream => _entrants.stream;

  @override
  late final WebSocketSink sink = _FakeSink(this);

  @override
  Future<void> get ready => Future.value();

  @override
  int? get closeCode => ferme ? 1000 : null;

  @override
  String? get closeReason => null;

  @override
  String? get protocol => null;
}

class _FakeSink implements WebSocketSink {
  _FakeSink(this._channel);

  final FakeChannel _channel;

  @override
  void add(dynamic data) => _channel.envoyes.add(data as String);

  @override
  Future<void> close([int? closeCode, String? closeReason]) async {
    _channel.ferme = true;
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {}

  @override
  Future<void> addStream(Stream<dynamic> stream) async {}

  @override
  Future<void> get done => Future.value();
}
