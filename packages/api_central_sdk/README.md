# api_central_sdk

SDK Dart pur pour l'API Central S2S : authentification par `TokenProvider`,
utilisateurs, messagerie, notifications, support, directs, signalisation des
appels, clés de chiffrement et temps réel (WebSocket). Il tourne dans Flutter
comme en Dart hors Flutter.

Les autres packages du dépôt s'appuient sur lui : `api_central_calls` pour le
média des appels, `api_central_encryption` pour le chiffrement,
`api_central_provider` pour l'état prêt à brancher.

## Démarrer

```dart
final sdk = ApiCentral(
  config: const ApiCentralConfig(
    baseUrl: 'https://api.example.com/s2s/v1',
    wsUrl: 'wss://api.example.com/events',
    applicationId: 'id-de-votre-application',
  ),
  // Le token vient du backend de l'application : api_key et api_secret n'y
  // sont jamais embarqués.
  tokenProvider: () => monBackend.tokenApiCentral(),
);
```

| Module | Rôle |
|---|---|
| `sdk.users` | utilisateurs, appareils et présence |
| `sdk.messaging` | conversations, messages et réactions |
| `sdk.notifications` | notifications push et in-app |
| `sdk.support` | tickets et base de connaissances |
| `sdk.live` | directs : cycle de vie, spectateurs, commentaires, réactions |
| `sdk.calls` | appels : cycle de vie, participants, signalisation WebRTC, jeton LiveKit |
| `sdk.encryption` | clés publiques du chiffrement de bout en bout |
| `sdk.realtime` | WebSocket, après `connectRealtime()` |

Les erreurs de l'API arrivent en exceptions typées, sous-classes de
`ApiCentralException` : `UnauthorizedException`, `ForbiddenException`,
`NotFoundException`, `ConflictException`, `ValidationException`,
`RateLimitException`, `ServerException` et `NetworkException`.

## Temps réel

```dart
final realtime = await sdk.connectRealtime();

realtime.onPresenceStatus.listen((event) {
  for (final statut in event.statuses) {
    // statut.userId, statut.status
  }
});
realtime.subscribePresence([bob, carol]);

realtime.onStats.listen((stats) => print(stats.usersOnline));
realtime.requestStats();
```

- `subscribePresence` obtient **une** réponse, `presence_status`, avec un
  statut par utilisateur demandé : il n'enregistre aucun abonnement côté
  serveur, et l'API n'émet pas encore `presence_update`. Rappelez-le pour
  rafraîchir les statuts.
- `requestStats` n'obtient de réponse qu'avec un token d'application.

## Appels et directs

- `calls` ne manipule aucun média : `api_central_calls` s'en charge.
  `calls.getLiveKitToken(callId)` renvoie l'URL du SFU et le jeton d'un appel de
  groupe ; se connecter toujours à cette URL. Son `toString` masque le jeton.
- `live.createStream` et `live.updateStream` acceptent `settings`, un objet JSON
  libre. À la mise à jour, il remplace les réglages existants en entier.
- `rtmpUrl` et `playbackUrl` sont des chaînes opaques : l'hôte publie avec
  l'`rtmpUrl` exacte, sans la reconstruire depuis `streamKey`. Le README à la
  racine du dépôt décrit le parcours complet.

## Tests

```bash
dart pub get
dart test -x integration   # unitaires et contrat, sans serveur
dart analyze
```

Les tests d'intégration (`test/integration/`, tag `integration`) demandent une
API locale sur `localhost:3004`, avec l'application de test déclarée en tête de
`realtime_live_test.dart` : `dart test -t integration`.
