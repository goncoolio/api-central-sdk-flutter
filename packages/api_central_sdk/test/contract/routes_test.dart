import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

/// Chemins appelés par le SDK, extraits des modules.
///
/// Mis à jour à la main : une route ajoutée à un module doit être déclarée ici,
/// ce qui force à vérifier son existence côté API.
const _routesUtilisees = <String>{
  'POST /users',
  'GET /users',
  'GET /users/{id}',
  'PUT /users/{id}',
  'DELETE /users/{id}',
  'GET /users/by-external/{externalId}',
  'POST /users/{id}/devices',
  'GET /users/{id}/devices',
  'DELETE /users/{id}/devices/{token}',
  'PUT /users/{id}/presence',
  'GET /users/{id}/presence',
  'POST /messaging/conversations',
  'GET /messaging/conversations',
  'GET /messaging/conversations/{id}',
  'PUT /messaging/conversations/{id}',
  'DELETE /messaging/conversations/{id}',
  'POST /messaging/conversations/{id}/participants',
  'GET /messaging/conversations/{id}/participants',
  'DELETE /messaging/conversations/{id}/participants/{userId}',
  'POST /messaging/conversations/{id}/messages',
  'GET /messaging/conversations/{id}/messages',
  'GET /messaging/messages/{id}',
  'PUT /messaging/messages/{id}',
  'DELETE /messaging/messages/{id}',
  'POST /messaging/messages/{id}/reactions',
  'DELETE /messaging/messages/{id}/reactions/{emoji}',
  'POST /messaging/conversations/{id}/typing',
  'POST /messaging/conversations/{id}/read',
  'POST /notifications/send',
  'POST /notifications/send-bulk',
  'POST /notifications/send-template',
  'GET /notifications',
  'GET /notifications/unread-count',
  'POST /notifications/mark-read',
  'POST /notifications/mark-all-read',
  'DELETE /notifications/{id}',
};

/// Routes réelles de l'API que le spec OpenAPI ne documente pas.
///
/// Elles existent bien dans `src/api/`, mais leurs handlers Rust n'ont pas
/// d'annotation `#[utoipa::path]`. Les exclure de la comparaison évite un échec
/// qui incriminerait le SDK alors que c'est le spec qui est incomplet.
const _absentesDuSpec = <String>{
  'POST /notifications/broadcast',
};

const _specUrl = 'http://localhost:3004/api-docs/openapi.json';

/// Normalise `{userId}` et `{id}` en `{}` pour comparer les formes.
String _normalise(String route) =>
    route.replaceAll(RegExp(r'\{[a-zA-Z_]+\}'), '{}');

Future<Set<String>?> _chargerSpec() async {
  try {
    final client = HttpClient()..connectionTimeout = const Duration(seconds: 2);
    final request = await client.getUrl(Uri.parse(_specUrl));
    final response = await request.close();
    final corps = await response.transform(utf8.decoder).join();
    client.close();

    final spec = jsonDecode(corps) as Map<String, dynamic>;
    final paths = spec['paths'] as Map<String, dynamic>;

    return {
      for (final entry in paths.entries)
        for (final methode in (entry.value as Map<String, dynamic>).keys)
          _normalise('${methode.toUpperCase()} ${entry.key}'),
    };
  } on Object {
    return null;
  }
}

void main() {
  test('toutes les routes du SDK existent dans le spec OpenAPI', () async {
    final routesApi = await _chargerSpec();

    if (routesApi == null) {
      markTestSkipped('API injoignable sur $_specUrl — test de contrat ignoré. '
          'Lancer le serveur pour le rejouer.');
      return;
    }

    final manquantes = _routesUtilisees
        .difference(_absentesDuSpec)
        .map(_normalise)
        .where((route) => !routesApi.contains(route))
        .toList()
      ..sort();

    expect(
      manquantes,
      isEmpty,
      reason: 'Ces routes sont appelées par le SDK mais absentes du spec :\n'
          '${manquantes.join('\n')}',
    );
  });
}
