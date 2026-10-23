## Non publié

### Nouveautés

- **`MessageNewEvent.replyToId`** et **`MessageUpdatedEvent.replyToId`** :
  identifiant du message auquel celui-ci répond, que l'API envoie dans
  `message_new` et `message_updated` (`reply_to_id`, omis quand le message ne
  répond à rien, `null` côté SDK). Seul l'identifiant voyage ; l'aperçu se
  retrouve dans l'historique local ou via le REST.
- **`MessageNewEvent.clientMessageId`** et
  **`MessageUpdatedEvent.clientMessageId`** : écho de la clé fournie à l'envoi,
  que l'API transmettait déjà et que le SDK jetait.

### Documentation

- `Message.replyTo` est un aperçu d'un seul niveau sur toutes les routes (le
  commentaire annonçait la chaîne complète pour `getMessage` et `sendMessage`).
  Contenu et pièces jointes arrivent vides si la cible a été supprimée.
- `sendMessage` documente `replyToId`, déjà transmis en `reply_to_id`, et le
  400 de l'API pour une cible absente, supprimée ou d'une autre conversation.

## 0.3.0

### Changements incompatibles

- **`live.listStreams` n'accepte plus `hostId`** : l'API ne lit que le statut et
  la pagination, et ignorait ce filtre. Seuls `status`, `page` et `limit` sont
  désormais transmis.
- **Les bascules média renvoient l'état appliqué par l'API** au lieu de `void` :
  `calls.setMuted`, `calls.setVideoEnabled` et `calls.setScreenSharing`
  renvoient un `bool` (`muted`, `video_enabled`, `screen_sharing` côté API).
  Un serveur qui n'a pas ce champ fait retomber le SDK sur la valeur demandée.
  Le code qui se contentait d'attendre ces appels continue de compiler.

### Corrections

- **`ReactionResult.retryAfterMs`** expose le délai à respecter quand l'API
  refuse une réaction : elle renvoie `retry_after_ms` avec `accepted: false`,
  que le SDK jetait. `null` quand la réaction est acceptée.

### Documentation

- Le README décrit ce que borne un token utilisateur côté API : membership
  exigée en messagerie (403 hors participants, 404 hors application),
  notifications réduites à celles de l'appelant, présence limitée à
  `online`/`offline` et filtrée par application, `email` et `metadata` masqués
  dans l'annuaire pour les autres utilisateurs.

## 0.3.0

Alignement du SDK sur ce que fait réellement l'API, module par module.

### Changements incompatibles

- **`calls.answer`, `calls.decline`, `calls.end` et `calls.leave` ne prennent
  plus `userId`** : ces routes ne lisent aucun corps, l'API prend l'acteur dans
  le token utilisateur (400 avec un token d'application). Le `userId` transmis
  jusqu'ici était purement décoratif.
- **`messaging.listConversations` et `messaging.getConversation` exigent
  `userId`** : l'API le réclame en paramètre de requête et répondait 400 sans
  lui, là où la signature du SDK le présentait comme facultatif.
- **`messaging.addParticipant` exige `actorId`** (422 sans lui côté API) et
  **`messaging.removeParticipant` aussi**, transmis en paramètre de requête
  (400 sans lui). L'acteur doit être administrateur de la conversation.
- **`Message.attachments` devient `List<Attachment>?`** au lieu de
  `Map<String, dynamic>?` : l'API renvoie toujours un tableau — vide quand il
  n'y a pas de pièce jointe. Le type précédent faisait lever un `TypeError` à
  la lecture de tout message relu depuis la base.
- **`support.createCategory`, `support.updateCategory` et
  `support.createArticle` exigent `slug`**, obligatoire côté API (422 sinon).
  `support.updateCategory` exige aussi `name` et n'expose plus d'indicateur
  d'activation, que l'API ne lit pas sur cette route.
- **`support.assignTicket` accepte `null`** pour retirer l'affectation d'un
  ticket, ce que l'API permet.
- **`live.listStreams` n'accepte plus `hostId`** : l'API ne lit que le statut et
  la pagination, et ignorait ce filtre.
- **`live.getViewers` n'accepte plus `page`** : l'API tire les spectateurs au
  hasard (`SRANDMEMBER`) et n'honore que `limit` — deux appels peuvent renvoyer
  des spectateurs différents. `StreamViewers.viewerCount` reste le total exact.
- **Les bascules média renvoient l'état appliqué par l'API** au lieu de `void` :
  `calls.setMuted`, `calls.setVideoEnabled` et `calls.setScreenSharing`
  renvoient un `bool`. Un serveur qui n'a pas ce champ fait retomber le SDK sur
  la valeur demandée, et le code qui se contentait d'attendre ces appels
  continue de compiler.

### Nouveautés

- **`messaging.updateParticipantSettings`** (`PUT
  …/participants/{userId}/settings`) : coupe une conversation pour un
  participant et règle sa préférence de notification (`NotificationPreference`,
  nouveau). La route existait côté API sans équivalent dans le SDK. Renvoie le
  nouveau modèle `ParticipantSettings`.
- **`messaging.sendMessage` transmet `mentions`** : sans lui, les participants
  réglés sur `NotificationPreference.mentions` ne recevaient jamais de
  notification.
- **`Message.readBy`** : identifiants des utilisateurs qui ont lu le message,
  renvoyés par l'API et jusqu'ici jetés. Permet de reconstruire les accusés de
  lecture d'un groupe après une reconnexion.
- **`ReactionResult.retryAfterMs`** : délai à respecter quand l'API refuse une
  réaction pour limite de débit.
- **`support.getArticle(incrementView: true)`** : compte la vue, ce que l'API
  proposait sans que le SDK le demande jamais.
- **`Ticket.updatedAt`**, **`support.updateStatus(note:)`** (conservée dans
  l'historique des statuts), **`metadata`** sur `createTicket` et
  `updateTicket`, **`createdById`** sur `createArticle`, **`slug`** et
  **`contentFormat`** sur `updateArticle`.
- **`live.listComments(page:)`** : l'API honore l'offset ; sans ce paramètre on
  restait bloqué sur la première page.

### Corrections

- **`messaging.updateConversation` ne lève plus sur une mise à jour réussie** :
  cette route renvoie le modèle de domaine, où la nature de la conversation
  arrive sous `conversationType` et non `type` comme partout ailleurs. La
  conversation renvoyée ne porte ni participants, ni dernier message, ni
  compteur de non-lus.

### Documentation

- Le README décrit ce que borne un token utilisateur : membership exigée en
  messagerie (403 hors participants, 404 hors application), notifications
  réduites à celles de l'appelant, présence limitée à `online`/`offline` et
  filtrée par application, `email` et `metadata` masqués dans l'annuaire pour
  les autres utilisateurs.
- `users.create` est un upsert sur `(application, externalUserId)` : un second
  appel met à jour et renvoie l'utilisateur existant, sans conflit.
- `users.updatePresence` ne conserve pas le statut envoyé ; `users.getPresence`
  le dérive des connexions WebSocket.
- `support.updateCategory` **crée** une nouvelle catégorie côté API au lieu de
  modifier l'existante : à réserver aux outils d'administration, en attendant
  une vraie mise à jour côté serveur.

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
