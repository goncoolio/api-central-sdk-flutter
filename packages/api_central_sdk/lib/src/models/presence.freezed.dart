// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresenceResponse {

 String get userId; String get status; String? get lastSeenAt;
/// Create a copy of PresenceResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceResponseCopyWith<PresenceResponse> get copyWith => _$PresenceResponseCopyWithImpl<PresenceResponse>(this as PresenceResponse, _$identity);

  /// Serializes this PresenceResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status,lastSeenAt);

@override
String toString() {
  return 'PresenceResponse(userId: $userId, status: $status, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class $PresenceResponseCopyWith<$Res>  {
  factory $PresenceResponseCopyWith(PresenceResponse value, $Res Function(PresenceResponse) _then) = _$PresenceResponseCopyWithImpl;
@useResult
$Res call({
 String userId, String status, String? lastSeenAt
});




}
/// @nodoc
class _$PresenceResponseCopyWithImpl<$Res>
    implements $PresenceResponseCopyWith<$Res> {
  _$PresenceResponseCopyWithImpl(this._self, this._then);

  final PresenceResponse _self;
  final $Res Function(PresenceResponse) _then;

/// Create a copy of PresenceResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? status = null,Object? lastSeenAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PresenceResponse].
extension PresenceResponsePatterns on PresenceResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresenceResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresenceResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresenceResponse value)  $default,){
final _that = this;
switch (_that) {
case _PresenceResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresenceResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PresenceResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String status,  String? lastSeenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresenceResponse() when $default != null:
return $default(_that.userId,_that.status,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String status,  String? lastSeenAt)  $default,) {final _that = this;
switch (_that) {
case _PresenceResponse():
return $default(_that.userId,_that.status,_that.lastSeenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String status,  String? lastSeenAt)?  $default,) {final _that = this;
switch (_that) {
case _PresenceResponse() when $default != null:
return $default(_that.userId,_that.status,_that.lastSeenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresenceResponse implements PresenceResponse {
  const _PresenceResponse({required this.userId, required this.status, this.lastSeenAt});
  factory _PresenceResponse.fromJson(Map<String, dynamic> json) => _$PresenceResponseFromJson(json);

@override final  String userId;
@override final  String status;
@override final  String? lastSeenAt;

/// Create a copy of PresenceResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresenceResponseCopyWith<_PresenceResponse> get copyWith => __$PresenceResponseCopyWithImpl<_PresenceResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresenceResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresenceResponse&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastSeenAt, lastSeenAt) || other.lastSeenAt == lastSeenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status,lastSeenAt);

@override
String toString() {
  return 'PresenceResponse(userId: $userId, status: $status, lastSeenAt: $lastSeenAt)';
}


}

/// @nodoc
abstract mixin class _$PresenceResponseCopyWith<$Res> implements $PresenceResponseCopyWith<$Res> {
  factory _$PresenceResponseCopyWith(_PresenceResponse value, $Res Function(_PresenceResponse) _then) = __$PresenceResponseCopyWithImpl;
@override @useResult
$Res call({
 String userId, String status, String? lastSeenAt
});




}
/// @nodoc
class __$PresenceResponseCopyWithImpl<$Res>
    implements _$PresenceResponseCopyWith<$Res> {
  __$PresenceResponseCopyWithImpl(this._self, this._then);

  final _PresenceResponse _self;
  final $Res Function(_PresenceResponse) _then;

/// Create a copy of PresenceResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? status = null,Object? lastSeenAt = freezed,}) {
  return _then(_PresenceResponse(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastSeenAt: freezed == lastSeenAt ? _self.lastSeenAt : lastSeenAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PresenceStatusItem {

 String get userId; String get status;
/// Create a copy of PresenceStatusItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceStatusItemCopyWith<PresenceStatusItem> get copyWith => _$PresenceStatusItemCopyWithImpl<PresenceStatusItem>(this as PresenceStatusItem, _$identity);

  /// Serializes this PresenceStatusItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceStatusItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status);

@override
String toString() {
  return 'PresenceStatusItem(userId: $userId, status: $status)';
}


}

/// @nodoc
abstract mixin class $PresenceStatusItemCopyWith<$Res>  {
  factory $PresenceStatusItemCopyWith(PresenceStatusItem value, $Res Function(PresenceStatusItem) _then) = _$PresenceStatusItemCopyWithImpl;
@useResult
$Res call({
 String userId, String status
});




}
/// @nodoc
class _$PresenceStatusItemCopyWithImpl<$Res>
    implements $PresenceStatusItemCopyWith<$Res> {
  _$PresenceStatusItemCopyWithImpl(this._self, this._then);

  final PresenceStatusItem _self;
  final $Res Function(PresenceStatusItem) _then;

/// Create a copy of PresenceStatusItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? status = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PresenceStatusItem].
extension PresenceStatusItemPatterns on PresenceStatusItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresenceStatusItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresenceStatusItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresenceStatusItem value)  $default,){
final _that = this;
switch (_that) {
case _PresenceStatusItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresenceStatusItem value)?  $default,){
final _that = this;
switch (_that) {
case _PresenceStatusItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresenceStatusItem() when $default != null:
return $default(_that.userId,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String status)  $default,) {final _that = this;
switch (_that) {
case _PresenceStatusItem():
return $default(_that.userId,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PresenceStatusItem() when $default != null:
return $default(_that.userId,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresenceStatusItem implements PresenceStatusItem {
  const _PresenceStatusItem({required this.userId, required this.status});
  factory _PresenceStatusItem.fromJson(Map<String, dynamic> json) => _$PresenceStatusItemFromJson(json);

@override final  String userId;
@override final  String status;

/// Create a copy of PresenceStatusItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresenceStatusItemCopyWith<_PresenceStatusItem> get copyWith => __$PresenceStatusItemCopyWithImpl<_PresenceStatusItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresenceStatusItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresenceStatusItem&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,status);

@override
String toString() {
  return 'PresenceStatusItem(userId: $userId, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PresenceStatusItemCopyWith<$Res> implements $PresenceStatusItemCopyWith<$Res> {
  factory _$PresenceStatusItemCopyWith(_PresenceStatusItem value, $Res Function(_PresenceStatusItem) _then) = __$PresenceStatusItemCopyWithImpl;
@override @useResult
$Res call({
 String userId, String status
});




}
/// @nodoc
class __$PresenceStatusItemCopyWithImpl<$Res>
    implements _$PresenceStatusItemCopyWith<$Res> {
  __$PresenceStatusItemCopyWithImpl(this._self, this._then);

  final _PresenceStatusItem _self;
  final $Res Function(_PresenceStatusItem) _then;

/// Create a copy of PresenceStatusItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? status = null,}) {
  return _then(_PresenceStatusItem(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
