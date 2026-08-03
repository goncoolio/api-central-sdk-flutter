// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encryption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PreKeyInfo _$PreKeyInfoFromJson(Map<String, dynamic> json) => _PreKeyInfo(
  prekeyId: (json['prekeyId'] as num).toInt(),
  prekey: json['prekey'] as String,
);

Map<String, dynamic> _$PreKeyInfoToJson(_PreKeyInfo instance) =>
    <String, dynamic>{'prekeyId': instance.prekeyId, 'prekey': instance.prekey};

_PreKeyBundle _$PreKeyBundleFromJson(Map<String, dynamic> json) =>
    _PreKeyBundle(
      userId: json['userId'] as String,
      identityKey: json['identityKey'] as String,
      signedPrekeyId: (json['signedPrekeyId'] as num).toInt(),
      signedPrekey: json['signedPrekey'] as String,
      signedPrekeySignature: json['signedPrekeySignature'] as String,
      prekey: json['prekey'] == null
          ? null
          : PreKeyInfo.fromJson(json['prekey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreKeyBundleToJson(_PreKeyBundle instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'identityKey': instance.identityKey,
      'signedPrekeyId': instance.signedPrekeyId,
      'signedPrekey': instance.signedPrekey,
      'signedPrekeySignature': instance.signedPrekeySignature,
      'prekey': instance.prekey?.toJson(),
    };

_PreKeyCount _$PreKeyCountFromJson(Map<String, dynamic> json) => _PreKeyCount(
  userId: json['userId'] as String,
  availablePrekeys: (json['availablePrekeys'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$PreKeyCountToJson(_PreKeyCount instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'availablePrekeys': instance.availablePrekeys,
    };
