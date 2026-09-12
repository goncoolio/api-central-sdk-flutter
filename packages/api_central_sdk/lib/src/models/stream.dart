import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_info.dart';

part 'stream.freezed.dart';
part 'stream.g.dart';

/// Cycle de vie d'un direct.
enum StreamStatus {
  @JsonValue('scheduled')
  scheduled,
  @JsonValue('live')
  live,
  @JsonValue('paused')
  paused,
  @JsonValue('ended')
  ended,
  @JsonValue('archived')
  archived,
}

/// Direct.
///
/// `streamKey` et `rtmpUrl` ne sont renseignés que pour l'hôte ou un token
/// d'application : l'API les masque aux spectateurs.
@freezed
abstract class LiveStream with _$LiveStream {
  const factory LiveStream({
    required String id,
    required UserInfo host,
    required String title,
    required StreamStatus status,
    String? description,
    String? thumbnailUrl,
    String? streamKey,
    String? rtmpUrl,
    String? playbackUrl,
    @Default(0) int viewerCount,
    @Default(0) int peakViewerCount,
    @Default(0) int totalReactions,
    @Default(0) int totalComments,
    DateTime? scheduledAt,
    DateTime? startedAt,
    DateTime? endedAt,
    DateTime? createdAt,
  }) = _LiveStream;

  factory LiveStream.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamFromJson(json);
}

/// Commentaire posté pendant un direct.
@freezed
abstract class StreamComment with _$StreamComment {
  const factory StreamComment({
    required String id,
    required String streamId,
    required UserInfo user,
    required String content,
    @Default(false) bool isPinned,
    @Default(false) bool isHighlighted,
    DateTime? createdAt,
  }) = _StreamComment;

  factory StreamComment.fromJson(Map<String, dynamic> json) =>
      _$StreamCommentFromJson(json);
}

/// Nombre de réactions pour un emoji donné.
@freezed
abstract class ReactionCount with _$ReactionCount {
  const factory ReactionCount({
    required String emoji,
    @Default(0) int count,
  }) = _ReactionCount;

  factory ReactionCount.fromJson(Map<String, dynamic> json) =>
      _$ReactionCountFromJson(json);
}

/// Statistiques d'un direct.
@freezed
abstract class StreamStats with _$StreamStats {
  const factory StreamStats({
    required String streamId,
    @Default(0) int viewerCount,
    @Default(0) int peakViewerCount,
    @Default(0) int totalComments,
    @Default(0) int totalReactions,
    @Default(<ReactionCount>[]) List<ReactionCount> reactionsByEmoji,
    int? durationSeconds,
  }) = _StreamStats;

  factory StreamStats.fromJson(Map<String, dynamic> json) =>
      _$StreamStatsFromJson(json);
}

/// Spectateurs d'un direct, avec leur nombre.
@freezed
abstract class StreamViewers with _$StreamViewers {
  const factory StreamViewers({
    required String streamId,
    @Default(0) int viewerCount,
    @Default(<UserInfo>[]) List<UserInfo> viewers,
  }) = _StreamViewers;

  factory StreamViewers.fromJson(Map<String, dynamic> json) =>
      _$StreamViewersFromJson(json);
}

/// Compteur renvoyé au join et au leave d'un direct.
@freezed
abstract class StreamViewerCount with _$StreamViewerCount {
  const factory StreamViewerCount({
    required String streamId,
    @Default(0) int viewerCount,
  }) = _StreamViewerCount;

  factory StreamViewerCount.fromJson(Map<String, dynamic> json) =>
      _$StreamViewerCountFromJson(json);
}

/// Résultat d'un envoi de réaction.
///
/// Les réactions sont limitées à une par utilisateur toutes les 200 ms :
/// [accepted] vaut `false` quand la limite est atteinte, et [retryAfterMs]
/// indique alors le délai à respecter avant de réessayer.
@freezed
abstract class ReactionResult with _$ReactionResult {
  const factory ReactionResult({
    @Default(false) bool accepted,
    String? message,

    /// Délai à respecter avant un nouvel envoi, en millisecondes.
    ///
    /// Renseigné seulement quand l'API refuse la réaction ; `null` sinon.
    int? retryAfterMs,
  }) = _ReactionResult;

  factory ReactionResult.fromJson(Map<String, dynamic> json) =>
      _$ReactionResultFromJson(json);
}
