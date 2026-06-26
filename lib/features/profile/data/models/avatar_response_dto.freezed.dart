// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'avatar_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AvatarResponseDto {

 String get avatarUrl; String get storagePath;
/// Create a copy of AvatarResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvatarResponseDtoCopyWith<AvatarResponseDto> get copyWith => _$AvatarResponseDtoCopyWithImpl<AvatarResponseDto>(this as AvatarResponseDto, _$identity);

  /// Serializes this AvatarResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvatarResponseDto&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarUrl,storagePath);

@override
String toString() {
  return 'AvatarResponseDto(avatarUrl: $avatarUrl, storagePath: $storagePath)';
}


}

/// @nodoc
abstract mixin class $AvatarResponseDtoCopyWith<$Res>  {
  factory $AvatarResponseDtoCopyWith(AvatarResponseDto value, $Res Function(AvatarResponseDto) _then) = _$AvatarResponseDtoCopyWithImpl;
@useResult
$Res call({
 String avatarUrl, String storagePath
});




}
/// @nodoc
class _$AvatarResponseDtoCopyWithImpl<$Res>
    implements $AvatarResponseDtoCopyWith<$Res> {
  _$AvatarResponseDtoCopyWithImpl(this._self, this._then);

  final AvatarResponseDto _self;
  final $Res Function(AvatarResponseDto) _then;

/// Create a copy of AvatarResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarUrl = null,Object? storagePath = null,}) {
  return _then(_self.copyWith(
avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AvatarResponseDto].
extension AvatarResponseDtoPatterns on AvatarResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvatarResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvatarResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvatarResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AvatarResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvatarResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AvatarResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String avatarUrl,  String storagePath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvatarResponseDto() when $default != null:
return $default(_that.avatarUrl,_that.storagePath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String avatarUrl,  String storagePath)  $default,) {final _that = this;
switch (_that) {
case _AvatarResponseDto():
return $default(_that.avatarUrl,_that.storagePath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String avatarUrl,  String storagePath)?  $default,) {final _that = this;
switch (_that) {
case _AvatarResponseDto() when $default != null:
return $default(_that.avatarUrl,_that.storagePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvatarResponseDto implements AvatarResponseDto {
  const _AvatarResponseDto({required this.avatarUrl, required this.storagePath});
  factory _AvatarResponseDto.fromJson(Map<String, dynamic> json) => _$AvatarResponseDtoFromJson(json);

@override final  String avatarUrl;
@override final  String storagePath;

/// Create a copy of AvatarResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvatarResponseDtoCopyWith<_AvatarResponseDto> get copyWith => __$AvatarResponseDtoCopyWithImpl<_AvatarResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvatarResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvatarResponseDto&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarUrl,storagePath);

@override
String toString() {
  return 'AvatarResponseDto(avatarUrl: $avatarUrl, storagePath: $storagePath)';
}


}

/// @nodoc
abstract mixin class _$AvatarResponseDtoCopyWith<$Res> implements $AvatarResponseDtoCopyWith<$Res> {
  factory _$AvatarResponseDtoCopyWith(_AvatarResponseDto value, $Res Function(_AvatarResponseDto) _then) = __$AvatarResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String avatarUrl, String storagePath
});




}
/// @nodoc
class __$AvatarResponseDtoCopyWithImpl<$Res>
    implements _$AvatarResponseDtoCopyWith<$Res> {
  __$AvatarResponseDtoCopyWithImpl(this._self, this._then);

  final _AvatarResponseDto _self;
  final $Res Function(_AvatarResponseDto) _then;

/// Create a copy of AvatarResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarUrl = null,Object? storagePath = null,}) {
  return _then(_AvatarResponseDto(
avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,storagePath: null == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
