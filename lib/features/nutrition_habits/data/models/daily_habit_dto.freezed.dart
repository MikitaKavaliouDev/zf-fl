// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_habit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyHabitDto {

 String get id; String get clientId; String get trainerId; String get title; String? get description; String get frequency; bool get isActive; List<HabitLogDto> get logs; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt;
/// Create a copy of DailyHabitDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyHabitDtoCopyWith<DailyHabitDto> get copyWith => _$DailyHabitDtoCopyWithImpl<DailyHabitDto>(this as DailyHabitDto, _$identity);

  /// Serializes this DailyHabitDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyHabitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.logs, logs)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,trainerId,title,description,frequency,isActive,const DeepCollectionEquality().hash(logs),createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'DailyHabitDto(id: $id, clientId: $clientId, trainerId: $trainerId, title: $title, description: $description, frequency: $frequency, isActive: $isActive, logs: $logs, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $DailyHabitDtoCopyWith<$Res>  {
  factory $DailyHabitDtoCopyWith(DailyHabitDto value, $Res Function(DailyHabitDto) _then) = _$DailyHabitDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String trainerId, String title, String? description, String frequency, bool isActive, List<HabitLogDto> logs, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class _$DailyHabitDtoCopyWithImpl<$Res>
    implements $DailyHabitDtoCopyWith<$Res> {
  _$DailyHabitDtoCopyWithImpl(this._self, this._then);

  final DailyHabitDto _self;
  final $Res Function(DailyHabitDto) _then;

/// Create a copy of DailyHabitDto
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
as List<HabitLogDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyHabitDto].
extension DailyHabitDtoPatterns on DailyHabitDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyHabitDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyHabitDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyHabitDto value)  $default,){
final _that = this;
switch (_that) {
case _DailyHabitDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyHabitDto value)?  $default,){
final _that = this;
switch (_that) {
case _DailyHabitDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String trainerId,  String title,  String? description,  String frequency,  bool isActive,  List<HabitLogDto> logs,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyHabitDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String trainerId,  String title,  String? description,  String frequency,  bool isActive,  List<HabitLogDto> logs,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _DailyHabitDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String trainerId,  String title,  String? description,  String frequency,  bool isActive,  List<HabitLogDto> logs,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _DailyHabitDto() when $default != null:
return $default(_that.id,_that.clientId,_that.trainerId,_that.title,_that.description,_that.frequency,_that.isActive,_that.logs,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyHabitDto extends DailyHabitDto {
  const _DailyHabitDto({required this.id, required this.clientId, required this.trainerId, required this.title, this.description, required this.frequency, this.isActive = true, final  List<HabitLogDto> logs = const <HabitLogDto>[], required this.createdAt, required this.updatedAt, this.deletedAt}): _logs = logs,super._();
  factory _DailyHabitDto.fromJson(Map<String, dynamic> json) => _$DailyHabitDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String trainerId;
@override final  String title;
@override final  String? description;
@override final  String frequency;
@override@JsonKey() final  bool isActive;
 final  List<HabitLogDto> _logs;
@override@JsonKey() List<HabitLogDto> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;

/// Create a copy of DailyHabitDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyHabitDtoCopyWith<_DailyHabitDto> get copyWith => __$DailyHabitDtoCopyWithImpl<_DailyHabitDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyHabitDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyHabitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._logs, _logs)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,trainerId,title,description,frequency,isActive,const DeepCollectionEquality().hash(_logs),createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'DailyHabitDto(id: $id, clientId: $clientId, trainerId: $trainerId, title: $title, description: $description, frequency: $frequency, isActive: $isActive, logs: $logs, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$DailyHabitDtoCopyWith<$Res> implements $DailyHabitDtoCopyWith<$Res> {
  factory _$DailyHabitDtoCopyWith(_DailyHabitDto value, $Res Function(_DailyHabitDto) _then) = __$DailyHabitDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String trainerId, String title, String? description, String frequency, bool isActive, List<HabitLogDto> logs, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class __$DailyHabitDtoCopyWithImpl<$Res>
    implements _$DailyHabitDtoCopyWith<$Res> {
  __$DailyHabitDtoCopyWithImpl(this._self, this._then);

  final _DailyHabitDto _self;
  final $Res Function(_DailyHabitDto) _then;

/// Create a copy of DailyHabitDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? trainerId = null,Object? title = null,Object? description = freezed,Object? frequency = null,Object? isActive = null,Object? logs = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_DailyHabitDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,trainerId: null == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<HabitLogDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
