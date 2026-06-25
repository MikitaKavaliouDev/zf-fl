// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UploadResponseDto {

 String get imagePath; String get publicUrl;
/// Create a copy of UploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadResponseDtoCopyWith<UploadResponseDto> get copyWith => _$UploadResponseDtoCopyWithImpl<UploadResponseDto>(this as UploadResponseDto, _$identity);

  /// Serializes this UploadResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadResponseDto&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.publicUrl, publicUrl) || other.publicUrl == publicUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,publicUrl);

@override
String toString() {
  return 'UploadResponseDto(imagePath: $imagePath, publicUrl: $publicUrl)';
}


}

/// @nodoc
abstract mixin class $UploadResponseDtoCopyWith<$Res>  {
  factory $UploadResponseDtoCopyWith(UploadResponseDto value, $Res Function(UploadResponseDto) _then) = _$UploadResponseDtoCopyWithImpl;
@useResult
$Res call({
 String imagePath, String publicUrl
});




}
/// @nodoc
class _$UploadResponseDtoCopyWithImpl<$Res>
    implements $UploadResponseDtoCopyWith<$Res> {
  _$UploadResponseDtoCopyWithImpl(this._self, this._then);

  final UploadResponseDto _self;
  final $Res Function(UploadResponseDto) _then;

/// Create a copy of UploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = null,Object? publicUrl = null,}) {
  return _then(_self.copyWith(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,publicUrl: null == publicUrl ? _self.publicUrl : publicUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadResponseDto].
extension UploadResponseDtoPatterns on UploadResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _UploadResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _UploadResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePath,  String publicUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadResponseDto() when $default != null:
return $default(_that.imagePath,_that.publicUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePath,  String publicUrl)  $default,) {final _that = this;
switch (_that) {
case _UploadResponseDto():
return $default(_that.imagePath,_that.publicUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePath,  String publicUrl)?  $default,) {final _that = this;
switch (_that) {
case _UploadResponseDto() when $default != null:
return $default(_that.imagePath,_that.publicUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadResponseDto implements UploadResponseDto {
  const _UploadResponseDto({required this.imagePath, required this.publicUrl});
  factory _UploadResponseDto.fromJson(Map<String, dynamic> json) => _$UploadResponseDtoFromJson(json);

@override final  String imagePath;
@override final  String publicUrl;

/// Create a copy of UploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadResponseDtoCopyWith<_UploadResponseDto> get copyWith => __$UploadResponseDtoCopyWithImpl<_UploadResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadResponseDto&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.publicUrl, publicUrl) || other.publicUrl == publicUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,publicUrl);

@override
String toString() {
  return 'UploadResponseDto(imagePath: $imagePath, publicUrl: $publicUrl)';
}


}

/// @nodoc
abstract mixin class _$UploadResponseDtoCopyWith<$Res> implements $UploadResponseDtoCopyWith<$Res> {
  factory _$UploadResponseDtoCopyWith(_UploadResponseDto value, $Res Function(_UploadResponseDto) _then) = __$UploadResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String imagePath, String publicUrl
});




}
/// @nodoc
class __$UploadResponseDtoCopyWithImpl<$Res>
    implements _$UploadResponseDtoCopyWith<$Res> {
  __$UploadResponseDtoCopyWithImpl(this._self, this._then);

  final _UploadResponseDto _self;
  final $Res Function(_UploadResponseDto) _then;

/// Create a copy of UploadResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? publicUrl = null,}) {
  return _then(_UploadResponseDto(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,publicUrl: null == publicUrl ? _self.publicUrl : publicUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
