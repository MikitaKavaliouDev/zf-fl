// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomExerciseDto {

 String get id; String get name; String get metricType; String? get muscleGroup; String? get equipment; String? get description; String? get videoUrl; String? get createdAt; String? get updatedAt;
/// Create a copy of CustomExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomExerciseDtoCopyWith<CustomExerciseDto> get copyWith => _$CustomExerciseDtoCopyWithImpl<CustomExerciseDto>(this as CustomExerciseDto, _$identity);

  /// Serializes this CustomExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.metricType, metricType) || other.metricType == metricType)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,metricType,muscleGroup,equipment,description,videoUrl,createdAt,updatedAt);

@override
String toString() {
  return 'CustomExerciseDto(id: $id, name: $name, metricType: $metricType, muscleGroup: $muscleGroup, equipment: $equipment, description: $description, videoUrl: $videoUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CustomExerciseDtoCopyWith<$Res>  {
  factory $CustomExerciseDtoCopyWith(CustomExerciseDto value, $Res Function(CustomExerciseDto) _then) = _$CustomExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String metricType, String? muscleGroup, String? equipment, String? description, String? videoUrl, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$CustomExerciseDtoCopyWithImpl<$Res>
    implements $CustomExerciseDtoCopyWith<$Res> {
  _$CustomExerciseDtoCopyWithImpl(this._self, this._then);

  final CustomExerciseDto _self;
  final $Res Function(CustomExerciseDto) _then;

/// Create a copy of CustomExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? metricType = null,Object? muscleGroup = freezed,Object? equipment = freezed,Object? description = freezed,Object? videoUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,metricType: null == metricType ? _self.metricType : metricType // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomExerciseDto].
extension CustomExerciseDtoPatterns on CustomExerciseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomExerciseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomExerciseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomExerciseDto value)  $default,){
final _that = this;
switch (_that) {
case _CustomExerciseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomExerciseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CustomExerciseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String metricType,  String? muscleGroup,  String? equipment,  String? description,  String? videoUrl,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomExerciseDto() when $default != null:
return $default(_that.id,_that.name,_that.metricType,_that.muscleGroup,_that.equipment,_that.description,_that.videoUrl,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String metricType,  String? muscleGroup,  String? equipment,  String? description,  String? videoUrl,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CustomExerciseDto():
return $default(_that.id,_that.name,_that.metricType,_that.muscleGroup,_that.equipment,_that.description,_that.videoUrl,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String metricType,  String? muscleGroup,  String? equipment,  String? description,  String? videoUrl,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CustomExerciseDto() when $default != null:
return $default(_that.id,_that.name,_that.metricType,_that.muscleGroup,_that.equipment,_that.description,_that.videoUrl,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomExerciseDto extends CustomExerciseDto {
  const _CustomExerciseDto({required this.id, required this.name, required this.metricType, this.muscleGroup, this.equipment, this.description, this.videoUrl, this.createdAt, this.updatedAt}): super._();
  factory _CustomExerciseDto.fromJson(Map<String, dynamic> json) => _$CustomExerciseDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String metricType;
@override final  String? muscleGroup;
@override final  String? equipment;
@override final  String? description;
@override final  String? videoUrl;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of CustomExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomExerciseDtoCopyWith<_CustomExerciseDto> get copyWith => __$CustomExerciseDtoCopyWithImpl<_CustomExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.metricType, metricType) || other.metricType == metricType)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,metricType,muscleGroup,equipment,description,videoUrl,createdAt,updatedAt);

@override
String toString() {
  return 'CustomExerciseDto(id: $id, name: $name, metricType: $metricType, muscleGroup: $muscleGroup, equipment: $equipment, description: $description, videoUrl: $videoUrl, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CustomExerciseDtoCopyWith<$Res> implements $CustomExerciseDtoCopyWith<$Res> {
  factory _$CustomExerciseDtoCopyWith(_CustomExerciseDto value, $Res Function(_CustomExerciseDto) _then) = __$CustomExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String metricType, String? muscleGroup, String? equipment, String? description, String? videoUrl, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$CustomExerciseDtoCopyWithImpl<$Res>
    implements _$CustomExerciseDtoCopyWith<$Res> {
  __$CustomExerciseDtoCopyWithImpl(this._self, this._then);

  final _CustomExerciseDto _self;
  final $Res Function(_CustomExerciseDto) _then;

/// Create a copy of CustomExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? metricType = null,Object? muscleGroup = freezed,Object? equipment = freezed,Object? description = freezed,Object? videoUrl = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CustomExerciseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,metricType: null == metricType ? _self.metricType : metricType // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
