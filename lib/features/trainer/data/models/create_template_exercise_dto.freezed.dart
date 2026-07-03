// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_template_exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTemplateExerciseDto {

 String get exerciseId; String? get targetReps;@JsonKey(name: 'targetSets') int? get targetSets;@JsonKey(name: 'durationSeconds') int? get durationSeconds; String? get notes; int? get order;
/// Create a copy of CreateTemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateTemplateExerciseDtoCopyWith<CreateTemplateExerciseDto> get copyWith => _$CreateTemplateExerciseDtoCopyWithImpl<CreateTemplateExerciseDto>(this as CreateTemplateExerciseDto, _$identity);

  /// Serializes this CreateTemplateExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTemplateExerciseDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,targetReps,targetSets,durationSeconds,notes,order);

@override
String toString() {
  return 'CreateTemplateExerciseDto(exerciseId: $exerciseId, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, notes: $notes, order: $order)';
}


}

/// @nodoc
abstract mixin class $CreateTemplateExerciseDtoCopyWith<$Res>  {
  factory $CreateTemplateExerciseDtoCopyWith(CreateTemplateExerciseDto value, $Res Function(CreateTemplateExerciseDto) _then) = _$CreateTemplateExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String exerciseId, String? targetReps,@JsonKey(name: 'targetSets') int? targetSets,@JsonKey(name: 'durationSeconds') int? durationSeconds, String? notes, int? order
});




}
/// @nodoc
class _$CreateTemplateExerciseDtoCopyWithImpl<$Res>
    implements $CreateTemplateExerciseDtoCopyWith<$Res> {
  _$CreateTemplateExerciseDtoCopyWithImpl(this._self, this._then);

  final CreateTemplateExerciseDto _self;
  final $Res Function(CreateTemplateExerciseDto) _then;

/// Create a copy of CreateTemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? notes = freezed,Object? order = freezed,}) {
  return _then(_self.copyWith(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateTemplateExerciseDto].
extension CreateTemplateExerciseDtoPatterns on CreateTemplateExerciseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateTemplateExerciseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTemplateExerciseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateTemplateExerciseDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateTemplateExerciseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateTemplateExerciseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateTemplateExerciseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exerciseId,  String? targetReps, @JsonKey(name: 'targetSets')  int? targetSets, @JsonKey(name: 'durationSeconds')  int? durationSeconds,  String? notes,  int? order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTemplateExerciseDto() when $default != null:
return $default(_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.notes,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exerciseId,  String? targetReps, @JsonKey(name: 'targetSets')  int? targetSets, @JsonKey(name: 'durationSeconds')  int? durationSeconds,  String? notes,  int? order)  $default,) {final _that = this;
switch (_that) {
case _CreateTemplateExerciseDto():
return $default(_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.notes,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exerciseId,  String? targetReps, @JsonKey(name: 'targetSets')  int? targetSets, @JsonKey(name: 'durationSeconds')  int? durationSeconds,  String? notes,  int? order)?  $default,) {final _that = this;
switch (_that) {
case _CreateTemplateExerciseDto() when $default != null:
return $default(_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.notes,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateTemplateExerciseDto implements CreateTemplateExerciseDto {
  const _CreateTemplateExerciseDto({required this.exerciseId, this.targetReps, @JsonKey(name: 'targetSets') this.targetSets, @JsonKey(name: 'durationSeconds') this.durationSeconds, this.notes, this.order});
  factory _CreateTemplateExerciseDto.fromJson(Map<String, dynamic> json) => _$CreateTemplateExerciseDtoFromJson(json);

@override final  String exerciseId;
@override final  String? targetReps;
@override@JsonKey(name: 'targetSets') final  int? targetSets;
@override@JsonKey(name: 'durationSeconds') final  int? durationSeconds;
@override final  String? notes;
@override final  int? order;

/// Create a copy of CreateTemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTemplateExerciseDtoCopyWith<_CreateTemplateExerciseDto> get copyWith => __$CreateTemplateExerciseDtoCopyWithImpl<_CreateTemplateExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateTemplateExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTemplateExerciseDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,targetReps,targetSets,durationSeconds,notes,order);

@override
String toString() {
  return 'CreateTemplateExerciseDto(exerciseId: $exerciseId, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, notes: $notes, order: $order)';
}


}

/// @nodoc
abstract mixin class _$CreateTemplateExerciseDtoCopyWith<$Res> implements $CreateTemplateExerciseDtoCopyWith<$Res> {
  factory _$CreateTemplateExerciseDtoCopyWith(_CreateTemplateExerciseDto value, $Res Function(_CreateTemplateExerciseDto) _then) = __$CreateTemplateExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String exerciseId, String? targetReps,@JsonKey(name: 'targetSets') int? targetSets,@JsonKey(name: 'durationSeconds') int? durationSeconds, String? notes, int? order
});




}
/// @nodoc
class __$CreateTemplateExerciseDtoCopyWithImpl<$Res>
    implements _$CreateTemplateExerciseDtoCopyWith<$Res> {
  __$CreateTemplateExerciseDtoCopyWithImpl(this._self, this._then);

  final _CreateTemplateExerciseDto _self;
  final $Res Function(_CreateTemplateExerciseDto) _then;

/// Create a copy of CreateTemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? notes = freezed,Object? order = freezed,}) {
  return _then(_CreateTemplateExerciseDto(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
