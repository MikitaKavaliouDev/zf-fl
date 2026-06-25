// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInConfigDto {

 int get checkInDay; int get checkInHour; String get nextCheckInDueAt;
/// Create a copy of CheckInConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInConfigDtoCopyWith<CheckInConfigDto> get copyWith => _$CheckInConfigDtoCopyWithImpl<CheckInConfigDto>(this as CheckInConfigDto, _$identity);

  /// Serializes this CheckInConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInConfigDto&&(identical(other.checkInDay, checkInDay) || other.checkInDay == checkInDay)&&(identical(other.checkInHour, checkInHour) || other.checkInHour == checkInHour)&&(identical(other.nextCheckInDueAt, nextCheckInDueAt) || other.nextCheckInDueAt == nextCheckInDueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkInDay,checkInHour,nextCheckInDueAt);

@override
String toString() {
  return 'CheckInConfigDto(checkInDay: $checkInDay, checkInHour: $checkInHour, nextCheckInDueAt: $nextCheckInDueAt)';
}


}

/// @nodoc
abstract mixin class $CheckInConfigDtoCopyWith<$Res>  {
  factory $CheckInConfigDtoCopyWith(CheckInConfigDto value, $Res Function(CheckInConfigDto) _then) = _$CheckInConfigDtoCopyWithImpl;
@useResult
$Res call({
 int checkInDay, int checkInHour, String nextCheckInDueAt
});




}
/// @nodoc
class _$CheckInConfigDtoCopyWithImpl<$Res>
    implements $CheckInConfigDtoCopyWith<$Res> {
  _$CheckInConfigDtoCopyWithImpl(this._self, this._then);

  final CheckInConfigDto _self;
  final $Res Function(CheckInConfigDto) _then;

/// Create a copy of CheckInConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkInDay = null,Object? checkInHour = null,Object? nextCheckInDueAt = null,}) {
  return _then(_self.copyWith(
checkInDay: null == checkInDay ? _self.checkInDay : checkInDay // ignore: cast_nullable_to_non_nullable
as int,checkInHour: null == checkInHour ? _self.checkInHour : checkInHour // ignore: cast_nullable_to_non_nullable
as int,nextCheckInDueAt: null == nextCheckInDueAt ? _self.nextCheckInDueAt : nextCheckInDueAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInConfigDto].
extension CheckInConfigDtoPatterns on CheckInConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int checkInDay,  int checkInHour,  String nextCheckInDueAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInConfigDto() when $default != null:
return $default(_that.checkInDay,_that.checkInHour,_that.nextCheckInDueAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int checkInDay,  int checkInHour,  String nextCheckInDueAt)  $default,) {final _that = this;
switch (_that) {
case _CheckInConfigDto():
return $default(_that.checkInDay,_that.checkInHour,_that.nextCheckInDueAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int checkInDay,  int checkInHour,  String nextCheckInDueAt)?  $default,) {final _that = this;
switch (_that) {
case _CheckInConfigDto() when $default != null:
return $default(_that.checkInDay,_that.checkInHour,_that.nextCheckInDueAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInConfigDto implements CheckInConfigDto {
  const _CheckInConfigDto({required this.checkInDay, required this.checkInHour, required this.nextCheckInDueAt});
  factory _CheckInConfigDto.fromJson(Map<String, dynamic> json) => _$CheckInConfigDtoFromJson(json);

@override final  int checkInDay;
@override final  int checkInHour;
@override final  String nextCheckInDueAt;

/// Create a copy of CheckInConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInConfigDtoCopyWith<_CheckInConfigDto> get copyWith => __$CheckInConfigDtoCopyWithImpl<_CheckInConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInConfigDto&&(identical(other.checkInDay, checkInDay) || other.checkInDay == checkInDay)&&(identical(other.checkInHour, checkInHour) || other.checkInHour == checkInHour)&&(identical(other.nextCheckInDueAt, nextCheckInDueAt) || other.nextCheckInDueAt == nextCheckInDueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkInDay,checkInHour,nextCheckInDueAt);

@override
String toString() {
  return 'CheckInConfigDto(checkInDay: $checkInDay, checkInHour: $checkInHour, nextCheckInDueAt: $nextCheckInDueAt)';
}


}

/// @nodoc
abstract mixin class _$CheckInConfigDtoCopyWith<$Res> implements $CheckInConfigDtoCopyWith<$Res> {
  factory _$CheckInConfigDtoCopyWith(_CheckInConfigDto value, $Res Function(_CheckInConfigDto) _then) = __$CheckInConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 int checkInDay, int checkInHour, String nextCheckInDueAt
});




}
/// @nodoc
class __$CheckInConfigDtoCopyWithImpl<$Res>
    implements _$CheckInConfigDtoCopyWith<$Res> {
  __$CheckInConfigDtoCopyWithImpl(this._self, this._then);

  final _CheckInConfigDto _self;
  final $Res Function(_CheckInConfigDto) _then;

/// Create a copy of CheckInConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkInDay = null,Object? checkInHour = null,Object? nextCheckInDueAt = null,}) {
  return _then(_CheckInConfigDto(
checkInDay: null == checkInDay ? _self.checkInDay : checkInDay // ignore: cast_nullable_to_non_nullable
as int,checkInHour: null == checkInHour ? _self.checkInHour : checkInHour // ignore: cast_nullable_to_non_nullable
as int,nextCheckInDueAt: null == nextCheckInDueAt ? _self.nextCheckInDueAt : nextCheckInDueAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
