// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseDto {

 String get id; String get name; String? get muscleGroup; String? get equipment; String? get category; String? get description; String? get imageUrl; String? get videoUrl; int? get recommendedRestSeconds; bool get isUnilateral;
/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseDtoCopyWith<ExerciseDto> get copyWith => _$ExerciseDtoCopyWithImpl<ExerciseDto>(this as ExerciseDto, _$identity);

  /// Serializes this ExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.recommendedRestSeconds, recommendedRestSeconds) || other.recommendedRestSeconds == recommendedRestSeconds)&&(identical(other.isUnilateral, isUnilateral) || other.isUnilateral == isUnilateral));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,muscleGroup,equipment,category,description,imageUrl,videoUrl,recommendedRestSeconds,isUnilateral);

@override
String toString() {
  return 'ExerciseDto(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment, category: $category, description: $description, imageUrl: $imageUrl, videoUrl: $videoUrl, recommendedRestSeconds: $recommendedRestSeconds, isUnilateral: $isUnilateral)';
}


}

/// @nodoc
abstract mixin class $ExerciseDtoCopyWith<$Res>  {
  factory $ExerciseDtoCopyWith(ExerciseDto value, $Res Function(ExerciseDto) _then) = _$ExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? muscleGroup, String? equipment, String? category, String? description, String? imageUrl, String? videoUrl, int? recommendedRestSeconds, bool isUnilateral
});




}
/// @nodoc
class _$ExerciseDtoCopyWithImpl<$Res>
    implements $ExerciseDtoCopyWith<$Res> {
  _$ExerciseDtoCopyWithImpl(this._self, this._then);

  final ExerciseDto _self;
  final $Res Function(ExerciseDto) _then;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? muscleGroup = freezed,Object? equipment = freezed,Object? category = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? recommendedRestSeconds = freezed,Object? isUnilateral = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,recommendedRestSeconds: freezed == recommendedRestSeconds ? _self.recommendedRestSeconds : recommendedRestSeconds // ignore: cast_nullable_to_non_nullable
as int?,isUnilateral: null == isUnilateral ? _self.isUnilateral : isUnilateral // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExerciseDto].
extension ExerciseDtoPatterns on ExerciseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseDto value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? muscleGroup,  String? equipment,  String? category,  String? description,  String? imageUrl,  String? videoUrl,  int? recommendedRestSeconds,  bool isUnilateral)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseDto() when $default != null:
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment,_that.category,_that.description,_that.imageUrl,_that.videoUrl,_that.recommendedRestSeconds,_that.isUnilateral);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? muscleGroup,  String? equipment,  String? category,  String? description,  String? imageUrl,  String? videoUrl,  int? recommendedRestSeconds,  bool isUnilateral)  $default,) {final _that = this;
switch (_that) {
case _ExerciseDto():
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment,_that.category,_that.description,_that.imageUrl,_that.videoUrl,_that.recommendedRestSeconds,_that.isUnilateral);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? muscleGroup,  String? equipment,  String? category,  String? description,  String? imageUrl,  String? videoUrl,  int? recommendedRestSeconds,  bool isUnilateral)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseDto() when $default != null:
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment,_that.category,_that.description,_that.imageUrl,_that.videoUrl,_that.recommendedRestSeconds,_that.isUnilateral);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseDto implements ExerciseDto {
  const _ExerciseDto({required this.id, required this.name, this.muscleGroup, this.equipment, this.category, this.description, this.imageUrl, this.videoUrl, this.recommendedRestSeconds, this.isUnilateral = false});
  factory _ExerciseDto.fromJson(Map<String, dynamic> json) => _$ExerciseDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? muscleGroup;
@override final  String? equipment;
@override final  String? category;
@override final  String? description;
@override final  String? imageUrl;
@override final  String? videoUrl;
@override final  int? recommendedRestSeconds;
@override@JsonKey() final  bool isUnilateral;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseDtoCopyWith<_ExerciseDto> get copyWith => __$ExerciseDtoCopyWithImpl<_ExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.category, category) || other.category == category)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.recommendedRestSeconds, recommendedRestSeconds) || other.recommendedRestSeconds == recommendedRestSeconds)&&(identical(other.isUnilateral, isUnilateral) || other.isUnilateral == isUnilateral));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,muscleGroup,equipment,category,description,imageUrl,videoUrl,recommendedRestSeconds,isUnilateral);

@override
String toString() {
  return 'ExerciseDto(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment, category: $category, description: $description, imageUrl: $imageUrl, videoUrl: $videoUrl, recommendedRestSeconds: $recommendedRestSeconds, isUnilateral: $isUnilateral)';
}


}

/// @nodoc
abstract mixin class _$ExerciseDtoCopyWith<$Res> implements $ExerciseDtoCopyWith<$Res> {
  factory _$ExerciseDtoCopyWith(_ExerciseDto value, $Res Function(_ExerciseDto) _then) = __$ExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? muscleGroup, String? equipment, String? category, String? description, String? imageUrl, String? videoUrl, int? recommendedRestSeconds, bool isUnilateral
});




}
/// @nodoc
class __$ExerciseDtoCopyWithImpl<$Res>
    implements _$ExerciseDtoCopyWith<$Res> {
  __$ExerciseDtoCopyWithImpl(this._self, this._then);

  final _ExerciseDto _self;
  final $Res Function(_ExerciseDto) _then;

/// Create a copy of ExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? muscleGroup = freezed,Object? equipment = freezed,Object? category = freezed,Object? description = freezed,Object? imageUrl = freezed,Object? videoUrl = freezed,Object? recommendedRestSeconds = freezed,Object? isUnilateral = null,}) {
  return _then(_ExerciseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,recommendedRestSeconds: freezed == recommendedRestSeconds ? _self.recommendedRestSeconds : recommendedRestSeconds // ignore: cast_nullable_to_non_nullable
as int?,isUnilateral: null == isUnilateral ? _self.isUnilateral : isUnilateral // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
