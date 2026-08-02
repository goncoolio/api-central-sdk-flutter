// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      data: json['data'] as Map<String, dynamic>?,
      isRead: json['isRead'] as bool? ?? false,
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
      'isRead': instance.isRead,
      'readAt': instance.readAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_BulkSendResult _$BulkSendResultFromJson(Map<String, dynamic> json) =>
    _BulkSendResult(
      success: json['success'] as bool? ?? false,
      sentCount: (json['sentCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BulkSendResultToJson(_BulkSendResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'sentCount': instance.sentCount,
    };

_BroadcastResult _$BroadcastResultFromJson(Map<String, dynamic> json) =>
    _BroadcastResult(
      success: json['success'] as bool? ?? false,
      sentCount: (json['sentCount'] as num?)?.toInt() ?? 0,
      totalUsers: (json['totalUsers'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$BroadcastResultToJson(_BroadcastResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'sentCount': instance.sentCount,
      'totalUsers': instance.totalUsers,
    };

_MarkReadResult _$MarkReadResultFromJson(Map<String, dynamic> json) =>
    _MarkReadResult(
      success: json['success'] as bool? ?? false,
      updatedCount: (json['updatedCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MarkReadResultToJson(_MarkReadResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'updatedCount': instance.updatedCount,
    };
