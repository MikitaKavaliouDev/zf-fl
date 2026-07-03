// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_exercise_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateExerciseDto {

 String get id; String get type; String? get exerciseId; String? get targetReps; int? get targetSets; int? get durationSeconds; String? get tempo; bool? get enableRpe; String? get notes; String? get videoUrl; String? get supersetGroupId; int? get supersetOrder; String? get exerciseCategory; TemplateExerciseRefDto? get exercise; int? get order; String? get templateId;
/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateExerciseDtoCopyWith<TemplateExerciseDto> get copyWith => _$TemplateExerciseDtoCopyWithImpl<TemplateExerciseDto>(this as TemplateExerciseDto, _$identity);

  /// Serializes this TemplateExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.enableRpe, enableRpe) || other.enableRpe == enableRpe)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.supersetGroupId, supersetGroupId) || other.supersetGroupId == supersetGroupId)&&(identical(other.supersetOrder, supersetOrder) || other.supersetOrder == supersetOrder)&&(identical(other.exerciseCategory, exerciseCategory) || other.exerciseCategory == exerciseCategory)&&(identical(other.exercise, exercise) || other.exercise == exercise)&&(identical(other.order, order) || other.order == order)&&(identical(other.templateId, templateId) || other.templateId == templateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,exerciseId,targetReps,targetSets,durationSeconds,tempo,enableRpe,notes,videoUrl,supersetGroupId,supersetOrder,exerciseCategory,exercise,order,templateId);

@override
String toString() {
  return 'TemplateExerciseDto(id: $id, type: $type, exerciseId: $exerciseId, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, tempo: $tempo, enableRpe: $enableRpe, notes: $notes, videoUrl: $videoUrl, supersetGroupId: $supersetGroupId, supersetOrder: $supersetOrder, exerciseCategory: $exerciseCategory, exercise: $exercise, order: $order, templateId: $templateId)';
}


}

/// @nodoc
abstract mixin class $TemplateExerciseDtoCopyWith<$Res>  {
  factory $TemplateExerciseDtoCopyWith(TemplateExerciseDto value, $Res Function(TemplateExerciseDto) _then) = _$TemplateExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String type, String? exerciseId, String? targetReps, int? targetSets, int? durationSeconds, String? tempo, bool? enableRpe, String? notes, String? videoUrl, String? supersetGroupId, int? supersetOrder, String? exerciseCategory, TemplateExerciseRefDto? exercise, int? order, String? templateId
});


$TemplateExerciseRefDtoCopyWith<$Res>? get exercise;

}
/// @nodoc
class _$TemplateExerciseDtoCopyWithImpl<$Res>
    implements $TemplateExerciseDtoCopyWith<$Res> {
  _$TemplateExerciseDtoCopyWithImpl(this._self, this._then);

  final TemplateExerciseDto _self;
  final $Res Function(TemplateExerciseDto) _then;

/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? exerciseId = freezed,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? tempo = freezed,Object? enableRpe = freezed,Object? notes = freezed,Object? videoUrl = freezed,Object? supersetGroupId = freezed,Object? supersetOrder = freezed,Object? exerciseCategory = freezed,Object? exercise = freezed,Object? order = freezed,Object? templateId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,exerciseId: freezed == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,enableRpe: freezed == enableRpe ? _self.enableRpe : enableRpe // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,supersetGroupId: freezed == supersetGroupId ? _self.supersetGroupId : supersetGroupId // ignore: cast_nullable_to_non_nullable
as String?,supersetOrder: freezed == supersetOrder ? _self.supersetOrder : supersetOrder // ignore: cast_nullable_to_non_nullable
as int?,exerciseCategory: freezed == exerciseCategory ? _self.exerciseCategory : exerciseCategory // ignore: cast_nullable_to_non_nullable
as String?,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as TemplateExerciseRefDto?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateExerciseRefDtoCopyWith<$Res>? get exercise {
    if (_self.exercise == null) {
    return null;
  }

  return $TemplateExerciseRefDtoCopyWith<$Res>(_self.exercise!, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}


/// Adds pattern-matching-related methods to [TemplateExerciseDto].
extension TemplateExerciseDtoPatterns on TemplateExerciseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateExerciseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateExerciseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateExerciseDto value)  $default,){
final _that = this;
switch (_that) {
case _TemplateExerciseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateExerciseDto value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateExerciseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String? exerciseId,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? tempo,  bool? enableRpe,  String? notes,  String? videoUrl,  String? supersetGroupId,  int? supersetOrder,  String? exerciseCategory,  TemplateExerciseRefDto? exercise,  int? order,  String? templateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateExerciseDto() when $default != null:
return $default(_that.id,_that.type,_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.tempo,_that.enableRpe,_that.notes,_that.videoUrl,_that.supersetGroupId,_that.supersetOrder,_that.exerciseCategory,_that.exercise,_that.order,_that.templateId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String? exerciseId,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? tempo,  bool? enableRpe,  String? notes,  String? videoUrl,  String? supersetGroupId,  int? supersetOrder,  String? exerciseCategory,  TemplateExerciseRefDto? exercise,  int? order,  String? templateId)  $default,) {final _that = this;
switch (_that) {
case _TemplateExerciseDto():
return $default(_that.id,_that.type,_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.tempo,_that.enableRpe,_that.notes,_that.videoUrl,_that.supersetGroupId,_that.supersetOrder,_that.exerciseCategory,_that.exercise,_that.order,_that.templateId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String? exerciseId,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? tempo,  bool? enableRpe,  String? notes,  String? videoUrl,  String? supersetGroupId,  int? supersetOrder,  String? exerciseCategory,  TemplateExerciseRefDto? exercise,  int? order,  String? templateId)?  $default,) {final _that = this;
switch (_that) {
case _TemplateExerciseDto() when $default != null:
return $default(_that.id,_that.type,_that.exerciseId,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.tempo,_that.enableRpe,_that.notes,_that.videoUrl,_that.supersetGroupId,_that.supersetOrder,_that.exerciseCategory,_that.exercise,_that.order,_that.templateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateExerciseDto implements TemplateExerciseDto {
  const _TemplateExerciseDto({required this.id, this.type = 'EXERCISE', this.exerciseId, this.targetReps, this.targetSets, this.durationSeconds, this.tempo, this.enableRpe, this.notes, this.videoUrl, this.supersetGroupId, this.supersetOrder, this.exerciseCategory, this.exercise, this.order, this.templateId});
  factory _TemplateExerciseDto.fromJson(Map<String, dynamic> json) => _$TemplateExerciseDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  String type;
@override final  String? exerciseId;
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
@override final  TemplateExerciseRefDto? exercise;
@override final  int? order;
@override final  String? templateId;

/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateExerciseDtoCopyWith<_TemplateExerciseDto> get copyWith => __$TemplateExerciseDtoCopyWithImpl<_TemplateExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.enableRpe, enableRpe) || other.enableRpe == enableRpe)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.supersetGroupId, supersetGroupId) || other.supersetGroupId == supersetGroupId)&&(identical(other.supersetOrder, supersetOrder) || other.supersetOrder == supersetOrder)&&(identical(other.exerciseCategory, exerciseCategory) || other.exerciseCategory == exerciseCategory)&&(identical(other.exercise, exercise) || other.exercise == exercise)&&(identical(other.order, order) || other.order == order)&&(identical(other.templateId, templateId) || other.templateId == templateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,exerciseId,targetReps,targetSets,durationSeconds,tempo,enableRpe,notes,videoUrl,supersetGroupId,supersetOrder,exerciseCategory,exercise,order,templateId);

@override
String toString() {
  return 'TemplateExerciseDto(id: $id, type: $type, exerciseId: $exerciseId, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, tempo: $tempo, enableRpe: $enableRpe, notes: $notes, videoUrl: $videoUrl, supersetGroupId: $supersetGroupId, supersetOrder: $supersetOrder, exerciseCategory: $exerciseCategory, exercise: $exercise, order: $order, templateId: $templateId)';
}


}

/// @nodoc
abstract mixin class _$TemplateExerciseDtoCopyWith<$Res> implements $TemplateExerciseDtoCopyWith<$Res> {
  factory _$TemplateExerciseDtoCopyWith(_TemplateExerciseDto value, $Res Function(_TemplateExerciseDto) _then) = __$TemplateExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String? exerciseId, String? targetReps, int? targetSets, int? durationSeconds, String? tempo, bool? enableRpe, String? notes, String? videoUrl, String? supersetGroupId, int? supersetOrder, String? exerciseCategory, TemplateExerciseRefDto? exercise, int? order, String? templateId
});


@override $TemplateExerciseRefDtoCopyWith<$Res>? get exercise;

}
/// @nodoc
class __$TemplateExerciseDtoCopyWithImpl<$Res>
    implements _$TemplateExerciseDtoCopyWith<$Res> {
  __$TemplateExerciseDtoCopyWithImpl(this._self, this._then);

  final _TemplateExerciseDto _self;
  final $Res Function(_TemplateExerciseDto) _then;

/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? exerciseId = freezed,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? tempo = freezed,Object? enableRpe = freezed,Object? notes = freezed,Object? videoUrl = freezed,Object? supersetGroupId = freezed,Object? supersetOrder = freezed,Object? exerciseCategory = freezed,Object? exercise = freezed,Object? order = freezed,Object? templateId = freezed,}) {
  return _then(_TemplateExerciseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,exerciseId: freezed == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,enableRpe: freezed == enableRpe ? _self.enableRpe : enableRpe // ignore: cast_nullable_to_non_nullable
as bool?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,supersetGroupId: freezed == supersetGroupId ? _self.supersetGroupId : supersetGroupId // ignore: cast_nullable_to_non_nullable
as String?,supersetOrder: freezed == supersetOrder ? _self.supersetOrder : supersetOrder // ignore: cast_nullable_to_non_nullable
as int?,exerciseCategory: freezed == exerciseCategory ? _self.exerciseCategory : exerciseCategory // ignore: cast_nullable_to_non_nullable
as String?,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as TemplateExerciseRefDto?,order: freezed == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateExerciseRefDtoCopyWith<$Res>? get exercise {
    if (_self.exercise == null) {
    return null;
  }

  return $TemplateExerciseRefDtoCopyWith<$Res>(_self.exercise!, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}

// dart format on
