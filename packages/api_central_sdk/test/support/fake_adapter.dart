import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

/// Réponse simulée renvoyée par [FakeAdapter].
class FakeReply {
  const FakeReply(this.statusCode, this.body);

  final int statusCode;
  final Object? body;
}

/// Décide de la réponse à partir de la requête et du rang de l'appel.
///
/// [callIndex] démarre à 1, ce qui permet de simuler une séquence — un 401
/// suivi d'un 200 après rafraîchissement du token, par exemple.
typedef FakeHandler = FakeReply Function(RequestOptions options, int callIndex);

/// Adaptateur HTTP simulé, avec un contrôle par appel.
///
/// `http_mock_adapter` fige sa réponse au moment de l'enregistrement de la
/// route : il ne permet pas de faire varier la réponse d'un appel à l'autre.
class FakeAdapter implements HttpClientAdapter {
  FakeAdapter(this.handler);

  final FakeHandler handler;

  /// Requêtes reçues, dans l'ordre.
  final List<RequestOptions> requests = [];

  int get callCount => requests.length;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final reply = handler(options, requests.length);

    return ResponseBody.fromString(
      jsonEncode(reply.body),
      reply.statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
