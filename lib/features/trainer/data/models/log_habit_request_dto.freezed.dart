// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_habit_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogHabitRequestDto {

 String get date; bool get isCompleted; String? get note;
/// Create a copy of LogHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogHabitRequestDtoCopyWith<LogHabitRequestDto> get copyWith => _$LogHabitRequestDtoCopyWithImpl<LogHabitRequestDto>(this as LogHabitRequestDto, _$identity);

  /// Serializes this LogHabitRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogHabitRequestDto&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,isCompleted,note);

@override
String toString() {
  return 'LogHabitRequestDto(date: $date, isCompleted: $isCompleted, note: $note)';
}


}

/// @nodoc
abstract mixin class $LogHabitRequestDtoCopyWith<$Res>  {
  factory $LogHabitRequestDtoCopyWith(LogHabitRequestDto value, $Res Function(LogHabitRequestDto) _then) = _$LogHabitRequestDtoCopyWithImpl;
@useResult
$Res call({
 String date, bool isCompleted, String? note
});




}
/// @nodoc
class _$LogHabitRequestDtoCopyWithImpl<$Res>
    implements $LogHabitRequestDtoCopyWith<$Res> {
  _$LogHabitRequestDtoCopyWithImpl(this._self, this._then);

  final LogHabitRequestDto _self;
  final $Res Function(LogHabitRequestDto) _then;

/// Create a copy of LogHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? isCompleted = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LogHabitRequestDto].
extension LogHabitRequestDtoPatterns on LogHabitRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogHabitRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogHabitRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogHabitRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _LogHabitRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogHabitRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _LogHabitRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  bool isCompleted,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogHabitRequestDto() when $default != null:
return $default(_that.date,_that.isCompleted,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  bool isCompleted,  String? note)  $default,) {final _that = this;
switch (_that) {
case _LogHabitRequestDto():
return $default(_that.date,_that.isCompleted,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  bool isCompleted,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _LogHabitRequestDto() when $default != null:
return $default(_that.date,_that.isCompleted,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogHabitRequestDto implements LogHabitRequestDto {
  const _LogHabitRequestDto({required this.date, required this.isCompleted, this.note});
  factory _LogHabitRequestDto.fromJson(Map<String, dynamic> json) => _$LogHabitRequestDtoFromJson(json);

@override final  String date;
@override final  bool isCompleted;
@override final  String? note;

/// Create a copy of LogHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogHabitRequestDtoCopyWith<_LogHabitRequestDto> get copyWith => __$LogHabitRequestDtoCopyWithImpl<_LogHabitRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogHabitRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogHabitRequestDto&&(identical(other.date, date) || other.date == date)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,isCompleted,note);

@override
String toString() {
  return 'LogHabitRequestDto(date: $date, isCompleted: $isCompleted, note: $note)';
}


}

/// @nodoc
abstract mixin class _$LogHabitRequestDtoCopyWith<$Res> implements $LogHabitRequestDtoCopyWith<$Res> {
  factory _$LogHabitRequestDtoCopyWith(_LogHabitRequestDto value, $Res Function(_LogHabitRequestDto) _then) = __$LogHabitRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String date, bool isCompleted, String? note
});




}
/// @nodoc
class __$LogHabitRequestDtoCopyWithImpl<$Res>
    implements _$LogHabitRequestDtoCopyWith<$Res> {
  __$LogHabitRequestDtoCopyWithImpl(this._self, this._then);

  final _LogHabitRequestDto _self;
  final $Res Function(_LogHabitRequestDto) _then;

/// Create a copy of LogHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? isCompleted = null,Object? note = freezed,}) {
  return _then(_LogHabitRequestDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
