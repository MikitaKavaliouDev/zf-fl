// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInResponseDto {

 String get id; String get status;
/// Create a copy of CheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInResponseDtoCopyWith<CheckInResponseDto> get copyWith => _$CheckInResponseDtoCopyWithImpl<CheckInResponseDto>(this as CheckInResponseDto, _$identity);

  /// Serializes this CheckInResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'CheckInResponseDto(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class $CheckInResponseDtoCopyWith<$Res>  {
  factory $CheckInResponseDtoCopyWith(CheckInResponseDto value, $Res Function(CheckInResponseDto) _then) = _$CheckInResponseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String status
});




}
/// @nodoc
class _$CheckInResponseDtoCopyWithImpl<$Res>
    implements $CheckInResponseDtoCopyWith<$Res> {
  _$CheckInResponseDtoCopyWithImpl(this._self, this._then);

  final CheckInResponseDto _self;
  final $Res Function(CheckInResponseDto) _then;

/// Create a copy of CheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInResponseDto].
extension CheckInResponseDtoPatterns on CheckInResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInResponseDto() when $default != null:
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String status)  $default,) {final _that = this;
switch (_that) {
case _CheckInResponseDto():
return $default(_that.id,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CheckInResponseDto() when $default != null:
return $default(_that.id,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInResponseDto implements CheckInResponseDto {
  const _CheckInResponseDto({required this.id, required this.status});
  factory _CheckInResponseDto.fromJson(Map<String, dynamic> json) => _$CheckInResponseDtoFromJson(json);

@override final  String id;
@override final  String status;

/// Create a copy of CheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInResponseDtoCopyWith<_CheckInResponseDto> get copyWith => __$CheckInResponseDtoCopyWithImpl<_CheckInResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status);

@override
String toString() {
  return 'CheckInResponseDto(id: $id, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CheckInResponseDtoCopyWith<$Res> implements $CheckInResponseDtoCopyWith<$Res> {
  factory _$CheckInResponseDtoCopyWith(_CheckInResponseDto value, $Res Function(_CheckInResponseDto) _then) = __$CheckInResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String status
});




}
/// @nodoc
class __$CheckInResponseDtoCopyWithImpl<$Res>
    implements _$CheckInResponseDtoCopyWith<$Res> {
  __$CheckInResponseDtoCopyWithImpl(this._self, this._then);

  final _CheckInResponseDto _self;
  final $Res Function(_CheckInResponseDto) _then;

/// Create a copy of CheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,}) {
  return _then(_CheckInResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
