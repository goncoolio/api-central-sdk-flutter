// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PresenceResponse _$PresenceResponseFromJson(Map<String, dynamic> json) =>
    _PresenceResponse(
      userId: json['userId'] as String,
      status: json['status'] as String,
      lastSeenAt: json['lastSeenAt'] as String?,
    );

Map<String, dynamic> _$PresenceResponseToJson(_PresenceResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': instance.status,
      'lastSeenAt': instance.lastSeenAt,
    };

_PresenceStatusItem _$PresenceStatusItemFromJson(Map<String, dynamic> json) =>
    _PresenceStatusItem(
      userId: json['userId'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PresenceStatusItemToJson(_PresenceStatusItem instance) =>
    <String, dynamic>{'userId': instance.userId, 'status': instance.status};
