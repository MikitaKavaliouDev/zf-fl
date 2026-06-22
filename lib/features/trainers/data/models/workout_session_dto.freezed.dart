// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutSessionDto {

 String get id; String get clientId; String get startTime; String? get endTime; String? get status; String? get name; String? get notes; String? get restStartedAt; String? get workoutTemplateId; String? get clientPackageId; bool get isTrainerLed;
/// Create a copy of WorkoutSessionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionDtoCopyWith<WorkoutSessionDto> get copyWith => _$WorkoutSessionDtoCopyWithImpl<WorkoutSessionDto>(this as WorkoutSessionDto, _$identity);

  /// Serializes this WorkoutSessionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.restStartedAt, restStartedAt) || other.restStartedAt == restStartedAt)&&(identical(other.workoutTemplateId, workoutTemplateId) || other.workoutTemplateId == workoutTemplateId)&&(identical(other.clientPackageId, clientPackageId) || other.clientPackageId == clientPackageId)&&(identical(other.isTrainerLed, isTrainerLed) || other.isTrainerLed == isTrainerLed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,startTime,endTime,status,name,notes,restStartedAt,workoutTemplateId,clientPackageId,isTrainerLed);

@override
String toString() {
  return 'WorkoutSessionDto(id: $id, clientId: $clientId, startTime: $startTime, endTime: $endTime, status: $status, name: $name, notes: $notes, restStartedAt: $restStartedAt, workoutTemplateId: $workoutTemplateId, clientPackageId: $clientPackageId, isTrainerLed: $isTrainerLed)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionDtoCopyWith<$Res>  {
  factory $WorkoutSessionDtoCopyWith(WorkoutSessionDto value, $Res Function(WorkoutSessionDto) _then) = _$WorkoutSessionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String startTime, String? endTime, String? status, String? name, String? notes, String? restStartedAt, String? workoutTemplateId, String? clientPackageId, bool isTrainerLed
});




}
/// @nodoc
class _$WorkoutSessionDtoCopyWithImpl<$Res>
    implements $WorkoutSessionDtoCopyWith<$Res> {
  _$WorkoutSessionDtoCopyWithImpl(this._self, this._then);

  final WorkoutSessionDto _self;
  final $Res Function(WorkoutSessionDto) _then;

/// Create a copy of WorkoutSessionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? startTime = null,Object? endTime = freezed,Object? status = freezed,Object? name = freezed,Object? notes = freezed,Object? restStartedAt = freezed,Object? workoutTemplateId = freezed,Object? clientPackageId = freezed,Object? isTrainerLed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,restStartedAt: freezed == restStartedAt ? _self.restStartedAt : restStartedAt // ignore: cast_nullable_to_non_nullable
as String?,workoutTemplateId: freezed == workoutTemplateId ? _self.workoutTemplateId : workoutTemplateId // ignore: cast_nullable_to_non_nullable
as String?,clientPackageId: freezed == clientPackageId ? _self.clientPackageId : clientPackageId // ignore: cast_nullable_to_non_nullable
as String?,isTrainerLed: null == isTrainerLed ? _self.isTrainerLed : isTrainerLed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkoutSessionDto].
extension WorkoutSessionDtoPatterns on WorkoutSessionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkoutSessionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkoutSessionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkoutSessionDto value)  $default,){
final _that = this;
switch (_that) {
case _WorkoutSessionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkoutSessionDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorkoutSessionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String startTime,  String? endTime,  String? status,  String? name,  String? notes,  String? restStartedAt,  String? workoutTemplateId,  String? clientPackageId,  bool isTrainerLed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkoutSessionDto() when $default != null:
return $default(_that.id,_that.clientId,_that.startTime,_that.endTime,_that.status,_that.name,_that.notes,_that.restStartedAt,_that.workoutTemplateId,_that.clientPackageId,_that.isTrainerLed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String startTime,  String? endTime,  String? status,  String? name,  String? notes,  String? restStartedAt,  String? workoutTemplateId,  String? clientPackageId,  bool isTrainerLed)  $default,) {final _that = this;
switch (_that) {
case _WorkoutSessionDto():
return $default(_that.id,_that.clientId,_that.startTime,_that.endTime,_that.status,_that.name,_that.notes,_that.restStartedAt,_that.workoutTemplateId,_that.clientPackageId,_that.isTrainerLed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String startTime,  String? endTime,  String? status,  String? name,  String? notes,  String? restStartedAt,  String? workoutTemplateId,  String? clientPackageId,  bool isTrainerLed)?  $default,) {final _that = this;
switch (_that) {
case _WorkoutSessionDto() when $default != null:
return $default(_that.id,_that.clientId,_that.startTime,_that.endTime,_that.status,_that.name,_that.notes,_that.restStartedAt,_that.workoutTemplateId,_that.clientPackageId,_that.isTrainerLed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkoutSessionDto implements WorkoutSessionDto {
  const _WorkoutSessionDto({required this.id, required this.clientId, required this.startTime, this.endTime, this.status, this.name, this.notes, this.restStartedAt, this.workoutTemplateId, this.clientPackageId, this.isTrainerLed = false});
  factory _WorkoutSessionDto.fromJson(Map<String, dynamic> json) => _$WorkoutSessionDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String startTime;
@override final  String? endTime;
@override final  String? status;
@override final  String? name;
@override final  String? notes;
@override final  String? restStartedAt;
@override final  String? workoutTemplateId;
@override final  String? clientPackageId;
@override@JsonKey() final  bool isTrainerLed;

/// Create a copy of WorkoutSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutSessionDtoCopyWith<_WorkoutSessionDto> get copyWith => __$WorkoutSessionDtoCopyWithImpl<_WorkoutSessionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutSessionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.restStartedAt, restStartedAt) || other.restStartedAt == restStartedAt)&&(identical(other.workoutTemplateId, workoutTemplateId) || other.workoutTemplateId == workoutTemplateId)&&(identical(other.clientPackageId, clientPackageId) || other.clientPackageId == clientPackageId)&&(identical(other.isTrainerLed, isTrainerLed) || other.isTrainerLed == isTrainerLed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,startTime,endTime,status,name,notes,restStartedAt,workoutTemplateId,clientPackageId,isTrainerLed);

@override
String toString() {
  return 'WorkoutSessionDto(id: $id, clientId: $clientId, startTime: $startTime, endTime: $endTime, status: $status, name: $name, notes: $notes, restStartedAt: $restStartedAt, workoutTemplateId: $workoutTemplateId, clientPackageId: $clientPackageId, isTrainerLed: $isTrainerLed)';
}


}

/// @nodoc
abstract mixin class _$WorkoutSessionDtoCopyWith<$Res> implements $WorkoutSessionDtoCopyWith<$Res> {
  factory _$WorkoutSessionDtoCopyWith(_WorkoutSessionDto value, $Res Function(_WorkoutSessionDto) _then) = __$WorkoutSessionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String startTime, String? endTime, String? status, String? name, String? notes, String? restStartedAt, String? workoutTemplateId, String? clientPackageId, bool isTrainerLed
});




}
/// @nodoc
class __$WorkoutSessionDtoCopyWithImpl<$Res>
    implements _$WorkoutSessionDtoCopyWith<$Res> {
  __$WorkoutSessionDtoCopyWithImpl(this._self, this._then);

  final _WorkoutSessionDto _self;
  final $Res Function(_WorkoutSessionDto) _then;

/// Create a copy of WorkoutSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? startTime = null,Object? endTime = freezed,Object? status = freezed,Object? name = freezed,Object? notes = freezed,Object? restStartedAt = freezed,Object? workoutTemplateId = freezed,Object? clientPackageId = freezed,Object? isTrainerLed = null,}) {
  return _then(_WorkoutSessionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,restStartedAt: freezed == restStartedAt ? _self.restStartedAt : restStartedAt // ignore: cast_nullable_to_non_nullable
as String?,workoutTemplateId: freezed == workoutTemplateId ? _self.workoutTemplateId : workoutTemplateId // ignore: cast_nullable_to_non_nullable
as String?,clientPackageId: freezed == clientPackageId ? _self.clientPackageId : clientPackageId // ignore: cast_nullable_to_non_nullable
as String?,isTrainerLed: null == isTrainerLed ? _self.isTrainerLed : isTrainerLed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
