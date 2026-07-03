// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_exercise_ref_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateExerciseRefDto {

 String get id; String get name; String? get muscleGroup; String? get equipment; String? get description; String? get videoUrl;
/// Create a copy of TemplateExerciseRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateExerciseRefDtoCopyWith<TemplateExerciseRefDto> get copyWith => _$TemplateExerciseRefDtoCopyWithImpl<TemplateExerciseRefDto>(this as TemplateExerciseRefDto, _$identity);

  /// Serializes this TemplateExerciseRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateExerciseRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,muscleGroup,equipment,description,videoUrl);

@override
String toString() {
  return 'TemplateExerciseRefDto(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment, description: $description, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class $TemplateExerciseRefDtoCopyWith<$Res>  {
  factory $TemplateExerciseRefDtoCopyWith(TemplateExerciseRefDto value, $Res Function(TemplateExerciseRefDto) _then) = _$TemplateExerciseRefDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? muscleGroup, String? equipment, String? description, String? videoUrl
});




}
/// @nodoc
class _$TemplateExerciseRefDtoCopyWithImpl<$Res>
    implements $TemplateExerciseRefDtoCopyWith<$Res> {
  _$TemplateExerciseRefDtoCopyWithImpl(this._self, this._then);

  final TemplateExerciseRefDto _self;
  final $Res Function(TemplateExerciseRefDto) _then;

/// Create a copy of TemplateExerciseRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? muscleGroup = freezed,Object? equipment = freezed,Object? description = freezed,Object? videoUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TemplateExerciseRefDto].
extension TemplateExerciseRefDtoPatterns on TemplateExerciseRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateExerciseRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateExerciseRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateExerciseRefDto value)  $default,){
final _that = this;
switch (_that) {
case _TemplateExerciseRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateExerciseRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateExerciseRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? muscleGroup,  String? equipment,  String? description,  String? videoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateExerciseRefDto() when $default != null:
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment,_that.description,_that.videoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? muscleGroup,  String? equipment,  String? description,  String? videoUrl)  $default,) {final _that = this;
switch (_that) {
case _TemplateExerciseRefDto():
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment,_that.description,_that.videoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? muscleGroup,  String? equipment,  String? description,  String? videoUrl)?  $default,) {final _that = this;
switch (_that) {
case _TemplateExerciseRefDto() when $default != null:
return $default(_that.id,_that.name,_that.muscleGroup,_that.equipment,_that.description,_that.videoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateExerciseRefDto implements TemplateExerciseRefDto {
  const _TemplateExerciseRefDto({required this.id, required this.name, this.muscleGroup, this.equipment, this.description, this.videoUrl});
  factory _TemplateExerciseRefDto.fromJson(Map<String, dynamic> json) => _$TemplateExerciseRefDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? muscleGroup;
@override final  String? equipment;
@override final  String? description;
@override final  String? videoUrl;

/// Create a copy of TemplateExerciseRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateExerciseRefDtoCopyWith<_TemplateExerciseRefDto> get copyWith => __$TemplateExerciseRefDtoCopyWithImpl<_TemplateExerciseRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateExerciseRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateExerciseRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.muscleGroup, muscleGroup) || other.muscleGroup == muscleGroup)&&(identical(other.equipment, equipment) || other.equipment == equipment)&&(identical(other.description, description) || other.description == description)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,muscleGroup,equipment,description,videoUrl);

@override
String toString() {
  return 'TemplateExerciseRefDto(id: $id, name: $name, muscleGroup: $muscleGroup, equipment: $equipment, description: $description, videoUrl: $videoUrl)';
}


}

/// @nodoc
abstract mixin class _$TemplateExerciseRefDtoCopyWith<$Res> implements $TemplateExerciseRefDtoCopyWith<$Res> {
  factory _$TemplateExerciseRefDtoCopyWith(_TemplateExerciseRefDto value, $Res Function(_TemplateExerciseRefDto) _then) = __$TemplateExerciseRefDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? muscleGroup, String? equipment, String? description, String? videoUrl
});




}
/// @nodoc
class __$TemplateExerciseRefDtoCopyWithImpl<$Res>
    implements _$TemplateExerciseRefDtoCopyWith<$Res> {
  __$TemplateExerciseRefDtoCopyWithImpl(this._self, this._then);

  final _TemplateExerciseRefDto _self;
  final $Res Function(_TemplateExerciseRefDto) _then;

/// Create a copy of TemplateExerciseRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? muscleGroup = freezed,Object? equipment = freezed,Object? description = freezed,Object? videoUrl = freezed,}) {
  return _then(_TemplateExerciseRefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,muscleGroup: freezed == muscleGroup ? _self.muscleGroup : muscleGroup // ignore: cast_nullable_to_non_nullable
as String?,equipment: freezed == equipment ? _self.equipment : equipment // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
