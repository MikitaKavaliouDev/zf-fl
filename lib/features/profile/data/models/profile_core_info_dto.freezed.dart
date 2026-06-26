// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_core_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileCoreInfoDto {

 String get name; String get username; String get weightUnit; String? get phone; String? get certifications; String? get aboutMe; String get businessCurrency; List<String> get specialties; List<String> get trainingTypes; List<ProfileLocationDto> get locations;
/// Create a copy of ProfileCoreInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCoreInfoDtoCopyWith<ProfileCoreInfoDto> get copyWith => _$ProfileCoreInfoDtoCopyWithImpl<ProfileCoreInfoDto>(this as ProfileCoreInfoDto, _$identity);

  /// Serializes this ProfileCoreInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileCoreInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&const DeepCollectionEquality().equals(other.trainingTypes, trainingTypes)&&const DeepCollectionEquality().equals(other.locations, locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,weightUnit,phone,certifications,aboutMe,businessCurrency,const DeepCollectionEquality().hash(specialties),const DeepCollectionEquality().hash(trainingTypes),const DeepCollectionEquality().hash(locations));

@override
String toString() {
  return 'ProfileCoreInfoDto(name: $name, username: $username, weightUnit: $weightUnit, phone: $phone, certifications: $certifications, aboutMe: $aboutMe, businessCurrency: $businessCurrency, specialties: $specialties, trainingTypes: $trainingTypes, locations: $locations)';
}


}

/// @nodoc
abstract mixin class $ProfileCoreInfoDtoCopyWith<$Res>  {
  factory $ProfileCoreInfoDtoCopyWith(ProfileCoreInfoDto value, $Res Function(ProfileCoreInfoDto) _then) = _$ProfileCoreInfoDtoCopyWithImpl;
@useResult
$Res call({
 String name, String username, String weightUnit, String? phone, String? certifications, String? aboutMe, String businessCurrency, List<String> specialties, List<String> trainingTypes, List<ProfileLocationDto> locations
});




}
/// @nodoc
class _$ProfileCoreInfoDtoCopyWithImpl<$Res>
    implements $ProfileCoreInfoDtoCopyWith<$Res> {
  _$ProfileCoreInfoDtoCopyWithImpl(this._self, this._then);

  final ProfileCoreInfoDto _self;
  final $Res Function(ProfileCoreInfoDto) _then;

/// Create a copy of ProfileCoreInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = null,Object? weightUnit = null,Object? phone = freezed,Object? certifications = freezed,Object? aboutMe = freezed,Object? businessCurrency = null,Object? specialties = null,Object? trainingTypes = null,Object? locations = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,businessCurrency: null == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self.trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<ProfileLocationDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileCoreInfoDto].
extension ProfileCoreInfoDtoPatterns on ProfileCoreInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileCoreInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileCoreInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileCoreInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileCoreInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileCoreInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileCoreInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String username,  String weightUnit,  String? phone,  String? certifications,  String? aboutMe,  String businessCurrency,  List<String> specialties,  List<String> trainingTypes,  List<ProfileLocationDto> locations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileCoreInfoDto() when $default != null:
return $default(_that.name,_that.username,_that.weightUnit,_that.phone,_that.certifications,_that.aboutMe,_that.businessCurrency,_that.specialties,_that.trainingTypes,_that.locations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String username,  String weightUnit,  String? phone,  String? certifications,  String? aboutMe,  String businessCurrency,  List<String> specialties,  List<String> trainingTypes,  List<ProfileLocationDto> locations)  $default,) {final _that = this;
switch (_that) {
case _ProfileCoreInfoDto():
return $default(_that.name,_that.username,_that.weightUnit,_that.phone,_that.certifications,_that.aboutMe,_that.businessCurrency,_that.specialties,_that.trainingTypes,_that.locations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String username,  String weightUnit,  String? phone,  String? certifications,  String? aboutMe,  String businessCurrency,  List<String> specialties,  List<String> trainingTypes,  List<ProfileLocationDto> locations)?  $default,) {final _that = this;
switch (_that) {
case _ProfileCoreInfoDto() when $default != null:
return $default(_that.name,_that.username,_that.weightUnit,_that.phone,_that.certifications,_that.aboutMe,_that.businessCurrency,_that.specialties,_that.trainingTypes,_that.locations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileCoreInfoDto implements ProfileCoreInfoDto {
  const _ProfileCoreInfoDto({required this.name, required this.username, this.weightUnit = 'KG', this.phone, this.certifications, this.aboutMe, this.businessCurrency = 'PLN', final  List<String> specialties = const <String>[], final  List<String> trainingTypes = const <String>[], final  List<ProfileLocationDto> locations = const <ProfileLocationDto>[]}): _specialties = specialties,_trainingTypes = trainingTypes,_locations = locations;
  factory _ProfileCoreInfoDto.fromJson(Map<String, dynamic> json) => _$ProfileCoreInfoDtoFromJson(json);

@override final  String name;
@override final  String username;
@override@JsonKey() final  String weightUnit;
@override final  String? phone;
@override final  String? certifications;
@override final  String? aboutMe;
@override@JsonKey() final  String businessCurrency;
 final  List<String> _specialties;
@override@JsonKey() List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

 final  List<String> _trainingTypes;
@override@JsonKey() List<String> get trainingTypes {
  if (_trainingTypes is EqualUnmodifiableListView) return _trainingTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingTypes);
}

 final  List<ProfileLocationDto> _locations;
@override@JsonKey() List<ProfileLocationDto> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}


/// Create a copy of ProfileCoreInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCoreInfoDtoCopyWith<_ProfileCoreInfoDto> get copyWith => __$ProfileCoreInfoDtoCopyWithImpl<_ProfileCoreInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileCoreInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileCoreInfoDto&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&const DeepCollectionEquality().equals(other._trainingTypes, _trainingTypes)&&const DeepCollectionEquality().equals(other._locations, _locations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,weightUnit,phone,certifications,aboutMe,businessCurrency,const DeepCollectionEquality().hash(_specialties),const DeepCollectionEquality().hash(_trainingTypes),const DeepCollectionEquality().hash(_locations));

@override
String toString() {
  return 'ProfileCoreInfoDto(name: $name, username: $username, weightUnit: $weightUnit, phone: $phone, certifications: $certifications, aboutMe: $aboutMe, businessCurrency: $businessCurrency, specialties: $specialties, trainingTypes: $trainingTypes, locations: $locations)';
}


}

/// @nodoc
abstract mixin class _$ProfileCoreInfoDtoCopyWith<$Res> implements $ProfileCoreInfoDtoCopyWith<$Res> {
  factory _$ProfileCoreInfoDtoCopyWith(_ProfileCoreInfoDto value, $Res Function(_ProfileCoreInfoDto) _then) = __$ProfileCoreInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String username, String weightUnit, String? phone, String? certifications, String? aboutMe, String businessCurrency, List<String> specialties, List<String> trainingTypes, List<ProfileLocationDto> locations
});




}
/// @nodoc
class __$ProfileCoreInfoDtoCopyWithImpl<$Res>
    implements _$ProfileCoreInfoDtoCopyWith<$Res> {
  __$ProfileCoreInfoDtoCopyWithImpl(this._self, this._then);

  final _ProfileCoreInfoDto _self;
  final $Res Function(_ProfileCoreInfoDto) _then;

/// Create a copy of ProfileCoreInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = null,Object? weightUnit = null,Object? phone = freezed,Object? certifications = freezed,Object? aboutMe = freezed,Object? businessCurrency = null,Object? specialties = null,Object? trainingTypes = null,Object? locations = null,}) {
  return _then(_ProfileCoreInfoDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,businessCurrency: null == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self._trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<ProfileLocationDto>,
  ));
}


}


/// @nodoc
mixin _$ProfileLocationDto {

 String get id; String get address; double? get latitude; double? get longitude;
/// Create a copy of ProfileLocationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileLocationDtoCopyWith<ProfileLocationDto> get copyWith => _$ProfileLocationDtoCopyWithImpl<ProfileLocationDto>(this as ProfileLocationDto, _$identity);

  /// Serializes this ProfileLocationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLocationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,latitude,longitude);

@override
String toString() {
  return 'ProfileLocationDto(id: $id, address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $ProfileLocationDtoCopyWith<$Res>  {
  factory $ProfileLocationDtoCopyWith(ProfileLocationDto value, $Res Function(ProfileLocationDto) _then) = _$ProfileLocationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String address, double? latitude, double? longitude
});




}
/// @nodoc
class _$ProfileLocationDtoCopyWithImpl<$Res>
    implements $ProfileLocationDtoCopyWith<$Res> {
  _$ProfileLocationDtoCopyWithImpl(this._self, this._then);

  final ProfileLocationDto _self;
  final $Res Function(ProfileLocationDto) _then;

/// Create a copy of ProfileLocationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? address = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileLocationDto].
extension ProfileLocationDtoPatterns on ProfileLocationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileLocationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileLocationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileLocationDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileLocationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileLocationDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileLocationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String address,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileLocationDto() when $default != null:
return $default(_that.id,_that.address,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String address,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _ProfileLocationDto():
return $default(_that.id,_that.address,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String address,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _ProfileLocationDto() when $default != null:
return $default(_that.id,_that.address,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileLocationDto implements ProfileLocationDto {
  const _ProfileLocationDto({required this.id, required this.address, this.latitude, this.longitude});
  factory _ProfileLocationDto.fromJson(Map<String, dynamic> json) => _$ProfileLocationDtoFromJson(json);

@override final  String id;
@override final  String address;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of ProfileLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileLocationDtoCopyWith<_ProfileLocationDto> get copyWith => __$ProfileLocationDtoCopyWithImpl<_ProfileLocationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileLocationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileLocationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,latitude,longitude);

@override
String toString() {
  return 'ProfileLocationDto(id: $id, address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$ProfileLocationDtoCopyWith<$Res> implements $ProfileLocationDtoCopyWith<$Res> {
  factory _$ProfileLocationDtoCopyWith(_ProfileLocationDto value, $Res Function(_ProfileLocationDto) _then) = __$ProfileLocationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String address, double? latitude, double? longitude
});




}
/// @nodoc
class __$ProfileLocationDtoCopyWithImpl<$Res>
    implements _$ProfileLocationDtoCopyWith<$Res> {
  __$ProfileLocationDtoCopyWithImpl(this._self, this._then);

  final _ProfileLocationDto _self;
  final $Res Function(_ProfileLocationDto) _then;

/// Create a copy of ProfileLocationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? address = null,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_ProfileLocationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
