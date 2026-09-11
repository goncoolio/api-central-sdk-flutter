## 0.2.0

- **Jeton LiveKit.** `calls.getLiveKitToken(callId)` (`GET /calls/{id}/token`)
  renvoie un `LiveKitToken` : `url`, `token`, `room` (`call:<id>`) et
  `identity`. Se connecter toujours à l'`url` renvoyée, jamais à une URL codée
  en dur. `toString` masque le jeton. Erreurs : 400 sans token utilisateur ou
  sans LiveKit configuré, 403 pour un non-participant, 404 pour un appel
  inconnu.
- **Événements temps réel typés.** `presence_status`, la réponse à
  `subscribePresence`, devient `PresenceStatusEvent` : une liste de
  `PresenceStatusItem`, sur le flux `onPresenceStatus`. `stats` devient
  `StatsEvent`, sur `onStats`, demandé par `requestStats()` et réservé aux
  tokens d'application.
- **Réglages des directs.** `live.createStream` et `live.updateStream`
  transmettent `settings`, un objet JSON libre. À la mise à jour, il remplace
  les réglages existants en entier.
- Documentation : `subscribePresence` n'enregistre aucun abonnement côté
  serveur, et l'API n'émet pas encore `presence_update`.

## 0.1.0

- Client HTTP (Dio) : `TokenProvider` mis en cache avec refresh mutualisé,
  conversion camelCase/snake_case, exceptions typées, timeouts adaptés.
- Modules `users`, `messaging`, `notifications`, `support`, `live`, `calls`
  (signalisation) et `encryption` (clés publiques E2E), vérifiés par un test de
  contrat contre le spec OpenAPI de l'API.
- Temps réel : WebSocket avec heartbeat, reconnexion, file d'attente et re-join
  automatique des rooms ; événements typés en sealed class, dont l'accusé de
  remise des messages (`message_delivered`).
- `ApiCentralServer` (`package:api_central_sdk/server.dart`), pour un backend
  qui détient `api_key` et `api_secret`.
