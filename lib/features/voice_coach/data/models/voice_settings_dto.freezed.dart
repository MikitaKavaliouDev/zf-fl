// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_settings_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoiceSettingsValues {

 double get stability; double get similarityBoost; double get style; bool get useSpeakerBoost; double get speed;
/// Create a copy of VoiceSettingsValues
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSettingsValuesCopyWith<VoiceSettingsValues> get copyWith => _$VoiceSettingsValuesCopyWithImpl<VoiceSettingsValues>(this as VoiceSettingsValues, _$identity);

  /// Serializes this VoiceSettingsValues to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSettingsValues&&(identical(other.stability, stability) || other.stability == stability)&&(identical(other.similarityBoost, similarityBoost) || other.similarityBoost == similarityBoost)&&(identical(other.style, style) || other.style == style)&&(identical(other.useSpeakerBoost, useSpeakerBoost) || other.useSpeakerBoost == useSpeakerBoost)&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stability,similarityBoost,style,useSpeakerBoost,speed);

@override
String toString() {
  return 'VoiceSettingsValues(stability: $stability, similarityBoost: $similarityBoost, style: $style, useSpeakerBoost: $useSpeakerBoost, speed: $speed)';
}


}

/// @nodoc
abstract mixin class $VoiceSettingsValuesCopyWith<$Res>  {
  factory $VoiceSettingsValuesCopyWith(VoiceSettingsValues value, $Res Function(VoiceSettingsValues) _then) = _$VoiceSettingsValuesCopyWithImpl;
@useResult
$Res call({
 double stability, double similarityBoost, double style, bool useSpeakerBoost, double speed
});




}
/// @nodoc
class _$VoiceSettingsValuesCopyWithImpl<$Res>
    implements $VoiceSettingsValuesCopyWith<$Res> {
  _$VoiceSettingsValuesCopyWithImpl(this._self, this._then);

  final VoiceSettingsValues _self;
  final $Res Function(VoiceSettingsValues) _then;

/// Create a copy of VoiceSettingsValues
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stability = null,Object? similarityBoost = null,Object? style = null,Object? useSpeakerBoost = null,Object? speed = null,}) {
  return _then(_self.copyWith(
stability: null == stability ? _self.stability : stability // ignore: cast_nullable_to_non_nullable
as double,similarityBoost: null == similarityBoost ? _self.similarityBoost : similarityBoost // ignore: cast_nullable_to_non_nullable
as double,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as double,useSpeakerBoost: null == useSpeakerBoost ? _self.useSpeakerBoost : useSpeakerBoost // ignore: cast_nullable_to_non_nullable
as bool,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceSettingsValues].
extension VoiceSettingsValuesPatterns on VoiceSettingsValues {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceSettingsValues value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceSettingsValues() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceSettingsValues value)  $default,){
final _that = this;
switch (_that) {
case _VoiceSettingsValues():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceSettingsValues value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceSettingsValues() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double stability,  double similarityBoost,  double style,  bool useSpeakerBoost,  double speed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceSettingsValues() when $default != null:
return $default(_that.stability,_that.similarityBoost,_that.style,_that.useSpeakerBoost,_that.speed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double stability,  double similarityBoost,  double style,  bool useSpeakerBoost,  double speed)  $default,) {final _that = this;
switch (_that) {
case _VoiceSettingsValues():
return $default(_that.stability,_that.similarityBoost,_that.style,_that.useSpeakerBoost,_that.speed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double stability,  double similarityBoost,  double style,  bool useSpeakerBoost,  double speed)?  $default,) {final _that = this;
switch (_that) {
case _VoiceSettingsValues() when $default != null:
return $default(_that.stability,_that.similarityBoost,_that.style,_that.useSpeakerBoost,_that.speed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceSettingsValues implements VoiceSettingsValues {
  const _VoiceSettingsValues({this.stability = 0.5, this.similarityBoost = 0.75, this.style = 0.0, this.useSpeakerBoost = true, this.speed = 1.0});
  factory _VoiceSettingsValues.fromJson(Map<String, dynamic> json) => _$VoiceSettingsValuesFromJson(json);

@override@JsonKey() final  double stability;
@override@JsonKey() final  double similarityBoost;
@override@JsonKey() final  double style;
@override@JsonKey() final  bool useSpeakerBoost;
@override@JsonKey() final  double speed;

/// Create a copy of VoiceSettingsValues
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceSettingsValuesCopyWith<_VoiceSettingsValues> get copyWith => __$VoiceSettingsValuesCopyWithImpl<_VoiceSettingsValues>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceSettingsValuesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceSettingsValues&&(identical(other.stability, stability) || other.stability == stability)&&(identical(other.similarityBoost, similarityBoost) || other.similarityBoost == similarityBoost)&&(identical(other.style, style) || other.style == style)&&(identical(other.useSpeakerBoost, useSpeakerBoost) || other.useSpeakerBoost == useSpeakerBoost)&&(identical(other.speed, speed) || other.speed == speed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stability,similarityBoost,style,useSpeakerBoost,speed);

@override
String toString() {
  return 'VoiceSettingsValues(stability: $stability, similarityBoost: $similarityBoost, style: $style, useSpeakerBoost: $useSpeakerBoost, speed: $speed)';
}


}

/// @nodoc
abstract mixin class _$VoiceSettingsValuesCopyWith<$Res> implements $VoiceSettingsValuesCopyWith<$Res> {
  factory _$VoiceSettingsValuesCopyWith(_VoiceSettingsValues value, $Res Function(_VoiceSettingsValues) _then) = __$VoiceSettingsValuesCopyWithImpl;
@override @useResult
$Res call({
 double stability, double similarityBoost, double style, bool useSpeakerBoost, double speed
});




}
/// @nodoc
class __$VoiceSettingsValuesCopyWithImpl<$Res>
    implements _$VoiceSettingsValuesCopyWith<$Res> {
  __$VoiceSettingsValuesCopyWithImpl(this._self, this._then);

  final _VoiceSettingsValues _self;
  final $Res Function(_VoiceSettingsValues) _then;

/// Create a copy of VoiceSettingsValues
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stability = null,Object? similarityBoost = null,Object? style = null,Object? useSpeakerBoost = null,Object? speed = null,}) {
  return _then(_VoiceSettingsValues(
stability: null == stability ? _self.stability : stability // ignore: cast_nullable_to_non_nullable
as double,similarityBoost: null == similarityBoost ? _self.similarityBoost : similarityBoost // ignore: cast_nullable_to_non_nullable
as double,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as double,useSpeakerBoost: null == useSpeakerBoost ? _self.useSpeakerBoost : useSpeakerBoost // ignore: cast_nullable_to_non_nullable
as bool,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VoiceSettingsResponseDto {

 String get voiceId; VoiceSettingsValues? get settings;
/// Create a copy of VoiceSettingsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceSettingsResponseDtoCopyWith<VoiceSettingsResponseDto> get copyWith => _$VoiceSettingsResponseDtoCopyWithImpl<VoiceSettingsResponseDto>(this as VoiceSettingsResponseDto, _$identity);

  /// Serializes this VoiceSettingsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceSettingsResponseDto&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voiceId,settings);

@override
String toString() {
  return 'VoiceSettingsResponseDto(voiceId: $voiceId, settings: $settings)';
}


}

/// @nodoc
abstract mixin class $VoiceSettingsResponseDtoCopyWith<$Res>  {
  factory $VoiceSettingsResponseDtoCopyWith(VoiceSettingsResponseDto value, $Res Function(VoiceSettingsResponseDto) _then) = _$VoiceSettingsResponseDtoCopyWithImpl;
@useResult
$Res call({
 String voiceId, VoiceSettingsValues? settings
});


$VoiceSettingsValuesCopyWith<$Res>? get settings;

}
/// @nodoc
class _$VoiceSettingsResponseDtoCopyWithImpl<$Res>
    implements $VoiceSettingsResponseDtoCopyWith<$Res> {
  _$VoiceSettingsResponseDtoCopyWithImpl(this._self, this._then);

  final VoiceSettingsResponseDto _self;
  final $Res Function(VoiceSettingsResponseDto) _then;

/// Create a copy of VoiceSettingsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voiceId = null,Object? settings = freezed,}) {
  return _then(_self.copyWith(
voiceId: null == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as VoiceSettingsValues?,
  ));
}
/// Create a copy of VoiceSettingsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoiceSettingsValuesCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $VoiceSettingsValuesCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [VoiceSettingsResponseDto].
extension VoiceSettingsResponseDtoPatterns on VoiceSettingsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceSettingsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceSettingsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceSettingsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _VoiceSettingsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceSettingsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceSettingsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voiceId,  VoiceSettingsValues? settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceSettingsResponseDto() when $default != null:
return $default(_that.voiceId,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voiceId,  VoiceSettingsValues? settings)  $default,) {final _that = this;
switch (_that) {
case _VoiceSettingsResponseDto():
return $default(_that.voiceId,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voiceId,  VoiceSettingsValues? settings)?  $default,) {final _that = this;
switch (_that) {
case _VoiceSettingsResponseDto() when $default != null:
return $default(_that.voiceId,_that.settings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceSettingsResponseDto implements VoiceSettingsResponseDto {
  const _VoiceSettingsResponseDto({required this.voiceId, this.settings});
  factory _VoiceSettingsResponseDto.fromJson(Map<String, dynamic> json) => _$VoiceSettingsResponseDtoFromJson(json);

@override final  String voiceId;
@override final  VoiceSettingsValues? settings;

/// Create a copy of VoiceSettingsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceSettingsResponseDtoCopyWith<_VoiceSettingsResponseDto> get copyWith => __$VoiceSettingsResponseDtoCopyWithImpl<_VoiceSettingsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceSettingsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceSettingsResponseDto&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId)&&(identical(other.settings, settings) || other.settings == settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voiceId,settings);

@override
String toString() {
  return 'VoiceSettingsResponseDto(voiceId: $voiceId, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$VoiceSettingsResponseDtoCopyWith<$Res> implements $VoiceSettingsResponseDtoCopyWith<$Res> {
  factory _$VoiceSettingsResponseDtoCopyWith(_VoiceSettingsResponseDto value, $Res Function(_VoiceSettingsResponseDto) _then) = __$VoiceSettingsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String voiceId, VoiceSettingsValues? settings
});


@override $VoiceSettingsValuesCopyWith<$Res>? get settings;

}
/// @nodoc
class __$VoiceSettingsResponseDtoCopyWithImpl<$Res>
    implements _$VoiceSettingsResponseDtoCopyWith<$Res> {
  __$VoiceSettingsResponseDtoCopyWithImpl(this._self, this._then);

  final _VoiceSettingsResponseDto _self;
  final $Res Function(_VoiceSettingsResponseDto) _then;

/// Create a copy of VoiceSettingsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voiceId = null,Object? settings = freezed,}) {
  return _then(_VoiceSettingsResponseDto(
voiceId: null == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String,settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as VoiceSettingsValues?,
  ));
}

/// Create a copy of VoiceSettingsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VoiceSettingsValuesCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $VoiceSettingsValuesCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// @nodoc
mixin _$VoiceDto {

 String get voiceId; String get name; String? get previewUrl; Map<String, String>? get labels; List<String>? get verifiedLanguages; String? get description; String? get category;
/// Create a copy of VoiceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceDtoCopyWith<VoiceDto> get copyWith => _$VoiceDtoCopyWithImpl<VoiceDto>(this as VoiceDto, _$identity);

  /// Serializes this VoiceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceDto&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&const DeepCollectionEquality().equals(other.labels, labels)&&const DeepCollectionEquality().equals(other.verifiedLanguages, verifiedLanguages)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voiceId,name,previewUrl,const DeepCollectionEquality().hash(labels),const DeepCollectionEquality().hash(verifiedLanguages),description,category);

@override
String toString() {
  return 'VoiceDto(voiceId: $voiceId, name: $name, previewUrl: $previewUrl, labels: $labels, verifiedLanguages: $verifiedLanguages, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class $VoiceDtoCopyWith<$Res>  {
  factory $VoiceDtoCopyWith(VoiceDto value, $Res Function(VoiceDto) _then) = _$VoiceDtoCopyWithImpl;
@useResult
$Res call({
 String voiceId, String name, String? previewUrl, Map<String, String>? labels, List<String>? verifiedLanguages, String? description, String? category
});




}
/// @nodoc
class _$VoiceDtoCopyWithImpl<$Res>
    implements $VoiceDtoCopyWith<$Res> {
  _$VoiceDtoCopyWithImpl(this._self, this._then);

  final VoiceDto _self;
  final $Res Function(VoiceDto) _then;

/// Create a copy of VoiceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voiceId = null,Object? name = null,Object? previewUrl = freezed,Object? labels = freezed,Object? verifiedLanguages = freezed,Object? description = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
voiceId: null == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self.labels : labels // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,verifiedLanguages: freezed == verifiedLanguages ? _self.verifiedLanguages : verifiedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceDto].
extension VoiceDtoPatterns on VoiceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceDto value)  $default,){
final _that = this;
switch (_that) {
case _VoiceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceDto value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String voiceId,  String name,  String? previewUrl,  Map<String, String>? labels,  List<String>? verifiedLanguages,  String? description,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceDto() when $default != null:
return $default(_that.voiceId,_that.name,_that.previewUrl,_that.labels,_that.verifiedLanguages,_that.description,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String voiceId,  String name,  String? previewUrl,  Map<String, String>? labels,  List<String>? verifiedLanguages,  String? description,  String? category)  $default,) {final _that = this;
switch (_that) {
case _VoiceDto():
return $default(_that.voiceId,_that.name,_that.previewUrl,_that.labels,_that.verifiedLanguages,_that.description,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String voiceId,  String name,  String? previewUrl,  Map<String, String>? labels,  List<String>? verifiedLanguages,  String? description,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _VoiceDto() when $default != null:
return $default(_that.voiceId,_that.name,_that.previewUrl,_that.labels,_that.verifiedLanguages,_that.description,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceDto implements VoiceDto {
  const _VoiceDto({required this.voiceId, required this.name, this.previewUrl, final  Map<String, String>? labels, final  List<String>? verifiedLanguages, this.description, this.category}): _labels = labels,_verifiedLanguages = verifiedLanguages;
  factory _VoiceDto.fromJson(Map<String, dynamic> json) => _$VoiceDtoFromJson(json);

@override final  String voiceId;
@override final  String name;
@override final  String? previewUrl;
 final  Map<String, String>? _labels;
@override Map<String, String>? get labels {
  final value = _labels;
  if (value == null) return null;
  if (_labels is EqualUnmodifiableMapView) return _labels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<String>? _verifiedLanguages;
@override List<String>? get verifiedLanguages {
  final value = _verifiedLanguages;
  if (value == null) return null;
  if (_verifiedLanguages is EqualUnmodifiableListView) return _verifiedLanguages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? description;
@override final  String? category;

/// Create a copy of VoiceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceDtoCopyWith<_VoiceDto> get copyWith => __$VoiceDtoCopyWithImpl<_VoiceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceDto&&(identical(other.voiceId, voiceId) || other.voiceId == voiceId)&&(identical(other.name, name) || other.name == name)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&const DeepCollectionEquality().equals(other._labels, _labels)&&const DeepCollectionEquality().equals(other._verifiedLanguages, _verifiedLanguages)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voiceId,name,previewUrl,const DeepCollectionEquality().hash(_labels),const DeepCollectionEquality().hash(_verifiedLanguages),description,category);

@override
String toString() {
  return 'VoiceDto(voiceId: $voiceId, name: $name, previewUrl: $previewUrl, labels: $labels, verifiedLanguages: $verifiedLanguages, description: $description, category: $category)';
}


}

/// @nodoc
abstract mixin class _$VoiceDtoCopyWith<$Res> implements $VoiceDtoCopyWith<$Res> {
  factory _$VoiceDtoCopyWith(_VoiceDto value, $Res Function(_VoiceDto) _then) = __$VoiceDtoCopyWithImpl;
@override @useResult
$Res call({
 String voiceId, String name, String? previewUrl, Map<String, String>? labels, List<String>? verifiedLanguages, String? description, String? category
});




}
/// @nodoc
class __$VoiceDtoCopyWithImpl<$Res>
    implements _$VoiceDtoCopyWith<$Res> {
  __$VoiceDtoCopyWithImpl(this._self, this._then);

  final _VoiceDto _self;
  final $Res Function(_VoiceDto) _then;

/// Create a copy of VoiceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voiceId = null,Object? name = null,Object? previewUrl = freezed,Object? labels = freezed,Object? verifiedLanguages = freezed,Object? description = freezed,Object? category = freezed,}) {
  return _then(_VoiceDto(
voiceId: null == voiceId ? _self.voiceId : voiceId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,labels: freezed == labels ? _self._labels : labels // ignore: cast_nullable_to_non_nullable
as Map<String, String>?,verifiedLanguages: freezed == verifiedLanguages ? _self._verifiedLanguages : verifiedLanguages // ignore: cast_nullable_to_non_nullable
as List<String>?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VoicesListResponseDto {

 List<VoiceDto> get voices;
/// Create a copy of VoicesListResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoicesListResponseDtoCopyWith<VoicesListResponseDto> get copyWith => _$VoicesListResponseDtoCopyWithImpl<VoicesListResponseDto>(this as VoicesListResponseDto, _$identity);

  /// Serializes this VoicesListResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoicesListResponseDto&&const DeepCollectionEquality().equals(other.voices, voices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(voices));

@override
String toString() {
  return 'VoicesListResponseDto(voices: $voices)';
}


}

/// @nodoc
abstract mixin class $VoicesListResponseDtoCopyWith<$Res>  {
  factory $VoicesListResponseDtoCopyWith(VoicesListResponseDto value, $Res Function(VoicesListResponseDto) _then) = _$VoicesListResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<VoiceDto> voices
});




}
/// @nodoc
class _$VoicesListResponseDtoCopyWithImpl<$Res>
    implements $VoicesListResponseDtoCopyWith<$Res> {
  _$VoicesListResponseDtoCopyWithImpl(this._self, this._then);

  final VoicesListResponseDto _self;
  final $Res Function(VoicesListResponseDto) _then;

/// Create a copy of VoicesListResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voices = null,}) {
  return _then(_self.copyWith(
voices: null == voices ? _self.voices : voices // ignore: cast_nullable_to_non_nullable
as List<VoiceDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [VoicesListResponseDto].
extension VoicesListResponseDtoPatterns on VoicesListResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoicesListResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoicesListResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoicesListResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _VoicesListResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoicesListResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _VoicesListResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<VoiceDto> voices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoicesListResponseDto() when $default != null:
return $default(_that.voices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<VoiceDto> voices)  $default,) {final _that = this;
switch (_that) {
case _VoicesListResponseDto():
return $default(_that.voices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<VoiceDto> voices)?  $default,) {final _that = this;
switch (_that) {
case _VoicesListResponseDto() when $default != null:
return $default(_that.voices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoicesListResponseDto implements VoicesListResponseDto {
  const _VoicesListResponseDto({required final  List<VoiceDto> voices}): _voices = voices;
  factory _VoicesListResponseDto.fromJson(Map<String, dynamic> json) => _$VoicesListResponseDtoFromJson(json);

 final  List<VoiceDto> _voices;
@override List<VoiceDto> get voices {
  if (_voices is EqualUnmodifiableListView) return _voices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_voices);
}


/// Create a copy of VoicesListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoicesListResponseDtoCopyWith<_VoicesListResponseDto> get copyWith => __$VoicesListResponseDtoCopyWithImpl<_VoicesListResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoicesListResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoicesListResponseDto&&const DeepCollectionEquality().equals(other._voices, _voices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_voices));

@override
String toString() {
  return 'VoicesListResponseDto(voices: $voices)';
}


}

/// @nodoc
abstract mixin class _$VoicesListResponseDtoCopyWith<$Res> implements $VoicesListResponseDtoCopyWith<$Res> {
  factory _$VoicesListResponseDtoCopyWith(_VoicesListResponseDto value, $Res Function(_VoicesListResponseDto) _then) = __$VoicesListResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<VoiceDto> voices
});




}
/// @nodoc
class __$VoicesListResponseDtoCopyWithImpl<$Res>
    implements _$VoicesListResponseDtoCopyWith<$Res> {
  __$VoicesListResponseDtoCopyWithImpl(this._self, this._then);

  final _VoicesListResponseDto _self;
  final $Res Function(_VoicesListResponseDto) _then;

/// Create a copy of VoicesListResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voices = null,}) {
  return _then(_VoicesListResponseDto(
voices: null == voices ? _self._voices : voices // ignore: cast_nullable_to_non_nullable
as List<VoiceDto>,
  ));
}


}

// dart format on
