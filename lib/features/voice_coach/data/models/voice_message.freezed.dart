// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceMessage {

 String get id; VoiceMessageRole get role; String get content; DateTime get timestamp;
/// Create a copy of VoiceMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceMessageCopyWith<VoiceMessage> get copyWith => _$VoiceMessageCopyWithImpl<VoiceMessage>(this as VoiceMessage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,id,role,content,timestamp);

@override
String toString() {
  return 'VoiceMessage(id: $id, role: $role, content: $content, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $VoiceMessageCopyWith<$Res>  {
  factory $VoiceMessageCopyWith(VoiceMessage value, $Res Function(VoiceMessage) _then) = _$VoiceMessageCopyWithImpl;
@useResult
$Res call({
 String id, VoiceMessageRole role, String content, DateTime timestamp
});




}
/// @nodoc
class _$VoiceMessageCopyWithImpl<$Res>
    implements $VoiceMessageCopyWith<$Res> {
  _$VoiceMessageCopyWithImpl(this._self, this._then);

  final VoiceMessage _self;
  final $Res Function(VoiceMessage) _then;

/// Create a copy of VoiceMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as VoiceMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceMessage].
extension VoiceMessagePatterns on VoiceMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceMessage value)  $default,){
final _that = this;
switch (_that) {
case _VoiceMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceMessage value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  VoiceMessageRole role,  String content,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceMessage() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  VoiceMessageRole role,  String content,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _VoiceMessage():
return $default(_that.id,_that.role,_that.content,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  VoiceMessageRole role,  String content,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _VoiceMessage() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _VoiceMessage implements VoiceMessage {
  const _VoiceMessage({required this.id, required this.role, required this.content, required this.timestamp});
  

@override final  String id;
@override final  VoiceMessageRole role;
@override final  String content;
@override final  DateTime timestamp;

/// Create a copy of VoiceMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceMessageCopyWith<_VoiceMessage> get copyWith => __$VoiceMessageCopyWithImpl<_VoiceMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,id,role,content,timestamp);

@override
String toString() {
  return 'VoiceMessage(id: $id, role: $role, content: $content, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$VoiceMessageCopyWith<$Res> implements $VoiceMessageCopyWith<$Res> {
  factory _$VoiceMessageCopyWith(_VoiceMessage value, $Res Function(_VoiceMessage) _then) = __$VoiceMessageCopyWithImpl;
@override @useResult
$Res call({
 String id, VoiceMessageRole role, String content, DateTime timestamp
});




}
/// @nodoc
class __$VoiceMessageCopyWithImpl<$Res>
    implements _$VoiceMessageCopyWith<$Res> {
  __$VoiceMessageCopyWithImpl(this._self, this._then);

  final _VoiceMessage _self;
  final $Res Function(_VoiceMessage) _then;

/// Create a copy of VoiceMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? timestamp = null,}) {
  return _then(_VoiceMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as VoiceMessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
