// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExerciseLogDto {

 String get id; String get clientId; String get exerciseId; int? get reps; double? get weight; bool get isCompleted; int? get order; String? get tempo; String? get notes; String get side; String get workoutSessionId; String? get supersetKey; int? get orderInSuperset; ExerciseDto? get exercise;
/// Create a copy of ExerciseLogDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseLogDtoCopyWith<ExerciseLogDto> get copyWith => _$ExerciseLogDtoCopyWithImpl<ExerciseLogDto>(this as ExerciseLogDto, _$identity);

  /// Serializes this ExerciseLogDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.order, order) || other.order == order)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.side, side) || other.side == side)&&(identical(other.workoutSessionId, workoutSessionId) || other.workoutSessionId == workoutSessionId)&&(identical(other.supersetKey, supersetKey) || other.supersetKey == supersetKey)&&(identical(other.orderInSuperset, orderInSuperset) || other.orderInSuperset == orderInSuperset)&&(identical(other.exercise, exercise) || other.exercise == exercise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,exerciseId,reps,weight,isCompleted,order,tempo,notes,side,workoutSessionId,supersetKey,orderInSuperset,exercise);

@override
String toString() {
  return 'ExerciseLogDto(id: $id, clientId: $clientId, exerciseId: $exerciseId, reps: $reps, weight: $weight, isCompleted: $isCompleted, order: $order, tempo: $tempo, notes: $notes, side: $side, workoutSessionId: $workoutSessionId, supersetKey: $supersetKey, orderInSuperset: $orderInSuperset, exercise: $exercise)';
}


}

/// @nodoc
abstract mixin class $ExerciseLogDtoCopyWith<$Res>  {
  factory $ExerciseLogDtoCopyWith(ExerciseLogDto value, $Res Function(ExerciseLogDto) _then) = _$ExerciseLogDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String exerciseId, int? reps, double? weight, bool isCompleted, int? order, String? tempo, String? notes, String side, String workoutSessionId, String? supersetKey, int? orderInSuperset, ExerciseDto? exercise
});


$ExerciseDtoCopyWith<$Res>? get exercise;

}
/// @nodoc
class _$ExerciseLogDtoCopyWithImpl<$Res>
    implements $ExerciseLogDtoCopyWith<$Res> {
  _$ExerciseLogDtoCopyWithImpl(this._self, this._then);

  final ExerciseLogDto _self;
  final $Res Function(ExerciseLogDto) _then;

/// Create a copy of ExerciseLogDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? exerciseId = null,Object? reps = freezed,Object? weight = freezed,Object? isCompleted = null,Object? order = freezed,Object? tempo = freezed,Object? notes = freezed,Object? side = null,Object? workoutSessionId = null,Object? supersetKey = freezed,Object? orderInSuperset = freezed,Object? exercise = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String,workoutSessionId: null == workoutSessionId ? _self.workoutSessionId : workoutSessionId // ignore: cast_nullable_to_non_nullable
as String,supersetKey: freezed == supersetKey ? _self.supersetKey : supersetKey // ignore: cast_nullable_to_non_nullable
as String?,orderInSuperset: freezed == orderInSuperset ? _self.orderInSuperset : orderInSuperset // ignore: cast_nullable_to_non_nullable
as int?,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDto?,
  ));
}
/// Create a copy of ExerciseLogDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseDtoCopyWith<$Res>? get exercise {
    if (_self.exercise == null) {
    return null;
  }

  return $ExerciseDtoCopyWith<$Res>(_self.exercise!, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExerciseLogDto].
extension ExerciseLogDtoPatterns on ExerciseLogDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExerciseLogDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExerciseLogDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExerciseLogDto value)  $default,){
final _that = this;
switch (_that) {
case _ExerciseLogDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExerciseLogDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExerciseLogDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String exerciseId,  int? reps,  double? weight,  bool isCompleted,  int? order,  String? tempo,  String? notes,  String side,  String workoutSessionId,  String? supersetKey,  int? orderInSuperset,  ExerciseDto? exercise)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExerciseLogDto() when $default != null:
return $default(_that.id,_that.clientId,_that.exerciseId,_that.reps,_that.weight,_that.isCompleted,_that.order,_that.tempo,_that.notes,_that.side,_that.workoutSessionId,_that.supersetKey,_that.orderInSuperset,_that.exercise);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String exerciseId,  int? reps,  double? weight,  bool isCompleted,  int? order,  String? tempo,  String? notes,  String side,  String workoutSessionId,  String? supersetKey,  int? orderInSuperset,  ExerciseDto? exercise)  $default,) {final _that = this;
switch (_that) {
case _ExerciseLogDto():
return $default(_that.id,_that.clientId,_that.exerciseId,_that.reps,_that.weight,_that.isCompleted,_that.order,_that.tempo,_that.notes,_that.side,_that.workoutSessionId,_that.supersetKey,_that.orderInSuperset,_that.exercise);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String exerciseId,  int? reps,  double? weight,  bool isCompleted,  int? order,  String? tempo,  String? notes,  String side,  String workoutSessionId,  String? supersetKey,  int? orderInSuperset,  ExerciseDto? exercise)?  $default,) {final _that = this;
switch (_that) {
case _ExerciseLogDto() when $default != null:
return $default(_that.id,_that.clientId,_that.exerciseId,_that.reps,_that.weight,_that.isCompleted,_that.order,_that.tempo,_that.notes,_that.side,_that.workoutSessionId,_that.supersetKey,_that.orderInSuperset,_that.exercise);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExerciseLogDto implements ExerciseLogDto {
  const _ExerciseLogDto({required this.id, required this.clientId, required this.exerciseId, this.reps, this.weight, this.isCompleted = false, this.order, this.tempo, this.notes, this.side = 'BOTH', required this.workoutSessionId, this.supersetKey, this.orderInSuperset, this.exercise});
  factory _ExerciseLogDto.fromJson(Map<String, dynamic> json) => _$ExerciseLogDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String exerciseId;
@override final  int? reps;
@override final  double? weight;
@override@JsonKey() final  bool isCompleted;
@override final  int? order;
@override final  String? tempo;
@override final  String? notes;
@override@JsonKey() final  String side;
@override final  String workoutSessionId;
@override final  String? supersetKey;
@override final  int? orderInSuperset;
@override final  ExerciseDto? exercise;

/// Create a copy of ExerciseLogDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExerciseLogDtoCopyWith<_ExerciseLogDto> get copyWith => __$ExerciseLogDtoCopyWithImpl<_ExerciseLogDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExerciseLogDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExerciseLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.order, order) || other.order == order)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.side, side) || other.side == side)&&(identical(other.workoutSessionId, workoutSessionId) || other.workoutSessionId == workoutSessionId)&&(identical(other.supersetKey, supersetKey) || other.supersetKey == supersetKey)&&(identical(other.orderInSuperset, orderInSuperset) || other.orderInSuperset == orderInSuperset)&&(identical(other.exercise, exercise) || other.exercise == exercise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,exerciseId,reps,weight,isCompleted,order,tempo,notes,side,workoutSessionId,supersetKey,orderInSuperset,exercise);

@override
String toString() {
  return 'ExerciseLogDto(id: $id, clientId: $clientId, exerciseId: $exerciseId, reps: $reps, weight: $weight, isCompleted: $isCompleted, order: $order, tempo: $tempo, notes: $notes, side: $side, workoutSessionId: $workoutSessionId, supersetKey: $supersetKey, orderInSuperset: $orderInSuperset, exercise: $exercise)';
}


}

/// @nodoc
abstract mixin class _$ExerciseLogDtoCopyWith<$Res> implements $ExerciseLogDtoCopyWith<$Res> {
  factory _$ExerciseLogDtoCopyWith(_ExerciseLogDto value, $Res Function(_ExerciseLogDto) _then) = __$ExerciseLogDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String exerciseId, int? reps, double? weight, bool isCompleted, int? order, String? tempo, String? notes, String side, String workoutSessionId, String? supersetKey, int? orderInSuperset, ExerciseDto? exercise
});


@override $ExerciseDtoCopyWith<$Res>? get exercise;

}
/// @nodoc
class __$ExerciseLogDtoCopyWithImpl<$Res>
    implements _$ExerciseLogDtoCopyWith<$Res> {
  __$ExerciseLogDtoCopyWithImpl(this._self, this._then);

  final _ExerciseLogDto _self;
  final $Res Function(_ExerciseLogDto) _then;

/// Create a copy of ExerciseLogDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? exerciseId = null,Object? reps = freezed,Object? weight = freezed,Object? isCompleted = null,Object? order = freezed,Object? tempo = freezed,Object? notes = freezed,Object? side = null,Object? workoutSessionId = null,Object? supersetKey = freezed,Object? orderInSuperset = freezed,Object? exercise = freezed,}) {
  return _then(_ExerciseLogDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,reps: freezed == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int?,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,side: null == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String,workoutSessionId: null == workoutSessionId ? _self.workoutSessionId : workoutSessionId // ignore: cast_nullable_to_non_nullable
as String,supersetKey: freezed == supersetKey ? _self.supersetKey : supersetKey // ignore: cast_nullable_to_non_nullable
as String?,orderInSuperset: freezed == orderInSuperset ? _self.orderInSuperset : orderInSuperset // ignore: cast_nullable_to_non_nullable
as int?,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDto?,
  ));
}

/// Create a copy of ExerciseLogDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseDtoCopyWith<$Res>? get exercise {
    if (_self.exercise == null) {
    return null;
  }

  return $ExerciseDtoCopyWith<$Res>(_self.exercise!, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}

// dart format on
