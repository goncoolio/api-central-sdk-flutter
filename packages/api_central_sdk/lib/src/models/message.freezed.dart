// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Attachment {

 String get url; String get mimeType; String? get name; int? get size;
/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttachmentCopyWith<Attachment> get copyWith => _$AttachmentCopyWithImpl<Attachment>(this as Attachment, _$identity);

  /// Serializes this Attachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Attachment&&(identical(other.url, url) || other.url == url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,mimeType,name,size);

@override
String toString() {
  return 'Attachment(url: $url, mimeType: $mimeType, name: $name, size: $size)';
}


}

/// @nodoc
abstract mixin class $AttachmentCopyWith<$Res>  {
  factory $AttachmentCopyWith(Attachment value, $Res Function(Attachment) _then) = _$AttachmentCopyWithImpl;
@useResult
$Res call({
 String url, String mimeType, String? name, int? size
});




}
/// @nodoc
class _$AttachmentCopyWithImpl<$Res>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._self, this._then);

  final Attachment _self;
  final $Res Function(Attachment) _then;

/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? mimeType = null,Object? name = freezed,Object? size = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Attachment].
extension AttachmentPatterns on Attachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Attachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Attachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Attachment value)  $default,){
final _that = this;
switch (_that) {
case _Attachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Attachment value)?  $default,){
final _that = this;
switch (_that) {
case _Attachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String mimeType,  String? name,  int? size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Attachment() when $default != null:
return $default(_that.url,_that.mimeType,_that.name,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String mimeType,  String? name,  int? size)  $default,) {final _that = this;
switch (_that) {
case _Attachment():
return $default(_that.url,_that.mimeType,_that.name,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String mimeType,  String? name,  int? size)?  $default,) {final _that = this;
switch (_that) {
case _Attachment() when $default != null:
return $default(_that.url,_that.mimeType,_that.name,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Attachment implements Attachment {
  const _Attachment({required this.url, required this.mimeType, this.name, this.size});
  factory _Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);

@override final  String url;
@override final  String mimeType;
@override final  String? name;
@override final  int? size;

/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttachmentCopyWith<_Attachment> get copyWith => __$AttachmentCopyWithImpl<_Attachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Attachment&&(identical(other.url, url) || other.url == url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.name, name) || other.name == name)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,mimeType,name,size);

@override
String toString() {
  return 'Attachment(url: $url, mimeType: $mimeType, name: $name, size: $size)';
}


}

/// @nodoc
abstract mixin class _$AttachmentCopyWith<$Res> implements $AttachmentCopyWith<$Res> {
  factory _$AttachmentCopyWith(_Attachment value, $Res Function(_Attachment) _then) = __$AttachmentCopyWithImpl;
@override @useResult
$Res call({
 String url, String mimeType, String? name, int? size
});




}
/// @nodoc
class __$AttachmentCopyWithImpl<$Res>
    implements _$AttachmentCopyWith<$Res> {
  __$AttachmentCopyWithImpl(this._self, this._then);

  final _Attachment _self;
  final $Res Function(_Attachment) _then;

/// Create a copy of Attachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? mimeType = null,Object? name = freezed,Object? size = freezed,}) {
  return _then(_Attachment(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$Reaction {

 String get emoji; String get userId; String? get userName;
/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactionCopyWith<Reaction> get copyWith => _$ReactionCopyWithImpl<Reaction>(this as Reaction, _$identity);

  /// Serializes this Reaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Reaction&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emoji,userId,userName);

@override
String toString() {
  return 'Reaction(emoji: $emoji, userId: $userId, userName: $userName)';
}


}

/// @nodoc
abstract mixin class $ReactionCopyWith<$Res>  {
  factory $ReactionCopyWith(Reaction value, $Res Function(Reaction) _then) = _$ReactionCopyWithImpl;
@useResult
$Res call({
 String emoji, String userId, String? userName
});




}
/// @nodoc
class _$ReactionCopyWithImpl<$Res>
    implements $ReactionCopyWith<$Res> {
  _$ReactionCopyWithImpl(this._self, this._then);

  final Reaction _self;
  final $Res Function(Reaction) _then;

/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emoji = null,Object? userId = null,Object? userName = freezed,}) {
  return _then(_self.copyWith(
emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Reaction].
extension ReactionPatterns on Reaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Reaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Reaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Reaction value)  $default,){
final _that = this;
switch (_that) {
case _Reaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Reaction value)?  $default,){
final _that = this;
switch (_that) {
case _Reaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String emoji,  String userId,  String? userName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Reaction() when $default != null:
return $default(_that.emoji,_that.userId,_that.userName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String emoji,  String userId,  String? userName)  $default,) {final _that = this;
switch (_that) {
case _Reaction():
return $default(_that.emoji,_that.userId,_that.userName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String emoji,  String userId,  String? userName)?  $default,) {final _that = this;
switch (_that) {
case _Reaction() when $default != null:
return $default(_that.emoji,_that.userId,_that.userName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Reaction implements Reaction {
  const _Reaction({required this.emoji, required this.userId, this.userName});
  factory _Reaction.fromJson(Map<String, dynamic> json) => _$ReactionFromJson(json);

@override final  String emoji;
@override final  String userId;
@override final  String? userName;

/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactionCopyWith<_Reaction> get copyWith => __$ReactionCopyWithImpl<_Reaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reaction&&(identical(other.emoji, emoji) || other.emoji == emoji)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userName, userName) || other.userName == userName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emoji,userId,userName);

@override
String toString() {
  return 'Reaction(emoji: $emoji, userId: $userId, userName: $userName)';
}


}

/// @nodoc
abstract mixin class _$ReactionCopyWith<$Res> implements $ReactionCopyWith<$Res> {
  factory _$ReactionCopyWith(_Reaction value, $Res Function(_Reaction) _then) = __$ReactionCopyWithImpl;
@override @useResult
$Res call({
 String emoji, String userId, String? userName
});




}
/// @nodoc
class __$ReactionCopyWithImpl<$Res>
    implements _$ReactionCopyWith<$Res> {
  __$ReactionCopyWithImpl(this._self, this._then);

  final _Reaction _self;
  final $Res Function(_Reaction) _then;

/// Create a copy of Reaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emoji = null,Object? userId = null,Object? userName = freezed,}) {
  return _then(_Reaction(
emoji: null == emoji ? _self.emoji : emoji // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Message {

 String get id; String get conversationId; String get content; ContentType get contentType; String? get clientMessageId; UserInfo? get sender; Map<String, dynamic>? get attachments; Message? get replyTo; List<Reaction> get reactions; bool get isEdited; DateTime? get editedAt; bool get isDeleted; DateTime? get createdAt;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId)&&(identical(other.sender, sender) || other.sender == sender)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&const DeepCollectionEquality().equals(other.reactions, reactions)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,content,contentType,clientMessageId,sender,const DeepCollectionEquality().hash(attachments),replyTo,const DeepCollectionEquality().hash(reactions),isEdited,editedAt,isDeleted,createdAt);

@override
String toString() {
  return 'Message(id: $id, conversationId: $conversationId, content: $content, contentType: $contentType, clientMessageId: $clientMessageId, sender: $sender, attachments: $attachments, replyTo: $replyTo, reactions: $reactions, isEdited: $isEdited, editedAt: $editedAt, isDeleted: $isDeleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 String id, String conversationId, String content, ContentType contentType, String? clientMessageId, UserInfo? sender, Map<String, dynamic>? attachments, Message? replyTo, List<Reaction> reactions, bool isEdited, DateTime? editedAt, bool isDeleted, DateTime? createdAt
});


$UserInfoCopyWith<$Res>? get sender;$MessageCopyWith<$Res>? get replyTo;

}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? content = null,Object? contentType = null,Object? clientMessageId = freezed,Object? sender = freezed,Object? attachments = freezed,Object? replyTo = freezed,Object? reactions = null,Object? isEdited = null,Object? editedAt = freezed,Object? isDeleted = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType,clientMessageId: freezed == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserInfo?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Message?,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<Reaction>,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}
}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String conversationId,  String content,  ContentType contentType,  String? clientMessageId,  UserInfo? sender,  Map<String, dynamic>? attachments,  Message? replyTo,  List<Reaction> reactions,  bool isEdited,  DateTime? editedAt,  bool isDeleted,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.conversationId,_that.content,_that.contentType,_that.clientMessageId,_that.sender,_that.attachments,_that.replyTo,_that.reactions,_that.isEdited,_that.editedAt,_that.isDeleted,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String conversationId,  String content,  ContentType contentType,  String? clientMessageId,  UserInfo? sender,  Map<String, dynamic>? attachments,  Message? replyTo,  List<Reaction> reactions,  bool isEdited,  DateTime? editedAt,  bool isDeleted,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.conversationId,_that.content,_that.contentType,_that.clientMessageId,_that.sender,_that.attachments,_that.replyTo,_that.reactions,_that.isEdited,_that.editedAt,_that.isDeleted,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String conversationId,  String content,  ContentType contentType,  String? clientMessageId,  UserInfo? sender,  Map<String, dynamic>? attachments,  Message? replyTo,  List<Reaction> reactions,  bool isEdited,  DateTime? editedAt,  bool isDeleted,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.conversationId,_that.content,_that.contentType,_that.clientMessageId,_that.sender,_that.attachments,_that.replyTo,_that.reactions,_that.isEdited,_that.editedAt,_that.isDeleted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({required this.id, required this.conversationId, required this.content, required this.contentType, this.clientMessageId, this.sender, final  Map<String, dynamic>? attachments, this.replyTo, final  List<Reaction> reactions = const <Reaction>[], this.isEdited = false, this.editedAt, this.isDeleted = false, this.createdAt}): _attachments = attachments,_reactions = reactions;
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override final  String id;
@override final  String conversationId;
@override final  String content;
@override final  ContentType contentType;
@override final  String? clientMessageId;
@override final  UserInfo? sender;
 final  Map<String, dynamic>? _attachments;
@override Map<String, dynamic>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableMapView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  Message? replyTo;
 final  List<Reaction> _reactions;
@override@JsonKey() List<Reaction> get reactions {
  if (_reactions is EqualUnmodifiableListView) return _reactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reactions);
}

@override@JsonKey() final  bool isEdited;
@override final  DateTime? editedAt;
@override@JsonKey() final  bool isDeleted;
@override final  DateTime? createdAt;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.content, content) || other.content == content)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&(identical(other.clientMessageId, clientMessageId) || other.clientMessageId == clientMessageId)&&(identical(other.sender, sender) || other.sender == sender)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.replyTo, replyTo) || other.replyTo == replyTo)&&const DeepCollectionEquality().equals(other._reactions, _reactions)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,content,contentType,clientMessageId,sender,const DeepCollectionEquality().hash(_attachments),replyTo,const DeepCollectionEquality().hash(_reactions),isEdited,editedAt,isDeleted,createdAt);

@override
String toString() {
  return 'Message(id: $id, conversationId: $conversationId, content: $content, contentType: $contentType, clientMessageId: $clientMessageId, sender: $sender, attachments: $attachments, replyTo: $replyTo, reactions: $reactions, isEdited: $isEdited, editedAt: $editedAt, isDeleted: $isDeleted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 String id, String conversationId, String content, ContentType contentType, String? clientMessageId, UserInfo? sender, Map<String, dynamic>? attachments, Message? replyTo, List<Reaction> reactions, bool isEdited, DateTime? editedAt, bool isDeleted, DateTime? createdAt
});


@override $UserInfoCopyWith<$Res>? get sender;@override $MessageCopyWith<$Res>? get replyTo;

}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? content = null,Object? contentType = null,Object? clientMessageId = freezed,Object? sender = freezed,Object? attachments = freezed,Object? replyTo = freezed,Object? reactions = null,Object? isEdited = null,Object? editedAt = freezed,Object? isDeleted = null,Object? createdAt = freezed,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,contentType: null == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as ContentType,clientMessageId: freezed == clientMessageId ? _self.clientMessageId : clientMessageId // ignore: cast_nullable_to_non_nullable
as String?,sender: freezed == sender ? _self.sender : sender // ignore: cast_nullable_to_non_nullable
as UserInfo?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,replyTo: freezed == replyTo ? _self.replyTo : replyTo // ignore: cast_nullable_to_non_nullable
as Message?,reactions: null == reactions ? _self._reactions : reactions // ignore: cast_nullable_to_non_nullable
as List<Reaction>,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoCopyWith<$Res>? get sender {
    if (_self.sender == null) {
    return null;
  }

  return $UserInfoCopyWith<$Res>(_self.sender!, (value) {
    return _then(_self.copyWith(sender: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get replyTo {
    if (_self.replyTo == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.replyTo!, (value) {
    return _then(_self.copyWith(replyTo: value));
  });
}
}

// dart format on
