// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDevice _$UserDeviceFromJson(Map<String, dynamic> json) => _UserDevice(
  id: json['id'] as String,
  userId: json['userId'] as String,
  deviceToken: json['deviceToken'] as String,
  platform: $enumDecode(_$DevicePlatformEnumMap, json['platform']),
  deviceInfo: json['deviceInfo'] as Map<String, dynamic>?,
  isActive: json['isActive'] as bool? ?? true,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserDeviceToJson(_UserDevice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'deviceToken': instance.deviceToken,
      'platform': _$DevicePlatformEnumMap[instance.platform]!,
      'deviceInfo': instance.deviceInfo,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$DevicePlatformEnumMap = {
  DevicePlatform.ios: 'ios',
  DevicePlatform.android: 'android',
  DevicePlatform.web: 'web',
};
