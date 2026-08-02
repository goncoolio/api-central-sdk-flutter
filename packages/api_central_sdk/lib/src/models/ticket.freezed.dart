// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryInfo {

 String get id; String get name; String get slug;
/// Create a copy of CategoryInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryInfoCopyWith<CategoryInfo> get copyWith => _$CategoryInfoCopyWithImpl<CategoryInfo>(this as CategoryInfo, _$identity);

  /// Serializes this CategoryInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CategoryInfo(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $CategoryInfoCopyWith<$Res>  {
  factory $CategoryInfoCopyWith(CategoryInfo value, $Res Function(CategoryInfo) _then) = _$CategoryInfoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class _$CategoryInfoCopyWithImpl<$Res>
    implements $CategoryInfoCopyWith<$Res> {
  _$CategoryInfoCopyWithImpl(this._self, this._then);

  final CategoryInfo _self;
  final $Res Function(CategoryInfo) _then;

/// Create a copy of CategoryInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryInfo].
extension CategoryInfoPatterns on CategoryInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryInfo value)  $default,){
final _that = this;
switch (_that) {
case _CategoryInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryInfo value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryInfo() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug)  $default,) {final _that = this;
switch (_that) {
case _CategoryInfo():
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug)?  $default,) {final _that = this;
switch (_that) {
case _CategoryInfo() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryInfo implements CategoryInfo {
  const _CategoryInfo({required this.id, required this.name, required this.slug});
  factory _CategoryInfo.fromJson(Map<String, dynamic> json) => _$CategoryInfoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;

/// Create a copy of CategoryInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryInfoCopyWith<_CategoryInfo> get copyWith => __$CategoryInfoCopyWithImpl<_CategoryInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'CategoryInfo(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$CategoryInfoCopyWith<$Res> implements $CategoryInfoCopyWith<$Res> {
  factory _$CategoryInfoCopyWith(_CategoryInfo value, $Res Function(_CategoryInfo) _then) = __$CategoryInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug
});




}
/// @nodoc
class __$CategoryInfoCopyWithImpl<$Res>
    implements _$CategoryInfoCopyWith<$Res> {
  __$CategoryInfoCopyWithImpl(this._self, this._then);

  final _CategoryInfo _self;
  final $Res Function(_CategoryInfo) _then;

/// Create a copy of CategoryInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,}) {
  return _then(_CategoryInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SupportCategory {

 String get id; String get name; String get slug; String? get applicationId; String? get description; String? get icon; String? get parentId; int get sortOrder; bool get isActive; DateTime? get createdAt;
/// Create a copy of SupportCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SupportCategoryCopyWith<SupportCategory> get copyWith => _$SupportCategoryCopyWithImpl<SupportCategory>(this as SupportCategory, _$identity);

  /// Serializes this SupportCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SupportCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,applicationId,description,icon,parentId,sortOrder,isActive,createdAt);

@override
String toString() {
  return 'SupportCategory(id: $id, name: $name, slug: $slug, applicationId: $applicationId, description: $description, icon: $icon, parentId: $parentId, sortOrder: $sortOrder, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $SupportCategoryCopyWith<$Res>  {
  factory $SupportCategoryCopyWith(SupportCategory value, $Res Function(SupportCategory) _then) = _$SupportCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? applicationId, String? description, String? icon, String? parentId, int sortOrder, bool isActive, DateTime? createdAt
});




}
/// @nodoc
class _$SupportCategoryCopyWithImpl<$Res>
    implements $SupportCategoryCopyWith<$Res> {
  _$SupportCategoryCopyWithImpl(this._self, this._then);

  final SupportCategory _self;
  final $Res Function(SupportCategory) _then;

/// Create a copy of SupportCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? applicationId = freezed,Object? description = freezed,Object? icon = freezed,Object? parentId = freezed,Object? sortOrder = null,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SupportCategory].
extension SupportCategoryPatterns on SupportCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SupportCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SupportCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SupportCategory value)  $default,){
final _that = this;
switch (_that) {
case _SupportCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SupportCategory value)?  $default,){
final _that = this;
switch (_that) {
case _SupportCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? applicationId,  String? description,  String? icon,  String? parentId,  int sortOrder,  bool isActive,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SupportCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.applicationId,_that.description,_that.icon,_that.parentId,_that.sortOrder,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? applicationId,  String? description,  String? icon,  String? parentId,  int sortOrder,  bool isActive,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _SupportCategory():
return $default(_that.id,_that.name,_that.slug,_that.applicationId,_that.description,_that.icon,_that.parentId,_that.sortOrder,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? applicationId,  String? description,  String? icon,  String? parentId,  int sortOrder,  bool isActive,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _SupportCategory() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.applicationId,_that.description,_that.icon,_that.parentId,_that.sortOrder,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SupportCategory implements SupportCategory {
  const _SupportCategory({required this.id, required this.name, required this.slug, this.applicationId, this.description, this.icon, this.parentId, this.sortOrder = 0, this.isActive = true, this.createdAt});
  factory _SupportCategory.fromJson(Map<String, dynamic> json) => _$SupportCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? applicationId;
@override final  String? description;
@override final  String? icon;
@override final  String? parentId;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;

/// Create a copy of SupportCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SupportCategoryCopyWith<_SupportCategory> get copyWith => __$SupportCategoryCopyWithImpl<_SupportCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SupportCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SupportCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,applicationId,description,icon,parentId,sortOrder,isActive,createdAt);

@override
String toString() {
  return 'SupportCategory(id: $id, name: $name, slug: $slug, applicationId: $applicationId, description: $description, icon: $icon, parentId: $parentId, sortOrder: $sortOrder, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$SupportCategoryCopyWith<$Res> implements $SupportCategoryCopyWith<$Res> {
  factory _$SupportCategoryCopyWith(_SupportCategory value, $Res Function(_SupportCategory) _then) = __$SupportCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? applicationId, String? description, String? icon, String? parentId, int sortOrder, bool isActive, DateTime? createdAt
});




}
/// @nodoc
class __$SupportCategoryCopyWithImpl<$Res>
    implements _$SupportCategoryCopyWith<$Res> {
  __$SupportCategoryCopyWithImpl(this._self, this._then);

  final _SupportCategory _self;
  final $Res Function(_SupportCategory) _then;

/// Create a copy of SupportCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? applicationId = freezed,Object? description = freezed,Object? icon = freezed,Object? parentId = freezed,Object? sortOrder = null,Object? isActive = null,Object? createdAt = freezed,}) {
  return _then(_SupportCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$Ticket {

 String get id; String get ticketNumber; UserInfo get user; String get subject; TicketStatus get status; TicketPriority get priority; String? get conversationId; CategoryInfo? get category; UserInfo? get assignedTo; String? get description; List<String>? get tags; DateTime? get firstResponseAt; DateTime? get resolvedAt; DateTime? get closedAt; DateTime? get createdAt;
/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketCopyWith<Ticket> get copyWith => _$TicketCopyWithImpl<Ticket>(this as Ticket, _$identity);

  /// Serializes this Ticket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ticket&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.user, user) || other.user == user)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.category, category) || other.category == category)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.firstResponseAt, firstResponseAt) || other.firstResponseAt == firstResponseAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketNumber,user,subject,status,priority,conversationId,category,assignedTo,description,const DeepCollectionEquality().hash(tags),firstResponseAt,resolvedAt,closedAt,createdAt);

@override
String toString() {
  return 'Ticket(id: $id, ticketNumber: $ticketNumber, user: $user, subject: $subject, status: $status, priority: $priority, conversationId: $conversationId, category: $category, assignedTo: $assignedTo, description: $description, tags: $tags, firstResponseAt: $firstResponseAt, resolvedAt: $resolvedAt, closedAt: $closedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TicketCopyWith<$Res>  {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) _then) = _$TicketCopyWithImpl;
@useResult
$Res call({
 String id, String ticketNumber, UserInfo user, String subject, TicketStatus status, TicketPriority priority, String? conversationId, CategoryInfo? category, UserInfo? assignedTo, String? description, List<String>? tags, DateTime? firstResponseAt, DateTime? resolvedAt, DateTime? closedAt, DateTime? createdAt
});


$UserInfoCopyWith<$Res> get user;$CategoryInfoCopyWith<$Res>? get category;$UserInfoCopyWith<$Res>? get assignedTo;

}
/// @nodoc
class _$TicketCopyWithImpl<$Res>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._self, this._then);

  final Ticket _self;
  final $Res Function(Ticket) _then;

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketNumber = null,Object? user = null,Object? subject = null,Object? status = null,Object? priority = null,Object? conversationId = freezed,Object? category = freezed,Object? assignedTo = freezed,Object? description = freezed,Object? tags = freezed,Object? firstResponseAt = freezed,Object? resolvedAt = freezed,Object? closedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketNumber: null == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TicketPriority,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryInfo?,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as UserInfo?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,firstResponseAt: freezed == firstResponseAt ? _self.firstResponseAt : firstResponseAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get user {
  
  return $UserInfoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryInfoCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryInfoCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get assignedTo {
    if (_self.assignedTo == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.assignedTo!, (value) {
    return _then(_self.copyWith(assignedTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Ticket].
extension TicketPatterns on Ticket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ticket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ticket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ticket value)  $default,){
final _that = this;
switch (_that) {
case _Ticket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ticket value)?  $default,){
final _that = this;
switch (_that) {
case _Ticket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketNumber,  UserInfo user,  String subject,  TicketStatus status,  TicketPriority priority,  String? conversationId,  CategoryInfo? category,  UserInfo? assignedTo,  String? description,  List<String>? tags,  DateTime? firstResponseAt,  DateTime? resolvedAt,  DateTime? closedAt,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ticket() when $default != null:
return $default(_that.id,_that.ticketNumber,_that.user,_that.subject,_that.status,_that.priority,_that.conversationId,_that.category,_that.assignedTo,_that.description,_that.tags,_that.firstResponseAt,_that.resolvedAt,_that.closedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketNumber,  UserInfo user,  String subject,  TicketStatus status,  TicketPriority priority,  String? conversationId,  CategoryInfo? category,  UserInfo? assignedTo,  String? description,  List<String>? tags,  DateTime? firstResponseAt,  DateTime? resolvedAt,  DateTime? closedAt,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Ticket():
return $default(_that.id,_that.ticketNumber,_that.user,_that.subject,_that.status,_that.priority,_that.conversationId,_that.category,_that.assignedTo,_that.description,_that.tags,_that.firstResponseAt,_that.resolvedAt,_that.closedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketNumber,  UserInfo user,  String subject,  TicketStatus status,  TicketPriority priority,  String? conversationId,  CategoryInfo? category,  UserInfo? assignedTo,  String? description,  List<String>? tags,  DateTime? firstResponseAt,  DateTime? resolvedAt,  DateTime? closedAt,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Ticket() when $default != null:
return $default(_that.id,_that.ticketNumber,_that.user,_that.subject,_that.status,_that.priority,_that.conversationId,_that.category,_that.assignedTo,_that.description,_that.tags,_that.firstResponseAt,_that.resolvedAt,_that.closedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ticket implements Ticket {
  const _Ticket({required this.id, required this.ticketNumber, required this.user, required this.subject, required this.status, required this.priority, this.conversationId, this.category, this.assignedTo, this.description, final  List<String>? tags, this.firstResponseAt, this.resolvedAt, this.closedAt, this.createdAt}): _tags = tags;
  factory _Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

@override final  String id;
@override final  String ticketNumber;
@override final  UserInfo user;
@override final  String subject;
@override final  TicketStatus status;
@override final  TicketPriority priority;
@override final  String? conversationId;
@override final  CategoryInfo? category;
@override final  UserInfo? assignedTo;
@override final  String? description;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  DateTime? firstResponseAt;
@override final  DateTime? resolvedAt;
@override final  DateTime? closedAt;
@override final  DateTime? createdAt;

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketCopyWith<_Ticket> get copyWith => __$TicketCopyWithImpl<_Ticket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ticket&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketNumber, ticketNumber) || other.ticketNumber == ticketNumber)&&(identical(other.user, user) || other.user == user)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.category, category) || other.category == category)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.firstResponseAt, firstResponseAt) || other.firstResponseAt == firstResponseAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketNumber,user,subject,status,priority,conversationId,category,assignedTo,description,const DeepCollectionEquality().hash(_tags),firstResponseAt,resolvedAt,closedAt,createdAt);

@override
String toString() {
  return 'Ticket(id: $id, ticketNumber: $ticketNumber, user: $user, subject: $subject, status: $status, priority: $priority, conversationId: $conversationId, category: $category, assignedTo: $assignedTo, description: $description, tags: $tags, firstResponseAt: $firstResponseAt, resolvedAt: $resolvedAt, closedAt: $closedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TicketCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$TicketCopyWith(_Ticket value, $Res Function(_Ticket) _then) = __$TicketCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketNumber, UserInfo user, String subject, TicketStatus status, TicketPriority priority, String? conversationId, CategoryInfo? category, UserInfo? assignedTo, String? description, List<String>? tags, DateTime? firstResponseAt, DateTime? resolvedAt, DateTime? closedAt, DateTime? createdAt
});


@override $UserInfoCopyWith<$Res> get user;@override $CategoryInfoCopyWith<$Res>? get category;@override $UserInfoCopyWith<$Res>? get assignedTo;

}
/// @nodoc
class __$TicketCopyWithImpl<$Res>
    implements _$TicketCopyWith<$Res> {
  __$TicketCopyWithImpl(this._self, this._then);

  final _Ticket _self;
  final $Res Function(_Ticket) _then;

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketNumber = null,Object? user = null,Object? subject = null,Object? status = null,Object? priority = null,Object? conversationId = freezed,Object? category = freezed,Object? assignedTo = freezed,Object? description = freezed,Object? tags = freezed,Object? firstResponseAt = freezed,Object? resolvedAt = freezed,Object? closedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_Ticket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketNumber: null == ticketNumber ? _self.ticketNumber : ticketNumber // ignore: cast_nullable_to_non_nullable
as String,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserInfo,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TicketStatus,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TicketPriority,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryInfo?,assignedTo: freezed == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as UserInfo?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,firstResponseAt: freezed == firstResponseAt ? _self.firstResponseAt : firstResponseAt // ignore: cast_nullable_to_non_nullable
as DateTime?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res> get user {
  
  return $UserInfoCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryInfoCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryInfoCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of Ticket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get assignedTo {
    if (_self.assignedTo == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.assignedTo!, (value) {
    return _then(_self.copyWith(assignedTo: value));
  });
}
}


/// @nodoc
mixin _$TicketReply {

 String get id; String get ticketId; String get senderId; SenderType get senderType; String get content; String? get senderName; DateTime? get createdAt;
/// Create a copy of TicketReply
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketReplyCopyWith<TicketReply> get copyWith => _$TicketReplyCopyWithImpl<TicketReply>(this as TicketReply, _$identity);

  /// Serializes this TicketReply to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketReply&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.content, content) || other.content == content)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketId,senderId,senderType,content,senderName,createdAt);

@override
String toString() {
  return 'TicketReply(id: $id, ticketId: $ticketId, senderId: $senderId, senderType: $senderType, content: $content, senderName: $senderName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TicketReplyCopyWith<$Res>  {
  factory $TicketReplyCopyWith(TicketReply value, $Res Function(TicketReply) _then) = _$TicketReplyCopyWithImpl;
@useResult
$Res call({
 String id, String ticketId, String senderId, SenderType senderType, String content, String? senderName, DateTime? createdAt
});




}
/// @nodoc
class _$TicketReplyCopyWithImpl<$Res>
    implements $TicketReplyCopyWith<$Res> {
  _$TicketReplyCopyWithImpl(this._self, this._then);

  final TicketReply _self;
  final $Res Function(TicketReply) _then;

/// Create a copy of TicketReply
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ticketId = null,Object? senderId = null,Object? senderType = null,Object? content = null,Object? senderName = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as SenderType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,senderName: freezed == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketReply].
extension TicketReplyPatterns on TicketReply {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketReply value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketReply() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketReply value)  $default,){
final _that = this;
switch (_that) {
case _TicketReply():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketReply value)?  $default,){
final _that = this;
switch (_that) {
case _TicketReply() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ticketId,  String senderId,  SenderType senderType,  String content,  String? senderName,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketReply() when $default != null:
return $default(_that.id,_that.ticketId,_that.senderId,_that.senderType,_that.content,_that.senderName,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ticketId,  String senderId,  SenderType senderType,  String content,  String? senderName,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TicketReply():
return $default(_that.id,_that.ticketId,_that.senderId,_that.senderType,_that.content,_that.senderName,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ticketId,  String senderId,  SenderType senderType,  String content,  String? senderName,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TicketReply() when $default != null:
return $default(_that.id,_that.ticketId,_that.senderId,_that.senderType,_that.content,_that.senderName,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TicketReply implements TicketReply {
  const _TicketReply({required this.id, required this.ticketId, required this.senderId, required this.senderType, required this.content, this.senderName, this.createdAt});
  factory _TicketReply.fromJson(Map<String, dynamic> json) => _$TicketReplyFromJson(json);

@override final  String id;
@override final  String ticketId;
@override final  String senderId;
@override final  SenderType senderType;
@override final  String content;
@override final  String? senderName;
@override final  DateTime? createdAt;

/// Create a copy of TicketReply
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketReplyCopyWith<_TicketReply> get copyWith => __$TicketReplyCopyWithImpl<_TicketReply>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TicketReplyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketReply&&(identical(other.id, id) || other.id == id)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderType, senderType) || other.senderType == senderType)&&(identical(other.content, content) || other.content == content)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,ticketId,senderId,senderType,content,senderName,createdAt);

@override
String toString() {
  return 'TicketReply(id: $id, ticketId: $ticketId, senderId: $senderId, senderType: $senderType, content: $content, senderName: $senderName, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TicketReplyCopyWith<$Res> implements $TicketReplyCopyWith<$Res> {
  factory _$TicketReplyCopyWith(_TicketReply value, $Res Function(_TicketReply) _then) = __$TicketReplyCopyWithImpl;
@override @useResult
$Res call({
 String id, String ticketId, String senderId, SenderType senderType, String content, String? senderName, DateTime? createdAt
});




}
/// @nodoc
class __$TicketReplyCopyWithImpl<$Res>
    implements _$TicketReplyCopyWith<$Res> {
  __$TicketReplyCopyWithImpl(this._self, this._then);

  final _TicketReply _self;
  final $Res Function(_TicketReply) _then;

/// Create a copy of TicketReply
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ticketId = null,Object? senderId = null,Object? senderType = null,Object? content = null,Object? senderName = freezed,Object? createdAt = freezed,}) {
  return _then(_TicketReply(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderType: null == senderType ? _self.senderType : senderType // ignore: cast_nullable_to_non_nullable
as SenderType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,senderName: freezed == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
