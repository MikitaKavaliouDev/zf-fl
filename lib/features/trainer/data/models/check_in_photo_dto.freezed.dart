// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInPhotoDto {

 String get id; String? get imageUrl; String? get imagePath; String? get caption; String? get photoDate;
/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInPhotoDtoCopyWith<CheckInPhotoDto> get copyWith => _$CheckInPhotoDtoCopyWithImpl<CheckInPhotoDto>(this as CheckInPhotoDto, _$identity);

  /// Serializes this CheckInPhotoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.photoDate, photoDate) || other.photoDate == photoDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,imagePath,caption,photoDate);

@override
String toString() {
  return 'CheckInPhotoDto(id: $id, imageUrl: $imageUrl, imagePath: $imagePath, caption: $caption, photoDate: $photoDate)';
}


}

/// @nodoc
abstract mixin class $CheckInPhotoDtoCopyWith<$Res>  {
  factory $CheckInPhotoDtoCopyWith(CheckInPhotoDto value, $Res Function(CheckInPhotoDto) _then) = _$CheckInPhotoDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? imageUrl, String? imagePath, String? caption, String? photoDate
});




}
/// @nodoc
class _$CheckInPhotoDtoCopyWithImpl<$Res>
    implements $CheckInPhotoDtoCopyWith<$Res> {
  _$CheckInPhotoDtoCopyWithImpl(this._self, this._then);

  final CheckInPhotoDto _self;
  final $Res Function(CheckInPhotoDto) _then;

/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = freezed,Object? imagePath = freezed,Object? caption = freezed,Object? photoDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,photoDate: freezed == photoDate ? _self.photoDate : photoDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInPhotoDto].
extension CheckInPhotoDtoPatterns on CheckInPhotoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInPhotoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInPhotoDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInPhotoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInPhotoDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String? imagePath,  String? caption,  String? photoDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imagePath,_that.caption,_that.photoDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? imageUrl,  String? imagePath,  String? caption,  String? photoDate)  $default,) {final _that = this;
switch (_that) {
case _CheckInPhotoDto():
return $default(_that.id,_that.imageUrl,_that.imagePath,_that.caption,_that.photoDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? imageUrl,  String? imagePath,  String? caption,  String? photoDate)?  $default,) {final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.imagePath,_that.caption,_that.photoDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInPhotoDto implements CheckInPhotoDto {
  const _CheckInPhotoDto({required this.id, this.imageUrl, this.imagePath, this.caption, this.photoDate});
  factory _CheckInPhotoDto.fromJson(Map<String, dynamic> json) => _$CheckInPhotoDtoFromJson(json);

@override final  String id;
@override final  String? imageUrl;
@override final  String? imagePath;
@override final  String? caption;
@override final  String? photoDate;

/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInPhotoDtoCopyWith<_CheckInPhotoDto> get copyWith => __$CheckInPhotoDtoCopyWithImpl<_CheckInPhotoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInPhotoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.photoDate, photoDate) || other.photoDate == photoDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,imagePath,caption,photoDate);

@override
String toString() {
  return 'CheckInPhotoDto(id: $id, imageUrl: $imageUrl, imagePath: $imagePath, caption: $caption, photoDate: $photoDate)';
}


}

/// @nodoc
abstract mixin class _$CheckInPhotoDtoCopyWith<$Res> implements $CheckInPhotoDtoCopyWith<$Res> {
  factory _$CheckInPhotoDtoCopyWith(_CheckInPhotoDto value, $Res Function(_CheckInPhotoDto) _then) = __$CheckInPhotoDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? imageUrl, String? imagePath, String? caption, String? photoDate
});




}
/// @nodoc
class __$CheckInPhotoDtoCopyWithImpl<$Res>
    implements _$CheckInPhotoDtoCopyWith<$Res> {
  __$CheckInPhotoDtoCopyWithImpl(this._self, this._then);

  final _CheckInPhotoDto _self;
  final $Res Function(_CheckInPhotoDto) _then;

/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = freezed,Object? imagePath = freezed,Object? caption = freezed,Object? photoDate = freezed,}) {
  return _then(_CheckInPhotoDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,photoDate: freezed == photoDate ? _self.photoDate : photoDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
