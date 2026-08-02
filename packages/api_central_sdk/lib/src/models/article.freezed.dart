// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KnowledgeArticle {

 String get id; String get title; String get slug; String get content; String? get applicationId; String? get categoryId; ContentFormat get contentFormat; List<String>? get tags; int get viewCount; int get helpfulCount; int get notHelpfulCount; bool get isPublished; DateTime? get publishedAt; String? get createdById; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of KnowledgeArticle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeArticleCopyWith<KnowledgeArticle> get copyWith => _$KnowledgeArticleCopyWithImpl<KnowledgeArticle>(this as KnowledgeArticle, _$identity);

  /// Serializes this KnowledgeArticle to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.content, content) || other.content == content)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.contentFormat, contentFormat) || other.contentFormat == contentFormat)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.helpfulCount, helpfulCount) || other.helpfulCount == helpfulCount)&&(identical(other.notHelpfulCount, notHelpfulCount) || other.notHelpfulCount == notHelpfulCount)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdById, createdById) || other.createdById == createdById)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,content,applicationId,categoryId,contentFormat,const DeepCollectionEquality().hash(tags),viewCount,helpfulCount,notHelpfulCount,isPublished,publishedAt,createdById,createdAt,updatedAt);

@override
String toString() {
  return 'KnowledgeArticle(id: $id, title: $title, slug: $slug, content: $content, applicationId: $applicationId, categoryId: $categoryId, contentFormat: $contentFormat, tags: $tags, viewCount: $viewCount, helpfulCount: $helpfulCount, notHelpfulCount: $notHelpfulCount, isPublished: $isPublished, publishedAt: $publishedAt, createdById: $createdById, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $KnowledgeArticleCopyWith<$Res>  {
  factory $KnowledgeArticleCopyWith(KnowledgeArticle value, $Res Function(KnowledgeArticle) _then) = _$KnowledgeArticleCopyWithImpl;
@useResult
$Res call({
 String id, String title, String slug, String content, String? applicationId, String? categoryId, ContentFormat contentFormat, List<String>? tags, int viewCount, int helpfulCount, int notHelpfulCount, bool isPublished, DateTime? publishedAt, String? createdById, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$KnowledgeArticleCopyWithImpl<$Res>
    implements $KnowledgeArticleCopyWith<$Res> {
  _$KnowledgeArticleCopyWithImpl(this._self, this._then);

  final KnowledgeArticle _self;
  final $Res Function(KnowledgeArticle) _then;

/// Create a copy of KnowledgeArticle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? content = null,Object? applicationId = freezed,Object? categoryId = freezed,Object? contentFormat = null,Object? tags = freezed,Object? viewCount = null,Object? helpfulCount = null,Object? notHelpfulCount = null,Object? isPublished = null,Object? publishedAt = freezed,Object? createdById = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,contentFormat: null == contentFormat ? _self.contentFormat : contentFormat // ignore: cast_nullable_to_non_nullable
as ContentFormat,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,helpfulCount: null == helpfulCount ? _self.helpfulCount : helpfulCount // ignore: cast_nullable_to_non_nullable
as int,notHelpfulCount: null == notHelpfulCount ? _self.notHelpfulCount : notHelpfulCount // ignore: cast_nullable_to_non_nullable
as int,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdById: freezed == createdById ? _self.createdById : createdById // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeArticle].
extension KnowledgeArticlePatterns on KnowledgeArticle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeArticle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeArticle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeArticle value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeArticle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeArticle value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeArticle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String slug,  String content,  String? applicationId,  String? categoryId,  ContentFormat contentFormat,  List<String>? tags,  int viewCount,  int helpfulCount,  int notHelpfulCount,  bool isPublished,  DateTime? publishedAt,  String? createdById,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeArticle() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.content,_that.applicationId,_that.categoryId,_that.contentFormat,_that.tags,_that.viewCount,_that.helpfulCount,_that.notHelpfulCount,_that.isPublished,_that.publishedAt,_that.createdById,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String slug,  String content,  String? applicationId,  String? categoryId,  ContentFormat contentFormat,  List<String>? tags,  int viewCount,  int helpfulCount,  int notHelpfulCount,  bool isPublished,  DateTime? publishedAt,  String? createdById,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeArticle():
return $default(_that.id,_that.title,_that.slug,_that.content,_that.applicationId,_that.categoryId,_that.contentFormat,_that.tags,_that.viewCount,_that.helpfulCount,_that.notHelpfulCount,_that.isPublished,_that.publishedAt,_that.createdById,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String slug,  String content,  String? applicationId,  String? categoryId,  ContentFormat contentFormat,  List<String>? tags,  int viewCount,  int helpfulCount,  int notHelpfulCount,  bool isPublished,  DateTime? publishedAt,  String? createdById,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeArticle() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.content,_that.applicationId,_that.categoryId,_that.contentFormat,_that.tags,_that.viewCount,_that.helpfulCount,_that.notHelpfulCount,_that.isPublished,_that.publishedAt,_that.createdById,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KnowledgeArticle implements KnowledgeArticle {
  const _KnowledgeArticle({required this.id, required this.title, required this.slug, required this.content, this.applicationId, this.categoryId, this.contentFormat = ContentFormat.markdown, final  List<String>? tags, this.viewCount = 0, this.helpfulCount = 0, this.notHelpfulCount = 0, this.isPublished = false, this.publishedAt, this.createdById, this.createdAt, this.updatedAt}): _tags = tags;
  factory _KnowledgeArticle.fromJson(Map<String, dynamic> json) => _$KnowledgeArticleFromJson(json);

@override final  String id;
@override final  String title;
@override final  String slug;
@override final  String content;
@override final  String? applicationId;
@override final  String? categoryId;
@override@JsonKey() final  ContentFormat contentFormat;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  int viewCount;
@override@JsonKey() final  int helpfulCount;
@override@JsonKey() final  int notHelpfulCount;
@override@JsonKey() final  bool isPublished;
@override final  DateTime? publishedAt;
@override final  String? createdById;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of KnowledgeArticle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeArticleCopyWith<_KnowledgeArticle> get copyWith => __$KnowledgeArticleCopyWithImpl<_KnowledgeArticle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnowledgeArticleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeArticle&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.content, content) || other.content == content)&&(identical(other.applicationId, applicationId) || other.applicationId == applicationId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.contentFormat, contentFormat) || other.contentFormat == contentFormat)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount)&&(identical(other.helpfulCount, helpfulCount) || other.helpfulCount == helpfulCount)&&(identical(other.notHelpfulCount, notHelpfulCount) || other.notHelpfulCount == notHelpfulCount)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.createdById, createdById) || other.createdById == createdById)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,content,applicationId,categoryId,contentFormat,const DeepCollectionEquality().hash(_tags),viewCount,helpfulCount,notHelpfulCount,isPublished,publishedAt,createdById,createdAt,updatedAt);

@override
String toString() {
  return 'KnowledgeArticle(id: $id, title: $title, slug: $slug, content: $content, applicationId: $applicationId, categoryId: $categoryId, contentFormat: $contentFormat, tags: $tags, viewCount: $viewCount, helpfulCount: $helpfulCount, notHelpfulCount: $notHelpfulCount, isPublished: $isPublished, publishedAt: $publishedAt, createdById: $createdById, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeArticleCopyWith<$Res> implements $KnowledgeArticleCopyWith<$Res> {
  factory _$KnowledgeArticleCopyWith(_KnowledgeArticle value, $Res Function(_KnowledgeArticle) _then) = __$KnowledgeArticleCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String slug, String content, String? applicationId, String? categoryId, ContentFormat contentFormat, List<String>? tags, int viewCount, int helpfulCount, int notHelpfulCount, bool isPublished, DateTime? publishedAt, String? createdById, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$KnowledgeArticleCopyWithImpl<$Res>
    implements _$KnowledgeArticleCopyWith<$Res> {
  __$KnowledgeArticleCopyWithImpl(this._self, this._then);

  final _KnowledgeArticle _self;
  final $Res Function(_KnowledgeArticle) _then;

/// Create a copy of KnowledgeArticle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? content = null,Object? applicationId = freezed,Object? categoryId = freezed,Object? contentFormat = null,Object? tags = freezed,Object? viewCount = null,Object? helpfulCount = null,Object? notHelpfulCount = null,Object? isPublished = null,Object? publishedAt = freezed,Object? createdById = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_KnowledgeArticle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,applicationId: freezed == applicationId ? _self.applicationId : applicationId // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,contentFormat: null == contentFormat ? _self.contentFormat : contentFormat // ignore: cast_nullable_to_non_nullable
as ContentFormat,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,viewCount: null == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int,helpfulCount: null == helpfulCount ? _self.helpfulCount : helpfulCount // ignore: cast_nullable_to_non_nullable
as int,notHelpfulCount: null == notHelpfulCount ? _self.notHelpfulCount : notHelpfulCount // ignore: cast_nullable_to_non_nullable
as int,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdById: freezed == createdById ? _self.createdById : createdById // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
