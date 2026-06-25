// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sharing_config_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SharingSettings {

 bool get workouts; bool get measurements; bool get photos; bool get checkins;
/// Create a copy of SharingSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharingSettingsCopyWith<SharingSettings> get copyWith => _$SharingSettingsCopyWithImpl<SharingSettings>(this as SharingSettings, _$identity);

  /// Serializes this SharingSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingSettings&&(identical(other.workouts, workouts) || other.workouts == workouts)&&(identical(other.measurements, measurements) || other.measurements == measurements)&&(identical(other.photos, photos) || other.photos == photos)&&(identical(other.checkins, checkins) || other.checkins == checkins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workouts,measurements,photos,checkins);

@override
String toString() {
  return 'SharingSettings(workouts: $workouts, measurements: $measurements, photos: $photos, checkins: $checkins)';
}


}

/// @nodoc
abstract mixin class $SharingSettingsCopyWith<$Res>  {
  factory $SharingSettingsCopyWith(SharingSettings value, $Res Function(SharingSettings) _then) = _$SharingSettingsCopyWithImpl;
@useResult
$Res call({
 bool workouts, bool measurements, bool photos, bool checkins
});




}
/// @nodoc
class _$SharingSettingsCopyWithImpl<$Res>
    implements $SharingSettingsCopyWith<$Res> {
  _$SharingSettingsCopyWithImpl(this._self, this._then);

  final SharingSettings _self;
  final $Res Function(SharingSettings) _then;

/// Create a copy of SharingSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? workouts = null,Object? measurements = null,Object? photos = null,Object? checkins = null,}) {
  return _then(_self.copyWith(
workouts: null == workouts ? _self.workouts : workouts // ignore: cast_nullable_to_non_nullable
as bool,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as bool,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as bool,checkins: null == checkins ? _self.checkins : checkins // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SharingSettings].
extension SharingSettingsPatterns on SharingSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharingSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharingSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharingSettings value)  $default,){
final _that = this;
switch (_that) {
case _SharingSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharingSettings value)?  $default,){
final _that = this;
switch (_that) {
case _SharingSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool workouts,  bool measurements,  bool photos,  bool checkins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharingSettings() when $default != null:
return $default(_that.workouts,_that.measurements,_that.photos,_that.checkins);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool workouts,  bool measurements,  bool photos,  bool checkins)  $default,) {final _that = this;
switch (_that) {
case _SharingSettings():
return $default(_that.workouts,_that.measurements,_that.photos,_that.checkins);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool workouts,  bool measurements,  bool photos,  bool checkins)?  $default,) {final _that = this;
switch (_that) {
case _SharingSettings() when $default != null:
return $default(_that.workouts,_that.measurements,_that.photos,_that.checkins);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SharingSettings implements SharingSettings {
  const _SharingSettings({this.workouts = true, this.measurements = true, this.photos = true, this.checkins = true});
  factory _SharingSettings.fromJson(Map<String, dynamic> json) => _$SharingSettingsFromJson(json);

@override@JsonKey() final  bool workouts;
@override@JsonKey() final  bool measurements;
@override@JsonKey() final  bool photos;
@override@JsonKey() final  bool checkins;

/// Create a copy of SharingSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharingSettingsCopyWith<_SharingSettings> get copyWith => __$SharingSettingsCopyWithImpl<_SharingSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SharingSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharingSettings&&(identical(other.workouts, workouts) || other.workouts == workouts)&&(identical(other.measurements, measurements) || other.measurements == measurements)&&(identical(other.photos, photos) || other.photos == photos)&&(identical(other.checkins, checkins) || other.checkins == checkins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,workouts,measurements,photos,checkins);

@override
String toString() {
  return 'SharingSettings(workouts: $workouts, measurements: $measurements, photos: $photos, checkins: $checkins)';
}


}

/// @nodoc
abstract mixin class _$SharingSettingsCopyWith<$Res> implements $SharingSettingsCopyWith<$Res> {
  factory _$SharingSettingsCopyWith(_SharingSettings value, $Res Function(_SharingSettings) _then) = __$SharingSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool workouts, bool measurements, bool photos, bool checkins
});




}
/// @nodoc
class __$SharingSettingsCopyWithImpl<$Res>
    implements _$SharingSettingsCopyWith<$Res> {
  __$SharingSettingsCopyWithImpl(this._self, this._then);

  final _SharingSettings _self;
  final $Res Function(_SharingSettings) _then;

/// Create a copy of SharingSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? workouts = null,Object? measurements = null,Object? photos = null,Object? checkins = null,}) {
  return _then(_SharingSettings(
workouts: null == workouts ? _self.workouts : workouts // ignore: cast_nullable_to_non_nullable
as bool,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as bool,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as bool,checkins: null == checkins ? _self.checkins : checkins // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$SharingConfigDto {

 DateTime? get expiresAt; String get duration; SharingSettings get settings;
/// Create a copy of SharingConfigDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharingConfigDtoCopyWith<SharingConfigDto> get copyWith => _$SharingConfigDtoCopyWithImpl<SharingConfigDto>(this as SharingConfigDto, _$identity);

  /// Serializes this SharingConfigDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingConfigDto&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expiresAt,duration,settings);

@override
String toString() {
  return 'SharingConfigDto(expiresAt: $expiresAt, duration: $duration, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $SharingConfigDtoCopyWith<$Res>  {
  factory $SharingConfigDtoCopyWith(SharingConfigDto value, $Res Function(SharingConfigDto) _then) = _$SharingConfigDtoCopyWithImpl;
@useResult
$Res call({
 DateTime? expiresAt, String duration, SharingSettings settings
});


$SharingSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$SharingConfigDtoCopyWithImpl<$Res>
    implements $SharingConfigDtoCopyWith<$Res> {
  _$SharingConfigDtoCopyWithImpl(this._self, this._then);

  final SharingConfigDto _self;
  final $Res Function(SharingConfigDto) _then;

/// Create a copy of SharingConfigDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expiresAt = freezed,Object? duration = null,Object? settings = null,}) {
  return _then(_self.copyWith(
expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as SharingSettings,
  ));
}
/// Create a copy of SharingConfigDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SharingSettingsCopyWith<$Res> get settings {
  
  return $SharingSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [SharingConfigDto].
extension SharingConfigDtoPatterns on SharingConfigDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SharingConfigDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SharingConfigDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SharingConfigDto value)  $default,){
final _that = this;
switch (_that) {
case _SharingConfigDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SharingConfigDto value)?  $default,){
final _that = this;
switch (_that) {
case _SharingConfigDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? expiresAt,  String duration,  SharingSettings settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SharingConfigDto() when $default != null:
return $default(_that.expiresAt,_that.duration,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? expiresAt,  String duration,  SharingSettings settings)  $default,) {final _that = this;
switch (_that) {
case _SharingConfigDto():
return $default(_that.expiresAt,_that.duration,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? expiresAt,  String duration,  SharingSettings settings)?  $default,) {final _that = this;
switch (_that) {
case _SharingConfigDto() when $default != null:
return $default(_that.expiresAt,_that.duration,_that.settings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SharingConfigDto extends SharingConfigDto {
  const _SharingConfigDto({this.expiresAt, this.duration = 'forever', this.settings = const SharingSettings()}): super._();
  factory _SharingConfigDto.fromJson(Map<String, dynamic> json) => _$SharingConfigDtoFromJson(json);

@override final  DateTime? expiresAt;
@override@JsonKey() final  String duration;
@override@JsonKey() final  SharingSettings settings;

/// Create a copy of SharingConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SharingConfigDtoCopyWith<_SharingConfigDto> get copyWith => __$SharingConfigDtoCopyWithImpl<_SharingConfigDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SharingConfigDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SharingConfigDto&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,expiresAt,duration,settings);

@override
String toString() {
  return 'SharingConfigDto(expiresAt: $expiresAt, duration: $duration, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$SharingConfigDtoCopyWith<$Res> implements $SharingConfigDtoCopyWith<$Res> {
  factory _$SharingConfigDtoCopyWith(_SharingConfigDto value, $Res Function(_SharingConfigDto) _then) = __$SharingConfigDtoCopyWithImpl;
@override @useResult
$Res call({
 DateTime? expiresAt, String duration, SharingSettings settings
});


@override $SharingSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$SharingConfigDtoCopyWithImpl<$Res>
    implements _$SharingConfigDtoCopyWith<$Res> {
  __$SharingConfigDtoCopyWithImpl(this._self, this._then);

  final _SharingConfigDto _self;
  final $Res Function(_SharingConfigDto) _then;

/// Create a copy of SharingConfigDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expiresAt = freezed,Object? duration = null,Object? settings = null,}) {
  return _then(_SharingConfigDto(
expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as SharingSettings,
  ));
}

/// Create a copy of SharingConfigDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SharingSettingsCopyWith<$Res> get settings {
  
  return $SharingSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
