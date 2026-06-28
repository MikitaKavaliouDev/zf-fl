// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TemplateDto {

 String get id; String get name; String? get description; List<TemplateExerciseDto> get exercises; int get exerciseCount; String? get programId; int get order; String? get category; String? get source; String? get programName;
/// Create a copy of TemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateDtoCopyWith<TemplateDto> get copyWith => _$TemplateDtoCopyWithImpl<TemplateDto>(this as TemplateDto, _$identity);

  /// Serializes this TemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.exercises, exercises)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.order, order) || other.order == order)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.programName, programName) || other.programName == programName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(exercises),exerciseCount,programId,order,category,source,programName);

@override
String toString() {
  return 'TemplateDto(id: $id, name: $name, description: $description, exercises: $exercises, exerciseCount: $exerciseCount, programId: $programId, order: $order, category: $category, source: $source, programName: $programName)';
}


}

/// @nodoc
abstract mixin class $TemplateDtoCopyWith<$Res>  {
  factory $TemplateDtoCopyWith(TemplateDto value, $Res Function(TemplateDto) _then) = _$TemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, List<TemplateExerciseDto> exercises, int exerciseCount, String? programId, int order, String? category, String? source, String? programName
});




}
/// @nodoc
class _$TemplateDtoCopyWithImpl<$Res>
    implements $TemplateDtoCopyWith<$Res> {
  _$TemplateDtoCopyWithImpl(this._self, this._then);

  final TemplateDto _self;
  final $Res Function(TemplateDto) _then;

/// Create a copy of TemplateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? exercises = null,Object? exerciseCount = null,Object? programId = freezed,Object? order = null,Object? category = freezed,Object? source = freezed,Object? programName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,exercises: null == exercises ? _self.exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<TemplateExerciseDto>,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,programName: freezed == programName ? _self.programName : programName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TemplateDto].
extension TemplateDtoPatterns on TemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _TemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _TemplateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  List<TemplateExerciseDto> exercises,  int exerciseCount,  String? programId,  int order,  String? category,  String? source,  String? programName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.exercises,_that.exerciseCount,_that.programId,_that.order,_that.category,_that.source,_that.programName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  List<TemplateExerciseDto> exercises,  int exerciseCount,  String? programId,  int order,  String? category,  String? source,  String? programName)  $default,) {final _that = this;
switch (_that) {
case _TemplateDto():
return $default(_that.id,_that.name,_that.description,_that.exercises,_that.exerciseCount,_that.programId,_that.order,_that.category,_that.source,_that.programName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  List<TemplateExerciseDto> exercises,  int exerciseCount,  String? programId,  int order,  String? category,  String? source,  String? programName)?  $default,) {final _that = this;
switch (_that) {
case _TemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.exercises,_that.exerciseCount,_that.programId,_that.order,_that.category,_that.source,_that.programName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateDto implements TemplateDto {
  const _TemplateDto({required this.id, required this.name, this.description, final  List<TemplateExerciseDto> exercises = const <TemplateExerciseDto>[], this.exerciseCount = 0, this.programId, this.order = 0, this.category, this.source, this.programName}): _exercises = exercises;
  factory _TemplateDto.fromJson(Map<String, dynamic> json) => _$TemplateDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
 final  List<TemplateExerciseDto> _exercises;
@override@JsonKey() List<TemplateExerciseDto> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}

@override@JsonKey() final  int exerciseCount;
@override final  String? programId;
@override@JsonKey() final  int order;
@override final  String? category;
@override final  String? source;
@override final  String? programName;

/// Create a copy of TemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TemplateDtoCopyWith<_TemplateDto> get copyWith => __$TemplateDtoCopyWithImpl<_TemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._exercises, _exercises)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.order, order) || other.order == order)&&(identical(other.category, category) || other.category == category)&&(identical(other.source, source) || other.source == source)&&(identical(other.programName, programName) || other.programName == programName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_exercises),exerciseCount,programId,order,category,source,programName);

@override
String toString() {
  return 'TemplateDto(id: $id, name: $name, description: $description, exercises: $exercises, exerciseCount: $exerciseCount, programId: $programId, order: $order, category: $category, source: $source, programName: $programName)';
}


}

/// @nodoc
abstract mixin class _$TemplateDtoCopyWith<$Res> implements $TemplateDtoCopyWith<$Res> {
  factory _$TemplateDtoCopyWith(_TemplateDto value, $Res Function(_TemplateDto) _then) = __$TemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, List<TemplateExerciseDto> exercises, int exerciseCount, String? programId, int order, String? category, String? source, String? programName
});




}
/// @nodoc
class __$TemplateDtoCopyWithImpl<$Res>
    implements _$TemplateDtoCopyWith<$Res> {
  __$TemplateDtoCopyWithImpl(this._self, this._then);

  final _TemplateDto _self;
  final $Res Function(_TemplateDto) _then;

/// Create a copy of TemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? exercises = null,Object? exerciseCount = null,Object? programId = freezed,Object? order = null,Object? category = freezed,Object? source = freezed,Object? programName = freezed,}) {
  return _then(_TemplateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<TemplateExerciseDto>,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,source: freezed == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String?,programName: freezed == programName ? _self.programName : programName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TemplateExerciseDto {

 String get id; int get order; String? get exerciseId; String? get type; String? get targetReps; int? get targetSets; int? get durationSeconds; String? get notes; ExerciseDto? get exercise;
/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateExerciseDtoCopyWith<TemplateExerciseDto> get copyWith => _$TemplateExerciseDtoCopyWithImpl<TemplateExerciseDto>(this as TemplateExerciseDto, _$identity);

  /// Serializes this TemplateExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.exercise, exercise) || other.exercise == exercise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,exerciseId,type,targetReps,targetSets,durationSeconds,notes,exercise);

@override
String toString() {
  return 'TemplateExerciseDto(id: $id, order: $order, exerciseId: $exerciseId, type: $type, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, notes: $notes, exercise: $exercise)';
}


}

/// @nodoc
abstract mixin class $TemplateExerciseDtoCopyWith<$Res>  {
  factory $TemplateExerciseDtoCopyWith(TemplateExerciseDto value, $Res Function(TemplateExerciseDto) _then) = _$TemplateExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String id, int order, String? exerciseId, String? type, String? targetReps, int? targetSets, int? durationSeconds, String? notes, ExerciseDto? exercise
});


$ExerciseDtoCopyWith<$Res>? get exercise;

}
/// @nodoc
class _$TemplateExerciseDtoCopyWithImpl<$Res>
    implements $TemplateExerciseDtoCopyWith<$Res> {
  _$TemplateExerciseDtoCopyWithImpl(this._self, this._then);

  final TemplateExerciseDto _self;
  final $Res Function(TemplateExerciseDto) _then;

/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? exerciseId = freezed,Object? type = freezed,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? notes = freezed,Object? exercise = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,exerciseId: freezed == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDto?,
  ));
}
/// Create a copy of TemplateExerciseDto
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int order,  String? exerciseId,  String? type,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? notes,  ExerciseDto? exercise)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TemplateExerciseDto() when $default != null:
return $default(_that.id,_that.order,_that.exerciseId,_that.type,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.notes,_that.exercise);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int order,  String? exerciseId,  String? type,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? notes,  ExerciseDto? exercise)  $default,) {final _that = this;
switch (_that) {
case _TemplateExerciseDto():
return $default(_that.id,_that.order,_that.exerciseId,_that.type,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.notes,_that.exercise);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int order,  String? exerciseId,  String? type,  String? targetReps,  int? targetSets,  int? durationSeconds,  String? notes,  ExerciseDto? exercise)?  $default,) {final _that = this;
switch (_that) {
case _TemplateExerciseDto() when $default != null:
return $default(_that.id,_that.order,_that.exerciseId,_that.type,_that.targetReps,_that.targetSets,_that.durationSeconds,_that.notes,_that.exercise);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TemplateExerciseDto implements TemplateExerciseDto {
  const _TemplateExerciseDto({required this.id, this.order = 0, this.exerciseId, this.type, this.targetReps, this.targetSets, this.durationSeconds, this.notes, this.exercise});
  factory _TemplateExerciseDto.fromJson(Map<String, dynamic> json) => _$TemplateExerciseDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  int order;
@override final  String? exerciseId;
@override final  String? type;
@override final  String? targetReps;
@override final  int? targetSets;
@override final  int? durationSeconds;
@override final  String? notes;
@override final  ExerciseDto? exercise;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TemplateExerciseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetReps, targetReps) || other.targetReps == targetReps)&&(identical(other.targetSets, targetSets) || other.targetSets == targetSets)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.exercise, exercise) || other.exercise == exercise));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,exerciseId,type,targetReps,targetSets,durationSeconds,notes,exercise);

@override
String toString() {
  return 'TemplateExerciseDto(id: $id, order: $order, exerciseId: $exerciseId, type: $type, targetReps: $targetReps, targetSets: $targetSets, durationSeconds: $durationSeconds, notes: $notes, exercise: $exercise)';
}


}

/// @nodoc
abstract mixin class _$TemplateExerciseDtoCopyWith<$Res> implements $TemplateExerciseDtoCopyWith<$Res> {
  factory _$TemplateExerciseDtoCopyWith(_TemplateExerciseDto value, $Res Function(_TemplateExerciseDto) _then) = __$TemplateExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String? exerciseId, String? type, String? targetReps, int? targetSets, int? durationSeconds, String? notes, ExerciseDto? exercise
});


@override $ExerciseDtoCopyWith<$Res>? get exercise;

}
/// @nodoc
class __$TemplateExerciseDtoCopyWithImpl<$Res>
    implements _$TemplateExerciseDtoCopyWith<$Res> {
  __$TemplateExerciseDtoCopyWithImpl(this._self, this._then);

  final _TemplateExerciseDto _self;
  final $Res Function(_TemplateExerciseDto) _then;

/// Create a copy of TemplateExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? exerciseId = freezed,Object? type = freezed,Object? targetReps = freezed,Object? targetSets = freezed,Object? durationSeconds = freezed,Object? notes = freezed,Object? exercise = freezed,}) {
  return _then(_TemplateExerciseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,exerciseId: freezed == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,targetReps: freezed == targetReps ? _self.targetReps : targetReps // ignore: cast_nullable_to_non_nullable
as String?,targetSets: freezed == targetSets ? _self.targetSets : targetSets // ignore: cast_nullable_to_non_nullable
as int?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,exercise: freezed == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDto?,
  ));
}

/// Create a copy of TemplateExerciseDto
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
