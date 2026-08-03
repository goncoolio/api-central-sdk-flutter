import '../http/api_client.dart';
import '../models/encryption.dart';

/// Gestion des clés publiques pour le chiffrement de bout en bout.
///
/// Ce module ne chiffre rien : il ne fait que publier et récupérer du matériel
/// public. Les primitives vivent dans le package `api_central_encryption`, et
/// les clés privées ne quittent jamais l'application.
///
/// Quatre routes sur cinq prennent l'utilisateur du token et exigent donc un
/// token utilisateur.
class EncryptionModule {
  const EncryptionModule(this._client);

  final ApiClient _client;

  /// Publie le matériel public de l'utilisateur du token.
  ///
  /// À appeler à la première configuration du chiffrement, et à chaque
  /// réinstallation : les clés précédentes deviennent alors inutilisables.
  Future<void> registerKeys({
    required String identityKey,
    required int signedPrekeyId,
    required String signedPrekey,
    required String signedPrekeySignature,
    required List<PreKeyInfo> prekeys,
  }) =>
      _client.post<Map<String, dynamic>>(
        '/encryption/keys/register',
        body: {
          'identityKey': identityKey,
          'signedPrekeyId': signedPrekeyId,
          'signedPrekey': signedPrekey,
          'signedPrekeySignature': signedPrekeySignature,
          'prekeys': prekeys.map((p) => p.toJson()).toList(),
        },
      );

  /// Récupère le matériel public d'un pair pour ouvrir une session.
  ///
  /// **Consomme une prekey à usage unique** du pair : deux appels successifs
  /// renvoient des prekeys différentes, et le stock finit par s'épuiser.
  Future<PreKeyBundle> getPreKeyBundle(String userId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/encryption/keys/$userId');
    return PreKeyBundle.fromJson(json);
  }

  /// Réapprovisionne le stock de prekeys de l'utilisateur du token.
  ///
  /// À appeler quand [getPrekeysCount] passe sous une vingtaine.
  Future<void> uploadPrekeys(List<PreKeyInfo> prekeys) =>
      _client.post<Map<String, dynamic>>(
        '/encryption/keys/prekeys',
        body: {'prekeys': prekeys.map((p) => p.toJson()).toList()},
      );

  /// Remplace la clé signée de l'utilisateur du token.
  ///
  /// À faire tourner périodiquement — toutes les semaines à un mois selon la
  /// politique de l'application.
  Future<void> rotateSignedPrekey({
    required int signedPrekeyId,
    required String signedPrekey,
    required String signedPrekeySignature,
  }) =>
      _client.post<Map<String, dynamic>>(
        '/encryption/keys/rotate',
        body: {
          'signedPrekeyId': signedPrekeyId,
          'signedPrekey': signedPrekey,
          'signedPrekeySignature': signedPrekeySignature,
        },
      );

  /// Prekeys restantes pour l'utilisateur du token.
  Future<PreKeyCount> getPrekeysCount() async {
    final json = await _client
        .get<Map<String, dynamic>>('/encryption/keys/prekeys/count');
    return PreKeyCount.fromJson(json);
  }
}
