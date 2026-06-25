// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacySettingsDto {

 bool get shareWorkoutHistory; bool get shareBodyMeasurements; bool get shareCheckinNotes; bool get shareLocation; bool get allowTrainerExport; int? get dataRetentionDays;
/// Create a copy of PrivacySettingsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrivacySettingsDtoCopyWith<PrivacySettingsDto> get copyWith => _$PrivacySettingsDtoCopyWithImpl<PrivacySettingsDto>(this as PrivacySettingsDto, _$identity);

  /// Serializes this PrivacySettingsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrivacySettingsDto&&(identical(other.shareWorkoutHistory, shareWorkoutHistory) || other.shareWorkoutHistory == shareWorkoutHistory)&&(identical(other.shareBodyMeasurements, shareBodyMeasurements) || other.shareBodyMeasurements == shareBodyMeasurements)&&(identical(other.shareCheckinNotes, shareCheckinNotes) || other.shareCheckinNotes == shareCheckinNotes)&&(identical(other.shareLocation, shareLocation) || other.shareLocation == shareLocation)&&(identical(other.allowTrainerExport, allowTrainerExport) || other.allowTrainerExport == allowTrainerExport)&&(identical(other.dataRetentionDays, dataRetentionDays) || other.dataRetentionDays == dataRetentionDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shareWorkoutHistory,shareBodyMeasurements,shareCheckinNotes,shareLocation,allowTrainerExport,dataRetentionDays);

@override
String toString() {
  return 'PrivacySettingsDto(shareWorkoutHistory: $shareWorkoutHistory, shareBodyMeasurements: $shareBodyMeasurements, shareCheckinNotes: $shareCheckinNotes, shareLocation: $shareLocation, allowTrainerExport: $allowTrainerExport, dataRetentionDays: $dataRetentionDays)';
}


}

/// @nodoc
abstract mixin class $PrivacySettingsDtoCopyWith<$Res>  {
  factory $PrivacySettingsDtoCopyWith(PrivacySettingsDto value, $Res Function(PrivacySettingsDto) _then) = _$PrivacySettingsDtoCopyWithImpl;
@useResult
$Res call({
 bool shareWorkoutHistory, bool shareBodyMeasurements, bool shareCheckinNotes, bool shareLocation, bool allowTrainerExport, int? dataRetentionDays
});




}
/// @nodoc
class _$PrivacySettingsDtoCopyWithImpl<$Res>
    implements $PrivacySettingsDtoCopyWith<$Res> {
  _$PrivacySettingsDtoCopyWithImpl(this._self, this._then);

  final PrivacySettingsDto _self;
  final $Res Function(PrivacySettingsDto) _then;

/// Create a copy of PrivacySettingsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shareWorkoutHistory = null,Object? shareBodyMeasurements = null,Object? shareCheckinNotes = null,Object? shareLocation = null,Object? allowTrainerExport = null,Object? dataRetentionDays = freezed,}) {
  return _then(_self.copyWith(
shareWorkoutHistory: null == shareWorkoutHistory ? _self.shareWorkoutHistory : shareWorkoutHistory // ignore: cast_nullable_to_non_nullable
as bool,shareBodyMeasurements: null == shareBodyMeasurements ? _self.shareBodyMeasurements : shareBodyMeasurements // ignore: cast_nullable_to_non_nullable
as bool,shareCheckinNotes: null == shareCheckinNotes ? _self.shareCheckinNotes : shareCheckinNotes // ignore: cast_nullable_to_non_nullable
as bool,shareLocation: null == shareLocation ? _self.shareLocation : shareLocation // ignore: cast_nullable_to_non_nullable
as bool,allowTrainerExport: null == allowTrainerExport ? _self.allowTrainerExport : allowTrainerExport // ignore: cast_nullable_to_non_nullable
as bool,dataRetentionDays: freezed == dataRetentionDays ? _self.dataRetentionDays : dataRetentionDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrivacySettingsDto].
extension PrivacySettingsDtoPatterns on PrivacySettingsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrivacySettingsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrivacySettingsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrivacySettingsDto value)  $default,){
final _that = this;
switch (_that) {
case _PrivacySettingsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrivacySettingsDto value)?  $default,){
final _that = this;
switch (_that) {
case _PrivacySettingsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool shareWorkoutHistory,  bool shareBodyMeasurements,  bool shareCheckinNotes,  bool shareLocation,  bool allowTrainerExport,  int? dataRetentionDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrivacySettingsDto() when $default != null:
return $default(_that.shareWorkoutHistory,_that.shareBodyMeasurements,_that.shareCheckinNotes,_that.shareLocation,_that.allowTrainerExport,_that.dataRetentionDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool shareWorkoutHistory,  bool shareBodyMeasurements,  bool shareCheckinNotes,  bool shareLocation,  bool allowTrainerExport,  int? dataRetentionDays)  $default,) {final _that = this;
switch (_that) {
case _PrivacySettingsDto():
return $default(_that.shareWorkoutHistory,_that.shareBodyMeasurements,_that.shareCheckinNotes,_that.shareLocation,_that.allowTrainerExport,_that.dataRetentionDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool shareWorkoutHistory,  bool shareBodyMeasurements,  bool shareCheckinNotes,  bool shareLocation,  bool allowTrainerExport,  int? dataRetentionDays)?  $default,) {final _that = this;
switch (_that) {
case _PrivacySettingsDto() when $default != null:
return $default(_that.shareWorkoutHistory,_that.shareBodyMeasurements,_that.shareCheckinNotes,_that.shareLocation,_that.allowTrainerExport,_that.dataRetentionDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrivacySettingsDto implements PrivacySettingsDto {
  const _PrivacySettingsDto({this.shareWorkoutHistory = false, this.shareBodyMeasurements = false, this.shareCheckinNotes = false, this.shareLocation = false, this.allowTrainerExport = false, this.dataRetentionDays});
  factory _PrivacySettingsDto.fromJson(Map<String, dynamic> json) => _$PrivacySettingsDtoFromJson(json);

@override@JsonKey() final  bool shareWorkoutHistory;
@override@JsonKey() final  bool shareBodyMeasurements;
@override@JsonKey() final  bool shareCheckinNotes;
@override@JsonKey() final  bool shareLocation;
@override@JsonKey() final  bool allowTrainerExport;
@override final  int? dataRetentionDays;

/// Create a copy of PrivacySettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrivacySettingsDtoCopyWith<_PrivacySettingsDto> get copyWith => __$PrivacySettingsDtoCopyWithImpl<_PrivacySettingsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrivacySettingsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrivacySettingsDto&&(identical(other.shareWorkoutHistory, shareWorkoutHistory) || other.shareWorkoutHistory == shareWorkoutHistory)&&(identical(other.shareBodyMeasurements, shareBodyMeasurements) || other.shareBodyMeasurements == shareBodyMeasurements)&&(identical(other.shareCheckinNotes, shareCheckinNotes) || other.shareCheckinNotes == shareCheckinNotes)&&(identical(other.shareLocation, shareLocation) || other.shareLocation == shareLocation)&&(identical(other.allowTrainerExport, allowTrainerExport) || other.allowTrainerExport == allowTrainerExport)&&(identical(other.dataRetentionDays, dataRetentionDays) || other.dataRetentionDays == dataRetentionDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shareWorkoutHistory,shareBodyMeasurements,shareCheckinNotes,shareLocation,allowTrainerExport,dataRetentionDays);

@override
String toString() {
  return 'PrivacySettingsDto(shareWorkoutHistory: $shareWorkoutHistory, shareBodyMeasurements: $shareBodyMeasurements, shareCheckinNotes: $shareCheckinNotes, shareLocation: $shareLocation, allowTrainerExport: $allowTrainerExport, dataRetentionDays: $dataRetentionDays)';
}


}

/// @nodoc
abstract mixin class _$PrivacySettingsDtoCopyWith<$Res> implements $PrivacySettingsDtoCopyWith<$Res> {
  factory _$PrivacySettingsDtoCopyWith(_PrivacySettingsDto value, $Res Function(_PrivacySettingsDto) _then) = __$PrivacySettingsDtoCopyWithImpl;
@override @useResult
$Res call({
 bool shareWorkoutHistory, bool shareBodyMeasurements, bool shareCheckinNotes, bool shareLocation, bool allowTrainerExport, int? dataRetentionDays
});




}
/// @nodoc
class __$PrivacySettingsDtoCopyWithImpl<$Res>
    implements _$PrivacySettingsDtoCopyWith<$Res> {
  __$PrivacySettingsDtoCopyWithImpl(this._self, this._then);

  final _PrivacySettingsDto _self;
  final $Res Function(_PrivacySettingsDto) _then;

/// Create a copy of PrivacySettingsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shareWorkoutHistory = null,Object? shareBodyMeasurements = null,Object? shareCheckinNotes = null,Object? shareLocation = null,Object? allowTrainerExport = null,Object? dataRetentionDays = freezed,}) {
  return _then(_PrivacySettingsDto(
shareWorkoutHistory: null == shareWorkoutHistory ? _self.shareWorkoutHistory : shareWorkoutHistory // ignore: cast_nullable_to_non_nullable
as bool,shareBodyMeasurements: null == shareBodyMeasurements ? _self.shareBodyMeasurements : shareBodyMeasurements // ignore: cast_nullable_to_non_nullable
as bool,shareCheckinNotes: null == shareCheckinNotes ? _self.shareCheckinNotes : shareCheckinNotes // ignore: cast_nullable_to_non_nullable
as bool,shareLocation: null == shareLocation ? _self.shareLocation : shareLocation // ignore: cast_nullable_to_non_nullable
as bool,allowTrainerExport: null == allowTrainerExport ? _self.allowTrainerExport : allowTrainerExport // ignore: cast_nullable_to_non_nullable
as bool,dataRetentionDays: freezed == dataRetentionDays ? _self.dataRetentionDays : dataRetentionDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
