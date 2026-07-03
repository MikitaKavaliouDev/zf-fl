// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assign_program_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssignProgramRequestDto {

 String get programId; String? get startDate; String get frequency;
/// Create a copy of AssignProgramRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignProgramRequestDtoCopyWith<AssignProgramRequestDto> get copyWith => _$AssignProgramRequestDtoCopyWithImpl<AssignProgramRequestDto>(this as AssignProgramRequestDto, _$identity);

  /// Serializes this AssignProgramRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignProgramRequestDto&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,programId,startDate,frequency);

@override
String toString() {
  return 'AssignProgramRequestDto(programId: $programId, startDate: $startDate, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class $AssignProgramRequestDtoCopyWith<$Res>  {
  factory $AssignProgramRequestDtoCopyWith(AssignProgramRequestDto value, $Res Function(AssignProgramRequestDto) _then) = _$AssignProgramRequestDtoCopyWithImpl;
@useResult
$Res call({
 String programId, String? startDate, String frequency
});




}
/// @nodoc
class _$AssignProgramRequestDtoCopyWithImpl<$Res>
    implements $AssignProgramRequestDtoCopyWith<$Res> {
  _$AssignProgramRequestDtoCopyWithImpl(this._self, this._then);

  final AssignProgramRequestDto _self;
  final $Res Function(AssignProgramRequestDto) _then;

/// Create a copy of AssignProgramRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? programId = null,Object? startDate = freezed,Object? frequency = null,}) {
  return _then(_self.copyWith(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignProgramRequestDto].
extension AssignProgramRequestDtoPatterns on AssignProgramRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignProgramRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignProgramRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignProgramRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _AssignProgramRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignProgramRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _AssignProgramRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String programId,  String? startDate,  String frequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignProgramRequestDto() when $default != null:
return $default(_that.programId,_that.startDate,_that.frequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String programId,  String? startDate,  String frequency)  $default,) {final _that = this;
switch (_that) {
case _AssignProgramRequestDto():
return $default(_that.programId,_that.startDate,_that.frequency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String programId,  String? startDate,  String frequency)?  $default,) {final _that = this;
switch (_that) {
case _AssignProgramRequestDto() when $default != null:
return $default(_that.programId,_that.startDate,_that.frequency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignProgramRequestDto implements AssignProgramRequestDto {
  const _AssignProgramRequestDto({required this.programId, this.startDate, this.frequency = '3 sessions / week'});
  factory _AssignProgramRequestDto.fromJson(Map<String, dynamic> json) => _$AssignProgramRequestDtoFromJson(json);

@override final  String programId;
@override final  String? startDate;
@override@JsonKey() final  String frequency;

/// Create a copy of AssignProgramRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignProgramRequestDtoCopyWith<_AssignProgramRequestDto> get copyWith => __$AssignProgramRequestDtoCopyWithImpl<_AssignProgramRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignProgramRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignProgramRequestDto&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,programId,startDate,frequency);

@override
String toString() {
  return 'AssignProgramRequestDto(programId: $programId, startDate: $startDate, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class _$AssignProgramRequestDtoCopyWith<$Res> implements $AssignProgramRequestDtoCopyWith<$Res> {
  factory _$AssignProgramRequestDtoCopyWith(_AssignProgramRequestDto value, $Res Function(_AssignProgramRequestDto) _then) = __$AssignProgramRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String programId, String? startDate, String frequency
});




}
/// @nodoc
class __$AssignProgramRequestDtoCopyWithImpl<$Res>
    implements _$AssignProgramRequestDtoCopyWith<$Res> {
  __$AssignProgramRequestDtoCopyWithImpl(this._self, this._then);

  final _AssignProgramRequestDto _self;
  final $Res Function(_AssignProgramRequestDto) _then;

/// Create a copy of AssignProgramRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? programId = null,Object? startDate = freezed,Object? frequency = null,}) {
  return _then(_AssignProgramRequestDto(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
