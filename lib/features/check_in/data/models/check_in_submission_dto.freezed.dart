// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_submission_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInSubmissionDto {

 double? get weight; double? get waistCm; double? get sleepHours; int? get energyLevel; int? get stressLevel; int? get hungerLevel; int? get digestionLevel; String? get nutritionCompliance; String get clientNotes; List<CheckInPhotoDto> get photos;
/// Create a copy of CheckInSubmissionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInSubmissionDtoCopyWith<CheckInSubmissionDto> get copyWith => _$CheckInSubmissionDtoCopyWithImpl<CheckInSubmissionDto>(this as CheckInSubmissionDto, _$identity);

  /// Serializes this CheckInSubmissionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInSubmissionDto&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.energyLevel, energyLevel) || other.energyLevel == energyLevel)&&(identical(other.stressLevel, stressLevel) || other.stressLevel == stressLevel)&&(identical(other.hungerLevel, hungerLevel) || other.hungerLevel == hungerLevel)&&(identical(other.digestionLevel, digestionLevel) || other.digestionLevel == digestionLevel)&&(identical(other.nutritionCompliance, nutritionCompliance) || other.nutritionCompliance == nutritionCompliance)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&const DeepCollectionEquality().equals(other.photos, photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,waistCm,sleepHours,energyLevel,stressLevel,hungerLevel,digestionLevel,nutritionCompliance,clientNotes,const DeepCollectionEquality().hash(photos));

@override
String toString() {
  return 'CheckInSubmissionDto(weight: $weight, waistCm: $waistCm, sleepHours: $sleepHours, energyLevel: $energyLevel, stressLevel: $stressLevel, hungerLevel: $hungerLevel, digestionLevel: $digestionLevel, nutritionCompliance: $nutritionCompliance, clientNotes: $clientNotes, photos: $photos)';
}


}

/// @nodoc
abstract mixin class $CheckInSubmissionDtoCopyWith<$Res>  {
  factory $CheckInSubmissionDtoCopyWith(CheckInSubmissionDto value, $Res Function(CheckInSubmissionDto) _then) = _$CheckInSubmissionDtoCopyWithImpl;
@useResult
$Res call({
 double? weight, double? waistCm, double? sleepHours, int? energyLevel, int? stressLevel, int? hungerLevel, int? digestionLevel, String? nutritionCompliance, String clientNotes, List<CheckInPhotoDto> photos
});




}
/// @nodoc
class _$CheckInSubmissionDtoCopyWithImpl<$Res>
    implements $CheckInSubmissionDtoCopyWith<$Res> {
  _$CheckInSubmissionDtoCopyWithImpl(this._self, this._then);

  final CheckInSubmissionDto _self;
  final $Res Function(CheckInSubmissionDto) _then;

/// Create a copy of CheckInSubmissionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weight = freezed,Object? waistCm = freezed,Object? sleepHours = freezed,Object? energyLevel = freezed,Object? stressLevel = freezed,Object? hungerLevel = freezed,Object? digestionLevel = freezed,Object? nutritionCompliance = freezed,Object? clientNotes = null,Object? photos = null,}) {
  return _then(_self.copyWith(
weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as double?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,energyLevel: freezed == energyLevel ? _self.energyLevel : energyLevel // ignore: cast_nullable_to_non_nullable
as int?,stressLevel: freezed == stressLevel ? _self.stressLevel : stressLevel // ignore: cast_nullable_to_non_nullable
as int?,hungerLevel: freezed == hungerLevel ? _self.hungerLevel : hungerLevel // ignore: cast_nullable_to_non_nullable
as int?,digestionLevel: freezed == digestionLevel ? _self.digestionLevel : digestionLevel // ignore: cast_nullable_to_non_nullable
as int?,nutritionCompliance: freezed == nutritionCompliance ? _self.nutritionCompliance : nutritionCompliance // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: null == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<CheckInPhotoDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInSubmissionDto].
extension CheckInSubmissionDtoPatterns on CheckInSubmissionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInSubmissionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInSubmissionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInSubmissionDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInSubmissionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInSubmissionDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInSubmissionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String clientNotes,  List<CheckInPhotoDto> photos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInSubmissionDto() when $default != null:
return $default(_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.clientNotes,_that.photos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String clientNotes,  List<CheckInPhotoDto> photos)  $default,) {final _that = this;
switch (_that) {
case _CheckInSubmissionDto():
return $default(_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.clientNotes,_that.photos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String clientNotes,  List<CheckInPhotoDto> photos)?  $default,) {final _that = this;
switch (_that) {
case _CheckInSubmissionDto() when $default != null:
return $default(_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.clientNotes,_that.photos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInSubmissionDto implements CheckInSubmissionDto {
  const _CheckInSubmissionDto({this.weight, this.waistCm, this.sleepHours, this.energyLevel, this.stressLevel, this.hungerLevel, this.digestionLevel, this.nutritionCompliance, this.clientNotes = '', final  List<CheckInPhotoDto> photos = const <CheckInPhotoDto>[]}): _photos = photos;
  factory _CheckInSubmissionDto.fromJson(Map<String, dynamic> json) => _$CheckInSubmissionDtoFromJson(json);

@override final  double? weight;
@override final  double? waistCm;
@override final  double? sleepHours;
@override final  int? energyLevel;
@override final  int? stressLevel;
@override final  int? hungerLevel;
@override final  int? digestionLevel;
@override final  String? nutritionCompliance;
@override@JsonKey() final  String clientNotes;
 final  List<CheckInPhotoDto> _photos;
@override@JsonKey() List<CheckInPhotoDto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}


/// Create a copy of CheckInSubmissionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInSubmissionDtoCopyWith<_CheckInSubmissionDto> get copyWith => __$CheckInSubmissionDtoCopyWithImpl<_CheckInSubmissionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInSubmissionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInSubmissionDto&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.energyLevel, energyLevel) || other.energyLevel == energyLevel)&&(identical(other.stressLevel, stressLevel) || other.stressLevel == stressLevel)&&(identical(other.hungerLevel, hungerLevel) || other.hungerLevel == hungerLevel)&&(identical(other.digestionLevel, digestionLevel) || other.digestionLevel == digestionLevel)&&(identical(other.nutritionCompliance, nutritionCompliance) || other.nutritionCompliance == nutritionCompliance)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&const DeepCollectionEquality().equals(other._photos, _photos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weight,waistCm,sleepHours,energyLevel,stressLevel,hungerLevel,digestionLevel,nutritionCompliance,clientNotes,const DeepCollectionEquality().hash(_photos));

@override
String toString() {
  return 'CheckInSubmissionDto(weight: $weight, waistCm: $waistCm, sleepHours: $sleepHours, energyLevel: $energyLevel, stressLevel: $stressLevel, hungerLevel: $hungerLevel, digestionLevel: $digestionLevel, nutritionCompliance: $nutritionCompliance, clientNotes: $clientNotes, photos: $photos)';
}


}

/// @nodoc
abstract mixin class _$CheckInSubmissionDtoCopyWith<$Res> implements $CheckInSubmissionDtoCopyWith<$Res> {
  factory _$CheckInSubmissionDtoCopyWith(_CheckInSubmissionDto value, $Res Function(_CheckInSubmissionDto) _then) = __$CheckInSubmissionDtoCopyWithImpl;
@override @useResult
$Res call({
 double? weight, double? waistCm, double? sleepHours, int? energyLevel, int? stressLevel, int? hungerLevel, int? digestionLevel, String? nutritionCompliance, String clientNotes, List<CheckInPhotoDto> photos
});




}
/// @nodoc
class __$CheckInSubmissionDtoCopyWithImpl<$Res>
    implements _$CheckInSubmissionDtoCopyWith<$Res> {
  __$CheckInSubmissionDtoCopyWithImpl(this._self, this._then);

  final _CheckInSubmissionDto _self;
  final $Res Function(_CheckInSubmissionDto) _then;

/// Create a copy of CheckInSubmissionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = freezed,Object? waistCm = freezed,Object? sleepHours = freezed,Object? energyLevel = freezed,Object? stressLevel = freezed,Object? hungerLevel = freezed,Object? digestionLevel = freezed,Object? nutritionCompliance = freezed,Object? clientNotes = null,Object? photos = null,}) {
  return _then(_CheckInSubmissionDto(
weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as double?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,energyLevel: freezed == energyLevel ? _self.energyLevel : energyLevel // ignore: cast_nullable_to_non_nullable
as int?,stressLevel: freezed == stressLevel ? _self.stressLevel : stressLevel // ignore: cast_nullable_to_non_nullable
as int?,hungerLevel: freezed == hungerLevel ? _self.hungerLevel : hungerLevel // ignore: cast_nullable_to_non_nullable
as int?,digestionLevel: freezed == digestionLevel ? _self.digestionLevel : digestionLevel // ignore: cast_nullable_to_non_nullable
as int?,nutritionCompliance: freezed == nutritionCompliance ? _self.nutritionCompliance : nutritionCompliance // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: null == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<CheckInPhotoDto>,
  ));
}


}


/// @nodoc
mixin _$CheckInPhotoDto {

 String get imagePath; String? get caption; String? get date;
/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInPhotoDtoCopyWith<CheckInPhotoDto> get copyWith => _$CheckInPhotoDtoCopyWithImpl<CheckInPhotoDto>(this as CheckInPhotoDto, _$identity);

  /// Serializes this CheckInPhotoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInPhotoDto&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,caption,date);

@override
String toString() {
  return 'CheckInPhotoDto(imagePath: $imagePath, caption: $caption, date: $date)';
}


}

/// @nodoc
abstract mixin class $CheckInPhotoDtoCopyWith<$Res>  {
  factory $CheckInPhotoDtoCopyWith(CheckInPhotoDto value, $Res Function(CheckInPhotoDto) _then) = _$CheckInPhotoDtoCopyWithImpl;
@useResult
$Res call({
 String imagePath, String? caption, String? date
});




}
/// @nodoc
class _$CheckInPhotoDtoCopyWithImpl<$Res>
    implements $CheckInPhotoDtoCopyWith<$Res> {
  _$CheckInPhotoDtoCopyWithImpl(this._self, this._then);

  final CheckInPhotoDto _self;
  final $Res Function(CheckInPhotoDto) _then;

/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = null,Object? caption = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInPhotoDto].
extension CheckInPhotoDtoPatterns on CheckInPhotoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInPhotoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInPhotoDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInPhotoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInPhotoDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePath,  String? caption,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
return $default(_that.imagePath,_that.caption,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePath,  String? caption,  String? date)  $default,) {final _that = this;
switch (_that) {
case _CheckInPhotoDto():
return $default(_that.imagePath,_that.caption,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePath,  String? caption,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _CheckInPhotoDto() when $default != null:
return $default(_that.imagePath,_that.caption,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInPhotoDto implements CheckInPhotoDto {
  const _CheckInPhotoDto({required this.imagePath, this.caption, this.date});
  factory _CheckInPhotoDto.fromJson(Map<String, dynamic> json) => _$CheckInPhotoDtoFromJson(json);

@override final  String imagePath;
@override final  String? caption;
@override final  String? date;

/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInPhotoDtoCopyWith<_CheckInPhotoDto> get copyWith => __$CheckInPhotoDtoCopyWithImpl<_CheckInPhotoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInPhotoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInPhotoDto&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imagePath,caption,date);

@override
String toString() {
  return 'CheckInPhotoDto(imagePath: $imagePath, caption: $caption, date: $date)';
}


}

/// @nodoc
abstract mixin class _$CheckInPhotoDtoCopyWith<$Res> implements $CheckInPhotoDtoCopyWith<$Res> {
  factory _$CheckInPhotoDtoCopyWith(_CheckInPhotoDto value, $Res Function(_CheckInPhotoDto) _then) = __$CheckInPhotoDtoCopyWithImpl;
@override @useResult
$Res call({
 String imagePath, String? caption, String? date
});




}
/// @nodoc
class __$CheckInPhotoDtoCopyWithImpl<$Res>
    implements _$CheckInPhotoDtoCopyWith<$Res> {
  __$CheckInPhotoDtoCopyWithImpl(this._self, this._then);

  final _CheckInPhotoDto _self;
  final $Res Function(_CheckInPhotoDto) _then;

/// Create a copy of CheckInPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? caption = freezed,Object? date = freezed,}) {
  return _then(_CheckInPhotoDto(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
