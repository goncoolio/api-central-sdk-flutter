// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stream.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveStream {

 String get id; UserInfo get host; String get title; StreamStatus get status; String? get description; String? get thumbnailUrl; String? get streamKey; String? get rtmpUrl; String? get playbackUrl; int get viewerCount; int get peakViewerCount; int get totalReactions; int get totalComments; DateTime? get scheduledAt; DateTime? get startedAt; DateTime? get endedAt; DateTime? get createdAt;
/// Create a copy of LiveStream
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveStreamCopyWith<LiveStream> get copyWith => _$LiveStreamCopyWithImpl<LiveStream>(this as LiveStream, _$identity);

  /// Serializes this LiveStream to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveStream&&(identical(other.id, id) || other.id == id)&&(identical(other.host, host) || other.host == host)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.streamKey, streamKey) || other.streamKey == streamKey)&&(identical(other.rtmpUrl, rtmpUrl) || other.rtmpUrl == rtmpUrl)&&(identical(other.playbackUrl, playbackUrl) || other.playbackUrl == playbackUrl)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.peakViewerCount, peakViewerCount) || other.peakViewerCount == peakViewerCount)&&(identical(other.totalReactions, totalReactions) || other.totalReactions == totalReactions)&&(identical(other.totalComments, totalComments) || other.totalComments == totalComments)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,host,title,status,description,thumbnailUrl,streamKey,rtmpUrl,playbackUrl,viewerCount,peakViewerCount,totalReactions,totalComments,scheduledAt,startedAt,endedAt,createdAt);

@override
String toString() {
  return 'LiveStream(id: $id, host: $host, title: $title, status: $status, description: $description, thumbnailUrl: $thumbnailUrl, streamKey: $streamKey, rtmpUrl: $rtmpUrl, playbackUrl: $playbackUrl, viewerCount: $viewerCount, peakViewerCount: $peakViewerCount, totalReactions: $totalReactions, totalComments: $totalComments, scheduledAt: $scheduledAt, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $LiveStreamCopyWith<$Res>  {
  factory $LiveStreamCopyWith(LiveStream value, $Res Function(LiveStream) _then) = _$LiveStreamCopyWithImpl;
@useResult
$Res call({
 String id, UserInfo host, String title, StreamStatus status, String? description, String? thumbnailUrl, String? streamKey, String? rtmpUrl, String? playbackUrl, int viewerCount, int peakViewerCount, int totalReactions, int totalComments, DateTime? scheduledAt, DateTime? startedAt, DateTime? endedAt, DateTime? createdAt
});


$UserInfoCopyWith<$Res> get host;

}
/// @nodoc
class _$LiveStreamCopyWithImpl<$Res>
    implements $LiveStreamCopyWith<$Res> {
  _$LiveStreamCopyWithImpl(this._self, this._then);

  final LiveStream _self;
  final $Res Function(LiveStream) _then;

/// Create a copy of LiveStream
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? host = null,Object? title = null,Object? status = null,Object? description = freezed,Object? thumbnailUrl = freezed,Object? streamKey = freezed,Object? rtmpUrl = freezed,Object? playbackUrl = freezed,Object? viewerCount = null,Object? peakViewerCount = null,Object? totalReactions = null,Object? totalComments = null,Object? scheduledAt = freezed,Object? startedAt = freezed,Object? endedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as UserInfo,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StreamStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,streamKey: freezed == streamKey ? _self.streamKey : streamKey // ignore: cast_nullable_to_non_nullable
as String?,rtmpUrl: freezed == rtmpUrl ? _self.rtmpUrl : rtmpUrl // ignore: cast_nullable_to_non_nullable
as String?,playbackUrl: freezed == playbackUrl ? _self.playbackUrl : playbackUrl // ignore: cast_nullable_to_non_nullable
as String?,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,peakViewerCount: null == peakViewerCount ? _self.peakViewerCount : peakViewerCount // ignore: cast_nullable_to_non_nullable
as int,totalReactions: null == totalReactions ? _self.totalReactions : totalReactions // ignore: cast_nullable_to_non_nullable
as int,totalComments: null == totalComments ? _self.totalComments : totalComments // ignore: cast_nullable_to_non_nullable
as int,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of LiveStream
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get host {
  
  return $UserInfoCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveStream].
extension LiveStreamPatterns on LiveStream {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveStream value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveStream() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveStream value)  $default,){
final _that = this;
switch (_that) {
case _LiveStream():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveStream value)?  $default,){
final _that = this;
switch (_that) {
case _LiveStream() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserInfo host,  String title,  StreamStatus status,  String? description,  String? thumbnailUrl,  String? streamKey,  String? rtmpUrl,  String? playbackUrl,  int viewerCount,  int peakViewerCount,  int totalReactions,  int totalComments,  DateTime? scheduledAt,  DateTime? startedAt,  DateTime? endedAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveStream() when $default != null:
return $default(_that.id,_that.host,_that.title,_that.status,_that.description,_that.thumbnailUrl,_that.streamKey,_that.rtmpUrl,_that.playbackUrl,_that.viewerCount,_that.peakViewerCount,_that.totalReactions,_that.totalComments,_that.scheduledAt,_that.startedAt,_that.endedAt,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserInfo host,  String title,  StreamStatus status,  String? description,  String? thumbnailUrl,  String? streamKey,  String? rtmpUrl,  String? playbackUrl,  int viewerCount,  int peakViewerCount,  int totalReactions,  int totalComments,  DateTime? scheduledAt,  DateTime? startedAt,  DateTime? endedAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _LiveStream():
return $default(_that.id,_that.host,_that.title,_that.status,_that.description,_that.thumbnailUrl,_that.streamKey,_that.rtmpUrl,_that.playbackUrl,_that.viewerCount,_that.peakViewerCount,_that.totalReactions,_that.totalComments,_that.scheduledAt,_that.startedAt,_that.endedAt,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserInfo host,  String title,  StreamStatus status,  String? description,  String? thumbnailUrl,  String? streamKey,  String? rtmpUrl,  String? playbackUrl,  int viewerCount,  int peakViewerCount,  int totalReactions,  int totalComments,  DateTime? scheduledAt,  DateTime? startedAt,  DateTime? endedAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _LiveStream() when $default != null:
return $default(_that.id,_that.host,_that.title,_that.status,_that.description,_that.thumbnailUrl,_that.streamKey,_that.rtmpUrl,_that.playbackUrl,_that.viewerCount,_that.peakViewerCount,_that.totalReactions,_that.totalComments,_that.scheduledAt,_that.startedAt,_that.endedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveStream implements LiveStream {
  const _LiveStream({required this.id, required this.host, required this.title, required this.status, this.description, this.thumbnailUrl, this.streamKey, this.rtmpUrl, this.playbackUrl, this.viewerCount = 0, this.peakViewerCount = 0, this.totalReactions = 0, this.totalComments = 0, this.scheduledAt, this.startedAt, this.endedAt, this.createdAt});
  factory _LiveStream.fromJson(Map<String, dynamic> json) => _$LiveStreamFromJson(json);

@override final  String id;
@override final  UserInfo host;
@override final  String title;
@override final  StreamStatus status;
@override final  String? description;
@override final  String? thumbnailUrl;
@override final  String? streamKey;
@override final  String? rtmpUrl;
@override final  String? playbackUrl;
@override@JsonKey() final  int viewerCount;
@override@JsonKey() final  int peakViewerCount;
@override@JsonKey() final  int totalReactions;
@override@JsonKey() final  int totalComments;
@override final  DateTime? scheduledAt;
@override final  DateTime? startedAt;
@override final  DateTime? endedAt;
@override final  DateTime? createdAt;

/// Create a copy of LiveStream
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveStreamCopyWith<_LiveStream> get copyWith => __$LiveStreamCopyWithImpl<_LiveStream>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveStreamToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveStream&&(identical(other.id, id) || other.id == id)&&(identical(other.host, host) || other.host == host)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.streamKey, streamKey) || other.streamKey == streamKey)&&(identical(other.rtmpUrl, rtmpUrl) || other.rtmpUrl == rtmpUrl)&&(identical(other.playbackUrl, playbackUrl) || other.playbackUrl == playbackUrl)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.peakViewerCount, peakViewerCount) || other.peakViewerCount == peakViewerCount)&&(identical(other.totalReactions, totalReactions) || other.totalReactions == totalReactions)&&(identical(other.totalComments, totalComments) || other.totalComments == totalComments)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,host,title,status,description,thumbnailUrl,streamKey,rtmpUrl,playbackUrl,viewerCount,peakViewerCount,totalReactions,totalComments,scheduledAt,startedAt,endedAt,createdAt);

@override
String toString() {
  return 'LiveStream(id: $id, host: $host, title: $title, status: $status, description: $description, thumbnailUrl: $thumbnailUrl, streamKey: $streamKey, rtmpUrl: $rtmpUrl, playbackUrl: $playbackUrl, viewerCount: $viewerCount, peakViewerCount: $peakViewerCount, totalReactions: $totalReactions, totalComments: $totalComments, scheduledAt: $scheduledAt, startedAt: $startedAt, endedAt: $endedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$LiveStreamCopyWith<$Res> implements $LiveStreamCopyWith<$Res> {
  factory _$LiveStreamCopyWith(_LiveStream value, $Res Function(_LiveStream) _then) = __$LiveStreamCopyWithImpl;
@override @useResult
$Res call({
 String id, UserInfo host, String title, StreamStatus status, String? description, String? thumbnailUrl, String? streamKey, String? rtmpUrl, String? playbackUrl, int viewerCount, int peakViewerCount, int totalReactions, int totalComments, DateTime? scheduledAt, DateTime? startedAt, DateTime? endedAt, DateTime? createdAt
});


@override $UserInfoCopyWith<$Res> get host;

}
/// @nodoc
class __$LiveStreamCopyWithImpl<$Res>
    implements _$LiveStreamCopyWith<$Res> {
  __$LiveStreamCopyWithImpl(this._self, this._then);

  final _LiveStream _self;
  final $Res Function(_LiveStream) _then;

/// Create a copy of LiveStream
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? host = null,Object? title = null,Object? status = null,Object? description = freezed,Object? thumbnailUrl = freezed,Object? streamKey = freezed,Object? rtmpUrl = freezed,Object? playbackUrl = freezed,Object? viewerCount = null,Object? peakViewerCount = null,Object? totalReactions = null,Object? totalComments = null,Object? scheduledAt = freezed,Object? startedAt = freezed,Object? endedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_LiveStream(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as UserInfo,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StreamStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,streamKey: freezed == streamKey ? _self.streamKey : streamKey // ignore: cast_nullable_to_non_nullable
as String?,rtmpUrl: freezed == rtmpUrl ? _self.rtmpUrl : rtmpUrl // ignore: cast_nullable_to_non_nullable
as String?,playbackUrl: freezed == playbackUrl ? _self.playbackUrl : playbackUrl // ignore: cast_nullable_to_non_nullable
as String?,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,peakViewerCount: null == peakViewerCount ? _self.peakViewerCount : peakViewerCount // ignore: cast_nullable_to_non_nullable
as int,totalReactions: null == totalReactions ? _self.totalReactions : totalReactions // ignore: cast_nullable_to_non_nullable
as int,totalComments: null == totalComments ? _self.totalComments : totalComments // ignore: cast_nullable_to_non_nullable
as int,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of LiveStream
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get host {
  
  return $UserInfoCopyWith<$Res>(_self.host, (value) {
    return _then(_self.copyWith(host: value));
  });
}
}


/// @nodoc
mixin _$StreamComment {

 String get id; String get streamId; UserInfo get user; String get content; bool get isPinned; bool get isHighlighted; DateTime? get createdAt;
/// Create a copy of StreamComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamCommentCopyWith<StreamComment> get copyWith => _$StreamCommentCopyWithImpl<StreamComment>(this as StreamComment, _$identity);

  /// Serializes this StreamComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamComment&&(identical(other.id, id) || other.id == id)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isHighlighted, isHighlighted) || other.isHighlighted == isHighlighted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,streamId,user,content,isPinned,isHighlighted,createdAt);

@override
String toString() {
  return 'StreamComment(id: $id, streamId: $streamId, user: $user, content: $content, isPinned: $isPinned, isHighlighted: $isHighlighted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $StreamCommentCopyWith<$Res>  {
  factory $StreamCommentCopyWith(StreamComment value, $Res Function(StreamComment) _then) = _$StreamCommentCopyWithImpl;
@useResult
$Res call({
 String id, String streamId, UserInfo user, String content, bool isPinned, bool isHighlighted, DateTime? createdAt
});


$UserInfoCopyWith<$Res> get user;

}
/// @nodoc
class _$StreamCommentCopyWithImpl<$Res>
    implements $StreamCommentCopyWith<$Res> {
  _$StreamCommentCopyWithImpl(this._self, this._then);

  final StreamComment _self;
  final $Res Function(StreamComment) _then;

/// Create a copy of StreamComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? streamId = null,Object? user = null,Object? content = null,Object? isPinned = null,Object? isHighlighted = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,isHighlighted: null == isHighlighted ? _self.isHighlighted : isHighlighted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of StreamComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get user {
  
  return $UserInfoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [StreamComment].
extension StreamCommentPatterns on StreamComment {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamComment() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamComment value)  $default,){
final _that = this;
switch (_that) {
case _StreamComment():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamComment value)?  $default,){
final _that = this;
switch (_that) {
case _StreamComment() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String streamId,  UserInfo user,  String content,  bool isPinned,  bool isHighlighted,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamComment() when $default != null:
return $default(_that.id,_that.streamId,_that.user,_that.content,_that.isPinned,_that.isHighlighted,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String streamId,  UserInfo user,  String content,  bool isPinned,  bool isHighlighted,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _StreamComment():
return $default(_that.id,_that.streamId,_that.user,_that.content,_that.isPinned,_that.isHighlighted,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String streamId,  UserInfo user,  String content,  bool isPinned,  bool isHighlighted,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _StreamComment() when $default != null:
return $default(_that.id,_that.streamId,_that.user,_that.content,_that.isPinned,_that.isHighlighted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamComment implements StreamComment {
  const _StreamComment({required this.id, required this.streamId, required this.user, required this.content, this.isPinned = false, this.isHighlighted = false, this.createdAt});
  factory _StreamComment.fromJson(Map<String, dynamic> json) => _$StreamCommentFromJson(json);

@override final  String id;
@override final  String streamId;
@override final  UserInfo user;
@override final  String content;
@override@JsonKey() final  bool isPinned;
@override@JsonKey() final  bool isHighlighted;
@override final  DateTime? createdAt;

/// Create a copy of StreamComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamCommentCopyWith<_StreamComment> get copyWith => __$StreamCommentCopyWithImpl<_StreamComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamComment&&(identical(other.id, id) || other.id == id)&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.user, user) || other.user == user)&&(identical(other.content, content) || other.content == content)&&(identical(other.isPinned, isPinned) || other.isPinned == isPinned)&&(identical(other.isHighlighted, isHighlighted) || other.isHighlighted == isHighlighted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,streamId,user,content,isPinned,isHighlighted,createdAt);

@override
String toString() {
  return 'StreamComment(id: $id, streamId: $streamId, user: $user, content: $content, isPinned: $isPinned, isHighlighted: $isHighlighted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$StreamCommentCopyWith<$Res> implements $StreamCommentCopyWith<$Res> {
  factory _$StreamCommentCopyWith(_StreamComment value, $Res Function(_StreamComment) _then) = __$StreamCommentCopyWithImpl;
@override @useResult
$Res call({
 String id, String streamId, UserInfo user, String content, bool isPinned, bool isHighlighted, DateTime? createdAt
});


@override $UserInfoCopyWith<$Res> get user;

}
/// @nodoc
class __$StreamCommentCopyWithImpl<$Res>
    implements _$StreamCommentCopyWith<$Res> {
  __$StreamCommentCopyWithImpl(this._self, this._then);

  final _StreamComment _self;
  final $Res Function(_StreamComment) _then;

/// Create a copy of StreamComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? streamId = null,Object? user = null,Object? content = null,Object? isPinned = null,Object? isHighlighted = null,Object? createdAt = freezed,}) {
  return _then(_StreamComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isPinned: null == isPinned ? _self.isPinned : isPinned // ignore: cast_nullable_to_non_nullable
as bool,isHighlighted: null == isHighlighted ? _self.isHighlighted : isHighlighted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of StreamComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get user {
  
  return $UserInfoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$ReactionCount {

 String get emoji; int get count;
/// Create a copy of ReactionCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactionCountCopyWith<ReactionCount> get copyWith => _$ReactionCountCopyWithImpl<ReactionCount>(this as ReactionCount, _$identity);

  /// Serializes this ReactionCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactionCount&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emoji,count);

@override
String toString() {
  return 'ReactionCount(emoji: $emoji, count: $count)';
}


}

/// @nodoc
abstract mixin class $ReactionCountCopyWith<$Res>  {
  factory $ReactionCountCopyWith(ReactionCount value, $Res Function(ReactionCount) _then) = _$ReactionCountCopyWithImpl;
@useResult
$Res call({
 String emoji, int count
});




}
/// @nodoc
class _$ReactionCountCopyWithImpl<$Res>
    implements $ReactionCountCopyWith<$Res> {
  _$ReactionCountCopyWithImpl(this._self, this._then);

  final ReactionCount _self;
  final $Res Function(ReactionCount) _then;

/// Create a copy of ReactionCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emoji = null,Object? count = null,}) {
  return _then(_self.copyWith(
emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReactionCount].
extension ReactionCountPatterns on ReactionCount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReactionCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReactionCount() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReactionCount value)  $default,){
final _that = this;
switch (_that) {
case _ReactionCount():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReactionCount value)?  $default,){
final _that = this;
switch (_that) {
case _ReactionCount() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String emoji,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReactionCount() when $default != null:
return $default(_that.emoji,_that.count);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String emoji,  int count)  $default,) {final _that = this;
switch (_that) {
case _ReactionCount():
return $default(_that.emoji,_that.count);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String emoji,  int count)?  $default,) {final _that = this;
switch (_that) {
case _ReactionCount() when $default != null:
return $default(_that.emoji,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReactionCount implements ReactionCount {
  const _ReactionCount({required this.emoji, this.count = 0});
  factory _ReactionCount.fromJson(Map<String, dynamic> json) => _$ReactionCountFromJson(json);

@override final  String emoji;
@override@JsonKey() final  int count;

/// Create a copy of ReactionCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactionCountCopyWith<_ReactionCount> get copyWith => __$ReactionCountCopyWithImpl<_ReactionCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReactionCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactionCount&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emoji,count);

@override
String toString() {
  return 'ReactionCount(emoji: $emoji, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ReactionCountCopyWith<$Res> implements $ReactionCountCopyWith<$Res> {
  factory _$ReactionCountCopyWith(_ReactionCount value, $Res Function(_ReactionCount) _then) = __$ReactionCountCopyWithImpl;
@override @useResult
$Res call({
 String emoji, int count
});




}
/// @nodoc
class __$ReactionCountCopyWithImpl<$Res>
    implements _$ReactionCountCopyWith<$Res> {
  __$ReactionCountCopyWithImpl(this._self, this._then);

  final _ReactionCount _self;
  final $Res Function(_ReactionCount) _then;

/// Create a copy of ReactionCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emoji = null,Object? count = null,}) {
  return _then(_ReactionCount(
emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StreamStats {

 String get streamId; int get viewerCount; int get peakViewerCount; int get totalComments; int get totalReactions; List<ReactionCount> get reactionsByEmoji; int? get durationSeconds;
/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamStatsCopyWith<StreamStats> get copyWith => _$StreamStatsCopyWithImpl<StreamStats>(this as StreamStats, _$identity);

  /// Serializes this StreamStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamStats&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.peakViewerCount, peakViewerCount) || other.peakViewerCount == peakViewerCount)&&(identical(other.totalComments, totalComments) || other.totalComments == totalComments)&&(identical(other.totalReactions, totalReactions) || other.totalReactions == totalReactions)&&const DeepCollectionEquality().equals(other.reactionsByEmoji, reactionsByEmoji)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount,peakViewerCount,totalComments,totalReactions,const DeepCollectionEquality().hash(reactionsByEmoji),durationSeconds);

@override
String toString() {
  return 'StreamStats(streamId: $streamId, viewerCount: $viewerCount, peakViewerCount: $peakViewerCount, totalComments: $totalComments, totalReactions: $totalReactions, reactionsByEmoji: $reactionsByEmoji, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class $StreamStatsCopyWith<$Res>  {
  factory $StreamStatsCopyWith(StreamStats value, $Res Function(StreamStats) _then) = _$StreamStatsCopyWithImpl;
@useResult
$Res call({
 String streamId, int viewerCount, int peakViewerCount, int totalComments, int totalReactions, List<ReactionCount> reactionsByEmoji, int? durationSeconds
});




}
/// @nodoc
class _$StreamStatsCopyWithImpl<$Res>
    implements $StreamStatsCopyWith<$Res> {
  _$StreamStatsCopyWithImpl(this._self, this._then);

  final StreamStats _self;
  final $Res Function(StreamStats) _then;

/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streamId = null,Object? viewerCount = null,Object? peakViewerCount = null,Object? totalComments = null,Object? totalReactions = null,Object? reactionsByEmoji = null,Object? durationSeconds = freezed,}) {
  return _then(_self.copyWith(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,peakViewerCount: null == peakViewerCount ? _self.peakViewerCount : peakViewerCount // ignore: cast_nullable_to_non_nullable
as int,totalComments: null == totalComments ? _self.totalComments : totalComments // ignore: cast_nullable_to_non_nullable
as int,totalReactions: null == totalReactions ? _self.totalReactions : totalReactions // ignore: cast_nullable_to_non_nullable
as int,reactionsByEmoji: null == reactionsByEmoji ? _self.reactionsByEmoji : reactionsByEmoji // ignore: cast_nullable_to_non_nullable
as List<ReactionCount>,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamStats].
extension StreamStatsPatterns on StreamStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamStats value)  $default,){
final _that = this;
switch (_that) {
case _StreamStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamStats value)?  $default,){
final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String streamId,  int viewerCount,  int peakViewerCount,  int totalComments,  int totalReactions,  List<ReactionCount> reactionsByEmoji,  int? durationSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that.streamId,_that.viewerCount,_that.peakViewerCount,_that.totalComments,_that.totalReactions,_that.reactionsByEmoji,_that.durationSeconds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String streamId,  int viewerCount,  int peakViewerCount,  int totalComments,  int totalReactions,  List<ReactionCount> reactionsByEmoji,  int? durationSeconds)  $default,) {final _that = this;
switch (_that) {
case _StreamStats():
return $default(_that.streamId,_that.viewerCount,_that.peakViewerCount,_that.totalComments,_that.totalReactions,_that.reactionsByEmoji,_that.durationSeconds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String streamId,  int viewerCount,  int peakViewerCount,  int totalComments,  int totalReactions,  List<ReactionCount> reactionsByEmoji,  int? durationSeconds)?  $default,) {final _that = this;
switch (_that) {
case _StreamStats() when $default != null:
return $default(_that.streamId,_that.viewerCount,_that.peakViewerCount,_that.totalComments,_that.totalReactions,_that.reactionsByEmoji,_that.durationSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamStats implements StreamStats {
  const _StreamStats({required this.streamId, this.viewerCount = 0, this.peakViewerCount = 0, this.totalComments = 0, this.totalReactions = 0, final  List<ReactionCount> reactionsByEmoji = const <ReactionCount>[], this.durationSeconds}): _reactionsByEmoji = reactionsByEmoji;
  factory _StreamStats.fromJson(Map<String, dynamic> json) => _$StreamStatsFromJson(json);

@override final  String streamId;
@override@JsonKey() final  int viewerCount;
@override@JsonKey() final  int peakViewerCount;
@override@JsonKey() final  int totalComments;
@override@JsonKey() final  int totalReactions;
 final  List<ReactionCount> _reactionsByEmoji;
@override@JsonKey() List<ReactionCount> get reactionsByEmoji {
  if (_reactionsByEmoji is EqualUnmodifiableListView) return _reactionsByEmoji;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactionsByEmoji);
}

@override final  int? durationSeconds;

/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamStatsCopyWith<_StreamStats> get copyWith => __$StreamStatsCopyWithImpl<_StreamStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamStats&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&(identical(other.peakViewerCount, peakViewerCount) || other.peakViewerCount == peakViewerCount)&&(identical(other.totalComments, totalComments) || other.totalComments == totalComments)&&(identical(other.totalReactions, totalReactions) || other.totalReactions == totalReactions)&&const DeepCollectionEquality().equals(other._reactionsByEmoji, _reactionsByEmoji)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount,peakViewerCount,totalComments,totalReactions,const DeepCollectionEquality().hash(_reactionsByEmoji),durationSeconds);

@override
String toString() {
  return 'StreamStats(streamId: $streamId, viewerCount: $viewerCount, peakViewerCount: $peakViewerCount, totalComments: $totalComments, totalReactions: $totalReactions, reactionsByEmoji: $reactionsByEmoji, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class _$StreamStatsCopyWith<$Res> implements $StreamStatsCopyWith<$Res> {
  factory _$StreamStatsCopyWith(_StreamStats value, $Res Function(_StreamStats) _then) = __$StreamStatsCopyWithImpl;
@override @useResult
$Res call({
 String streamId, int viewerCount, int peakViewerCount, int totalComments, int totalReactions, List<ReactionCount> reactionsByEmoji, int? durationSeconds
});




}
/// @nodoc
class __$StreamStatsCopyWithImpl<$Res>
    implements _$StreamStatsCopyWith<$Res> {
  __$StreamStatsCopyWithImpl(this._self, this._then);

  final _StreamStats _self;
  final $Res Function(_StreamStats) _then;

/// Create a copy of StreamStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? viewerCount = null,Object? peakViewerCount = null,Object? totalComments = null,Object? totalReactions = null,Object? reactionsByEmoji = null,Object? durationSeconds = freezed,}) {
  return _then(_StreamStats(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,peakViewerCount: null == peakViewerCount ? _self.peakViewerCount : peakViewerCount // ignore: cast_nullable_to_non_nullable
as int,totalComments: null == totalComments ? _self.totalComments : totalComments // ignore: cast_nullable_to_non_nullable
as int,totalReactions: null == totalReactions ? _self.totalReactions : totalReactions // ignore: cast_nullable_to_non_nullable
as int,reactionsByEmoji: null == reactionsByEmoji ? _self._reactionsByEmoji : reactionsByEmoji // ignore: cast_nullable_to_non_nullable
as List<ReactionCount>,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$StreamViewers {

 String get streamId; int get viewerCount; List<UserInfo> get viewers;
/// Create a copy of StreamViewers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamViewersCopyWith<StreamViewers> get copyWith => _$StreamViewersCopyWithImpl<StreamViewers>(this as StreamViewers, _$identity);

  /// Serializes this StreamViewers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamViewers&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&const DeepCollectionEquality().equals(other.viewers, viewers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount,const DeepCollectionEquality().hash(viewers));

@override
String toString() {
  return 'StreamViewers(streamId: $streamId, viewerCount: $viewerCount, viewers: $viewers)';
}


}

/// @nodoc
abstract mixin class $StreamViewersCopyWith<$Res>  {
  factory $StreamViewersCopyWith(StreamViewers value, $Res Function(StreamViewers) _then) = _$StreamViewersCopyWithImpl;
@useResult
$Res call({
 String streamId, int viewerCount, List<UserInfo> viewers
});




}
/// @nodoc
class _$StreamViewersCopyWithImpl<$Res>
    implements $StreamViewersCopyWith<$Res> {
  _$StreamViewersCopyWithImpl(this._self, this._then);

  final StreamViewers _self;
  final $Res Function(StreamViewers) _then;

/// Create a copy of StreamViewers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streamId = null,Object? viewerCount = null,Object? viewers = null,}) {
  return _then(_self.copyWith(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,viewers: null == viewers ? _self.viewers : viewers // ignore: cast_nullable_to_non_nullable
as List<UserInfo>,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamViewers].
extension StreamViewersPatterns on StreamViewers {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamViewers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamViewers() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamViewers value)  $default,){
final _that = this;
switch (_that) {
case _StreamViewers():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamViewers value)?  $default,){
final _that = this;
switch (_that) {
case _StreamViewers() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String streamId,  int viewerCount,  List<UserInfo> viewers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamViewers() when $default != null:
return $default(_that.streamId,_that.viewerCount,_that.viewers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String streamId,  int viewerCount,  List<UserInfo> viewers)  $default,) {final _that = this;
switch (_that) {
case _StreamViewers():
return $default(_that.streamId,_that.viewerCount,_that.viewers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String streamId,  int viewerCount,  List<UserInfo> viewers)?  $default,) {final _that = this;
switch (_that) {
case _StreamViewers() when $default != null:
return $default(_that.streamId,_that.viewerCount,_that.viewers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamViewers implements StreamViewers {
  const _StreamViewers({required this.streamId, this.viewerCount = 0, final  List<UserInfo> viewers = const <UserInfo>[]}): _viewers = viewers;
  factory _StreamViewers.fromJson(Map<String, dynamic> json) => _$StreamViewersFromJson(json);

@override final  String streamId;
@override@JsonKey() final  int viewerCount;
 final  List<UserInfo> _viewers;
@override@JsonKey() List<UserInfo> get viewers {
  if (_viewers is EqualUnmodifiableListView) return _viewers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_viewers);
}


/// Create a copy of StreamViewers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamViewersCopyWith<_StreamViewers> get copyWith => __$StreamViewersCopyWithImpl<_StreamViewers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamViewersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamViewers&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount)&&const DeepCollectionEquality().equals(other._viewers, _viewers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount,const DeepCollectionEquality().hash(_viewers));

@override
String toString() {
  return 'StreamViewers(streamId: $streamId, viewerCount: $viewerCount, viewers: $viewers)';
}


}

/// @nodoc
abstract mixin class _$StreamViewersCopyWith<$Res> implements $StreamViewersCopyWith<$Res> {
  factory _$StreamViewersCopyWith(_StreamViewers value, $Res Function(_StreamViewers) _then) = __$StreamViewersCopyWithImpl;
@override @useResult
$Res call({
 String streamId, int viewerCount, List<UserInfo> viewers
});




}
/// @nodoc
class __$StreamViewersCopyWithImpl<$Res>
    implements _$StreamViewersCopyWith<$Res> {
  __$StreamViewersCopyWithImpl(this._self, this._then);

  final _StreamViewers _self;
  final $Res Function(_StreamViewers) _then;

/// Create a copy of StreamViewers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? viewerCount = null,Object? viewers = null,}) {
  return _then(_StreamViewers(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,viewers: null == viewers ? _self._viewers : viewers // ignore: cast_nullable_to_non_nullable
as List<UserInfo>,
  ));
}


}


/// @nodoc
mixin _$StreamViewerCount {

 String get streamId; int get viewerCount;
/// Create a copy of StreamViewerCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StreamViewerCountCopyWith<StreamViewerCount> get copyWith => _$StreamViewerCountCopyWithImpl<StreamViewerCount>(this as StreamViewerCount, _$identity);

  /// Serializes this StreamViewerCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StreamViewerCount&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount);

@override
String toString() {
  return 'StreamViewerCount(streamId: $streamId, viewerCount: $viewerCount)';
}


}

/// @nodoc
abstract mixin class $StreamViewerCountCopyWith<$Res>  {
  factory $StreamViewerCountCopyWith(StreamViewerCount value, $Res Function(StreamViewerCount) _then) = _$StreamViewerCountCopyWithImpl;
@useResult
$Res call({
 String streamId, int viewerCount
});




}
/// @nodoc
class _$StreamViewerCountCopyWithImpl<$Res>
    implements $StreamViewerCountCopyWith<$Res> {
  _$StreamViewerCountCopyWithImpl(this._self, this._then);

  final StreamViewerCount _self;
  final $Res Function(StreamViewerCount) _then;

/// Create a copy of StreamViewerCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streamId = null,Object? viewerCount = null,}) {
  return _then(_self.copyWith(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StreamViewerCount].
extension StreamViewerCountPatterns on StreamViewerCount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StreamViewerCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StreamViewerCount() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StreamViewerCount value)  $default,){
final _that = this;
switch (_that) {
case _StreamViewerCount():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StreamViewerCount value)?  $default,){
final _that = this;
switch (_that) {
case _StreamViewerCount() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String streamId,  int viewerCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StreamViewerCount() when $default != null:
return $default(_that.streamId,_that.viewerCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String streamId,  int viewerCount)  $default,) {final _that = this;
switch (_that) {
case _StreamViewerCount():
return $default(_that.streamId,_that.viewerCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String streamId,  int viewerCount)?  $default,) {final _that = this;
switch (_that) {
case _StreamViewerCount() when $default != null:
return $default(_that.streamId,_that.viewerCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StreamViewerCount implements StreamViewerCount {
  const _StreamViewerCount({required this.streamId, this.viewerCount = 0});
  factory _StreamViewerCount.fromJson(Map<String, dynamic> json) => _$StreamViewerCountFromJson(json);

@override final  String streamId;
@override@JsonKey() final  int viewerCount;

/// Create a copy of StreamViewerCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StreamViewerCountCopyWith<_StreamViewerCount> get copyWith => __$StreamViewerCountCopyWithImpl<_StreamViewerCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StreamViewerCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StreamViewerCount&&(identical(other.streamId, streamId) || other.streamId == streamId)&&(identical(other.viewerCount, viewerCount) || other.viewerCount == viewerCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,streamId,viewerCount);

@override
String toString() {
  return 'StreamViewerCount(streamId: $streamId, viewerCount: $viewerCount)';
}


}

/// @nodoc
abstract mixin class _$StreamViewerCountCopyWith<$Res> implements $StreamViewerCountCopyWith<$Res> {
  factory _$StreamViewerCountCopyWith(_StreamViewerCount value, $Res Function(_StreamViewerCount) _then) = __$StreamViewerCountCopyWithImpl;
@override @useResult
$Res call({
 String streamId, int viewerCount
});




}
/// @nodoc
class __$StreamViewerCountCopyWithImpl<$Res>
    implements _$StreamViewerCountCopyWith<$Res> {
  __$StreamViewerCountCopyWithImpl(this._self, this._then);

  final _StreamViewerCount _self;
  final $Res Function(_StreamViewerCount) _then;

/// Create a copy of StreamViewerCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streamId = null,Object? viewerCount = null,}) {
  return _then(_StreamViewerCount(
streamId: null == streamId ? _self.streamId : streamId // ignore: cast_nullable_to_non_nullable
as String,viewerCount: null == viewerCount ? _self.viewerCount : viewerCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReactionResult {

 bool get accepted; String? get message;/// Délai à respecter avant un nouvel envoi, en millisecondes.
///
/// Renseigné seulement quand l'API refuse la réaction ; `null` sinon.
 int? get retryAfterMs;
/// Create a copy of ReactionResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactionResultCopyWith<ReactionResult> get copyWith => _$ReactionResultCopyWithImpl<ReactionResult>(this as ReactionResult, _$identity);

  /// Serializes this ReactionResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactionResult&&(identical(other.accepted, accepted) || other.accepted == accepted)&&(identical(other.message, message) || other.message == message)&&(identical(other.retryAfterMs, retryAfterMs) || other.retryAfterMs == retryAfterMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accepted,message,retryAfterMs);

@override
String toString() {
  return 'ReactionResult(accepted: $accepted, message: $message, retryAfterMs: $retryAfterMs)';
}


}

/// @nodoc
abstract mixin class $ReactionResultCopyWith<$Res>  {
  factory $ReactionResultCopyWith(ReactionResult value, $Res Function(ReactionResult) _then) = _$ReactionResultCopyWithImpl;
@useResult
$Res call({
 bool accepted, String? message, int? retryAfterMs
});




}
/// @nodoc
class _$ReactionResultCopyWithImpl<$Res>
    implements $ReactionResultCopyWith<$Res> {
  _$ReactionResultCopyWithImpl(this._self, this._then);

  final ReactionResult _self;
  final $Res Function(ReactionResult) _then;

/// Create a copy of ReactionResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accepted = null,Object? message = freezed,Object? retryAfterMs = freezed,}) {
  return _then(_self.copyWith(
accepted: null == accepted ? _self.accepted : accepted // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,retryAfterMs: freezed == retryAfterMs ? _self.retryAfterMs : retryAfterMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReactionResult].
extension ReactionResultPatterns on ReactionResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReactionResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReactionResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReactionResult value)  $default,){
final _that = this;
switch (_that) {
case _ReactionResult():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReactionResult value)?  $default,){
final _that = this;
switch (_that) {
case _ReactionResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool accepted,  String? message,  int? retryAfterMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReactionResult() when $default != null:
return $default(_that.accepted,_that.message,_that.retryAfterMs);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool accepted,  String? message,  int? retryAfterMs)  $default,) {final _that = this;
switch (_that) {
case _ReactionResult():
return $default(_that.accepted,_that.message,_that.retryAfterMs);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool accepted,  String? message,  int? retryAfterMs)?  $default,) {final _that = this;
switch (_that) {
case _ReactionResult() when $default != null:
return $default(_that.accepted,_that.message,_that.retryAfterMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReactionResult implements ReactionResult {
  const _ReactionResult({this.accepted = false, this.message, this.retryAfterMs});
  factory _ReactionResult.fromJson(Map<String, dynamic> json) => _$ReactionResultFromJson(json);

@override@JsonKey() final  bool accepted;
@override final  String? message;
/// Délai à respecter avant un nouvel envoi, en millisecondes.
///
/// Renseigné seulement quand l'API refuse la réaction ; `null` sinon.
@override final  int? retryAfterMs;

/// Create a copy of ReactionResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactionResultCopyWith<_ReactionResult> get copyWith => __$ReactionResultCopyWithImpl<_ReactionResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReactionResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactionResult&&(identical(other.accepted, accepted) || other.accepted == accepted)&&(identical(other.message, message) || other.message == message)&&(identical(other.retryAfterMs, retryAfterMs) || other.retryAfterMs == retryAfterMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accepted,message,retryAfterMs);

@override
String toString() {
  return 'ReactionResult(accepted: $accepted, message: $message, retryAfterMs: $retryAfterMs)';
}


}

/// @nodoc
abstract mixin class _$ReactionResultCopyWith<$Res> implements $ReactionResultCopyWith<$Res> {
  factory _$ReactionResultCopyWith(_ReactionResult value, $Res Function(_ReactionResult) _then) = __$ReactionResultCopyWithImpl;
@override @useResult
$Res call({
 bool accepted, String? message, int? retryAfterMs
});




}
/// @nodoc
class __$ReactionResultCopyWithImpl<$Res>
    implements _$ReactionResultCopyWith<$Res> {
  __$ReactionResultCopyWithImpl(this._self, this._then);

  final _ReactionResult _self;
  final $Res Function(_ReactionResult) _then;

/// Create a copy of ReactionResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accepted = null,Object? message = freezed,Object? retryAfterMs = freezed,}) {
  return _then(_ReactionResult(
accepted: null == accepted ? _self.accepted : accepted // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,retryAfterMs: freezed == retryAfterMs ? _self.retryAfterMs : retryAfterMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
