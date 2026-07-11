// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HabitLogDto {

 String get id; String get habitId; String get clientId; String get date; bool get isCompleted; String? get note; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of HabitLogDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitLogDtoCopyWith<HabitLogDto> get copyWith => _$HabitLogDtoCopyWithImpl<HabitLogDto>(this as HabitLogDto, _$identity);

  /// Serializes this HabitLogDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,clientId,date,isCompleted,note,createdAt,updatedAt);

@override
String toString() {
  return 'HabitLogDto(id: $id, habitId: $habitId, clientId: $clientId, date: $date, isCompleted: $isCompleted, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $HabitLogDtoCopyWith<$Res>  {
  factory $HabitLogDtoCopyWith(HabitLogDto value, $Res Function(HabitLogDto) _then) = _$HabitLogDtoCopyWithImpl;
@useResult
$Res call({
 String id, String habitId, String clientId, String date, bool isCompleted, String? note, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$HabitLogDtoCopyWithImpl<$Res>
    implements $HabitLogDtoCopyWith<$Res> {
  _$HabitLogDtoCopyWithImpl(this._self, this._then);

  final HabitLogDto _self;
  final $Res Function(HabitLogDto) _then;

/// Create a copy of HabitLogDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? habitId = null,Object? clientId = null,Object? date = null,Object? isCompleted = null,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitLogDto].
extension HabitLogDtoPatterns on HabitLogDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitLogDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitLogDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitLogDto value)  $default,){
final _that = this;
switch (_that) {
case _HabitLogDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitLogDto value)?  $default,){
final _that = this;
switch (_that) {
case _HabitLogDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String habitId,  String clientId,  String date,  bool isCompleted,  String? note,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitLogDto() when $default != null:
return $default(_that.id,_that.habitId,_that.clientId,_that.date,_that.isCompleted,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String habitId,  String clientId,  String date,  bool isCompleted,  String? note,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _HabitLogDto():
return $default(_that.id,_that.habitId,_that.clientId,_that.date,_that.isCompleted,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String habitId,  String clientId,  String date,  bool isCompleted,  String? note,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _HabitLogDto() when $default != null:
return $default(_that.id,_that.habitId,_that.clientId,_that.date,_that.isCompleted,_that.note,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HabitLogDto extends HabitLogDto {
  const _HabitLogDto({required this.id, required this.habitId, required this.clientId, required this.date, required this.isCompleted, this.note, required this.createdAt, required this.updatedAt}): super._();
  factory _HabitLogDto.fromJson(Map<String, dynamic> json) => _$HabitLogDtoFromJson(json);

@override final  String id;
@override final  String habitId;
@override final  String clientId;
@override final  String date;
@override final  bool isCompleted;
@override final  String? note;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of HabitLogDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitLogDtoCopyWith<_HabitLogDto> get copyWith => __$HabitLogDtoCopyWithImpl<_HabitLogDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HabitLogDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitLogDto&&(identical(other.id, id) || other.id == id)&&(identical(other.habitId, habitId) || other.habitId == habitId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,habitId,clientId,date,isCompleted,note,createdAt,updatedAt);

@override
String toString() {
  return 'HabitLogDto(id: $id, habitId: $habitId, clientId: $clientId, date: $date, isCompleted: $isCompleted, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$HabitLogDtoCopyWith<$Res> implements $HabitLogDtoCopyWith<$Res> {
  factory _$HabitLogDtoCopyWith(_HabitLogDto value, $Res Function(_HabitLogDto) _then) = __$HabitLogDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String habitId, String clientId, String date, bool isCompleted, String? note, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$HabitLogDtoCopyWithImpl<$Res>
    implements _$HabitLogDtoCopyWith<$Res> {
  __$HabitLogDtoCopyWithImpl(this._self, this._then);

  final _HabitLogDto _self;
  final $Res Function(_HabitLogDto) _then;

/// Create a copy of HabitLogDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? habitId = null,Object? clientId = null,Object? date = null,Object? isCompleted = null,Object? note = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_HabitLogDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,habitId: null == habitId ? _self.habitId : habitId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
