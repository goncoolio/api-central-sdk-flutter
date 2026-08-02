// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotification {

 String get id; String get type; String get title; String get body; Map<String, dynamic>? get data; bool get isRead; DateTime? get readAt; DateTime? get createdAt;
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationCopyWith<AppNotification> get copyWith => _$AppNotificationCopyWithImpl<AppNotification>(this as AppNotification, _$identity);

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,body,const DeepCollectionEquality().hash(data),isRead,readAt,createdAt);

@override
String toString() {
  return 'AppNotification(id: $id, type: $type, title: $title, body: $body, data: $data, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res>  {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) _then) = _$AppNotificationCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String body, Map<String, dynamic>? data, bool isRead, DateTime? readAt, DateTime? createdAt
});




}
/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? data = freezed,Object? isRead = null,Object? readAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotification value)  $default,){
final _that = this;
switch (_that) {
case _AppNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotification value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body,  Map<String, dynamic>? data,  bool isRead,  DateTime? readAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.data,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body,  Map<String, dynamic>? data,  bool isRead,  DateTime? readAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppNotification():
return $default(_that.id,_that.type,_that.title,_that.body,_that.data,_that.isRead,_that.readAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String body,  Map<String, dynamic>? data,  bool isRead,  DateTime? readAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.data,_that.isRead,_that.readAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotification implements AppNotification {
  const _AppNotification({required this.id, required this.type, required this.title, required this.body, final  Map<String, dynamic>? data, this.isRead = false, this.readAt, this.createdAt}): _data = data;
  factory _AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);

@override final  String id;
@override final  String type;
@override final  String title;
@override final  String body;
 final  Map<String, dynamic>? _data;
@override Map<String, dynamic>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  bool isRead;
@override final  DateTime? readAt;
@override final  DateTime? createdAt;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationCopyWith<_AppNotification> get copyWith => __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,body,const DeepCollectionEquality().hash(_data),isRead,readAt,createdAt);

@override
String toString() {
  return 'AppNotification(id: $id, type: $type, title: $title, body: $body, data: $data, isRead: $isRead, readAt: $readAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(_AppNotification value, $Res Function(_AppNotification) _then) = __$AppNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String body, Map<String, dynamic>? data, bool isRead, DateTime? readAt, DateTime? createdAt
});




}
/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? data = freezed,Object? isRead = null,Object? readAt = freezed,Object? createdAt = freezed,}) {
  return _then(_AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BulkSendResult {

 bool get success; int get sentCount;
/// Create a copy of BulkSendResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulkSendResultCopyWith<BulkSendResult> get copyWith => _$BulkSendResultCopyWithImpl<BulkSendResult>(this as BulkSendResult, _$identity);

  /// Serializes this BulkSendResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BulkSendResult&&(identical(other.success, success) || other.success == success)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,sentCount);

@override
String toString() {
  return 'BulkSendResult(success: $success, sentCount: $sentCount)';
}


}

/// @nodoc
abstract mixin class $BulkSendResultCopyWith<$Res>  {
  factory $BulkSendResultCopyWith(BulkSendResult value, $Res Function(BulkSendResult) _then) = _$BulkSendResultCopyWithImpl;
@useResult
$Res call({
 bool success, int sentCount
});




}
/// @nodoc
class _$BulkSendResultCopyWithImpl<$Res>
    implements $BulkSendResultCopyWith<$Res> {
  _$BulkSendResultCopyWithImpl(this._self, this._then);

  final BulkSendResult _self;
  final $Res Function(BulkSendResult) _then;

/// Create a copy of BulkSendResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? sentCount = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BulkSendResult].
extension BulkSendResultPatterns on BulkSendResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BulkSendResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BulkSendResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BulkSendResult value)  $default,){
final _that = this;
switch (_that) {
case _BulkSendResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BulkSendResult value)?  $default,){
final _that = this;
switch (_that) {
case _BulkSendResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int sentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BulkSendResult() when $default != null:
return $default(_that.success,_that.sentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int sentCount)  $default,) {final _that = this;
switch (_that) {
case _BulkSendResult():
return $default(_that.success,_that.sentCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int sentCount)?  $default,) {final _that = this;
switch (_that) {
case _BulkSendResult() when $default != null:
return $default(_that.success,_that.sentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BulkSendResult implements BulkSendResult {
  const _BulkSendResult({this.success = false, this.sentCount = 0});
  factory _BulkSendResult.fromJson(Map<String, dynamic> json) => _$BulkSendResultFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  int sentCount;

/// Create a copy of BulkSendResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BulkSendResultCopyWith<_BulkSendResult> get copyWith => __$BulkSendResultCopyWithImpl<_BulkSendResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BulkSendResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BulkSendResult&&(identical(other.success, success) || other.success == success)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,sentCount);

@override
String toString() {
  return 'BulkSendResult(success: $success, sentCount: $sentCount)';
}


}

/// @nodoc
abstract mixin class _$BulkSendResultCopyWith<$Res> implements $BulkSendResultCopyWith<$Res> {
  factory _$BulkSendResultCopyWith(_BulkSendResult value, $Res Function(_BulkSendResult) _then) = __$BulkSendResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, int sentCount
});




}
/// @nodoc
class __$BulkSendResultCopyWithImpl<$Res>
    implements _$BulkSendResultCopyWith<$Res> {
  __$BulkSendResultCopyWithImpl(this._self, this._then);

  final _BulkSendResult _self;
  final $Res Function(_BulkSendResult) _then;

/// Create a copy of BulkSendResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? sentCount = null,}) {
  return _then(_BulkSendResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BroadcastResult {

 bool get success; int get sentCount; int get totalUsers;
/// Create a copy of BroadcastResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BroadcastResultCopyWith<BroadcastResult> get copyWith => _$BroadcastResultCopyWithImpl<BroadcastResult>(this as BroadcastResult, _$identity);

  /// Serializes this BroadcastResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BroadcastResult&&(identical(other.success, success) || other.success == success)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,sentCount,totalUsers);

@override
String toString() {
  return 'BroadcastResult(success: $success, sentCount: $sentCount, totalUsers: $totalUsers)';
}


}

/// @nodoc
abstract mixin class $BroadcastResultCopyWith<$Res>  {
  factory $BroadcastResultCopyWith(BroadcastResult value, $Res Function(BroadcastResult) _then) = _$BroadcastResultCopyWithImpl;
@useResult
$Res call({
 bool success, int sentCount, int totalUsers
});




}
/// @nodoc
class _$BroadcastResultCopyWithImpl<$Res>
    implements $BroadcastResultCopyWith<$Res> {
  _$BroadcastResultCopyWithImpl(this._self, this._then);

  final BroadcastResult _self;
  final $Res Function(BroadcastResult) _then;

/// Create a copy of BroadcastResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? sentCount = null,Object? totalUsers = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BroadcastResult].
extension BroadcastResultPatterns on BroadcastResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BroadcastResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BroadcastResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BroadcastResult value)  $default,){
final _that = this;
switch (_that) {
case _BroadcastResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BroadcastResult value)?  $default,){
final _that = this;
switch (_that) {
case _BroadcastResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int sentCount,  int totalUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BroadcastResult() when $default != null:
return $default(_that.success,_that.sentCount,_that.totalUsers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int sentCount,  int totalUsers)  $default,) {final _that = this;
switch (_that) {
case _BroadcastResult():
return $default(_that.success,_that.sentCount,_that.totalUsers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int sentCount,  int totalUsers)?  $default,) {final _that = this;
switch (_that) {
case _BroadcastResult() when $default != null:
return $default(_that.success,_that.sentCount,_that.totalUsers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BroadcastResult implements BroadcastResult {
  const _BroadcastResult({this.success = false, this.sentCount = 0, this.totalUsers = 0});
  factory _BroadcastResult.fromJson(Map<String, dynamic> json) => _$BroadcastResultFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  int sentCount;
@override@JsonKey() final  int totalUsers;

/// Create a copy of BroadcastResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BroadcastResultCopyWith<_BroadcastResult> get copyWith => __$BroadcastResultCopyWithImpl<_BroadcastResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BroadcastResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BroadcastResult&&(identical(other.success, success) || other.success == success)&&(identical(other.sentCount, sentCount) || other.sentCount == sentCount)&&(identical(other.totalUsers, totalUsers) || other.totalUsers == totalUsers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,sentCount,totalUsers);

@override
String toString() {
  return 'BroadcastResult(success: $success, sentCount: $sentCount, totalUsers: $totalUsers)';
}


}

/// @nodoc
abstract mixin class _$BroadcastResultCopyWith<$Res> implements $BroadcastResultCopyWith<$Res> {
  factory _$BroadcastResultCopyWith(_BroadcastResult value, $Res Function(_BroadcastResult) _then) = __$BroadcastResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, int sentCount, int totalUsers
});




}
/// @nodoc
class __$BroadcastResultCopyWithImpl<$Res>
    implements _$BroadcastResultCopyWith<$Res> {
  __$BroadcastResultCopyWithImpl(this._self, this._then);

  final _BroadcastResult _self;
  final $Res Function(_BroadcastResult) _then;

/// Create a copy of BroadcastResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? sentCount = null,Object? totalUsers = null,}) {
  return _then(_BroadcastResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,sentCount: null == sentCount ? _self.sentCount : sentCount // ignore: cast_nullable_to_non_nullable
as int,totalUsers: null == totalUsers ? _self.totalUsers : totalUsers // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MarkReadResult {

 bool get success; int get updatedCount;
/// Create a copy of MarkReadResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkReadResultCopyWith<MarkReadResult> get copyWith => _$MarkReadResultCopyWithImpl<MarkReadResult>(this as MarkReadResult, _$identity);

  /// Serializes this MarkReadResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkReadResult&&(identical(other.success, success) || other.success == success)&&(identical(other.updatedCount, updatedCount) || other.updatedCount == updatedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,updatedCount);

@override
String toString() {
  return 'MarkReadResult(success: $success, updatedCount: $updatedCount)';
}


}

/// @nodoc
abstract mixin class $MarkReadResultCopyWith<$Res>  {
  factory $MarkReadResultCopyWith(MarkReadResult value, $Res Function(MarkReadResult) _then) = _$MarkReadResultCopyWithImpl;
@useResult
$Res call({
 bool success, int updatedCount
});




}
/// @nodoc
class _$MarkReadResultCopyWithImpl<$Res>
    implements $MarkReadResultCopyWith<$Res> {
  _$MarkReadResultCopyWithImpl(this._self, this._then);

  final MarkReadResult _self;
  final $Res Function(MarkReadResult) _then;

/// Create a copy of MarkReadResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? updatedCount = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,updatedCount: null == updatedCount ? _self.updatedCount : updatedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkReadResult].
extension MarkReadResultPatterns on MarkReadResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkReadResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkReadResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkReadResult value)  $default,){
final _that = this;
switch (_that) {
case _MarkReadResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkReadResult value)?  $default,){
final _that = this;
switch (_that) {
case _MarkReadResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  int updatedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkReadResult() when $default != null:
return $default(_that.success,_that.updatedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  int updatedCount)  $default,) {final _that = this;
switch (_that) {
case _MarkReadResult():
return $default(_that.success,_that.updatedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  int updatedCount)?  $default,) {final _that = this;
switch (_that) {
case _MarkReadResult() when $default != null:
return $default(_that.success,_that.updatedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkReadResult implements MarkReadResult {
  const _MarkReadResult({this.success = false, this.updatedCount = 0});
  factory _MarkReadResult.fromJson(Map<String, dynamic> json) => _$MarkReadResultFromJson(json);

@override@JsonKey() final  bool success;
@override@JsonKey() final  int updatedCount;

/// Create a copy of MarkReadResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkReadResultCopyWith<_MarkReadResult> get copyWith => __$MarkReadResultCopyWithImpl<_MarkReadResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkReadResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkReadResult&&(identical(other.success, success) || other.success == success)&&(identical(other.updatedCount, updatedCount) || other.updatedCount == updatedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,updatedCount);

@override
String toString() {
  return 'MarkReadResult(success: $success, updatedCount: $updatedCount)';
}


}

/// @nodoc
abstract mixin class _$MarkReadResultCopyWith<$Res> implements $MarkReadResultCopyWith<$Res> {
  factory _$MarkReadResultCopyWith(_MarkReadResult value, $Res Function(_MarkReadResult) _then) = __$MarkReadResultCopyWithImpl;
@override @useResult
$Res call({
 bool success, int updatedCount
});




}
/// @nodoc
class __$MarkReadResultCopyWithImpl<$Res>
    implements _$MarkReadResultCopyWith<$Res> {
  __$MarkReadResultCopyWithImpl(this._self, this._then);

  final _MarkReadResult _self;
  final $Res Function(_MarkReadResult) _then;

/// Create a copy of MarkReadResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? updatedCount = null,}) {
  return _then(_MarkReadResult(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,updatedCount: null == updatedCount ? _self.updatedCount : updatedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
