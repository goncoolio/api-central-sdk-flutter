## 0.2.0

* `MessagesNotifier.send(content, replyToId:)` envoie une réponse : le message
  ajouté porte l'aperçu du message cité dans `replyTo`. Sans `replyToId`,
  l'appel reste celui d'avant.
* `MessagesNotifier` : une réponse reçue en temps réel (`message_new` avec
  `replyToId`) reprend l'aperçu du message cité depuis la liste chargée, sur un
  seul niveau ; un message cité absent de la liste donne un aperçu vide qui ne
  garde que son identifiant. `clientMessageId` est aussi recopié.

## 0.0.1

* TODO: Describe initial release.
