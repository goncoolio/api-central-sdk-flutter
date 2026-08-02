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

  Future<User> get(String userId) async {
    final json = await _client.get<Map<String, dynamic>>('/users/$userId');
    return User.fromJson(json);
  }

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

  /// `status` est libre : `online`, `offline`, `away` sont les valeurs usuelles.
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

  Future<PresenceResponse> getPresence(String userId) async {
    final json =
        await _client.get<Map<String, dynamic>>('/users/$userId/presence');
    return PresenceResponse.fromJson(json);
  }
}
