// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_transformation_photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerTransformationPhotoDto {

 String get id; String get imagePath; String? get caption; String? get clientName; String? get publicUrl; String? get createdAt;
/// Create a copy of TrainerTransformationPhotoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerTransformationPhotoDtoCopyWith<TrainerTransformationPhotoDto> get copyWith => _$TrainerTransformationPhotoDtoCopyWithImpl<TrainerTransformationPhotoDto>(this as TrainerTransformationPhotoDto, _$identity);

  /// Serializes this TrainerTransformationPhotoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerTransformationPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.publicUrl, publicUrl) || other.publicUrl == publicUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imagePath,caption,clientName,publicUrl,createdAt);

@override
String toString() {
  return 'TrainerTransformationPhotoDto(id: $id, imagePath: $imagePath, caption: $caption, clientName: $clientName, publicUrl: $publicUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainerTransformationPhotoDtoCopyWith<$Res>  {
  factory $TrainerTransformationPhotoDtoCopyWith(TrainerTransformationPhotoDto value, $Res Function(TrainerTransformationPhotoDto) _then) = _$TrainerTransformationPhotoDtoCopyWithImpl;
@useResult
$Res call({
 String id, String imagePath, String? caption, String? clientName, String? publicUrl, String? createdAt
});




}
/// @nodoc
class _$TrainerTransformationPhotoDtoCopyWithImpl<$Res>
    implements $TrainerTransformationPhotoDtoCopyWith<$Res> {
  _$TrainerTransformationPhotoDtoCopyWithImpl(this._self, this._then);

  final TrainerTransformationPhotoDto _self;
  final $Res Function(TrainerTransformationPhotoDto) _then;

/// Create a copy of TrainerTransformationPhotoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imagePath = null,Object? caption = freezed,Object? clientName = freezed,Object? publicUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,publicUrl: freezed == publicUrl ? _self.publicUrl : publicUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerTransformationPhotoDto].
extension TrainerTransformationPhotoDtoPatterns on TrainerTransformationPhotoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerTransformationPhotoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerTransformationPhotoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerTransformationPhotoDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerTransformationPhotoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerTransformationPhotoDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerTransformationPhotoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imagePath,  String? caption,  String? clientName,  String? publicUrl,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerTransformationPhotoDto() when $default != null:
return $default(_that.id,_that.imagePath,_that.caption,_that.clientName,_that.publicUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imagePath,  String? caption,  String? clientName,  String? publicUrl,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerTransformationPhotoDto():
return $default(_that.id,_that.imagePath,_that.caption,_that.clientName,_that.publicUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imagePath,  String? caption,  String? clientName,  String? publicUrl,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerTransformationPhotoDto() when $default != null:
return $default(_that.id,_that.imagePath,_that.caption,_that.clientName,_that.publicUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerTransformationPhotoDto implements TrainerTransformationPhotoDto {
  const _TrainerTransformationPhotoDto({required this.id, required this.imagePath, this.caption, this.clientName, this.publicUrl, this.createdAt});
  factory _TrainerTransformationPhotoDto.fromJson(Map<String, dynamic> json) => _$TrainerTransformationPhotoDtoFromJson(json);

@override final  String id;
@override final  String imagePath;
@override final  String? caption;
@override final  String? clientName;
@override final  String? publicUrl;
@override final  String? createdAt;

/// Create a copy of TrainerTransformationPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerTransformationPhotoDtoCopyWith<_TrainerTransformationPhotoDto> get copyWith => __$TrainerTransformationPhotoDtoCopyWithImpl<_TrainerTransformationPhotoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerTransformationPhotoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerTransformationPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.publicUrl, publicUrl) || other.publicUrl == publicUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imagePath,caption,clientName,publicUrl,createdAt);

@override
String toString() {
  return 'TrainerTransformationPhotoDto(id: $id, imagePath: $imagePath, caption: $caption, clientName: $clientName, publicUrl: $publicUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerTransformationPhotoDtoCopyWith<$Res> implements $TrainerTransformationPhotoDtoCopyWith<$Res> {
  factory _$TrainerTransformationPhotoDtoCopyWith(_TrainerTransformationPhotoDto value, $Res Function(_TrainerTransformationPhotoDto) _then) = __$TrainerTransformationPhotoDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String imagePath, String? caption, String? clientName, String? publicUrl, String? createdAt
});




}
/// @nodoc
class __$TrainerTransformationPhotoDtoCopyWithImpl<$Res>
    implements _$TrainerTransformationPhotoDtoCopyWith<$Res> {
  __$TrainerTransformationPhotoDtoCopyWithImpl(this._self, this._then);

  final _TrainerTransformationPhotoDto _self;
  final $Res Function(_TrainerTransformationPhotoDto) _then;

/// Create a copy of TrainerTransformationPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imagePath = null,Object? caption = freezed,Object? clientName = freezed,Object? publicUrl = freezed,Object? createdAt = freezed,}) {
  return _then(_TrainerTransformationPhotoDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,publicUrl: freezed == publicUrl ? _self.publicUrl : publicUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
