// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CallParticipant _$CallParticipantFromJson(Map<String, dynamic> json) =>
    _CallParticipant(
      id: json['id'] as String,
      user: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
      status: $enumDecode(_$ParticipantCallStatusEnumMap, json['status']),
      role: $enumDecodeNullable(_$ParticipantRoleEnumMap, json['role']),
      isMuted: json['isMuted'] as bool? ?? false,
      isVideoEnabled: json['isVideoEnabled'] as bool? ?? false,
      isScreenSharing: json['isScreenSharing'] as bool? ?? false,
      joinedAt: json['joinedAt'] == null
          ? null
          : DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$CallParticipantToJson(_CallParticipant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user.toJson(),
      'status': _$ParticipantCallStatusEnumMap[instance.status]!,
      'role': _$ParticipantRoleEnumMap[instance.role],
      'isMuted': instance.isMuted,
      'isVideoEnabled': instance.isVideoEnabled,
      'isScreenSharing': instance.isScreenSharing,
      'joinedAt': instance.joinedAt?.toIso8601String(),
    };

const _$ParticipantCallStatusEnumMap = {
  ParticipantCallStatus.invited: 'invited',
  ParticipantCallStatus.ringing: 'ringing',
  ParticipantCallStatus.joined: 'joined',
  ParticipantCallStatus.onHold: 'on_hold',
  ParticipantCallStatus.left: 'left',
  ParticipantCallStatus.declined: 'declined',
  ParticipantCallStatus.missed: 'missed',
};

const _$ParticipantRoleEnumMap = {
  ParticipantRole.admin: 'admin',
  ParticipantRole.member: 'member',
  ParticipantRole.readonly: 'readonly',
};

_Call _$CallFromJson(Map<String, dynamic> json) => _Call(
  id: json['id'] as String,
  initiator: UserInfo.fromJson(json['initiator'] as Map<String, dynamic>),
  callType: $enumDecode(_$CallTypeEnumMap, json['callType']),
  status: $enumDecode(_$CallStatusEnumMap, json['status']),
  conversationId: json['conversationId'] as String?,
  participants:
      (json['participants'] as List<dynamic>?)
          ?.map((e) => CallParticipant.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CallParticipant>[],
  participantCount: (json['participantCount'] as num?)?.toInt() ?? 0,
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  encryptionEnabled: json['encryptionEnabled'] as bool? ?? false,
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  connectedAt: json['connectedAt'] == null
      ? null
      : DateTime.parse(json['connectedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$CallToJson(_Call instance) => <String, dynamic>{
  'id': instance.id,
  'initiator': instance.initiator.toJson(),
  'callType': _$CallTypeEnumMap[instance.callType]!,
  'status': _$CallStatusEnumMap[instance.status]!,
  'conversationId': instance.conversationId,
  'participants': instance.participants.map((e) => e.toJson()).toList(),
  'participantCount': instance.participantCount,
  'durationSeconds': instance.durationSeconds,
  'encryptionEnabled': instance.encryptionEnabled,
  'startedAt': instance.startedAt?.toIso8601String(),
  'connectedAt': instance.connectedAt?.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$CallTypeEnumMap = {
  CallType.audio: 'audio',
  CallType.video: 'video',
  CallType.screenShare: 'screen_share',
};

const _$CallStatusEnumMap = {
  CallStatus.initiating: 'initiating',
  CallStatus.ringing: 'ringing',
  CallStatus.connected: 'connected',
  CallStatus.onHold: 'on_hold',
  CallStatus.ended: 'ended',
  CallStatus.failed: 'failed',
};

_CallInfo _$CallInfoFromJson(Map<String, dynamic> json) => _CallInfo(
  id: json['id'] as String,
  callType: $enumDecode(_$CallTypeEnumMap, json['callType']),
  status: $enumDecode(_$CallStatusEnumMap, json['status']),
  conversationId: json['conversationId'] as String?,
  initiatorId: json['initiatorId'] as String?,
  participantCount: (json['participantCount'] as num?)?.toInt() ?? 0,
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
  encryptionEnabled: json['encryptionEnabled'] as bool? ?? false,
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  connectedAt: json['connectedAt'] == null
      ? null
      : DateTime.parse(json['connectedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
);

Map<String, dynamic> _$CallInfoToJson(_CallInfo instance) => <String, dynamic>{
  'id': instance.id,
  'callType': _$CallTypeEnumMap[instance.callType]!,
  'status': _$CallStatusEnumMap[instance.status]!,
  'conversationId': instance.conversationId,
  'initiatorId': instance.initiatorId,
  'participantCount': instance.participantCount,
  'durationSeconds': instance.durationSeconds,
  'encryptionEnabled': instance.encryptionEnabled,
  'startedAt': instance.startedAt?.toIso8601String(),
  'connectedAt': instance.connectedAt?.toIso8601String(),
  'endedAt': instance.endedAt?.toIso8601String(),
};

_CallHistoryEntry _$CallHistoryEntryFromJson(Map<String, dynamic> json) =>
    _CallHistoryEntry(
      callInfo: CallInfo.fromJson(json['call'] as Map<String, dynamic>),
      otherParticipants:
          (json['otherParticipants'] as List<dynamic>?)
              ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UserInfo>[],
      yourStatus: $enumDecodeNullable(
        _$ParticipantCallStatusEnumMap,
        json['yourStatus'],
      ),
    );

Map<String, dynamic> _$CallHistoryEntryToJson(_CallHistoryEntry instance) =>
    <String, dynamic>{
      'call': instance.callInfo.toJson(),
      'otherParticipants': instance.otherParticipants
          .map((e) => e.toJson())
          .toList(),
      'yourStatus': _$ParticipantCallStatusEnumMap[instance.yourStatus],
    };

_CallHistory _$CallHistoryFromJson(Map<String, dynamic> json) => _CallHistory(
  calls:
      (json['calls'] as List<dynamic>?)
          ?.map((e) => CallHistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CallHistoryEntry>[],
  total: (json['total'] as num?)?.toInt() ?? 0,
  hasMore: json['hasMore'] as bool? ?? false,
);

Map<String, dynamic> _$CallHistoryToJson(_CallHistory instance) =>
    <String, dynamic>{
      'calls': instance.calls.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'hasMore': instance.hasMore,
    };

_IceServer _$IceServerFromJson(Map<String, dynamic> json) => _IceServer(
  urls: _urlsDepuisJson(json['urls']),
  username: json['username'] as String?,
  credential: json['credential'] as String?,
);

Map<String, dynamic> _$IceServerToJson(_IceServer instance) =>
    <String, dynamic>{
      'urls': instance.urls,
      'username': instance.username,
      'credential': instance.credential,
    };

_IceServersResponse _$IceServersResponseFromJson(Map<String, dynamic> json) =>
    _IceServersResponse(
      iceServers:
          (json['iceServers'] as List<dynamic>?)
              ?.map((e) => IceServer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <IceServer>[],
      callId: json['callId'] as String?,
      ttl: (json['ttl'] as num?)?.toInt() ?? 86400,
    );

Map<String, dynamic> _$IceServersResponseToJson(_IceServersResponse instance) =>
    <String, dynamic>{
      'iceServers': instance.iceServers.map((e) => e.toJson()).toList(),
      'callId': instance.callId,
      'ttl': instance.ttl,
    };

_LiveKitToken _$LiveKitTokenFromJson(Map<String, dynamic> json) =>
    _LiveKitToken(
      url: json['url'] as String,
      token: json['token'] as String,
      room: json['room'] as String,
      identity: json['identity'] as String,
    );

Map<String, dynamic> _$LiveKitTokenToJson(_LiveKitToken instance) =>
    <String, dynamic>{
      'url': instance.url,
      'token': instance.token,
      'room': instance.room,
      'identity': instance.identity,
    };
