// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiveStream _$LiveStreamFromJson(Map<String, dynamic> json) => _LiveStream(
  id: json['id'] as String,
  host: UserInfo.fromJson(json['host'] as Map<String, dynamic>),
  title: json['title'] as String,
  status: $enumDecode(_$StreamStatusEnumMap, json['status']),
  description: json['description'] as String?,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  streamKey: json['streamKey'] as String?,
  rtmpUrl: json['rtmpUrl'] as String?,
  playbackUrl: json['playbackUrl'] as String?,
  viewerCount: (json['viewerCount'] as num?)?.toInt() ?? 0,
  peakViewerCount: (json['peakViewerCount'] as num?)?.toInt() ?? 0,
  totalReactions: (json['totalReactions'] as num?)?.toInt() ?? 0,
  totalComments: (json['totalComments'] as num?)?.toInt() ?? 0,
  scheduledAt: json['scheduledAt'] == null
      ? null
      : DateTime.parse(json['scheduledAt'] as String),
  startedAt: json['startedAt'] == null
      ? null
      : DateTime.parse(json['startedAt'] as String),
  endedAt: json['endedAt'] == null
      ? null
      : DateTime.parse(json['endedAt'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$LiveStreamToJson(_LiveStream instance) =>
    <String, dynamic>{
      'id': instance.id,
      'host': instance.host.toJson(),
      'title': instance.title,
      'status': _$StreamStatusEnumMap[instance.status]!,
      'description': instance.description,
      'thumbnailUrl': instance.thumbnailUrl,
      'streamKey': instance.streamKey,
      'rtmpUrl': instance.rtmpUrl,
      'playbackUrl': instance.playbackUrl,
      'viewerCount': instance.viewerCount,
      'peakViewerCount': instance.peakViewerCount,
      'totalReactions': instance.totalReactions,
      'totalComments': instance.totalComments,
      'scheduledAt': instance.scheduledAt?.toIso8601String(),
      'startedAt': instance.startedAt?.toIso8601String(),
      'endedAt': instance.endedAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$StreamStatusEnumMap = {
  StreamStatus.scheduled: 'scheduled',
  StreamStatus.live: 'live',
  StreamStatus.paused: 'paused',
  StreamStatus.ended: 'ended',
  StreamStatus.archived: 'archived',
};

_StreamComment _$StreamCommentFromJson(Map<String, dynamic> json) =>
    _StreamComment(
      id: json['id'] as String,
      streamId: json['streamId'] as String,
      user: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
      content: json['content'] as String,
      isPinned: json['isPinned'] as bool? ?? false,
      isHighlighted: json['isHighlighted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$StreamCommentToJson(_StreamComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'streamId': instance.streamId,
      'user': instance.user.toJson(),
      'content': instance.content,
      'isPinned': instance.isPinned,
      'isHighlighted': instance.isHighlighted,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_ReactionCount _$ReactionCountFromJson(Map<String, dynamic> json) =>
    _ReactionCount(
      emoji: json['emoji'] as String,
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ReactionCountToJson(_ReactionCount instance) =>
    <String, dynamic>{'emoji': instance.emoji, 'count': instance.count};

_StreamStats _$StreamStatsFromJson(Map<String, dynamic> json) => _StreamStats(
  streamId: json['streamId'] as String,
  viewerCount: (json['viewerCount'] as num?)?.toInt() ?? 0,
  peakViewerCount: (json['peakViewerCount'] as num?)?.toInt() ?? 0,
  totalComments: (json['totalComments'] as num?)?.toInt() ?? 0,
  totalReactions: (json['totalReactions'] as num?)?.toInt() ?? 0,
  reactionsByEmoji:
      (json['reactionsByEmoji'] as List<dynamic>?)
          ?.map((e) => ReactionCount.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ReactionCount>[],
  durationSeconds: (json['durationSeconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$StreamStatsToJson(
  _StreamStats instance,
) => <String, dynamic>{
  'streamId': instance.streamId,
  'viewerCount': instance.viewerCount,
  'peakViewerCount': instance.peakViewerCount,
  'totalComments': instance.totalComments,
  'totalReactions': instance.totalReactions,
  'reactionsByEmoji': instance.reactionsByEmoji.map((e) => e.toJson()).toList(),
  'durationSeconds': instance.durationSeconds,
};

_StreamViewers _$StreamViewersFromJson(Map<String, dynamic> json) =>
    _StreamViewers(
      streamId: json['streamId'] as String,
      viewerCount: (json['viewerCount'] as num?)?.toInt() ?? 0,
      viewers:
          (json['viewers'] as List<dynamic>?)
              ?.map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <UserInfo>[],
    );

Map<String, dynamic> _$StreamViewersToJson(_StreamViewers instance) =>
    <String, dynamic>{
      'streamId': instance.streamId,
      'viewerCount': instance.viewerCount,
      'viewers': instance.viewers.map((e) => e.toJson()).toList(),
    };

_StreamViewerCount _$StreamViewerCountFromJson(Map<String, dynamic> json) =>
    _StreamViewerCount(
      streamId: json['streamId'] as String,
      viewerCount: (json['viewerCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$StreamViewerCountToJson(_StreamViewerCount instance) =>
    <String, dynamic>{
      'streamId': instance.streamId,
      'viewerCount': instance.viewerCount,
    };

_ReactionResult _$ReactionResultFromJson(Map<String, dynamic> json) =>
    _ReactionResult(
      accepted: json['accepted'] as bool? ?? false,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ReactionResultToJson(_ReactionResult instance) =>
    <String, dynamic>{
      'accepted': instance.accepted,
      'message': instance.message,
    };
