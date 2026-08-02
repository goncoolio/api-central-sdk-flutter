import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_device.freezed.dart';
part 'user_device.g.dart';

/// Plateforme d'un appareil enregistré pour les notifications push.
enum DevicePlatform {
  @JsonValue('ios')
  ios,
  @JsonValue('android')
  android,
  @JsonValue('web')
  web,
}

/// Appareil enregistré pour recevoir les notifications push.
@freezed
abstract class UserDevice with _$UserDevice {
  const factory UserDevice({
    required String id,
    required String userId,
    required String deviceToken,
    required DevicePlatform platform,
    Map<String, dynamic>? deviceInfo,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserDevice;

  factory UserDevice.fromJson(Map<String, dynamic> json) =>
      _$UserDeviceFromJson(json);
}
