// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_habit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerHabitDto {

 String get id; String get clientId; String get trainerId; String get title; String? get description; String get frequency; bool get isActive; List<TrainerHabitLogDto> get logs; String get createdAt; String get updatedAt; String? get deletedAt;
/// Create a copy of TrainerHabitDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerHabitDtoCopyWith<TrainerHabitDto> get copyWith => _$TrainerHabitDtoCopyWithImpl<TrainerHabitDto>(this as TrainerHabitDto, _$identity);

  /// Serializes this TrainerHabitDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerHabitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.logs, logs)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,trainerId,title,description,frequency,isActive,const DeepCollectionEquality().hash(logs),createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'TrainerHabitDto(id: $id, clientId: $clientId, trainerId: $trainerId, title: $title, description: $description, frequency: $frequency, isActive: $isActive, logs: $logs, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $TrainerHabitDtoCopyWith<$Res>  {
  factory $TrainerHabitDtoCopyWith(TrainerHabitDto value, $Res Function(TrainerHabitDto) _then) = _$TrainerHabitDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String trainerId, String title, String? description, String frequency, bool isActive, List<TrainerHabitLogDto> logs, String createdAt, String updatedAt, String? deletedAt
});




}
/// @nodoc
class _$TrainerHabitDtoCopyWithImpl<$Res>
    implements $TrainerHabitDtoCopyWith<$Res> {
  _$TrainerHabitDtoCopyWithImpl(this._self, this._then);

  final TrainerHabitDto _self;
  final $Res Function(TrainerHabitDto) _then;

/// Create a copy of TrainerHabitDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? trainerId = null,Object? title = null,Object? description = freezed,Object? frequency = null,Object? isActive = null,Object? logs = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,trainerId: null == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,logs: null == logs ? _self.logs : logs // ignore: cast_nullable_to_non_nullable
as List<TrainerHabitLogDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerHabitDto].
extension TrainerHabitDtoPatterns on TrainerHabitDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerHabitDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerHabitDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerHabitDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerHabitDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerHabitDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerHabitDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String trainerId,  String title,  String? description,  String frequency,  bool isActive,  List<TrainerHabitLogDto> logs,  String createdAt,  String updatedAt,  String? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerHabitDto() when $default != null:
return $default(_that.id,_that.clientId,_that.trainerId,_that.title,_that.description,_that.frequency,_that.isActive,_that.logs,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String trainerId,  String title,  String? description,  String frequency,  bool isActive,  List<TrainerHabitLogDto> logs,  String createdAt,  String updatedAt,  String? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerHabitDto():
return $default(_that.id,_that.clientId,_that.trainerId,_that.title,_that.description,_that.frequency,_that.isActive,_that.logs,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String trainerId,  String title,  String? description,  String frequency,  bool isActive,  List<TrainerHabitLogDto> logs,  String createdAt,  String updatedAt,  String? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerHabitDto() when $default != null:
return $default(_that.id,_that.clientId,_that.trainerId,_that.title,_that.description,_that.frequency,_that.isActive,_that.logs,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerHabitDto implements TrainerHabitDto {
  const _TrainerHabitDto({required this.id, required this.clientId, required this.trainerId, required this.title, this.description, required this.frequency, required this.isActive, final  List<TrainerHabitLogDto> logs = const <TrainerHabitLogDto>[], required this.createdAt, required this.updatedAt, this.deletedAt}): _logs = logs;
  factory _TrainerHabitDto.fromJson(Map<String, dynamic> json) => _$TrainerHabitDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String trainerId;
@override final  String title;
@override final  String? description;
@override final  String frequency;
@override final  bool isActive;
 final  List<TrainerHabitLogDto> _logs;
@override@JsonKey() List<TrainerHabitLogDto> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

@override final  String createdAt;
@override final  String updatedAt;
@override final  String? deletedAt;

/// Create a copy of TrainerHabitDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerHabitDtoCopyWith<_TrainerHabitDto> get copyWith => __$TrainerHabitDtoCopyWithImpl<_TrainerHabitDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerHabitDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerHabitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._logs, _logs)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,trainerId,title,description,frequency,isActive,const DeepCollectionEquality().hash(_logs),createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'TrainerHabitDto(id: $id, clientId: $clientId, trainerId: $trainerId, title: $title, description: $description, frequency: $frequency, isActive: $isActive, logs: $logs, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerHabitDtoCopyWith<$Res> implements $TrainerHabitDtoCopyWith<$Res> {
  factory _$TrainerHabitDtoCopyWith(_TrainerHabitDto value, $Res Function(_TrainerHabitDto) _then) = __$TrainerHabitDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String trainerId, String title, String? description, String frequency, bool isActive, List<TrainerHabitLogDto> logs, String createdAt, String updatedAt, String? deletedAt
});




}
/// @nodoc
class __$TrainerHabitDtoCopyWithImpl<$Res>
    implements _$TrainerHabitDtoCopyWith<$Res> {
  __$TrainerHabitDtoCopyWithImpl(this._self, this._then);

  final _TrainerHabitDto _self;
  final $Res Function(_TrainerHabitDto) _then;

/// Create a copy of TrainerHabitDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? trainerId = null,Object? title = null,Object? description = freezed,Object? frequency = null,Object? isActive = null,Object? logs = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_TrainerHabitDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,trainerId: null == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<TrainerHabitLogDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
