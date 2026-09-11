import 'dart:convert';
import 'dart:typed_data';

import 'package:api_central_sdk/api_central_sdk.dart';
import 'package:dio/dio.dart';

/// Réponse HTTP simulée, sérialisée comme le fait l'API (snake_case).
class FakeReply {
  const FakeReply(this.statusCode, [this.body = const {'success': true}]);

  final int statusCode;
  final Object? body;
}

/// Adaptateur HTTP simulé, qui répond selon « MÉTHODE /chemin ».
///
/// Une route non déclarée répond 404 : un test qui en oublie une échoue au
/// lieu de passer par hasard.
class FakeHttp implements HttpClientAdapter {
  FakeHttp(this.routes);

  /// Réponses par route, par exemple `'GET /calls/call-1'`.
  final Map<String, FakeReply> routes;

  /// Requêtes reçues, dans l'ordre, corps déjà convertis en snake_case.
  final List<RequestOptions> requests = [];

  /// Requêtes reçues, sous la forme « MÉTHODE /chemin ».
  List<String> get journal => [
    for (final requete in requests) '${requete.method} ${requete.path}',
  ];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final reponse =
        routes['${options.method} ${options.path}'] ??
        const FakeReply(404, {
          'message': 'Route non simulée',
          'statusCode': 404,
        });

    return ResponseBody.fromString(
      jsonEncode(reponse.body),
      reponse.statusCode,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

/// SDK dont les requêtes HTTP passent par [http].
ApiCentral sdkSimule(FakeHttp http) {
  final sdk = ApiCentral(
    config: const ApiCentralConfig(
      baseUrl: 'https://api.test/s2s/v1',
      applicationId: 'app-42',
    ),
    tokenProvider: () async => 'jwt-1',
  );
  sdk.client.dio.httpClientAdapter = http;
  return sdk;
}

/// Appel tel que `GET /calls/{id}` le renvoie.
///
/// [participantIds] liste tous les participants, initiateur en tête : l'API
/// inscrit l'initiateur parmi eux.
Map<String, dynamic> appelJson(
  String callId, {
  required List<String> participantIds,
  String callType = 'video',
}) => {
  'id': callId,
  'initiator': {
    'id': participantIds.first,
    'external_user_id': 'ext-${participantIds.first}',
  },
  'call_type': callType,
  'status': 'ringing',
  'participants': [
    for (final (rang, id) in participantIds.indexed)
      {
        'id': 'participant-$id',
        'user': {'id': id, 'external_user_id': 'ext-$id'},
        'status': rang == 0 ? 'joined' : 'invited',
      },
  ],
  'participant_count': 1,
  'encryption_enabled': true,
};
