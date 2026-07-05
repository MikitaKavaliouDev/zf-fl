// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerClientSessionDto {

 String get id; String get clientId; String get name; String get startTime; String? get endTime; String get status; String? get notes; bool? get isTrainerLed; String? get createdAt; String? get updatedAt;@JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false) List<TrainerClientExerciseLogEntry> get exerciseLogs;
/// Create a copy of TrainerClientSessionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientSessionDtoCopyWith<TrainerClientSessionDto> get copyWith => _$TrainerClientSessionDtoCopyWithImpl<TrainerClientSessionDto>(this as TrainerClientSessionDto, _$identity);

  /// Serializes this TrainerClientSessionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isTrainerLed, isTrainerLed) || other.isTrainerLed == isTrainerLed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.exerciseLogs, exerciseLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,name,startTime,endTime,status,notes,isTrainerLed,createdAt,updatedAt,const DeepCollectionEquality().hash(exerciseLogs));

@override
String toString() {
  return 'TrainerClientSessionDto(id: $id, clientId: $clientId, name: $name, startTime: $startTime, endTime: $endTime, status: $status, notes: $notes, isTrainerLed: $isTrainerLed, createdAt: $createdAt, updatedAt: $updatedAt, exerciseLogs: $exerciseLogs)';
}


}

/// @nodoc
abstract mixin class $TrainerClientSessionDtoCopyWith<$Res>  {
  factory $TrainerClientSessionDtoCopyWith(TrainerClientSessionDto value, $Res Function(TrainerClientSessionDto) _then) = _$TrainerClientSessionDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String name, String startTime, String? endTime, String status, String? notes, bool? isTrainerLed, String? createdAt, String? updatedAt,@JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false) List<TrainerClientExerciseLogEntry> exerciseLogs
});




}
/// @nodoc
class _$TrainerClientSessionDtoCopyWithImpl<$Res>
    implements $TrainerClientSessionDtoCopyWith<$Res> {
  _$TrainerClientSessionDtoCopyWithImpl(this._self, this._then);

  final TrainerClientSessionDto _self;
  final $Res Function(TrainerClientSessionDto) _then;

/// Create a copy of TrainerClientSessionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? name = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? notes = freezed,Object? isTrainerLed = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? exerciseLogs = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isTrainerLed: freezed == isTrainerLed ? _self.isTrainerLed : isTrainerLed // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,exerciseLogs: null == exerciseLogs ? _self.exerciseLogs : exerciseLogs // ignore: cast_nullable_to_non_nullable
as List<TrainerClientExerciseLogEntry>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerClientSessionDto].
extension TrainerClientSessionDtoPatterns on TrainerClientSessionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerClientSessionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerClientSessionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerClientSessionDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerClientSessionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerClientSessionDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerClientSessionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String name,  String startTime,  String? endTime,  String status,  String? notes,  bool? isTrainerLed,  String? createdAt,  String? updatedAt, @JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false)  List<TrainerClientExerciseLogEntry> exerciseLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerClientSessionDto() when $default != null:
return $default(_that.id,_that.clientId,_that.name,_that.startTime,_that.endTime,_that.status,_that.notes,_that.isTrainerLed,_that.createdAt,_that.updatedAt,_that.exerciseLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String name,  String startTime,  String? endTime,  String status,  String? notes,  bool? isTrainerLed,  String? createdAt,  String? updatedAt, @JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false)  List<TrainerClientExerciseLogEntry> exerciseLogs)  $default,) {final _that = this;
switch (_that) {
case _TrainerClientSessionDto():
return $default(_that.id,_that.clientId,_that.name,_that.startTime,_that.endTime,_that.status,_that.notes,_that.isTrainerLed,_that.createdAt,_that.updatedAt,_that.exerciseLogs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String name,  String startTime,  String? endTime,  String status,  String? notes,  bool? isTrainerLed,  String? createdAt,  String? updatedAt, @JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false)  List<TrainerClientExerciseLogEntry> exerciseLogs)?  $default,) {final _that = this;
switch (_that) {
case _TrainerClientSessionDto() when $default != null:
return $default(_that.id,_that.clientId,_that.name,_that.startTime,_that.endTime,_that.status,_that.notes,_that.isTrainerLed,_that.createdAt,_that.updatedAt,_that.exerciseLogs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerClientSessionDto implements TrainerClientSessionDto {
  const _TrainerClientSessionDto({required this.id, required this.clientId, this.name = '', required this.startTime, this.endTime, required this.status, this.notes, this.isTrainerLed, this.createdAt, this.updatedAt, @JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false) final  List<TrainerClientExerciseLogEntry> exerciseLogs = const []}): _exerciseLogs = exerciseLogs;
  factory _TrainerClientSessionDto.fromJson(Map<String, dynamic> json) => _$TrainerClientSessionDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override@JsonKey() final  String name;
@override final  String startTime;
@override final  String? endTime;
@override final  String status;
@override final  String? notes;
@override final  bool? isTrainerLed;
@override final  String? createdAt;
@override final  String? updatedAt;
 final  List<TrainerClientExerciseLogEntry> _exerciseLogs;
@override@JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false) List<TrainerClientExerciseLogEntry> get exerciseLogs {
  if (_exerciseLogs is EqualUnmodifiableListView) return _exerciseLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exerciseLogs);
}


/// Create a copy of TrainerClientSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerClientSessionDtoCopyWith<_TrainerClientSessionDto> get copyWith => __$TrainerClientSessionDtoCopyWithImpl<_TrainerClientSessionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerClientSessionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerClientSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isTrainerLed, isTrainerLed) || other.isTrainerLed == isTrainerLed)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._exerciseLogs, _exerciseLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,name,startTime,endTime,status,notes,isTrainerLed,createdAt,updatedAt,const DeepCollectionEquality().hash(_exerciseLogs));

@override
String toString() {
  return 'TrainerClientSessionDto(id: $id, clientId: $clientId, name: $name, startTime: $startTime, endTime: $endTime, status: $status, notes: $notes, isTrainerLed: $isTrainerLed, createdAt: $createdAt, updatedAt: $updatedAt, exerciseLogs: $exerciseLogs)';
}


}

/// @nodoc
abstract mixin class _$TrainerClientSessionDtoCopyWith<$Res> implements $TrainerClientSessionDtoCopyWith<$Res> {
  factory _$TrainerClientSessionDtoCopyWith(_TrainerClientSessionDto value, $Res Function(_TrainerClientSessionDto) _then) = __$TrainerClientSessionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String name, String startTime, String? endTime, String status, String? notes, bool? isTrainerLed, String? createdAt, String? updatedAt,@JsonKey(name: 'exerciseLogs', defaultValue: [], fromJson: _exerciseLogsFromJson, includeToJson: false) List<TrainerClientExerciseLogEntry> exerciseLogs
});




}
/// @nodoc
class __$TrainerClientSessionDtoCopyWithImpl<$Res>
    implements _$TrainerClientSessionDtoCopyWith<$Res> {
  __$TrainerClientSessionDtoCopyWithImpl(this._self, this._then);

  final _TrainerClientSessionDto _self;
  final $Res Function(_TrainerClientSessionDto) _then;

/// Create a copy of TrainerClientSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? name = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? notes = freezed,Object? isTrainerLed = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? exerciseLogs = null,}) {
  return _then(_TrainerClientSessionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isTrainerLed: freezed == isTrainerLed ? _self.isTrainerLed : isTrainerLed // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,exerciseLogs: null == exerciseLogs ? _self._exerciseLogs : exerciseLogs // ignore: cast_nullable_to_non_nullable
as List<TrainerClientExerciseLogEntry>,
  ));
}


}

// dart format on
