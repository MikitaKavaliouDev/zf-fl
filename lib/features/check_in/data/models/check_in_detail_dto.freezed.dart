// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInDetailDto {

 String get id; DateTime get date; String get status; double? get weight; double? get waistCm; double? get sleepHours; int? get energyLevel; int? get stressLevel; int? get hungerLevel; int? get digestionLevel; String? get nutritionCompliance; String? get clientNotes; List<CheckInPhotoDetailDto> get photos; CheckInReviewerDto? get reviewedBy;
/// Create a copy of CheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInDetailDtoCopyWith<CheckInDetailDto> get copyWith => _$CheckInDetailDtoCopyWithImpl<CheckInDetailDto>(this as CheckInDetailDto, _$identity);

  /// Serializes this CheckInDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.energyLevel, energyLevel) || other.energyLevel == energyLevel)&&(identical(other.stressLevel, stressLevel) || other.stressLevel == stressLevel)&&(identical(other.hungerLevel, hungerLevel) || other.hungerLevel == hungerLevel)&&(identical(other.digestionLevel, digestionLevel) || other.digestionLevel == digestionLevel)&&(identical(other.nutritionCompliance, nutritionCompliance) || other.nutritionCompliance == nutritionCompliance)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,weight,waistCm,sleepHours,energyLevel,stressLevel,hungerLevel,digestionLevel,nutritionCompliance,clientNotes,const DeepCollectionEquality().hash(photos),reviewedBy);

@override
String toString() {
  return 'CheckInDetailDto(id: $id, date: $date, status: $status, weight: $weight, waistCm: $waistCm, sleepHours: $sleepHours, energyLevel: $energyLevel, stressLevel: $stressLevel, hungerLevel: $hungerLevel, digestionLevel: $digestionLevel, nutritionCompliance: $nutritionCompliance, clientNotes: $clientNotes, photos: $photos, reviewedBy: $reviewedBy)';
}


}

/// @nodoc
abstract mixin class $CheckInDetailDtoCopyWith<$Res>  {
  factory $CheckInDetailDtoCopyWith(CheckInDetailDto value, $Res Function(CheckInDetailDto) _then) = _$CheckInDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, DateTime date, String status, double? weight, double? waistCm, double? sleepHours, int? energyLevel, int? stressLevel, int? hungerLevel, int? digestionLevel, String? nutritionCompliance, String? clientNotes, List<CheckInPhotoDetailDto> photos, CheckInReviewerDto? reviewedBy
});


$CheckInReviewerDtoCopyWith<$Res>? get reviewedBy;

}
/// @nodoc
class _$CheckInDetailDtoCopyWithImpl<$Res>
    implements $CheckInDetailDtoCopyWith<$Res> {
  _$CheckInDetailDtoCopyWithImpl(this._self, this._then);

  final CheckInDetailDto _self;
  final $Res Function(CheckInDetailDto) _then;

/// Create a copy of CheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? status = null,Object? weight = freezed,Object? waistCm = freezed,Object? sleepHours = freezed,Object? energyLevel = freezed,Object? stressLevel = freezed,Object? hungerLevel = freezed,Object? digestionLevel = freezed,Object? nutritionCompliance = freezed,Object? clientNotes = freezed,Object? photos = null,Object? reviewedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as double?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,energyLevel: freezed == energyLevel ? _self.energyLevel : energyLevel // ignore: cast_nullable_to_non_nullable
as int?,stressLevel: freezed == stressLevel ? _self.stressLevel : stressLevel // ignore: cast_nullable_to_non_nullable
as int?,hungerLevel: freezed == hungerLevel ? _self.hungerLevel : hungerLevel // ignore: cast_nullable_to_non_nullable
as int?,digestionLevel: freezed == digestionLevel ? _self.digestionLevel : digestionLevel // ignore: cast_nullable_to_non_nullable
as int?,nutritionCompliance: freezed == nutritionCompliance ? _self.nutritionCompliance : nutritionCompliance // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: freezed == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<CheckInPhotoDetailDto>,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as CheckInReviewerDto?,
  ));
}
/// Create a copy of CheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInReviewerDtoCopyWith<$Res>? get reviewedBy {
    if (_self.reviewedBy == null) {
    return null;
  }

  return $CheckInReviewerDtoCopyWith<$Res>(_self.reviewedBy!, (value) {
    return _then(_self.copyWith(reviewedBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckInDetailDto].
extension CheckInDetailDtoPatterns on CheckInDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime date,  String status,  double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String? clientNotes,  List<CheckInPhotoDetailDto> photos,  CheckInReviewerDto? reviewedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInDetailDto() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.clientNotes,_that.photos,_that.reviewedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime date,  String status,  double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String? clientNotes,  List<CheckInPhotoDetailDto> photos,  CheckInReviewerDto? reviewedBy)  $default,) {final _that = this;
switch (_that) {
case _CheckInDetailDto():
return $default(_that.id,_that.date,_that.status,_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.clientNotes,_that.photos,_that.reviewedBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime date,  String status,  double? weight,  double? waistCm,  double? sleepHours,  int? energyLevel,  int? stressLevel,  int? hungerLevel,  int? digestionLevel,  String? nutritionCompliance,  String? clientNotes,  List<CheckInPhotoDetailDto> photos,  CheckInReviewerDto? reviewedBy)?  $default,) {final _that = this;
switch (_that) {
case _CheckInDetailDto() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.weight,_that.waistCm,_that.sleepHours,_that.energyLevel,_that.stressLevel,_that.hungerLevel,_that.digestionLevel,_that.nutritionCompliance,_that.clientNotes,_that.photos,_that.reviewedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInDetailDto implements CheckInDetailDto {
  const _CheckInDetailDto({required this.id, required this.date, required this.status, this.weight, this.waistCm, this.sleepHours, this.energyLevel, this.stressLevel, this.hungerLevel, this.digestionLevel, this.nutritionCompliance, this.clientNotes, final  List<CheckInPhotoDetailDto> photos = const <CheckInPhotoDetailDto>[], this.reviewedBy}): _photos = photos;
  factory _CheckInDetailDto.fromJson(Map<String, dynamic> json) => _$CheckInDetailDtoFromJson(json);

@override final  String id;
@override final  DateTime date;
@override final  String status;
@override final  double? weight;
@override final  double? waistCm;
@override final  double? sleepHours;
@override final  int? energyLevel;
@override final  int? stressLevel;
@override final  int? hungerLevel;
@override final  int? digestionLevel;
@override final  String? nutritionCompliance;
@override final  String? clientNotes;
 final  List<CheckInPhotoDetailDto> _photos;
@override@JsonKey() List<CheckInPhotoDetailDto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override final  CheckInReviewerDto? reviewedBy;

/// Create a copy of CheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInDetailDtoCopyWith<_CheckInDetailDto> get copyWith => __$CheckInDetailDtoCopyWithImpl<_CheckInDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.waistCm, waistCm) || other.waistCm == waistCm)&&(identical(other.sleepHours, sleepHours) || other.sleepHours == sleepHours)&&(identical(other.energyLevel, energyLevel) || other.energyLevel == energyLevel)&&(identical(other.stressLevel, stressLevel) || other.stressLevel == stressLevel)&&(identical(other.hungerLevel, hungerLevel) || other.hungerLevel == hungerLevel)&&(identical(other.digestionLevel, digestionLevel) || other.digestionLevel == digestionLevel)&&(identical(other.nutritionCompliance, nutritionCompliance) || other.nutritionCompliance == nutritionCompliance)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.reviewedBy, reviewedBy) || other.reviewedBy == reviewedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,weight,waistCm,sleepHours,energyLevel,stressLevel,hungerLevel,digestionLevel,nutritionCompliance,clientNotes,const DeepCollectionEquality().hash(_photos),reviewedBy);

@override
String toString() {
  return 'CheckInDetailDto(id: $id, date: $date, status: $status, weight: $weight, waistCm: $waistCm, sleepHours: $sleepHours, energyLevel: $energyLevel, stressLevel: $stressLevel, hungerLevel: $hungerLevel, digestionLevel: $digestionLevel, nutritionCompliance: $nutritionCompliance, clientNotes: $clientNotes, photos: $photos, reviewedBy: $reviewedBy)';
}


}

/// @nodoc
abstract mixin class _$CheckInDetailDtoCopyWith<$Res> implements $CheckInDetailDtoCopyWith<$Res> {
  factory _$CheckInDetailDtoCopyWith(_CheckInDetailDto value, $Res Function(_CheckInDetailDto) _then) = __$CheckInDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime date, String status, double? weight, double? waistCm, double? sleepHours, int? energyLevel, int? stressLevel, int? hungerLevel, int? digestionLevel, String? nutritionCompliance, String? clientNotes, List<CheckInPhotoDetailDto> photos, CheckInReviewerDto? reviewedBy
});


@override $CheckInReviewerDtoCopyWith<$Res>? get reviewedBy;

}
/// @nodoc
class __$CheckInDetailDtoCopyWithImpl<$Res>
    implements _$CheckInDetailDtoCopyWith<$Res> {
  __$CheckInDetailDtoCopyWithImpl(this._self, this._then);

  final _CheckInDetailDto _self;
  final $Res Function(_CheckInDetailDto) _then;

/// Create a copy of CheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? status = null,Object? weight = freezed,Object? waistCm = freezed,Object? sleepHours = freezed,Object? energyLevel = freezed,Object? stressLevel = freezed,Object? hungerLevel = freezed,Object? digestionLevel = freezed,Object? nutritionCompliance = freezed,Object? clientNotes = freezed,Object? photos = null,Object? reviewedBy = freezed,}) {
  return _then(_CheckInDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,waistCm: freezed == waistCm ? _self.waistCm : waistCm // ignore: cast_nullable_to_non_nullable
as double?,sleepHours: freezed == sleepHours ? _self.sleepHours : sleepHours // ignore: cast_nullable_to_non_nullable
as double?,energyLevel: freezed == energyLevel ? _self.energyLevel : energyLevel // ignore: cast_nullable_to_non_nullable
as int?,stressLevel: freezed == stressLevel ? _self.stressLevel : stressLevel // ignore: cast_nullable_to_non_nullable
as int?,hungerLevel: freezed == hungerLevel ? _self.hungerLevel : hungerLevel // ignore: cast_nullable_to_non_nullable
as int?,digestionLevel: freezed == digestionLevel ? _self.digestionLevel : digestionLevel // ignore: cast_nullable_to_non_nullable
as int?,nutritionCompliance: freezed == nutritionCompliance ? _self.nutritionCompliance : nutritionCompliance // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: freezed == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String?,photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<CheckInPhotoDetailDto>,reviewedBy: freezed == reviewedBy ? _self.reviewedBy : reviewedBy // ignore: cast_nullable_to_non_nullable
as CheckInReviewerDto?,
  ));
}

/// Create a copy of CheckInDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInReviewerDtoCopyWith<$Res>? get reviewedBy {
    if (_self.reviewedBy == null) {
    return null;
  }

  return $CheckInReviewerDtoCopyWith<$Res>(_self.reviewedBy!, (value) {
    return _then(_self.copyWith(reviewedBy: value));
  });
}
}


/// @nodoc
mixin _$CheckInPhotoDetailDto {

 String get id; String get imageUrl; String? get caption; DateTime? get photoDate;
/// Create a copy of CheckInPhotoDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInPhotoDetailDtoCopyWith<CheckInPhotoDetailDto> get copyWith => _$CheckInPhotoDetailDtoCopyWithImpl<CheckInPhotoDetailDto>(this as CheckInPhotoDetailDto, _$identity);

  /// Serializes this CheckInPhotoDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInPhotoDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.photoDate, photoDate) || other.photoDate == photoDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,caption,photoDate);

@override
String toString() {
  return 'CheckInPhotoDetailDto(id: $id, imageUrl: $imageUrl, caption: $caption, photoDate: $photoDate)';
}


}

/// @nodoc
abstract mixin class $CheckInPhotoDetailDtoCopyWith<$Res>  {
  factory $CheckInPhotoDetailDtoCopyWith(CheckInPhotoDetailDto value, $Res Function(CheckInPhotoDetailDto) _then) = _$CheckInPhotoDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String imageUrl, String? caption, DateTime? photoDate
});




}
/// @nodoc
class _$CheckInPhotoDetailDtoCopyWithImpl<$Res>
    implements $CheckInPhotoDetailDtoCopyWith<$Res> {
  _$CheckInPhotoDetailDtoCopyWithImpl(this._self, this._then);

  final CheckInPhotoDetailDto _self;
  final $Res Function(CheckInPhotoDetailDto) _then;

/// Create a copy of CheckInPhotoDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imageUrl = null,Object? caption = freezed,Object? photoDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,photoDate: freezed == photoDate ? _self.photoDate : photoDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInPhotoDetailDto].
extension CheckInPhotoDetailDtoPatterns on CheckInPhotoDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInPhotoDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInPhotoDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInPhotoDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInPhotoDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInPhotoDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInPhotoDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String? caption,  DateTime? photoDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInPhotoDetailDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.caption,_that.photoDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imageUrl,  String? caption,  DateTime? photoDate)  $default,) {final _that = this;
switch (_that) {
case _CheckInPhotoDetailDto():
return $default(_that.id,_that.imageUrl,_that.caption,_that.photoDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imageUrl,  String? caption,  DateTime? photoDate)?  $default,) {final _that = this;
switch (_that) {
case _CheckInPhotoDetailDto() when $default != null:
return $default(_that.id,_that.imageUrl,_that.caption,_that.photoDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInPhotoDetailDto implements CheckInPhotoDetailDto {
  const _CheckInPhotoDetailDto({required this.id, required this.imageUrl, this.caption, this.photoDate});
  factory _CheckInPhotoDetailDto.fromJson(Map<String, dynamic> json) => _$CheckInPhotoDetailDtoFromJson(json);

@override final  String id;
@override final  String imageUrl;
@override final  String? caption;
@override final  DateTime? photoDate;

/// Create a copy of CheckInPhotoDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInPhotoDetailDtoCopyWith<_CheckInPhotoDetailDto> get copyWith => __$CheckInPhotoDetailDtoCopyWithImpl<_CheckInPhotoDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInPhotoDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInPhotoDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.photoDate, photoDate) || other.photoDate == photoDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,imageUrl,caption,photoDate);

@override
String toString() {
  return 'CheckInPhotoDetailDto(id: $id, imageUrl: $imageUrl, caption: $caption, photoDate: $photoDate)';
}


}

/// @nodoc
abstract mixin class _$CheckInPhotoDetailDtoCopyWith<$Res> implements $CheckInPhotoDetailDtoCopyWith<$Res> {
  factory _$CheckInPhotoDetailDtoCopyWith(_CheckInPhotoDetailDto value, $Res Function(_CheckInPhotoDetailDto) _then) = __$CheckInPhotoDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String imageUrl, String? caption, DateTime? photoDate
});




}
/// @nodoc
class __$CheckInPhotoDetailDtoCopyWithImpl<$Res>
    implements _$CheckInPhotoDetailDtoCopyWith<$Res> {
  __$CheckInPhotoDetailDtoCopyWithImpl(this._self, this._then);

  final _CheckInPhotoDetailDto _self;
  final $Res Function(_CheckInPhotoDetailDto) _then;

/// Create a copy of CheckInPhotoDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imageUrl = null,Object? caption = freezed,Object? photoDate = freezed,}) {
  return _then(_CheckInPhotoDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,photoDate: freezed == photoDate ? _self.photoDate : photoDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$CheckInReviewerDto {

 String get name; String? get photoUrl;
/// Create a copy of CheckInReviewerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInReviewerDtoCopyWith<CheckInReviewerDto> get copyWith => _$CheckInReviewerDtoCopyWithImpl<CheckInReviewerDto>(this as CheckInReviewerDto, _$identity);

  /// Serializes this CheckInReviewerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInReviewerDto&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,photoUrl);

@override
String toString() {
  return 'CheckInReviewerDto(name: $name, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $CheckInReviewerDtoCopyWith<$Res>  {
  factory $CheckInReviewerDtoCopyWith(CheckInReviewerDto value, $Res Function(CheckInReviewerDto) _then) = _$CheckInReviewerDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? photoUrl
});




}
/// @nodoc
class _$CheckInReviewerDtoCopyWithImpl<$Res>
    implements $CheckInReviewerDtoCopyWith<$Res> {
  _$CheckInReviewerDtoCopyWithImpl(this._self, this._then);

  final CheckInReviewerDto _self;
  final $Res Function(CheckInReviewerDto) _then;

/// Create a copy of CheckInReviewerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInReviewerDto].
extension CheckInReviewerDtoPatterns on CheckInReviewerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInReviewerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInReviewerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInReviewerDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInReviewerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInReviewerDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInReviewerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInReviewerDto() when $default != null:
return $default(_that.name,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _CheckInReviewerDto():
return $default(_that.name,_that.photoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _CheckInReviewerDto() when $default != null:
return $default(_that.name,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInReviewerDto implements CheckInReviewerDto {
  const _CheckInReviewerDto({required this.name, this.photoUrl});
  factory _CheckInReviewerDto.fromJson(Map<String, dynamic> json) => _$CheckInReviewerDtoFromJson(json);

@override final  String name;
@override final  String? photoUrl;

/// Create a copy of CheckInReviewerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInReviewerDtoCopyWith<_CheckInReviewerDto> get copyWith => __$CheckInReviewerDtoCopyWithImpl<_CheckInReviewerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInReviewerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInReviewerDto&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,photoUrl);

@override
String toString() {
  return 'CheckInReviewerDto(name: $name, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$CheckInReviewerDtoCopyWith<$Res> implements $CheckInReviewerDtoCopyWith<$Res> {
  factory _$CheckInReviewerDtoCopyWith(_CheckInReviewerDto value, $Res Function(_CheckInReviewerDto) _then) = __$CheckInReviewerDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? photoUrl
});




}
/// @nodoc
class __$CheckInReviewerDtoCopyWithImpl<$Res>
    implements _$CheckInReviewerDtoCopyWith<$Res> {
  __$CheckInReviewerDtoCopyWithImpl(this._self, this._then);

  final _CheckInReviewerDto _self;
  final $Res Function(_CheckInReviewerDto) _then;

/// Create a copy of CheckInReviewerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? photoUrl = freezed,}) {
  return _then(_CheckInReviewerDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
