// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assigned_program_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AssignedProgramDto {

 String get assignmentId; String? get startDate; bool get isActive; ProgramDto get program; String get source;
/// Create a copy of AssignedProgramDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignedProgramDtoCopyWith<AssignedProgramDto> get copyWith => _$AssignedProgramDtoCopyWithImpl<AssignedProgramDto>(this as AssignedProgramDto, _$identity);

  /// Serializes this AssignedProgramDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignedProgramDto&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.program, program) || other.program == program)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignmentId,startDate,isActive,program,source);

@override
String toString() {
  return 'AssignedProgramDto(assignmentId: $assignmentId, startDate: $startDate, isActive: $isActive, program: $program, source: $source)';
}


}

/// @nodoc
abstract mixin class $AssignedProgramDtoCopyWith<$Res>  {
  factory $AssignedProgramDtoCopyWith(AssignedProgramDto value, $Res Function(AssignedProgramDto) _then) = _$AssignedProgramDtoCopyWithImpl;
@useResult
$Res call({
 String assignmentId, String? startDate, bool isActive, ProgramDto program, String source
});


$ProgramDtoCopyWith<$Res> get program;

}
/// @nodoc
class _$AssignedProgramDtoCopyWithImpl<$Res>
    implements $AssignedProgramDtoCopyWith<$Res> {
  _$AssignedProgramDtoCopyWithImpl(this._self, this._then);

  final AssignedProgramDto _self;
  final $Res Function(AssignedProgramDto) _then;

/// Create a copy of AssignedProgramDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? assignmentId = null,Object? startDate = freezed,Object? isActive = null,Object? program = null,Object? source = null,}) {
  return _then(_self.copyWith(
assignmentId: null == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramDto,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of AssignedProgramDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramDtoCopyWith<$Res> get program {
  
  return $ProgramDtoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// Adds pattern-matching-related methods to [AssignedProgramDto].
extension AssignedProgramDtoPatterns on AssignedProgramDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignedProgramDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignedProgramDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignedProgramDto value)  $default,){
final _that = this;
switch (_that) {
case _AssignedProgramDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignedProgramDto value)?  $default,){
final _that = this;
switch (_that) {
case _AssignedProgramDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String assignmentId,  String? startDate,  bool isActive,  ProgramDto program,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignedProgramDto() when $default != null:
return $default(_that.assignmentId,_that.startDate,_that.isActive,_that.program,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String assignmentId,  String? startDate,  bool isActive,  ProgramDto program,  String source)  $default,) {final _that = this;
switch (_that) {
case _AssignedProgramDto():
return $default(_that.assignmentId,_that.startDate,_that.isActive,_that.program,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String assignmentId,  String? startDate,  bool isActive,  ProgramDto program,  String source)?  $default,) {final _that = this;
switch (_that) {
case _AssignedProgramDto() when $default != null:
return $default(_that.assignmentId,_that.startDate,_that.isActive,_that.program,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignedProgramDto implements AssignedProgramDto {
  const _AssignedProgramDto({required this.assignmentId, this.startDate, this.isActive = false, required this.program, this.source = 'assigned'});
  factory _AssignedProgramDto.fromJson(Map<String, dynamic> json) => _$AssignedProgramDtoFromJson(json);

@override final  String assignmentId;
@override final  String? startDate;
@override@JsonKey() final  bool isActive;
@override final  ProgramDto program;
@override@JsonKey() final  String source;

/// Create a copy of AssignedProgramDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignedProgramDtoCopyWith<_AssignedProgramDto> get copyWith => __$AssignedProgramDtoCopyWithImpl<_AssignedProgramDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignedProgramDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignedProgramDto&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.program, program) || other.program == program)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,assignmentId,startDate,isActive,program,source);

@override
String toString() {
  return 'AssignedProgramDto(assignmentId: $assignmentId, startDate: $startDate, isActive: $isActive, program: $program, source: $source)';
}


}

/// @nodoc
abstract mixin class _$AssignedProgramDtoCopyWith<$Res> implements $AssignedProgramDtoCopyWith<$Res> {
  factory _$AssignedProgramDtoCopyWith(_AssignedProgramDto value, $Res Function(_AssignedProgramDto) _then) = __$AssignedProgramDtoCopyWithImpl;
@override @useResult
$Res call({
 String assignmentId, String? startDate, bool isActive, ProgramDto program, String source
});


@override $ProgramDtoCopyWith<$Res> get program;

}
/// @nodoc
class __$AssignedProgramDtoCopyWithImpl<$Res>
    implements _$AssignedProgramDtoCopyWith<$Res> {
  __$AssignedProgramDtoCopyWithImpl(this._self, this._then);

  final _AssignedProgramDto _self;
  final $Res Function(_AssignedProgramDto) _then;

/// Create a copy of AssignedProgramDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? assignmentId = null,Object? startDate = freezed,Object? isActive = null,Object? program = null,Object? source = null,}) {
  return _then(_AssignedProgramDto(
assignmentId: null == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramDto,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of AssignedProgramDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramDtoCopyWith<$Res> get program {
  
  return $ProgramDtoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}

// dart format on
