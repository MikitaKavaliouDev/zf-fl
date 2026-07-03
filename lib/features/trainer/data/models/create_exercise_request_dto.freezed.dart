// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_exercise_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateExerciseRequestDto {

 String get exerciseId; String? get targetReps; int? get targetSets; int? get durationSeconds; String? get tempo; bool? get enableRpe; String? get notes; String? get videoUrl; String? get supersetGroupId; int? get supersetOrder; String? get exerciseCategory; String? get metricType; double? get targetDistanceKm; double? get targetLevel;
/// Create a copy of CreateExerciseRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateExerciseRequestDtoCopyWith<CreateExerciseRequestDto> get copyWith => _$CreateExerciseRequestDtoCopyWithImpl<CreateExerciseRequestDto>(this as CreateExerciseRequestDto, _$identity);

  /// Serializes this CreateExerciseRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateExerciseRequestDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.enableRpe, enableRpe) || other.enableRpe == enableRpe)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.supersetGroupId, supersetGroupId) || other.supersetGroupId == supersetGroupId)&&(identical(other.supersetOrder, supersetOrder) || other.supersetOrder == supersetOrder)&&(identical(other.exerciseCategory, exerciseCategory) || other.exerciseCategory == exerciseCategory)&&(identical(other.metricType, metricType) || other.metricType == metricType)&&(identical(other.targetDistanceKm, targetDistanceKm) || other.targetDistanceKm == targetDistanceKm)&&(identical(other.targetLevel, targetLevel) || other.targetLevel == targetLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,targetReps,targetSets,durationSeconds,tempo,enableRpe,notes,videoUrl,supersetGroupId,supersetOrder,exerciseCategory,metricType,targetDistanceKm,targetLevel);

@override
String toString() {
  return 'CreateExerciseRequestDto(exerciseId: $exerciseId, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, tempo: $tempo, enableRpe: $enableRpe, notes: $notes, videoUrl: $videoUrl, supersetGroupId: $supersetGroupId, supersetOrder: $supersetOrder, exerciseCategory: $exerciseCategory, metricType: $metricType, targetDistanceKm: $targetDistanceKm, targetLevel: $targetLevel)';
}


}

/// @nodoc
abstract mixin class $CreateExerciseRequestDtoCopyWith<$Res>  {
  factory $CreateExerciseRequestDtoCopyWith(CreateExerciseRequestDto value, $Res Function(CreateExerciseRequestDto) _then) = _$CreateExerciseRequestDtoCopyWithImpl;
@useResult
$Res call({
 String exerciseId, String? targetReps, int? targetSets, int? durationSeconds, String? tempo, bool? enableRpe, String? notes, String? videoUrl, String? supersetGroupId, int? supersetOrder, String? exerciseCategory, String? metricType, double? targetDistanceKm, double? targetLevel
});




}
/// @nodoc
class _$CreateExerciseRequestDtoCopyWithImpl<$Res>
    implements $CreateExerciseRequestDtoCopyWith<$Res> {
  _$CreateExerciseRequestDtoCopyWithImpl(this._self, this._then);

  final CreateExerciseRequestDto _self;
  final $Res Function(CreateExerciseRequestDto) _then;

/// Create a copy of CreateExerciseRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? tempo = freezed,Object? enableRpe = freezed,Object? notes = freezed,Object? videoUrl = freezed,Object? supersetGroupId = freezed,Object? supersetOrder = freezed,Object? exerciseCategory = freezed,Object? metricType = freezed,Object? targetDistanceKm = freezed,Object? targetLevel = freezed,}) {
  return _then(_self.copyWith(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,enableRpe: freezed == enableRpe ? _self.enableRpe : enableRpe // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,supersetGroupId: freezed == supersetGroupId ? _self.supersetGroupId : supersetGroupId // ignore: cast_nullable_to_non_nullable
as String?,supersetOrder: freezed == supersetOrder ? _self.supersetOrder : supersetOrder // ignore: cast_nullable_to_non_nullable
as int?,exerciseCategory: freezed == exerciseCategory ? _self.exerciseCategory : exerciseCategory // ignore: cast_nullable_to_non_nullable
as String?,metricType: freezed == metricType ? _self.metricType : metricType // ignore: cast_nullable_to_non_nullable
as String?,targetDistanceKm: freezed == targetDistanceKm ? _self.targetDistanceKm : targetDistanceKm // ignore: cast_nullable_to_non_nullable
as double?,targetLevel: freezed == targetLevel ? _self.targetLevel : targetLevel // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateExerciseRequestDto].
extension CreateExerciseRequestDtoPatterns on CreateExerciseRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateExerciseRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateExerciseRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateExerciseRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateExerciseRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateExerciseRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateExerciseRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exerciseId,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? tempo,  bool? enableRpe,  String? notes,  String? videoUrl,  String? supersetGroupId,  int? supersetOrder,  String? exerciseCategory,  String? metricType,  double? targetDistanceKm,  double? targetLevel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateExerciseRequestDto() when $default != null:
return $default(_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.tempo,_that.enableRpe,_that.notes,_that.videoUrl,_that.supersetGroupId,_that.supersetOrder,_that.exerciseCategory,_that.metricType,_that.targetDistanceKm,_that.targetLevel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exerciseId,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? tempo,  bool? enableRpe,  String? notes,  String? videoUrl,  String? supersetGroupId,  int? supersetOrder,  String? exerciseCategory,  String? metricType,  double? targetDistanceKm,  double? targetLevel)  $default,) {final _that = this;
switch (_that) {
case _CreateExerciseRequestDto():
return $default(_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.tempo,_that.enableRpe,_that.notes,_that.videoUrl,_that.supersetGroupId,_that.supersetOrder,_that.exerciseCategory,_that.metricType,_that.targetDistanceKm,_that.targetLevel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exerciseId,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? tempo,  bool? enableRpe,  String? notes,  String? videoUrl,  String? supersetGroupId,  int? supersetOrder,  String? exerciseCategory,  String? metricType,  double? targetDistanceKm,  double? targetLevel)?  $default,) {final _that = this;
switch (_that) {
case _CreateExerciseRequestDto() when $default != null:
return $default(_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.tempo,_that.enableRpe,_that.notes,_that.videoUrl,_that.supersetGroupId,_that.supersetOrder,_that.exerciseCategory,_that.metricType,_that.targetDistanceKm,_that.targetLevel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateExerciseRequestDto implements CreateExerciseRequestDto {
  const _CreateExerciseRequestDto({required this.exerciseId, this.targetReps, this.targetSets, this.durationSeconds, this.tempo, this.enableRpe, this.notes, this.videoUrl, this.supersetGroupId, this.supersetOrder, this.exerciseCategory, this.metricType, this.targetDistanceKm, this.targetLevel});
  factory _CreateExerciseRequestDto.fromJson(Map<String, dynamic> json) => _$CreateExerciseRequestDtoFromJson(json);

@override final  String exerciseId;
@override final  String? targetReps;
@override final  int? targetSets;
@override final  int? durationSeconds;
@override final  String? tempo;
@override final  bool? enableRpe;
@override final  String? notes;
@override final  String? videoUrl;
@override final  String? supersetGroupId;
@override final  int? supersetOrder;
@override final  String? exerciseCategory;
@override final  String? metricType;
@override final  double? targetDistanceKm;
@override final  double? targetLevel;

/// Create a copy of CreateExerciseRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateExerciseRequestDtoCopyWith<_CreateExerciseRequestDto> get copyWith => __$CreateExerciseRequestDtoCopyWithImpl<_CreateExerciseRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateExerciseRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateExerciseRequestDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.enableRpe, enableRpe) || other.enableRpe == enableRpe)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.supersetGroupId, supersetGroupId) || other.supersetGroupId == supersetGroupId)&&(identical(other.supersetOrder, supersetOrder) || other.supersetOrder == supersetOrder)&&(identical(other.exerciseCategory, exerciseCategory) || other.exerciseCategory == exerciseCategory)&&(identical(other.metricType, metricType) || other.metricType == metricType)&&(identical(other.targetDistanceKm, targetDistanceKm) || other.targetDistanceKm == targetDistanceKm)&&(identical(other.targetLevel, targetLevel) || other.targetLevel == targetLevel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,targetReps,targetSets,durationSeconds,tempo,enableRpe,notes,videoUrl,supersetGroupId,supersetOrder,exerciseCategory,metricType,targetDistanceKm,targetLevel);

@override
String toString() {
  return 'CreateExerciseRequestDto(exerciseId: $exerciseId, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, tempo: $tempo, enableRpe: $enableRpe, notes: $notes, videoUrl: $videoUrl, supersetGroupId: $supersetGroupId, supersetOrder: $supersetOrder, exerciseCategory: $exerciseCategory, metricType: $metricType, targetDistanceKm: $targetDistanceKm, targetLevel: $targetLevel)';
}


}

/// @nodoc
abstract mixin class _$CreateExerciseRequestDtoCopyWith<$Res> implements $CreateExerciseRequestDtoCopyWith<$Res> {
  factory _$CreateExerciseRequestDtoCopyWith(_CreateExerciseRequestDto value, $Res Function(_CreateExerciseRequestDto) _then) = __$CreateExerciseRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String exerciseId, String? targetReps, int? targetSets, int? durationSeconds, String? tempo, bool? enableRpe, String? notes, String? videoUrl, String? supersetGroupId, int? supersetOrder, String? exerciseCategory, String? metricType, double? targetDistanceKm, double? targetLevel
});




}
/// @nodoc
class __$CreateExerciseRequestDtoCopyWithImpl<$Res>
    implements _$CreateExerciseRequestDtoCopyWith<$Res> {
  __$CreateExerciseRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateExerciseRequestDto _self;
  final $Res Function(_CreateExerciseRequestDto) _then;

/// Create a copy of CreateExerciseRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? tempo = freezed,Object? enableRpe = freezed,Object? notes = freezed,Object? videoUrl = freezed,Object? supersetGroupId = freezed,Object? supersetOrder = freezed,Object? exerciseCategory = freezed,Object? metricType = freezed,Object? targetDistanceKm = freezed,Object? targetLevel = freezed,}) {
  return _then(_CreateExerciseRequestDto(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,enableRpe: freezed == enableRpe ? _self.enableRpe : enableRpe // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,supersetGroupId: freezed == supersetGroupId ? _self.supersetGroupId : supersetGroupId // ignore: cast_nullable_to_non_nullable
as String?,supersetOrder: freezed == supersetOrder ? _self.supersetOrder : supersetOrder // ignore: cast_nullable_to_non_nullable
as int?,exerciseCategory: freezed == exerciseCategory ? _self.exerciseCategory : exerciseCategory // ignore: cast_nullable_to_non_nullable
as String?,metricType: freezed == metricType ? _self.metricType : metricType // ignore: cast_nullable_to_non_nullable
as String?,targetDistanceKm: freezed == targetDistanceKm ? _self.targetDistanceKm : targetDistanceKm // ignore: cast_nullable_to_non_nullable
as double?,targetLevel: freezed == targetLevel ? _self.targetLevel : targetLevel // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
