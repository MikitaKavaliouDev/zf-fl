// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerSettingsDto {

 int get defaultCheckInDay; int get defaultCheckInHour;
/// Create a copy of TrainerSettingsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerSettingsDtoCopyWith<TrainerSettingsDto> get copyWith => _$TrainerSettingsDtoCopyWithImpl<TrainerSettingsDto>(this as TrainerSettingsDto, _$identity);

  /// Serializes this TrainerSettingsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerSettingsDto&&(identical(other.defaultCheckInDay, defaultCheckInDay) || other.defaultCheckInDay == defaultCheckInDay)&&(identical(other.defaultCheckInHour, defaultCheckInHour) || other.defaultCheckInHour == defaultCheckInHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultCheckInDay,defaultCheckInHour);

@override
String toString() {
  return 'TrainerSettingsDto(defaultCheckInDay: $defaultCheckInDay, defaultCheckInHour: $defaultCheckInHour)';
}


}

/// @nodoc
abstract mixin class $TrainerSettingsDtoCopyWith<$Res>  {
  factory $TrainerSettingsDtoCopyWith(TrainerSettingsDto value, $Res Function(TrainerSettingsDto) _then) = _$TrainerSettingsDtoCopyWithImpl;
@useResult
$Res call({
 int defaultCheckInDay, int defaultCheckInHour
});




}
/// @nodoc
class _$TrainerSettingsDtoCopyWithImpl<$Res>
    implements $TrainerSettingsDtoCopyWith<$Res> {
  _$TrainerSettingsDtoCopyWithImpl(this._self, this._then);

  final TrainerSettingsDto _self;
  final $Res Function(TrainerSettingsDto) _then;

/// Create a copy of TrainerSettingsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? defaultCheckInDay = null,Object? defaultCheckInHour = null,}) {
  return _then(_self.copyWith(
defaultCheckInDay: null == defaultCheckInDay ? _self.defaultCheckInDay : defaultCheckInDay // ignore: cast_nullable_to_non_nullable
as int,defaultCheckInHour: null == defaultCheckInHour ? _self.defaultCheckInHour : defaultCheckInHour // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerSettingsDto].
extension TrainerSettingsDtoPatterns on TrainerSettingsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerSettingsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerSettingsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerSettingsDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerSettingsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerSettingsDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerSettingsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int defaultCheckInDay,  int defaultCheckInHour)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerSettingsDto() when $default != null:
return $default(_that.defaultCheckInDay,_that.defaultCheckInHour);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int defaultCheckInDay,  int defaultCheckInHour)  $default,) {final _that = this;
switch (_that) {
case _TrainerSettingsDto():
return $default(_that.defaultCheckInDay,_that.defaultCheckInHour);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int defaultCheckInDay,  int defaultCheckInHour)?  $default,) {final _that = this;
switch (_that) {
case _TrainerSettingsDto() when $default != null:
return $default(_that.defaultCheckInDay,_that.defaultCheckInHour);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerSettingsDto implements TrainerSettingsDto {
  const _TrainerSettingsDto({required this.defaultCheckInDay, required this.defaultCheckInHour});
  factory _TrainerSettingsDto.fromJson(Map<String, dynamic> json) => _$TrainerSettingsDtoFromJson(json);

@override final  int defaultCheckInDay;
@override final  int defaultCheckInHour;

/// Create a copy of TrainerSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerSettingsDtoCopyWith<_TrainerSettingsDto> get copyWith => __$TrainerSettingsDtoCopyWithImpl<_TrainerSettingsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerSettingsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerSettingsDto&&(identical(other.defaultCheckInDay, defaultCheckInDay) || other.defaultCheckInDay == defaultCheckInDay)&&(identical(other.defaultCheckInHour, defaultCheckInHour) || other.defaultCheckInHour == defaultCheckInHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,defaultCheckInDay,defaultCheckInHour);

@override
String toString() {
  return 'TrainerSettingsDto(defaultCheckInDay: $defaultCheckInDay, defaultCheckInHour: $defaultCheckInHour)';
}


}

/// @nodoc
abstract mixin class _$TrainerSettingsDtoCopyWith<$Res> implements $TrainerSettingsDtoCopyWith<$Res> {
  factory _$TrainerSettingsDtoCopyWith(_TrainerSettingsDto value, $Res Function(_TrainerSettingsDto) _then) = __$TrainerSettingsDtoCopyWithImpl;
@override @useResult
$Res call({
 int defaultCheckInDay, int defaultCheckInHour
});




}
/// @nodoc
class __$TrainerSettingsDtoCopyWithImpl<$Res>
    implements _$TrainerSettingsDtoCopyWith<$Res> {
  __$TrainerSettingsDtoCopyWithImpl(this._self, this._then);

  final _TrainerSettingsDto _self;
  final $Res Function(_TrainerSettingsDto) _then;

/// Create a copy of TrainerSettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? defaultCheckInDay = null,Object? defaultCheckInHour = null,}) {
  return _then(_TrainerSettingsDto(
defaultCheckInDay: null == defaultCheckInDay ? _self.defaultCheckInDay : defaultCheckInDay // ignore: cast_nullable_to_non_nullable
as int,defaultCheckInHour: null == defaultCheckInHour ? _self.defaultCheckInHour : defaultCheckInHour // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
