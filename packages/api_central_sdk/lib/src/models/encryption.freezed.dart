// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'encryption.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreKeyInfo {

 int get prekeyId; String get prekey;
/// Create a copy of PreKeyInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreKeyInfoCopyWith<PreKeyInfo> get copyWith => _$PreKeyInfoCopyWithImpl<PreKeyInfo>(this as PreKeyInfo, _$identity);

  /// Serializes this PreKeyInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreKeyInfo&&(identical(other.prekeyId, prekeyId) || other.prekeyId == prekeyId)&&(identical(other.prekey, prekey) || other.prekey == prekey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prekeyId,prekey);

@override
String toString() {
  return 'PreKeyInfo(prekeyId: $prekeyId, prekey: $prekey)';
}


}

/// @nodoc
abstract mixin class $PreKeyInfoCopyWith<$Res>  {
  factory $PreKeyInfoCopyWith(PreKeyInfo value, $Res Function(PreKeyInfo) _then) = _$PreKeyInfoCopyWithImpl;
@useResult
$Res call({
 int prekeyId, String prekey
});




}
/// @nodoc
class _$PreKeyInfoCopyWithImpl<$Res>
    implements $PreKeyInfoCopyWith<$Res> {
  _$PreKeyInfoCopyWithImpl(this._self, this._then);

  final PreKeyInfo _self;
  final $Res Function(PreKeyInfo) _then;

/// Create a copy of PreKeyInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prekeyId = null,Object? prekey = null,}) {
  return _then(_self.copyWith(
prekeyId: null == prekeyId ? _self.prekeyId : prekeyId // ignore: cast_nullable_to_non_nullable
as int,prekey: null == prekey ? _self.prekey : prekey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PreKeyInfo].
extension PreKeyInfoPatterns on PreKeyInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreKeyInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreKeyInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreKeyInfo value)  $default,){
final _that = this;
switch (_that) {
case _PreKeyInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreKeyInfo value)?  $default,){
final _that = this;
switch (_that) {
case _PreKeyInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int prekeyId,  String prekey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreKeyInfo() when $default != null:
return $default(_that.prekeyId,_that.prekey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int prekeyId,  String prekey)  $default,) {final _that = this;
switch (_that) {
case _PreKeyInfo():
return $default(_that.prekeyId,_that.prekey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int prekeyId,  String prekey)?  $default,) {final _that = this;
switch (_that) {
case _PreKeyInfo() when $default != null:
return $default(_that.prekeyId,_that.prekey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreKeyInfo implements PreKeyInfo {
  const _PreKeyInfo({required this.prekeyId, required this.prekey});
  factory _PreKeyInfo.fromJson(Map<String, dynamic> json) => _$PreKeyInfoFromJson(json);

@override final  int prekeyId;
@override final  String prekey;

/// Create a copy of PreKeyInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreKeyInfoCopyWith<_PreKeyInfo> get copyWith => __$PreKeyInfoCopyWithImpl<_PreKeyInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreKeyInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreKeyInfo&&(identical(other.prekeyId, prekeyId) || other.prekeyId == prekeyId)&&(identical(other.prekey, prekey) || other.prekey == prekey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prekeyId,prekey);

@override
String toString() {
  return 'PreKeyInfo(prekeyId: $prekeyId, prekey: $prekey)';
}


}

/// @nodoc
abstract mixin class _$PreKeyInfoCopyWith<$Res> implements $PreKeyInfoCopyWith<$Res> {
  factory _$PreKeyInfoCopyWith(_PreKeyInfo value, $Res Function(_PreKeyInfo) _then) = __$PreKeyInfoCopyWithImpl;
@override @useResult
$Res call({
 int prekeyId, String prekey
});




}
/// @nodoc
class __$PreKeyInfoCopyWithImpl<$Res>
    implements _$PreKeyInfoCopyWith<$Res> {
  __$PreKeyInfoCopyWithImpl(this._self, this._then);

  final _PreKeyInfo _self;
  final $Res Function(_PreKeyInfo) _then;

/// Create a copy of PreKeyInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prekeyId = null,Object? prekey = null,}) {
  return _then(_PreKeyInfo(
prekeyId: null == prekeyId ? _self.prekeyId : prekeyId // ignore: cast_nullable_to_non_nullable
as int,prekey: null == prekey ? _self.prekey : prekey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PreKeyBundle {

 String get userId; String get identityKey; int get signedPrekeyId; String get signedPrekey; String get signedPrekeySignature; PreKeyInfo? get prekey;
/// Create a copy of PreKeyBundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreKeyBundleCopyWith<PreKeyBundle> get copyWith => _$PreKeyBundleCopyWithImpl<PreKeyBundle>(this as PreKeyBundle, _$identity);

  /// Serializes this PreKeyBundle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreKeyBundle&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.identityKey, identityKey) || other.identityKey == identityKey)&&(identical(other.signedPrekeyId, signedPrekeyId) || other.signedPrekeyId == signedPrekeyId)&&(identical(other.signedPrekey, signedPrekey) || other.signedPrekey == signedPrekey)&&(identical(other.signedPrekeySignature, signedPrekeySignature) || other.signedPrekeySignature == signedPrekeySignature)&&(identical(other.prekey, prekey) || other.prekey == prekey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,identityKey,signedPrekeyId,signedPrekey,signedPrekeySignature,prekey);

@override
String toString() {
  return 'PreKeyBundle(userId: $userId, identityKey: $identityKey, signedPrekeyId: $signedPrekeyId, signedPrekey: $signedPrekey, signedPrekeySignature: $signedPrekeySignature, prekey: $prekey)';
}


}

/// @nodoc
abstract mixin class $PreKeyBundleCopyWith<$Res>  {
  factory $PreKeyBundleCopyWith(PreKeyBundle value, $Res Function(PreKeyBundle) _then) = _$PreKeyBundleCopyWithImpl;
@useResult
$Res call({
 String userId, String identityKey, int signedPrekeyId, String signedPrekey, String signedPrekeySignature, PreKeyInfo? prekey
});


$PreKeyInfoCopyWith<$Res>? get prekey;

}
/// @nodoc
class _$PreKeyBundleCopyWithImpl<$Res>
    implements $PreKeyBundleCopyWith<$Res> {
  _$PreKeyBundleCopyWithImpl(this._self, this._then);

  final PreKeyBundle _self;
  final $Res Function(PreKeyBundle) _then;

/// Create a copy of PreKeyBundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? identityKey = null,Object? signedPrekeyId = null,Object? signedPrekey = null,Object? signedPrekeySignature = null,Object? prekey = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,identityKey: null == identityKey ? _self.identityKey : identityKey // ignore: cast_nullable_to_non_nullable
as String,signedPrekeyId: null == signedPrekeyId ? _self.signedPrekeyId : signedPrekeyId // ignore: cast_nullable_to_non_nullable
as int,signedPrekey: null == signedPrekey ? _self.signedPrekey : signedPrekey // ignore: cast_nullable_to_non_nullable
as String,signedPrekeySignature: null == signedPrekeySignature ? _self.signedPrekeySignature : signedPrekeySignature // ignore: cast_nullable_to_non_nullable
as String,prekey: freezed == prekey ? _self.prekey : prekey // ignore: cast_nullable_to_non_nullable
as PreKeyInfo?,
  ));
}
/// Create a copy of PreKeyBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreKeyInfoCopyWith<$Res>? get prekey {
    if (_self.prekey == null) {
    return null;
  }

  return $PreKeyInfoCopyWith<$Res>(_self.prekey!, (value) {
    return _then(_self.copyWith(prekey: value));
  });
}
}


/// Adds pattern-matching-related methods to [PreKeyBundle].
extension PreKeyBundlePatterns on PreKeyBundle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreKeyBundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreKeyBundle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreKeyBundle value)  $default,){
final _that = this;
switch (_that) {
case _PreKeyBundle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreKeyBundle value)?  $default,){
final _that = this;
switch (_that) {
case _PreKeyBundle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String identityKey,  int signedPrekeyId,  String signedPrekey,  String signedPrekeySignature,  PreKeyInfo? prekey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreKeyBundle() when $default != null:
return $default(_that.userId,_that.identityKey,_that.signedPrekeyId,_that.signedPrekey,_that.signedPrekeySignature,_that.prekey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String identityKey,  int signedPrekeyId,  String signedPrekey,  String signedPrekeySignature,  PreKeyInfo? prekey)  $default,) {final _that = this;
switch (_that) {
case _PreKeyBundle():
return $default(_that.userId,_that.identityKey,_that.signedPrekeyId,_that.signedPrekey,_that.signedPrekeySignature,_that.prekey);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String identityKey,  int signedPrekeyId,  String signedPrekey,  String signedPrekeySignature,  PreKeyInfo? prekey)?  $default,) {final _that = this;
switch (_that) {
case _PreKeyBundle() when $default != null:
return $default(_that.userId,_that.identityKey,_that.signedPrekeyId,_that.signedPrekey,_that.signedPrekeySignature,_that.prekey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreKeyBundle implements PreKeyBundle {
  const _PreKeyBundle({required this.userId, required this.identityKey, required this.signedPrekeyId, required this.signedPrekey, required this.signedPrekeySignature, this.prekey});
  factory _PreKeyBundle.fromJson(Map<String, dynamic> json) => _$PreKeyBundleFromJson(json);

@override final  String userId;
@override final  String identityKey;
@override final  int signedPrekeyId;
@override final  String signedPrekey;
@override final  String signedPrekeySignature;
@override final  PreKeyInfo? prekey;

/// Create a copy of PreKeyBundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreKeyBundleCopyWith<_PreKeyBundle> get copyWith => __$PreKeyBundleCopyWithImpl<_PreKeyBundle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreKeyBundleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreKeyBundle&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.identityKey, identityKey) || other.identityKey == identityKey)&&(identical(other.signedPrekeyId, signedPrekeyId) || other.signedPrekeyId == signedPrekeyId)&&(identical(other.signedPrekey, signedPrekey) || other.signedPrekey == signedPrekey)&&(identical(other.signedPrekeySignature, signedPrekeySignature) || other.signedPrekeySignature == signedPrekeySignature)&&(identical(other.prekey, prekey) || other.prekey == prekey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,identityKey,signedPrekeyId,signedPrekey,signedPrekeySignature,prekey);

@override
String toString() {
  return 'PreKeyBundle(userId: $userId, identityKey: $identityKey, signedPrekeyId: $signedPrekeyId, signedPrekey: $signedPrekey, signedPrekeySignature: $signedPrekeySignature, prekey: $prekey)';
}


}

/// @nodoc
abstract mixin class _$PreKeyBundleCopyWith<$Res> implements $PreKeyBundleCopyWith<$Res> {
  factory _$PreKeyBundleCopyWith(_PreKeyBundle value, $Res Function(_PreKeyBundle) _then) = __$PreKeyBundleCopyWithImpl;
@override @useResult
$Res call({
 String userId, String identityKey, int signedPrekeyId, String signedPrekey, String signedPrekeySignature, PreKeyInfo? prekey
});


@override $PreKeyInfoCopyWith<$Res>? get prekey;

}
/// @nodoc
class __$PreKeyBundleCopyWithImpl<$Res>
    implements _$PreKeyBundleCopyWith<$Res> {
  __$PreKeyBundleCopyWithImpl(this._self, this._then);

  final _PreKeyBundle _self;
  final $Res Function(_PreKeyBundle) _then;

/// Create a copy of PreKeyBundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? identityKey = null,Object? signedPrekeyId = null,Object? signedPrekey = null,Object? signedPrekeySignature = null,Object? prekey = freezed,}) {
  return _then(_PreKeyBundle(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,identityKey: null == identityKey ? _self.identityKey : identityKey // ignore: cast_nullable_to_non_nullable
as String,signedPrekeyId: null == signedPrekeyId ? _self.signedPrekeyId : signedPrekeyId // ignore: cast_nullable_to_non_nullable
as int,signedPrekey: null == signedPrekey ? _self.signedPrekey : signedPrekey // ignore: cast_nullable_to_non_nullable
as String,signedPrekeySignature: null == signedPrekeySignature ? _self.signedPrekeySignature : signedPrekeySignature // ignore: cast_nullable_to_non_nullable
as String,prekey: freezed == prekey ? _self.prekey : prekey // ignore: cast_nullable_to_non_nullable
as PreKeyInfo?,
  ));
}

/// Create a copy of PreKeyBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PreKeyInfoCopyWith<$Res>? get prekey {
    if (_self.prekey == null) {
    return null;
  }

  return $PreKeyInfoCopyWith<$Res>(_self.prekey!, (value) {
    return _then(_self.copyWith(prekey: value));
  });
}
}


/// @nodoc
mixin _$PreKeyCount {

 String get userId; int get availablePrekeys;
/// Create a copy of PreKeyCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreKeyCountCopyWith<PreKeyCount> get copyWith => _$PreKeyCountCopyWithImpl<PreKeyCount>(this as PreKeyCount, _$identity);

  /// Serializes this PreKeyCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreKeyCount&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.availablePrekeys, availablePrekeys) || other.availablePrekeys == availablePrekeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,availablePrekeys);

@override
String toString() {
  return 'PreKeyCount(userId: $userId, availablePrekeys: $availablePrekeys)';
}


}

/// @nodoc
abstract mixin class $PreKeyCountCopyWith<$Res>  {
  factory $PreKeyCountCopyWith(PreKeyCount value, $Res Function(PreKeyCount) _then) = _$PreKeyCountCopyWithImpl;
@useResult
$Res call({
 String userId, int availablePrekeys
});




}
/// @nodoc
class _$PreKeyCountCopyWithImpl<$Res>
    implements $PreKeyCountCopyWith<$Res> {
  _$PreKeyCountCopyWithImpl(this._self, this._then);

  final PreKeyCount _self;
  final $Res Function(PreKeyCount) _then;

/// Create a copy of PreKeyCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? availablePrekeys = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,availablePrekeys: null == availablePrekeys ? _self.availablePrekeys : availablePrekeys // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PreKeyCount].
extension PreKeyCountPatterns on PreKeyCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreKeyCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreKeyCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreKeyCount value)  $default,){
final _that = this;
switch (_that) {
case _PreKeyCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreKeyCount value)?  $default,){
final _that = this;
switch (_that) {
case _PreKeyCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  int availablePrekeys)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreKeyCount() when $default != null:
return $default(_that.userId,_that.availablePrekeys);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  int availablePrekeys)  $default,) {final _that = this;
switch (_that) {
case _PreKeyCount():
return $default(_that.userId,_that.availablePrekeys);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  int availablePrekeys)?  $default,) {final _that = this;
switch (_that) {
case _PreKeyCount() when $default != null:
return $default(_that.userId,_that.availablePrekeys);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreKeyCount implements PreKeyCount {
  const _PreKeyCount({required this.userId, this.availablePrekeys = 0});
  factory _PreKeyCount.fromJson(Map<String, dynamic> json) => _$PreKeyCountFromJson(json);

@override final  String userId;
@override@JsonKey() final  int availablePrekeys;

/// Create a copy of PreKeyCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreKeyCountCopyWith<_PreKeyCount> get copyWith => __$PreKeyCountCopyWithImpl<_PreKeyCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreKeyCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreKeyCount&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.availablePrekeys, availablePrekeys) || other.availablePrekeys == availablePrekeys));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,availablePrekeys);

@override
String toString() {
  return 'PreKeyCount(userId: $userId, availablePrekeys: $availablePrekeys)';
}


}

/// @nodoc
abstract mixin class _$PreKeyCountCopyWith<$Res> implements $PreKeyCountCopyWith<$Res> {
  factory _$PreKeyCountCopyWith(_PreKeyCount value, $Res Function(_PreKeyCount) _then) = __$PreKeyCountCopyWithImpl;
@override @useResult
$Res call({
 String userId, int availablePrekeys
});




}
/// @nodoc
class __$PreKeyCountCopyWithImpl<$Res>
    implements _$PreKeyCountCopyWith<$Res> {
  __$PreKeyCountCopyWithImpl(this._self, this._then);

  final _PreKeyCount _self;
  final $Res Function(_PreKeyCount) _then;

/// Create a copy of PreKeyCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? availablePrekeys = null,}) {
  return _then(_PreKeyCount(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,availablePrekeys: null == availablePrekeys ? _self.availablePrekeys : availablePrekeys // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
