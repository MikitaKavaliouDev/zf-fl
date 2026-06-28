// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramDetailResponse {

 ProgramDto get program; bool get isActive;
/// Create a copy of ProgramDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramDetailResponseCopyWith<ProgramDetailResponse> get copyWith => _$ProgramDetailResponseCopyWithImpl<ProgramDetailResponse>(this as ProgramDetailResponse, _$identity);

  /// Serializes this ProgramDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramDetailResponse&&(identical(other.program, program) || other.program == program)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,program,isActive);

@override
String toString() {
  return 'ProgramDetailResponse(program: $program, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $ProgramDetailResponseCopyWith<$Res>  {
  factory $ProgramDetailResponseCopyWith(ProgramDetailResponse value, $Res Function(ProgramDetailResponse) _then) = _$ProgramDetailResponseCopyWithImpl;
@useResult
$Res call({
 ProgramDto program, bool isActive
});


$ProgramDtoCopyWith<$Res> get program;

}
/// @nodoc
class _$ProgramDetailResponseCopyWithImpl<$Res>
    implements $ProgramDetailResponseCopyWith<$Res> {
  _$ProgramDetailResponseCopyWithImpl(this._self, this._then);

  final ProgramDetailResponse _self;
  final $Res Function(ProgramDetailResponse) _then;

/// Create a copy of ProgramDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? program = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramDto,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProgramDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramDtoCopyWith<$Res> get program {
  
  return $ProgramDtoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgramDetailResponse].
extension ProgramDetailResponsePatterns on ProgramDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProgramDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProgramDto program,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramDetailResponse() when $default != null:
return $default(_that.program,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProgramDto program,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _ProgramDetailResponse():
return $default(_that.program,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProgramDto program,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _ProgramDetailResponse() when $default != null:
return $default(_that.program,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramDetailResponse implements ProgramDetailResponse {
  const _ProgramDetailResponse({required this.program, this.isActive = false});
  factory _ProgramDetailResponse.fromJson(Map<String, dynamic> json) => _$ProgramDetailResponseFromJson(json);

@override final  ProgramDto program;
@override@JsonKey() final  bool isActive;

/// Create a copy of ProgramDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramDetailResponseCopyWith<_ProgramDetailResponse> get copyWith => __$ProgramDetailResponseCopyWithImpl<_ProgramDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramDetailResponse&&(identical(other.program, program) || other.program == program)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,program,isActive);

@override
String toString() {
  return 'ProgramDetailResponse(program: $program, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$ProgramDetailResponseCopyWith<$Res> implements $ProgramDetailResponseCopyWith<$Res> {
  factory _$ProgramDetailResponseCopyWith(_ProgramDetailResponse value, $Res Function(_ProgramDetailResponse) _then) = __$ProgramDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 ProgramDto program, bool isActive
});


@override $ProgramDtoCopyWith<$Res> get program;

}
/// @nodoc
class __$ProgramDetailResponseCopyWithImpl<$Res>
    implements _$ProgramDetailResponseCopyWith<$Res> {
  __$ProgramDetailResponseCopyWithImpl(this._self, this._then);

  final _ProgramDetailResponse _self;
  final $Res Function(_ProgramDetailResponse) _then;

/// Create a copy of ProgramDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? program = null,Object? isActive = null,}) {
  return _then(_ProgramDetailResponse(
program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as ProgramDto,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProgramDetailResponse
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
