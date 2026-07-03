// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_habit_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerHabitLogDto {

 String get id; String get habitId; String get clientId; String get date; bool get isCompleted; String? get note;
/// Create a copy of TrainerHabitLogDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerHabitLogDtoCopyWith<TrainerHabitLogDto> get copyWith => _$TrainerHabitLogDtoCopyWithImpl<TrainerHabitLogDto>(this as TrainerHabitLogDto, _$identity);

  /// Serializes this TrainerHabitLogDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerHabitLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,clientId,date,isCompleted,note);

@override
String toString() {
  return 'TrainerHabitLogDto(id: $id, habitId: $habitId, clientId: $clientId, date: $date, isCompleted: $isCompleted, note: $note)';
}


}

/// @nodoc
abstract mixin class $TrainerHabitLogDtoCopyWith<$Res>  {
  factory $TrainerHabitLogDtoCopyWith(TrainerHabitLogDto value, $Res Function(TrainerHabitLogDto) _then) = _$TrainerHabitLogDtoCopyWithImpl;
@useResult
$Res call({
 String id, String habitId, String clientId, String date, bool isCompleted, String? note
});




}
/// @nodoc
class _$TrainerHabitLogDtoCopyWithImpl<$Res>
    implements $TrainerHabitLogDtoCopyWith<$Res> {
  _$TrainerHabitLogDtoCopyWithImpl(this._self, this._then);

  final TrainerHabitLogDto _self;
  final $Res Function(TrainerHabitLogDto) _then;

/// Create a copy of TrainerHabitLogDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? clientId = null,Object? date = null,Object? isCompleted = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerHabitLogDto].
extension TrainerHabitLogDtoPatterns on TrainerHabitLogDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerHabitLogDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerHabitLogDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerHabitLogDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerHabitLogDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerHabitLogDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerHabitLogDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String habitId,  String clientId,  String date,  bool isCompleted,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerHabitLogDto() when $default != null:
return $default(_that.id,_that.habitId,_that.clientId,_that.date,_that.isCompleted,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String habitId,  String clientId,  String date,  bool isCompleted,  String? note)  $default,) {final _that = this;
switch (_that) {
case _TrainerHabitLogDto():
return $default(_that.id,_that.habitId,_that.clientId,_that.date,_that.isCompleted,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String habitId,  String clientId,  String date,  bool isCompleted,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _TrainerHabitLogDto() when $default != null:
return $default(_that.id,_that.habitId,_that.clientId,_that.date,_that.isCompleted,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerHabitLogDto implements TrainerHabitLogDto {
  const _TrainerHabitLogDto({required this.id, required this.habitId, required this.clientId, required this.date, required this.isCompleted, this.note});
  factory _TrainerHabitLogDto.fromJson(Map<String, dynamic> json) => _$TrainerHabitLogDtoFromJson(json);

@override final  String id;
@override final  String habitId;
@override final  String clientId;
@override final  String date;
@override final  bool isCompleted;
@override final  String? note;

/// Create a copy of TrainerHabitLogDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerHabitLogDtoCopyWith<_TrainerHabitLogDto> get copyWith => __$TrainerHabitLogDtoCopyWithImpl<_TrainerHabitLogDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerHabitLogDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerHabitLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,clientId,date,isCompleted,note);

@override
String toString() {
  return 'TrainerHabitLogDto(id: $id, habitId: $habitId, clientId: $clientId, date: $date, isCompleted: $isCompleted, note: $note)';
}


}

/// @nodoc
abstract mixin class _$TrainerHabitLogDtoCopyWith<$Res> implements $TrainerHabitLogDtoCopyWith<$Res> {
  factory _$TrainerHabitLogDtoCopyWith(_TrainerHabitLogDto value, $Res Function(_TrainerHabitLogDto) _then) = __$TrainerHabitLogDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String habitId, String clientId, String date, bool isCompleted, String? note
});




}
/// @nodoc
class __$TrainerHabitLogDtoCopyWithImpl<$Res>
    implements _$TrainerHabitLogDtoCopyWith<$Res> {
  __$TrainerHabitLogDtoCopyWithImpl(this._self, this._then);

  final _TrainerHabitLogDto _self;
  final $Res Function(_TrainerHabitLogDto) _then;

/// Create a copy of TrainerHabitLogDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? clientId = null,Object? date = null,Object? isCompleted = null,Object? note = freezed,}) {
  return _then(_TrainerHabitLogDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
