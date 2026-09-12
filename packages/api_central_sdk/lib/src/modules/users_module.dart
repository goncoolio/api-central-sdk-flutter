import '../http/api_client.dart';
import '../models/pagination.dart';
import '../models/presence.dart';
import '../models/user.dart';
import '../models/user_device.dart';

/// Gestion des utilisateurs, de leurs appareils et de leur présence.
///
/// La création et la suppression d'utilisateurs sont des opérations serveur :
/// une application mobile ne devrait les appeler que sur son propre compte.
class UsersModule {
  const UsersModule(this._client);

  final ApiClient _client;

  /// Enregistre un utilisateur, ou met à jour celui qui porte déjà cet
  /// `externalUserId`.
  ///
  /// L'API fait un upsert sur `(application, externalUserId)` : un second
  /// appel ne renvoie pas de conflit, il renvoie l'utilisateur existant après
  /// mise à jour des champs fournis — les champs omis sont conservés. Il n'y a
  /// donc pas moyen de détecter ici un compte déjà enregistré.
  ///
  /// `externalUserId` fait 1 à 255 caractères et doit être unique dans
  /// l'application.
  Future<User> create({
    required String externalUserId,
    String? displayName,
    String? email,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
  }) async {
    final json = await _client.post<Map<String, dynamic>>('/users', body: {
      'externalUserId': externalUserId,
      'displayName': ?displayName,
      'email': ?email,
      'avatarUrl': ?avatarUrl,
      'metadata': ?metadata,
    });
    return User.fromJson(json);
  }

  /// Annuaire de l'application.
  ///
  /// Avec un token utilisateur, `email` et `metadata` des autres utilisateurs
  /// arrivent à `null` : ils ne sont renseignés que pour l'utilisateur du
  /// token. Un token d'application voit l'annuaire complet.
  Future<PaginatedResponse<User>> list({int? page, int? limit}) async {
    final json = await _client.get<Map<String, dynamic>>('/users', query: {
      'page': ?page,
      'limit': ?limit,
    });
    return PaginatedResponse<User>.fromJson(
      json,
      (item) => User.fromJson(item! as Map<String, dynamic>),
    );
  }

  /// Utilisateur de l'application, par son identifiant interne.
  ///
  /// Comme [list], masque `email` et `metadata` des autres utilisateurs quand
  /// l'appel est fait avec un token utilisateur. Un utilisateur d'une autre
  /// application renvoie 404.
  Future<User> get(String userId) async {
    final json = await _client.get<Map<String, dynamic>>('/users/$userId');
    return User.fromJson(json);
  }

  /// Utilisateur de l'application, par l'identifiant de l'application cliente.
  ///
  /// Même masquage que [get] : avec un token utilisateur, `email` et
  /// `metadata` des autres comptes arrivent à `null`.
  Future<User> getByExternalId(String externalId) async {
    final json = await _client.get<Map<String, dynamic>>(
      '/users/by-external/${Uri.encodeComponent(externalId)}',
    );
    return User.fromJson(json);
  }

  Future<User> update(
    String userId, {
    String? displayName,
    String? email,
    String? avatarUrl,
    Map<String, dynamic>? metadata,
  }) async {
    final json =
        await _client.put<Map<String, dynamic>>('/users/$userId', body: {
      'displayName': ?displayName,
      'email': ?email,
      'avatarUrl': ?avatarUrl,
      'metadata': ?metadata,
    });
    return User.fromJson(json);
  }

  Future<void> delete(String userId) =>
      _client.delete<Map<String, dynamic>>('/users/$userId');

  Future<UserDevice> registerDevice(
    String userId, {
    required String deviceToken,
    required DevicePlatform platform,
    Map<String, dynamic>? deviceInfo,
  }) async {
    final json = await _client
        .post<Map<String, dynamic>>('/users/$userId/devices', body: {
      'deviceToken': deviceToken,
      'platform': platform.name,
      'deviceInfo': ?deviceInfo,
    });
    return UserDevice.fromJson(json);
  }

  Future<List<UserDevice>> listDevices(String userId) async {
    final json = await _client.get<List<dynamic>>('/users/$userId/devices');
    return json
        .map((e) => UserDevice.fromJson((e! as Map).cast<String, dynamic>()))
        .toList();
  }

  /// Le token d'appareil peut contenir des caractères à encoder.
  Future<void> removeDevice(String userId, String deviceToken) =>
      _client.delete<Map<String, dynamic>>(
        '/users/$userId/devices/${Uri.encodeComponent(deviceToken)}',
      );

  /// Signale une activité de l'utilisateur.
  ///
  /// L'API met à jour sa date de dernière activité et renvoie le `status`
  /// envoyé **sans le conserver** : la présence réelle est dérivée des
  /// connexions WebSocket, et [getPresence] ne renverra donc que `online` ou
  /// `offline`. Ne vous attendez pas à relire ici le statut que vous écrivez.
  Future<PresenceResponse> updatePresence(
    String userId, {
    required String status,
  }) async {
    final json = await _client.put<Map<String, dynamic>>(
      '/users/$userId/presence',
      body: {'status': status},
    );
    return PresenceResponse.fromJson(json);
  }

  /// Présence d'un utilisateur : `online` tant qu'il a une connexion temps
  /// réel ouverte, `offline` sinon.
  ///
  /// Un utilisateur d'une autre application renvoie 404.
  Future<PresenceResponse> getPresence(String userId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/users/$userId/presence');
    return PresenceResponse.fromJson(json);
  }
}
