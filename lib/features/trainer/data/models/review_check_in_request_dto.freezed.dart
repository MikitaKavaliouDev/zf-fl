// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_check_in_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewCheckInRequestDto {

 String get trainerResponse;
/// Create a copy of ReviewCheckInRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewCheckInRequestDtoCopyWith<ReviewCheckInRequestDto> get copyWith => _$ReviewCheckInRequestDtoCopyWithImpl<ReviewCheckInRequestDto>(this as ReviewCheckInRequestDto, _$identity);

  /// Serializes this ReviewCheckInRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewCheckInRequestDto&&(identical(other.trainerResponse, trainerResponse) || other.trainerResponse == trainerResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainerResponse);

@override
String toString() {
  return 'ReviewCheckInRequestDto(trainerResponse: $trainerResponse)';
}


}

/// @nodoc
abstract mixin class $ReviewCheckInRequestDtoCopyWith<$Res>  {
  factory $ReviewCheckInRequestDtoCopyWith(ReviewCheckInRequestDto value, $Res Function(ReviewCheckInRequestDto) _then) = _$ReviewCheckInRequestDtoCopyWithImpl;
@useResult
$Res call({
 String trainerResponse
});




}
/// @nodoc
class _$ReviewCheckInRequestDtoCopyWithImpl<$Res>
    implements $ReviewCheckInRequestDtoCopyWith<$Res> {
  _$ReviewCheckInRequestDtoCopyWithImpl(this._self, this._then);

  final ReviewCheckInRequestDto _self;
  final $Res Function(ReviewCheckInRequestDto) _then;

/// Create a copy of ReviewCheckInRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainerResponse = null,}) {
  return _then(_self.copyWith(
trainerResponse: null == trainerResponse ? _self.trainerResponse : trainerResponse // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewCheckInRequestDto].
extension ReviewCheckInRequestDtoPatterns on ReviewCheckInRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewCheckInRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewCheckInRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewCheckInRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _ReviewCheckInRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewCheckInRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewCheckInRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String trainerResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewCheckInRequestDto() when $default != null:
return $default(_that.trainerResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String trainerResponse)  $default,) {final _that = this;
switch (_that) {
case _ReviewCheckInRequestDto():
return $default(_that.trainerResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String trainerResponse)?  $default,) {final _that = this;
switch (_that) {
case _ReviewCheckInRequestDto() when $default != null:
return $default(_that.trainerResponse);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewCheckInRequestDto implements ReviewCheckInRequestDto {
  const _ReviewCheckInRequestDto({required this.trainerResponse});
  factory _ReviewCheckInRequestDto.fromJson(Map<String, dynamic> json) => _$ReviewCheckInRequestDtoFromJson(json);

@override final  String trainerResponse;

/// Create a copy of ReviewCheckInRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewCheckInRequestDtoCopyWith<_ReviewCheckInRequestDto> get copyWith => __$ReviewCheckInRequestDtoCopyWithImpl<_ReviewCheckInRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewCheckInRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewCheckInRequestDto&&(identical(other.trainerResponse, trainerResponse) || other.trainerResponse == trainerResponse));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,trainerResponse);

@override
String toString() {
  return 'ReviewCheckInRequestDto(trainerResponse: $trainerResponse)';
}


}

/// @nodoc
abstract mixin class _$ReviewCheckInRequestDtoCopyWith<$Res> implements $ReviewCheckInRequestDtoCopyWith<$Res> {
  factory _$ReviewCheckInRequestDtoCopyWith(_ReviewCheckInRequestDto value, $Res Function(_ReviewCheckInRequestDto) _then) = __$ReviewCheckInRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String trainerResponse
});




}
/// @nodoc
class __$ReviewCheckInRequestDtoCopyWithImpl<$Res>
    implements _$ReviewCheckInRequestDtoCopyWith<$Res> {
  __$ReviewCheckInRequestDtoCopyWithImpl(this._self, this._then);

  final _ReviewCheckInRequestDto _self;
  final $Res Function(_ReviewCheckInRequestDto) _then;

/// Create a copy of ReviewCheckInRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainerResponse = null,}) {
  return _then(_ReviewCheckInRequestDto(
trainerResponse: null == trainerResponse ? _self.trainerResponse : trainerResponse // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
