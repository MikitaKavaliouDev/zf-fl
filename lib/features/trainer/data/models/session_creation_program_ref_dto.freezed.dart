// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_creation_program_ref_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionCreationProgramRefDto {

 String? get trainerId;
/// Create a copy of SessionCreationProgramRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCreationProgramRefDtoCopyWith<SessionCreationProgramRefDto> get copyWith => _$SessionCreationProgramRefDtoCopyWithImpl<SessionCreationProgramRefDto>(this as SessionCreationProgramRefDto, _$identity);

  /// Serializes this SessionCreationProgramRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCreationProgramRefDto&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainerId);

@override
String toString() {
  return 'SessionCreationProgramRefDto(trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class $SessionCreationProgramRefDtoCopyWith<$Res>  {
  factory $SessionCreationProgramRefDtoCopyWith(SessionCreationProgramRefDto value, $Res Function(SessionCreationProgramRefDto) _then) = _$SessionCreationProgramRefDtoCopyWithImpl;
@useResult
$Res call({
 String? trainerId
});




}
/// @nodoc
class _$SessionCreationProgramRefDtoCopyWithImpl<$Res>
    implements $SessionCreationProgramRefDtoCopyWith<$Res> {
  _$SessionCreationProgramRefDtoCopyWithImpl(this._self, this._then);

  final SessionCreationProgramRefDto _self;
  final $Res Function(SessionCreationProgramRefDto) _then;

/// Create a copy of SessionCreationProgramRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainerId = freezed,}) {
  return _then(_self.copyWith(
trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionCreationProgramRefDto].
extension SessionCreationProgramRefDtoPatterns on SessionCreationProgramRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionCreationProgramRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionCreationProgramRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionCreationProgramRefDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionCreationProgramRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionCreationProgramRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionCreationProgramRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? trainerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionCreationProgramRefDto() when $default != null:
return $default(_that.trainerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? trainerId)  $default,) {final _that = this;
switch (_that) {
case _SessionCreationProgramRefDto():
return $default(_that.trainerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? trainerId)?  $default,) {final _that = this;
switch (_that) {
case _SessionCreationProgramRefDto() when $default != null:
return $default(_that.trainerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionCreationProgramRefDto implements SessionCreationProgramRefDto {
  const _SessionCreationProgramRefDto({this.trainerId});
  factory _SessionCreationProgramRefDto.fromJson(Map<String, dynamic> json) => _$SessionCreationProgramRefDtoFromJson(json);

@override final  String? trainerId;

/// Create a copy of SessionCreationProgramRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCreationProgramRefDtoCopyWith<_SessionCreationProgramRefDto> get copyWith => __$SessionCreationProgramRefDtoCopyWithImpl<_SessionCreationProgramRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionCreationProgramRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionCreationProgramRefDto&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainerId);

@override
String toString() {
  return 'SessionCreationProgramRefDto(trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class _$SessionCreationProgramRefDtoCopyWith<$Res> implements $SessionCreationProgramRefDtoCopyWith<$Res> {
  factory _$SessionCreationProgramRefDtoCopyWith(_SessionCreationProgramRefDto value, $Res Function(_SessionCreationProgramRefDto) _then) = __$SessionCreationProgramRefDtoCopyWithImpl;
@override @useResult
$Res call({
 String? trainerId
});




}
/// @nodoc
class __$SessionCreationProgramRefDtoCopyWithImpl<$Res>
    implements _$SessionCreationProgramRefDtoCopyWith<$Res> {
  __$SessionCreationProgramRefDtoCopyWithImpl(this._self, this._then);

  final _SessionCreationProgramRefDto _self;
  final $Res Function(_SessionCreationProgramRefDto) _then;

/// Create a copy of SessionCreationProgramRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainerId = freezed,}) {
  return _then(_SessionCreationProgramRefDto(
trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
