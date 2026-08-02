// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'call.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CallParticipant {

 String get id; UserInfo get user; ParticipantCallStatus get status; ParticipantRole? get role; bool get isMuted; bool get isVideoEnabled; bool get isScreenSharing; DateTime? get joinedAt;
/// Create a copy of CallParticipant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallParticipantCopyWith<CallParticipant> get copyWith => _$CallParticipantCopyWithImpl<CallParticipant>(this as CallParticipant, _$identity);

  /// Serializes this CallParticipant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallParticipant&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isVideoEnabled, isVideoEnabled) || other.isVideoEnabled == isVideoEnabled)&&(identical(other.isScreenSharing, isScreenSharing) || other.isScreenSharing == isScreenSharing)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,status,role,isMuted,isVideoEnabled,isScreenSharing,joinedAt);

@override
String toString() {
  return 'CallParticipant(id: $id, user: $user, status: $status, role: $role, isMuted: $isMuted, isVideoEnabled: $isVideoEnabled, isScreenSharing: $isScreenSharing, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class $CallParticipantCopyWith<$Res>  {
  factory $CallParticipantCopyWith(CallParticipant value, $Res Function(CallParticipant) _then) = _$CallParticipantCopyWithImpl;
@useResult
$Res call({
 String id, UserInfo user, ParticipantCallStatus status, ParticipantRole? role, bool isMuted, bool isVideoEnabled, bool isScreenSharing, DateTime? joinedAt
});


$UserInfoCopyWith<$Res> get user;

}
/// @nodoc
class _$CallParticipantCopyWithImpl<$Res>
    implements $CallParticipantCopyWith<$Res> {
  _$CallParticipantCopyWithImpl(this._self, this._then);

  final CallParticipant _self;
  final $Res Function(CallParticipant) _then;

/// Create a copy of CallParticipant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? status = null,Object? role = freezed,Object? isMuted = null,Object? isVideoEnabled = null,Object? isScreenSharing = null,Object? joinedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParticipantCallStatus,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ParticipantRole?,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isVideoEnabled: null == isVideoEnabled ? _self.isVideoEnabled : isVideoEnabled // ignore: cast_nullable_to_non_nullable
as bool,isScreenSharing: null == isScreenSharing ? _self.isScreenSharing : isScreenSharing // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of CallParticipant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get user {
  
  return $UserInfoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [CallParticipant].
extension CallParticipantPatterns on CallParticipant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallParticipant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallParticipant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallParticipant value)  $default,){
final _that = this;
switch (_that) {
case _CallParticipant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallParticipant value)?  $default,){
final _that = this;
switch (_that) {
case _CallParticipant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserInfo user,  ParticipantCallStatus status,  ParticipantRole? role,  bool isMuted,  bool isVideoEnabled,  bool isScreenSharing,  DateTime? joinedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallParticipant() when $default != null:
return $default(_that.id,_that.user,_that.status,_that.role,_that.isMuted,_that.isVideoEnabled,_that.isScreenSharing,_that.joinedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserInfo user,  ParticipantCallStatus status,  ParticipantRole? role,  bool isMuted,  bool isVideoEnabled,  bool isScreenSharing,  DateTime? joinedAt)  $default,) {final _that = this;
switch (_that) {
case _CallParticipant():
return $default(_that.id,_that.user,_that.status,_that.role,_that.isMuted,_that.isVideoEnabled,_that.isScreenSharing,_that.joinedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserInfo user,  ParticipantCallStatus status,  ParticipantRole? role,  bool isMuted,  bool isVideoEnabled,  bool isScreenSharing,  DateTime? joinedAt)?  $default,) {final _that = this;
switch (_that) {
case _CallParticipant() when $default != null:
return $default(_that.id,_that.user,_that.status,_that.role,_that.isMuted,_that.isVideoEnabled,_that.isScreenSharing,_that.joinedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallParticipant implements CallParticipant {
  const _CallParticipant({required this.id, required this.user, required this.status, this.role, this.isMuted = false, this.isVideoEnabled = false, this.isScreenSharing = false, this.joinedAt});
  factory _CallParticipant.fromJson(Map<String, dynamic> json) => _$CallParticipantFromJson(json);

@override final  String id;
@override final  UserInfo user;
@override final  ParticipantCallStatus status;
@override final  ParticipantRole? role;
@override@JsonKey() final  bool isMuted;
@override@JsonKey() final  bool isVideoEnabled;
@override@JsonKey() final  bool isScreenSharing;
@override final  DateTime? joinedAt;

/// Create a copy of CallParticipant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallParticipantCopyWith<_CallParticipant> get copyWith => __$CallParticipantCopyWithImpl<_CallParticipant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallParticipantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallParticipant&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.isMuted, isMuted) || other.isMuted == isMuted)&&(identical(other.isVideoEnabled, isVideoEnabled) || other.isVideoEnabled == isVideoEnabled)&&(identical(other.isScreenSharing, isScreenSharing) || other.isScreenSharing == isScreenSharing)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,status,role,isMuted,isVideoEnabled,isScreenSharing,joinedAt);

@override
String toString() {
  return 'CallParticipant(id: $id, user: $user, status: $status, role: $role, isMuted: $isMuted, isVideoEnabled: $isVideoEnabled, isScreenSharing: $isScreenSharing, joinedAt: $joinedAt)';
}


}

/// @nodoc
abstract mixin class _$CallParticipantCopyWith<$Res> implements $CallParticipantCopyWith<$Res> {
  factory _$CallParticipantCopyWith(_CallParticipant value, $Res Function(_CallParticipant) _then) = __$CallParticipantCopyWithImpl;
@override @useResult
$Res call({
 String id, UserInfo user, ParticipantCallStatus status, ParticipantRole? role, bool isMuted, bool isVideoEnabled, bool isScreenSharing, DateTime? joinedAt
});


@override $UserInfoCopyWith<$Res> get user;

}
/// @nodoc
class __$CallParticipantCopyWithImpl<$Res>
    implements _$CallParticipantCopyWith<$Res> {
  __$CallParticipantCopyWithImpl(this._self, this._then);

  final _CallParticipant _self;
  final $Res Function(_CallParticipant) _then;

/// Create a copy of CallParticipant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? status = null,Object? role = freezed,Object? isMuted = null,Object? isVideoEnabled = null,Object? isScreenSharing = null,Object? joinedAt = freezed,}) {
  return _then(_CallParticipant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ParticipantCallStatus,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as ParticipantRole?,isMuted: null == isMuted ? _self.isMuted : isMuted // ignore: cast_nullable_to_non_nullable
as bool,isVideoEnabled: null == isVideoEnabled ? _self.isVideoEnabled : isVideoEnabled // ignore: cast_nullable_to_non_nullable
as bool,isScreenSharing: null == isScreenSharing ? _self.isScreenSharing : isScreenSharing // ignore: cast_nullable_to_non_nullable
as bool,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of CallParticipant
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
mixin _$Call {

 String get id; UserInfo get initiator; CallType get callType; CallStatus get status; String? get conversationId; List<CallParticipant> get participants; int get participantCount; int? get durationSeconds; bool get encryptionEnabled; DateTime? get startedAt; DateTime? get connectedAt; DateTime? get endedAt; DateTime? get createdAt;
/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallCopyWith<Call> get copyWith => _$CallCopyWithImpl<Call>(this as Call, _$identity);

  /// Serializes this Call to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Call&&(identical(other.id, id) || other.id == id)&&(identical(other.initiator, initiator) || other.initiator == initiator)&&(identical(other.callType, callType) || other.callType == callType)&&(identical(other.status, status) || other.status == status)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other.participants, participants)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.encryptionEnabled, encryptionEnabled) || other.encryptionEnabled == encryptionEnabled)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,initiator,callType,status,conversationId,const DeepCollectionEquality().hash(participants),participantCount,durationSeconds,encryptionEnabled,startedAt,connectedAt,endedAt,createdAt);

@override
String toString() {
  return 'Call(id: $id, initiator: $initiator, callType: $callType, status: $status, conversationId: $conversationId, participants: $participants, participantCount: $participantCount, durationSeconds: $durationSeconds, encryptionEnabled: $encryptionEnabled, startedAt: $startedAt, connectedAt: $connectedAt, endedAt: $endedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CallCopyWith<$Res>  {
  factory $CallCopyWith(Call value, $Res Function(Call) _then) = _$CallCopyWithImpl;
@useResult
$Res call({
 String id, UserInfo initiator, CallType callType, CallStatus status, String? conversationId, List<CallParticipant> participants, int participantCount, int? durationSeconds, bool encryptionEnabled, DateTime? startedAt, DateTime? connectedAt, DateTime? endedAt, DateTime? createdAt
});


$UserInfoCopyWith<$Res> get initiator;

}
/// @nodoc
class _$CallCopyWithImpl<$Res>
    implements $CallCopyWith<$Res> {
  _$CallCopyWithImpl(this._self, this._then);

  final Call _self;
  final $Res Function(Call) _then;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? initiator = null,Object? callType = null,Object? status = null,Object? conversationId = freezed,Object? participants = null,Object? participantCount = null,Object? durationSeconds = freezed,Object? encryptionEnabled = null,Object? startedAt = freezed,Object? connectedAt = freezed,Object? endedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,initiator: null == initiator ? _self.initiator : initiator // ignore: cast_nullable_to_non_nullable
as UserInfo,callType: null == callType ? _self.callType : callType // ignore: cast_nullable_to_non_nullable
as CallType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<CallParticipant>,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,encryptionEnabled: null == encryptionEnabled ? _self.encryptionEnabled : encryptionEnabled // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get initiator {
  
  return $UserInfoCopyWith<$Res>(_self.initiator, (value) {
    return _then(_self.copyWith(initiator: value));
  });
}
}


/// Adds pattern-matching-related methods to [Call].
extension CallPatterns on Call {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Call value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Call() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Call value)  $default,){
final _that = this;
switch (_that) {
case _Call():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Call value)?  $default,){
final _that = this;
switch (_that) {
case _Call() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UserInfo initiator,  CallType callType,  CallStatus status,  String? conversationId,  List<CallParticipant> participants,  int participantCount,  int? durationSeconds,  bool encryptionEnabled,  DateTime? startedAt,  DateTime? connectedAt,  DateTime? endedAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Call() when $default != null:
return $default(_that.id,_that.initiator,_that.callType,_that.status,_that.conversationId,_that.participants,_that.participantCount,_that.durationSeconds,_that.encryptionEnabled,_that.startedAt,_that.connectedAt,_that.endedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UserInfo initiator,  CallType callType,  CallStatus status,  String? conversationId,  List<CallParticipant> participants,  int participantCount,  int? durationSeconds,  bool encryptionEnabled,  DateTime? startedAt,  DateTime? connectedAt,  DateTime? endedAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Call():
return $default(_that.id,_that.initiator,_that.callType,_that.status,_that.conversationId,_that.participants,_that.participantCount,_that.durationSeconds,_that.encryptionEnabled,_that.startedAt,_that.connectedAt,_that.endedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UserInfo initiator,  CallType callType,  CallStatus status,  String? conversationId,  List<CallParticipant> participants,  int participantCount,  int? durationSeconds,  bool encryptionEnabled,  DateTime? startedAt,  DateTime? connectedAt,  DateTime? endedAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Call() when $default != null:
return $default(_that.id,_that.initiator,_that.callType,_that.status,_that.conversationId,_that.participants,_that.participantCount,_that.durationSeconds,_that.encryptionEnabled,_that.startedAt,_that.connectedAt,_that.endedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Call implements Call {
  const _Call({required this.id, required this.initiator, required this.callType, required this.status, this.conversationId, final  List<CallParticipant> participants = const <CallParticipant>[], this.participantCount = 0, this.durationSeconds, this.encryptionEnabled = false, this.startedAt, this.connectedAt, this.endedAt, this.createdAt}): _participants = participants;
  factory _Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);

@override final  String id;
@override final  UserInfo initiator;
@override final  CallType callType;
@override final  CallStatus status;
@override final  String? conversationId;
 final  List<CallParticipant> _participants;
@override@JsonKey() List<CallParticipant> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}

@override@JsonKey() final  int participantCount;
@override final  int? durationSeconds;
@override@JsonKey() final  bool encryptionEnabled;
@override final  DateTime? startedAt;
@override final  DateTime? connectedAt;
@override final  DateTime? endedAt;
@override final  DateTime? createdAt;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallCopyWith<_Call> get copyWith => __$CallCopyWithImpl<_Call>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Call&&(identical(other.id, id) || other.id == id)&&(identical(other.initiator, initiator) || other.initiator == initiator)&&(identical(other.callType, callType) || other.callType == callType)&&(identical(other.status, status) || other.status == status)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other._participants, _participants)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.encryptionEnabled, encryptionEnabled) || other.encryptionEnabled == encryptionEnabled)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,initiator,callType,status,conversationId,const DeepCollectionEquality().hash(_participants),participantCount,durationSeconds,encryptionEnabled,startedAt,connectedAt,endedAt,createdAt);

@override
String toString() {
  return 'Call(id: $id, initiator: $initiator, callType: $callType, status: $status, conversationId: $conversationId, participants: $participants, participantCount: $participantCount, durationSeconds: $durationSeconds, encryptionEnabled: $encryptionEnabled, startedAt: $startedAt, connectedAt: $connectedAt, endedAt: $endedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CallCopyWith<$Res> implements $CallCopyWith<$Res> {
  factory _$CallCopyWith(_Call value, $Res Function(_Call) _then) = __$CallCopyWithImpl;
@override @useResult
$Res call({
 String id, UserInfo initiator, CallType callType, CallStatus status, String? conversationId, List<CallParticipant> participants, int participantCount, int? durationSeconds, bool encryptionEnabled, DateTime? startedAt, DateTime? connectedAt, DateTime? endedAt, DateTime? createdAt
});


@override $UserInfoCopyWith<$Res> get initiator;

}
/// @nodoc
class __$CallCopyWithImpl<$Res>
    implements _$CallCopyWith<$Res> {
  __$CallCopyWithImpl(this._self, this._then);

  final _Call _self;
  final $Res Function(_Call) _then;

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? initiator = null,Object? callType = null,Object? status = null,Object? conversationId = freezed,Object? participants = null,Object? participantCount = null,Object? durationSeconds = freezed,Object? encryptionEnabled = null,Object? startedAt = freezed,Object? connectedAt = freezed,Object? endedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_Call(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,initiator: null == initiator ? _self.initiator : initiator // ignore: cast_nullable_to_non_nullable
as UserInfo,callType: null == callType ? _self.callType : callType // ignore: cast_nullable_to_non_nullable
as CallType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<CallParticipant>,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,encryptionEnabled: null == encryptionEnabled ? _self.encryptionEnabled : encryptionEnabled // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Call
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get initiator {
  
  return $UserInfoCopyWith<$Res>(_self.initiator, (value) {
    return _then(_self.copyWith(initiator: value));
  });
}
}


/// @nodoc
mixin _$CallInfo {

 String get id; CallType get callType; CallStatus get status; String? get conversationId; String? get initiatorId; int get participantCount; int? get durationSeconds; bool get encryptionEnabled; DateTime? get startedAt; DateTime? get connectedAt; DateTime? get endedAt;
/// Create a copy of CallInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallInfoCopyWith<CallInfo> get copyWith => _$CallInfoCopyWithImpl<CallInfo>(this as CallInfo, _$identity);

  /// Serializes this CallInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.callType, callType) || other.callType == callType)&&(identical(other.status, status) || other.status == status)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.initiatorId, initiatorId) || other.initiatorId == initiatorId)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.encryptionEnabled, encryptionEnabled) || other.encryptionEnabled == encryptionEnabled)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,callType,status,conversationId,initiatorId,participantCount,durationSeconds,encryptionEnabled,startedAt,connectedAt,endedAt);

@override
String toString() {
  return 'CallInfo(id: $id, callType: $callType, status: $status, conversationId: $conversationId, initiatorId: $initiatorId, participantCount: $participantCount, durationSeconds: $durationSeconds, encryptionEnabled: $encryptionEnabled, startedAt: $startedAt, connectedAt: $connectedAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class $CallInfoCopyWith<$Res>  {
  factory $CallInfoCopyWith(CallInfo value, $Res Function(CallInfo) _then) = _$CallInfoCopyWithImpl;
@useResult
$Res call({
 String id, CallType callType, CallStatus status, String? conversationId, String? initiatorId, int participantCount, int? durationSeconds, bool encryptionEnabled, DateTime? startedAt, DateTime? connectedAt, DateTime? endedAt
});




}
/// @nodoc
class _$CallInfoCopyWithImpl<$Res>
    implements $CallInfoCopyWith<$Res> {
  _$CallInfoCopyWithImpl(this._self, this._then);

  final CallInfo _self;
  final $Res Function(CallInfo) _then;

/// Create a copy of CallInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? callType = null,Object? status = null,Object? conversationId = freezed,Object? initiatorId = freezed,Object? participantCount = null,Object? durationSeconds = freezed,Object? encryptionEnabled = null,Object? startedAt = freezed,Object? connectedAt = freezed,Object? endedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,callType: null == callType ? _self.callType : callType // ignore: cast_nullable_to_non_nullable
as CallType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,initiatorId: freezed == initiatorId ? _self.initiatorId : initiatorId // ignore: cast_nullable_to_non_nullable
as String?,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,encryptionEnabled: null == encryptionEnabled ? _self.encryptionEnabled : encryptionEnabled // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CallInfo].
extension CallInfoPatterns on CallInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallInfo value)  $default,){
final _that = this;
switch (_that) {
case _CallInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CallInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  CallType callType,  CallStatus status,  String? conversationId,  String? initiatorId,  int participantCount,  int? durationSeconds,  bool encryptionEnabled,  DateTime? startedAt,  DateTime? connectedAt,  DateTime? endedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallInfo() when $default != null:
return $default(_that.id,_that.callType,_that.status,_that.conversationId,_that.initiatorId,_that.participantCount,_that.durationSeconds,_that.encryptionEnabled,_that.startedAt,_that.connectedAt,_that.endedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  CallType callType,  CallStatus status,  String? conversationId,  String? initiatorId,  int participantCount,  int? durationSeconds,  bool encryptionEnabled,  DateTime? startedAt,  DateTime? connectedAt,  DateTime? endedAt)  $default,) {final _that = this;
switch (_that) {
case _CallInfo():
return $default(_that.id,_that.callType,_that.status,_that.conversationId,_that.initiatorId,_that.participantCount,_that.durationSeconds,_that.encryptionEnabled,_that.startedAt,_that.connectedAt,_that.endedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  CallType callType,  CallStatus status,  String? conversationId,  String? initiatorId,  int participantCount,  int? durationSeconds,  bool encryptionEnabled,  DateTime? startedAt,  DateTime? connectedAt,  DateTime? endedAt)?  $default,) {final _that = this;
switch (_that) {
case _CallInfo() when $default != null:
return $default(_that.id,_that.callType,_that.status,_that.conversationId,_that.initiatorId,_that.participantCount,_that.durationSeconds,_that.encryptionEnabled,_that.startedAt,_that.connectedAt,_that.endedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallInfo implements CallInfo {
  const _CallInfo({required this.id, required this.callType, required this.status, this.conversationId, this.initiatorId, this.participantCount = 0, this.durationSeconds, this.encryptionEnabled = false, this.startedAt, this.connectedAt, this.endedAt});
  factory _CallInfo.fromJson(Map<String, dynamic> json) => _$CallInfoFromJson(json);

@override final  String id;
@override final  CallType callType;
@override final  CallStatus status;
@override final  String? conversationId;
@override final  String? initiatorId;
@override@JsonKey() final  int participantCount;
@override final  int? durationSeconds;
@override@JsonKey() final  bool encryptionEnabled;
@override final  DateTime? startedAt;
@override final  DateTime? connectedAt;
@override final  DateTime? endedAt;

/// Create a copy of CallInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallInfoCopyWith<_CallInfo> get copyWith => __$CallInfoCopyWithImpl<_CallInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.callType, callType) || other.callType == callType)&&(identical(other.status, status) || other.status == status)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.initiatorId, initiatorId) || other.initiatorId == initiatorId)&&(identical(other.participantCount, participantCount) || other.participantCount == participantCount)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.encryptionEnabled, encryptionEnabled) || other.encryptionEnabled == encryptionEnabled)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.connectedAt, connectedAt) || other.connectedAt == connectedAt)&&(identical(other.endedAt, endedAt) || other.endedAt == endedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,callType,status,conversationId,initiatorId,participantCount,durationSeconds,encryptionEnabled,startedAt,connectedAt,endedAt);

@override
String toString() {
  return 'CallInfo(id: $id, callType: $callType, status: $status, conversationId: $conversationId, initiatorId: $initiatorId, participantCount: $participantCount, durationSeconds: $durationSeconds, encryptionEnabled: $encryptionEnabled, startedAt: $startedAt, connectedAt: $connectedAt, endedAt: $endedAt)';
}


}

/// @nodoc
abstract mixin class _$CallInfoCopyWith<$Res> implements $CallInfoCopyWith<$Res> {
  factory _$CallInfoCopyWith(_CallInfo value, $Res Function(_CallInfo) _then) = __$CallInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, CallType callType, CallStatus status, String? conversationId, String? initiatorId, int participantCount, int? durationSeconds, bool encryptionEnabled, DateTime? startedAt, DateTime? connectedAt, DateTime? endedAt
});




}
/// @nodoc
class __$CallInfoCopyWithImpl<$Res>
    implements _$CallInfoCopyWith<$Res> {
  __$CallInfoCopyWithImpl(this._self, this._then);

  final _CallInfo _self;
  final $Res Function(_CallInfo) _then;

/// Create a copy of CallInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? callType = null,Object? status = null,Object? conversationId = freezed,Object? initiatorId = freezed,Object? participantCount = null,Object? durationSeconds = freezed,Object? encryptionEnabled = null,Object? startedAt = freezed,Object? connectedAt = freezed,Object? endedAt = freezed,}) {
  return _then(_CallInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,callType: null == callType ? _self.callType : callType // ignore: cast_nullable_to_non_nullable
as CallType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CallStatus,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,initiatorId: freezed == initiatorId ? _self.initiatorId : initiatorId // ignore: cast_nullable_to_non_nullable
as String?,participantCount: null == participantCount ? _self.participantCount : participantCount // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,encryptionEnabled: null == encryptionEnabled ? _self.encryptionEnabled : encryptionEnabled // ignore: cast_nullable_to_non_nullable
as bool,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,connectedAt: freezed == connectedAt ? _self.connectedAt : connectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endedAt: freezed == endedAt ? _self.endedAt : endedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CallHistoryEntry {

/// Nommé `callInfo` côté Dart : un champ `call` entrerait en collision avec
/// la méthode `call()` que freezed génère pour `copyWith`. La clé JSON
/// reste `call`.
@JsonKey(name: 'call') CallInfo get callInfo; List<UserInfo> get otherParticipants; ParticipantCallStatus? get yourStatus;
/// Create a copy of CallHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallHistoryEntryCopyWith<CallHistoryEntry> get copyWith => _$CallHistoryEntryCopyWithImpl<CallHistoryEntry>(this as CallHistoryEntry, _$identity);

  /// Serializes this CallHistoryEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallHistoryEntry&&(identical(other.callInfo, callInfo) || other.callInfo == callInfo)&&const DeepCollectionEquality().equals(other.otherParticipants, otherParticipants)&&(identical(other.yourStatus, yourStatus) || other.yourStatus == yourStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,callInfo,const DeepCollectionEquality().hash(otherParticipants),yourStatus);

@override
String toString() {
  return 'CallHistoryEntry(callInfo: $callInfo, otherParticipants: $otherParticipants, yourStatus: $yourStatus)';
}


}

/// @nodoc
abstract mixin class $CallHistoryEntryCopyWith<$Res>  {
  factory $CallHistoryEntryCopyWith(CallHistoryEntry value, $Res Function(CallHistoryEntry) _then) = _$CallHistoryEntryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'call') CallInfo callInfo, List<UserInfo> otherParticipants, ParticipantCallStatus? yourStatus
});


$CallInfoCopyWith<$Res> get callInfo;

}
/// @nodoc
class _$CallHistoryEntryCopyWithImpl<$Res>
    implements $CallHistoryEntryCopyWith<$Res> {
  _$CallHistoryEntryCopyWithImpl(this._self, this._then);

  final CallHistoryEntry _self;
  final $Res Function(CallHistoryEntry) _then;

/// Create a copy of CallHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? callInfo = null,Object? otherParticipants = null,Object? yourStatus = freezed,}) {
  return _then(_self.copyWith(
callInfo: null == callInfo ? _self.callInfo : callInfo // ignore: cast_nullable_to_non_nullable
as CallInfo,otherParticipants: null == otherParticipants ? _self.otherParticipants : otherParticipants // ignore: cast_nullable_to_non_nullable
as List<UserInfo>,yourStatus: freezed == yourStatus ? _self.yourStatus : yourStatus // ignore: cast_nullable_to_non_nullable
as ParticipantCallStatus?,
  ));
}
/// Create a copy of CallHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallInfoCopyWith<$Res> get callInfo {
  
  return $CallInfoCopyWith<$Res>(_self.callInfo, (value) {
    return _then(_self.copyWith(callInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [CallHistoryEntry].
extension CallHistoryEntryPatterns on CallHistoryEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallHistoryEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallHistoryEntry value)  $default,){
final _that = this;
switch (_that) {
case _CallHistoryEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallHistoryEntry value)?  $default,){
final _that = this;
switch (_that) {
case _CallHistoryEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'call')  CallInfo callInfo,  List<UserInfo> otherParticipants,  ParticipantCallStatus? yourStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallHistoryEntry() when $default != null:
return $default(_that.callInfo,_that.otherParticipants,_that.yourStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'call')  CallInfo callInfo,  List<UserInfo> otherParticipants,  ParticipantCallStatus? yourStatus)  $default,) {final _that = this;
switch (_that) {
case _CallHistoryEntry():
return $default(_that.callInfo,_that.otherParticipants,_that.yourStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'call')  CallInfo callInfo,  List<UserInfo> otherParticipants,  ParticipantCallStatus? yourStatus)?  $default,) {final _that = this;
switch (_that) {
case _CallHistoryEntry() when $default != null:
return $default(_that.callInfo,_that.otherParticipants,_that.yourStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallHistoryEntry implements CallHistoryEntry {
  const _CallHistoryEntry({@JsonKey(name: 'call') required this.callInfo, final  List<UserInfo> otherParticipants = const <UserInfo>[], this.yourStatus}): _otherParticipants = otherParticipants;
  factory _CallHistoryEntry.fromJson(Map<String, dynamic> json) => _$CallHistoryEntryFromJson(json);

/// Nommé `callInfo` côté Dart : un champ `call` entrerait en collision avec
/// la méthode `call()` que freezed génère pour `copyWith`. La clé JSON
/// reste `call`.
@override@JsonKey(name: 'call') final  CallInfo callInfo;
 final  List<UserInfo> _otherParticipants;
@override@JsonKey() List<UserInfo> get otherParticipants {
  if (_otherParticipants is EqualUnmodifiableListView) return _otherParticipants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_otherParticipants);
}

@override final  ParticipantCallStatus? yourStatus;

/// Create a copy of CallHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallHistoryEntryCopyWith<_CallHistoryEntry> get copyWith => __$CallHistoryEntryCopyWithImpl<_CallHistoryEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallHistoryEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallHistoryEntry&&(identical(other.callInfo, callInfo) || other.callInfo == callInfo)&&const DeepCollectionEquality().equals(other._otherParticipants, _otherParticipants)&&(identical(other.yourStatus, yourStatus) || other.yourStatus == yourStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,callInfo,const DeepCollectionEquality().hash(_otherParticipants),yourStatus);

@override
String toString() {
  return 'CallHistoryEntry(callInfo: $callInfo, otherParticipants: $otherParticipants, yourStatus: $yourStatus)';
}


}

/// @nodoc
abstract mixin class _$CallHistoryEntryCopyWith<$Res> implements $CallHistoryEntryCopyWith<$Res> {
  factory _$CallHistoryEntryCopyWith(_CallHistoryEntry value, $Res Function(_CallHistoryEntry) _then) = __$CallHistoryEntryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'call') CallInfo callInfo, List<UserInfo> otherParticipants, ParticipantCallStatus? yourStatus
});


@override $CallInfoCopyWith<$Res> get callInfo;

}
/// @nodoc
class __$CallHistoryEntryCopyWithImpl<$Res>
    implements _$CallHistoryEntryCopyWith<$Res> {
  __$CallHistoryEntryCopyWithImpl(this._self, this._then);

  final _CallHistoryEntry _self;
  final $Res Function(_CallHistoryEntry) _then;

/// Create a copy of CallHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? callInfo = null,Object? otherParticipants = null,Object? yourStatus = freezed,}) {
  return _then(_CallHistoryEntry(
callInfo: null == callInfo ? _self.callInfo : callInfo // ignore: cast_nullable_to_non_nullable
as CallInfo,otherParticipants: null == otherParticipants ? _self._otherParticipants : otherParticipants // ignore: cast_nullable_to_non_nullable
as List<UserInfo>,yourStatus: freezed == yourStatus ? _self.yourStatus : yourStatus // ignore: cast_nullable_to_non_nullable
as ParticipantCallStatus?,
  ));
}

/// Create a copy of CallHistoryEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CallInfoCopyWith<$Res> get callInfo {
  
  return $CallInfoCopyWith<$Res>(_self.callInfo, (value) {
    return _then(_self.copyWith(callInfo: value));
  });
}
}


/// @nodoc
mixin _$CallHistory {

 List<CallHistoryEntry> get calls; int get total; bool get hasMore;
/// Create a copy of CallHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallHistoryCopyWith<CallHistory> get copyWith => _$CallHistoryCopyWithImpl<CallHistory>(this as CallHistory, _$identity);

  /// Serializes this CallHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallHistory&&const DeepCollectionEquality().equals(other.calls, calls)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(calls),total,hasMore);

@override
String toString() {
  return 'CallHistory(calls: $calls, total: $total, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $CallHistoryCopyWith<$Res>  {
  factory $CallHistoryCopyWith(CallHistory value, $Res Function(CallHistory) _then) = _$CallHistoryCopyWithImpl;
@useResult
$Res call({
 List<CallHistoryEntry> calls, int total, bool hasMore
});




}
/// @nodoc
class _$CallHistoryCopyWithImpl<$Res>
    implements $CallHistoryCopyWith<$Res> {
  _$CallHistoryCopyWithImpl(this._self, this._then);

  final CallHistory _self;
  final $Res Function(CallHistory) _then;

/// Create a copy of CallHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calls = null,Object? total = null,Object? hasMore = null,}) {
  return _then(_self.copyWith(
calls: null == calls ? _self.calls : calls // ignore: cast_nullable_to_non_nullable
as List<CallHistoryEntry>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CallHistory].
extension CallHistoryPatterns on CallHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallHistory value)  $default,){
final _that = this;
switch (_that) {
case _CallHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallHistory value)?  $default,){
final _that = this;
switch (_that) {
case _CallHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CallHistoryEntry> calls,  int total,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallHistory() when $default != null:
return $default(_that.calls,_that.total,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CallHistoryEntry> calls,  int total,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _CallHistory():
return $default(_that.calls,_that.total,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CallHistoryEntry> calls,  int total,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _CallHistory() when $default != null:
return $default(_that.calls,_that.total,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallHistory implements CallHistory {
  const _CallHistory({final  List<CallHistoryEntry> calls = const <CallHistoryEntry>[], this.total = 0, this.hasMore = false}): _calls = calls;
  factory _CallHistory.fromJson(Map<String, dynamic> json) => _$CallHistoryFromJson(json);

 final  List<CallHistoryEntry> _calls;
@override@JsonKey() List<CallHistoryEntry> get calls {
  if (_calls is EqualUnmodifiableListView) return _calls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_calls);
}

@override@JsonKey() final  int total;
@override@JsonKey() final  bool hasMore;

/// Create a copy of CallHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallHistoryCopyWith<_CallHistory> get copyWith => __$CallHistoryCopyWithImpl<_CallHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallHistory&&const DeepCollectionEquality().equals(other._calls, _calls)&&(identical(other.total, total) || other.total == total)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_calls),total,hasMore);

@override
String toString() {
  return 'CallHistory(calls: $calls, total: $total, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$CallHistoryCopyWith<$Res> implements $CallHistoryCopyWith<$Res> {
  factory _$CallHistoryCopyWith(_CallHistory value, $Res Function(_CallHistory) _then) = __$CallHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<CallHistoryEntry> calls, int total, bool hasMore
});




}
/// @nodoc
class __$CallHistoryCopyWithImpl<$Res>
    implements _$CallHistoryCopyWith<$Res> {
  __$CallHistoryCopyWithImpl(this._self, this._then);

  final _CallHistory _self;
  final $Res Function(_CallHistory) _then;

/// Create a copy of CallHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calls = null,Object? total = null,Object? hasMore = null,}) {
  return _then(_CallHistory(
calls: null == calls ? _self._calls : calls // ignore: cast_nullable_to_non_nullable
as List<CallHistoryEntry>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$IceServer {

@JsonKey(fromJson: _urlsDepuisJson) List<String> get urls; String? get username; String? get credential;
/// Create a copy of IceServer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IceServerCopyWith<IceServer> get copyWith => _$IceServerCopyWithImpl<IceServer>(this as IceServer, _$identity);

  /// Serializes this IceServer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IceServer&&const DeepCollectionEquality().equals(other.urls, urls)&&(identical(other.username, username) || other.username == username)&&(identical(other.credential, credential) || other.credential == credential));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(urls),username,credential);

@override
String toString() {
  return 'IceServer(urls: $urls, username: $username, credential: $credential)';
}


}

/// @nodoc
abstract mixin class $IceServerCopyWith<$Res>  {
  factory $IceServerCopyWith(IceServer value, $Res Function(IceServer) _then) = _$IceServerCopyWithImpl;
@useResult
$Res call({
@JsonKey(fromJson: _urlsDepuisJson) List<String> urls, String? username, String? credential
});




}
/// @nodoc
class _$IceServerCopyWithImpl<$Res>
    implements $IceServerCopyWith<$Res> {
  _$IceServerCopyWithImpl(this._self, this._then);

  final IceServer _self;
  final $Res Function(IceServer) _then;

/// Create a copy of IceServer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? urls = null,Object? username = freezed,Object? credential = freezed,}) {
  return _then(_self.copyWith(
urls: null == urls ? _self.urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,credential: freezed == credential ? _self.credential : credential // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IceServer].
extension IceServerPatterns on IceServer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IceServer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IceServer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IceServer value)  $default,){
final _that = this;
switch (_that) {
case _IceServer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IceServer value)?  $default,){
final _that = this;
switch (_that) {
case _IceServer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _urlsDepuisJson)  List<String> urls,  String? username,  String? credential)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IceServer() when $default != null:
return $default(_that.urls,_that.username,_that.credential);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(fromJson: _urlsDepuisJson)  List<String> urls,  String? username,  String? credential)  $default,) {final _that = this;
switch (_that) {
case _IceServer():
return $default(_that.urls,_that.username,_that.credential);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(fromJson: _urlsDepuisJson)  List<String> urls,  String? username,  String? credential)?  $default,) {final _that = this;
switch (_that) {
case _IceServer() when $default != null:
return $default(_that.urls,_that.username,_that.credential);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IceServer implements IceServer {
  const _IceServer({@JsonKey(fromJson: _urlsDepuisJson) required final  List<String> urls, this.username, this.credential}): _urls = urls;
  factory _IceServer.fromJson(Map<String, dynamic> json) => _$IceServerFromJson(json);

 final  List<String> _urls;
@override@JsonKey(fromJson: _urlsDepuisJson) List<String> get urls {
  if (_urls is EqualUnmodifiableListView) return _urls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_urls);
}

@override final  String? username;
@override final  String? credential;

/// Create a copy of IceServer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IceServerCopyWith<_IceServer> get copyWith => __$IceServerCopyWithImpl<_IceServer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IceServerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IceServer&&const DeepCollectionEquality().equals(other._urls, _urls)&&(identical(other.username, username) || other.username == username)&&(identical(other.credential, credential) || other.credential == credential));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_urls),username,credential);

@override
String toString() {
  return 'IceServer(urls: $urls, username: $username, credential: $credential)';
}


}

/// @nodoc
abstract mixin class _$IceServerCopyWith<$Res> implements $IceServerCopyWith<$Res> {
  factory _$IceServerCopyWith(_IceServer value, $Res Function(_IceServer) _then) = __$IceServerCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(fromJson: _urlsDepuisJson) List<String> urls, String? username, String? credential
});




}
/// @nodoc
class __$IceServerCopyWithImpl<$Res>
    implements _$IceServerCopyWith<$Res> {
  __$IceServerCopyWithImpl(this._self, this._then);

  final _IceServer _self;
  final $Res Function(_IceServer) _then;

/// Create a copy of IceServer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? urls = null,Object? username = freezed,Object? credential = freezed,}) {
  return _then(_IceServer(
urls: null == urls ? _self._urls : urls // ignore: cast_nullable_to_non_nullable
as List<String>,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,credential: freezed == credential ? _self.credential : credential // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$IceServersResponse {

 List<IceServer> get iceServers; String? get callId; int get ttl;
/// Create a copy of IceServersResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IceServersResponseCopyWith<IceServersResponse> get copyWith => _$IceServersResponseCopyWithImpl<IceServersResponse>(this as IceServersResponse, _$identity);

  /// Serializes this IceServersResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IceServersResponse&&const DeepCollectionEquality().equals(other.iceServers, iceServers)&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.ttl, ttl) || other.ttl == ttl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(iceServers),callId,ttl);

@override
String toString() {
  return 'IceServersResponse(iceServers: $iceServers, callId: $callId, ttl: $ttl)';
}


}

/// @nodoc
abstract mixin class $IceServersResponseCopyWith<$Res>  {
  factory $IceServersResponseCopyWith(IceServersResponse value, $Res Function(IceServersResponse) _then) = _$IceServersResponseCopyWithImpl;
@useResult
$Res call({
 List<IceServer> iceServers, String? callId, int ttl
});




}
/// @nodoc
class _$IceServersResponseCopyWithImpl<$Res>
    implements $IceServersResponseCopyWith<$Res> {
  _$IceServersResponseCopyWithImpl(this._self, this._then);

  final IceServersResponse _self;
  final $Res Function(IceServersResponse) _then;

/// Create a copy of IceServersResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iceServers = null,Object? callId = freezed,Object? ttl = null,}) {
  return _then(_self.copyWith(
iceServers: null == iceServers ? _self.iceServers : iceServers // ignore: cast_nullable_to_non_nullable
as List<IceServer>,callId: freezed == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String?,ttl: null == ttl ? _self.ttl : ttl // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IceServersResponse].
extension IceServersResponsePatterns on IceServersResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IceServersResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IceServersResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IceServersResponse value)  $default,){
final _that = this;
switch (_that) {
case _IceServersResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IceServersResponse value)?  $default,){
final _that = this;
switch (_that) {
case _IceServersResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IceServer> iceServers,  String? callId,  int ttl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IceServersResponse() when $default != null:
return $default(_that.iceServers,_that.callId,_that.ttl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IceServer> iceServers,  String? callId,  int ttl)  $default,) {final _that = this;
switch (_that) {
case _IceServersResponse():
return $default(_that.iceServers,_that.callId,_that.ttl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IceServer> iceServers,  String? callId,  int ttl)?  $default,) {final _that = this;
switch (_that) {
case _IceServersResponse() when $default != null:
return $default(_that.iceServers,_that.callId,_that.ttl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IceServersResponse implements IceServersResponse {
  const _IceServersResponse({final  List<IceServer> iceServers = const <IceServer>[], this.callId, this.ttl = 86400}): _iceServers = iceServers;
  factory _IceServersResponse.fromJson(Map<String, dynamic> json) => _$IceServersResponseFromJson(json);

 final  List<IceServer> _iceServers;
@override@JsonKey() List<IceServer> get iceServers {
  if (_iceServers is EqualUnmodifiableListView) return _iceServers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_iceServers);
}

@override final  String? callId;
@override@JsonKey() final  int ttl;

/// Create a copy of IceServersResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IceServersResponseCopyWith<_IceServersResponse> get copyWith => __$IceServersResponseCopyWithImpl<_IceServersResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IceServersResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IceServersResponse&&const DeepCollectionEquality().equals(other._iceServers, _iceServers)&&(identical(other.callId, callId) || other.callId == callId)&&(identical(other.ttl, ttl) || other.ttl == ttl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_iceServers),callId,ttl);

@override
String toString() {
  return 'IceServersResponse(iceServers: $iceServers, callId: $callId, ttl: $ttl)';
}


}

/// @nodoc
abstract mixin class _$IceServersResponseCopyWith<$Res> implements $IceServersResponseCopyWith<$Res> {
  factory _$IceServersResponseCopyWith(_IceServersResponse value, $Res Function(_IceServersResponse) _then) = __$IceServersResponseCopyWithImpl;
@override @useResult
$Res call({
 List<IceServer> iceServers, String? callId, int ttl
});




}
/// @nodoc
class __$IceServersResponseCopyWithImpl<$Res>
    implements _$IceServersResponseCopyWith<$Res> {
  __$IceServersResponseCopyWithImpl(this._self, this._then);

  final _IceServersResponse _self;
  final $Res Function(_IceServersResponse) _then;

/// Create a copy of IceServersResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iceServers = null,Object? callId = freezed,Object? ttl = null,}) {
  return _then(_IceServersResponse(
iceServers: null == iceServers ? _self._iceServers : iceServers // ignore: cast_nullable_to_non_nullable
as List<IceServer>,callId: freezed == callId ? _self.callId : callId // ignore: cast_nullable_to_non_nullable
as String?,ttl: null == ttl ? _self.ttl : ttl // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
