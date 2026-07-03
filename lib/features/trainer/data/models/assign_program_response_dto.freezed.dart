// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assign_program_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssignProgramResponseDto {

 Map<String, dynamic>? get assignment; int get sessionCount;
/// Create a copy of AssignProgramResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignProgramResponseDtoCopyWith<AssignProgramResponseDto> get copyWith => _$AssignProgramResponseDtoCopyWithImpl<AssignProgramResponseDto>(this as AssignProgramResponseDto, _$identity);

  /// Serializes this AssignProgramResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignProgramResponseDto&&const DeepCollectionEquality().equals(other.assignment, assignment)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(assignment),sessionCount);

@override
String toString() {
  return 'AssignProgramResponseDto(assignment: $assignment, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $AssignProgramResponseDtoCopyWith<$Res>  {
  factory $AssignProgramResponseDtoCopyWith(AssignProgramResponseDto value, $Res Function(AssignProgramResponseDto) _then) = _$AssignProgramResponseDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? assignment, int sessionCount
});




}
/// @nodoc
class _$AssignProgramResponseDtoCopyWithImpl<$Res>
    implements $AssignProgramResponseDtoCopyWith<$Res> {
  _$AssignProgramResponseDtoCopyWithImpl(this._self, this._then);

  final AssignProgramResponseDto _self;
  final $Res Function(AssignProgramResponseDto) _then;

/// Create a copy of AssignProgramResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignment = freezed,Object? sessionCount = null,}) {
  return _then(_self.copyWith(
assignment: freezed == assignment ? _self.assignment : assignment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignProgramResponseDto].
extension AssignProgramResponseDtoPatterns on AssignProgramResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignProgramResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignProgramResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignProgramResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AssignProgramResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignProgramResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AssignProgramResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic>? assignment,  int sessionCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignProgramResponseDto() when $default != null:
return $default(_that.assignment,_that.sessionCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic>? assignment,  int sessionCount)  $default,) {final _that = this;
switch (_that) {
case _AssignProgramResponseDto():
return $default(_that.assignment,_that.sessionCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic>? assignment,  int sessionCount)?  $default,) {final _that = this;
switch (_that) {
case _AssignProgramResponseDto() when $default != null:
return $default(_that.assignment,_that.sessionCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignProgramResponseDto implements AssignProgramResponseDto {
  const _AssignProgramResponseDto({final  Map<String, dynamic>? assignment, required this.sessionCount}): _assignment = assignment;
  factory _AssignProgramResponseDto.fromJson(Map<String, dynamic> json) => _$AssignProgramResponseDtoFromJson(json);

 final  Map<String, dynamic>? _assignment;
@override Map<String, dynamic>? get assignment {
  final value = _assignment;
  if (value == null) return null;
  if (_assignment is EqualUnmodifiableMapView) return _assignment;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  int sessionCount;

/// Create a copy of AssignProgramResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignProgramResponseDtoCopyWith<_AssignProgramResponseDto> get copyWith => __$AssignProgramResponseDtoCopyWithImpl<_AssignProgramResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignProgramResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignProgramResponseDto&&const DeepCollectionEquality().equals(other._assignment, _assignment)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_assignment),sessionCount);

@override
String toString() {
  return 'AssignProgramResponseDto(assignment: $assignment, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class _$AssignProgramResponseDtoCopyWith<$Res> implements $AssignProgramResponseDtoCopyWith<$Res> {
  factory _$AssignProgramResponseDtoCopyWith(_AssignProgramResponseDto value, $Res Function(_AssignProgramResponseDto) _then) = __$AssignProgramResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic>? assignment, int sessionCount
});




}
/// @nodoc
class __$AssignProgramResponseDtoCopyWithImpl<$Res>
    implements _$AssignProgramResponseDtoCopyWith<$Res> {
  __$AssignProgramResponseDtoCopyWithImpl(this._self, this._then);

  final _AssignProgramResponseDto _self;
  final $Res Function(_AssignProgramResponseDto) _then;

/// Create a copy of AssignProgramResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignment = freezed,Object? sessionCount = null,}) {
  return _then(_AssignProgramResponseDto(
assignment: freezed == assignment ? _self._assignment : assignment // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
