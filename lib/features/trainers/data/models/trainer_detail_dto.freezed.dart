// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerDetailDto {

 String get id; String? get name; String? get username; String? get email; String? get profilePhotoPath; String? get bio; double? get averageRating;@JsonKey(fromJson: _parseStringList) List<String> get specialties;@JsonKey(fromJson: _parseStringList) List<String> get certifications; bool get isVerified; bool get isLinked; String? get businessCurrency; List<TrainerLocation>? get locations; List<dynamic> get services; Map<String, dynamic>? get stats;
/// Create a copy of TrainerDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDetailDtoCopyWith<TrainerDetailDto> get copyWith => _$TrainerDetailDtoCopyWithImpl<TrainerDetailDto>(this as TrainerDetailDto, _$identity);

  /// Serializes this TrainerDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.stats, stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,profilePhotoPath,bio,averageRating,const DeepCollectionEquality().hash(specialties),const DeepCollectionEquality().hash(certifications),isVerified,isLinked,businessCurrency,const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(stats));

@override
String toString() {
  return 'TrainerDetailDto(id: $id, name: $name, username: $username, email: $email, profilePhotoPath: $profilePhotoPath, bio: $bio, averageRating: $averageRating, specialties: $specialties, certifications: $certifications, isVerified: $isVerified, isLinked: $isLinked, businessCurrency: $businessCurrency, locations: $locations, services: $services, stats: $stats)';
}


}

/// @nodoc
abstract mixin class $TrainerDetailDtoCopyWith<$Res>  {
  factory $TrainerDetailDtoCopyWith(TrainerDetailDto value, $Res Function(TrainerDetailDto) _then) = _$TrainerDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? username, String? email, String? profilePhotoPath, String? bio, double? averageRating,@JsonKey(fromJson: _parseStringList) List<String> specialties,@JsonKey(fromJson: _parseStringList) List<String> certifications, bool isVerified, bool isLinked, String? businessCurrency, List<TrainerLocation>? locations, List<dynamic> services, Map<String, dynamic>? stats
});




}
/// @nodoc
class _$TrainerDetailDtoCopyWithImpl<$Res>
    implements $TrainerDetailDtoCopyWith<$Res> {
  _$TrainerDetailDtoCopyWithImpl(this._self, this._then);

  final TrainerDetailDto _self;
  final $Res Function(TrainerDetailDto) _then;

/// Create a copy of TrainerDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? username = freezed,Object? email = freezed,Object? profilePhotoPath = freezed,Object? bio = freezed,Object? averageRating = freezed,Object? specialties = null,Object? certifications = null,Object? isVerified = null,Object? isLinked = null,Object? businessCurrency = freezed,Object? locations = freezed,Object? services = null,Object? stats = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,certifications: null == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,businessCurrency: freezed == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String?,locations: freezed == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<TrainerLocation>?,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<dynamic>,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerDetailDto].
extension TrainerDetailDtoPatterns on TrainerDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? username,  String? email,  String? profilePhotoPath,  String? bio,  double? averageRating, @JsonKey(fromJson: _parseStringList)  List<String> specialties, @JsonKey(fromJson: _parseStringList)  List<String> certifications,  bool isVerified,  bool isLinked,  String? businessCurrency,  List<TrainerLocation>? locations,  List<dynamic> services,  Map<String, dynamic>? stats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.profilePhotoPath,_that.bio,_that.averageRating,_that.specialties,_that.certifications,_that.isVerified,_that.isLinked,_that.businessCurrency,_that.locations,_that.services,_that.stats);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? username,  String? email,  String? profilePhotoPath,  String? bio,  double? averageRating, @JsonKey(fromJson: _parseStringList)  List<String> specialties, @JsonKey(fromJson: _parseStringList)  List<String> certifications,  bool isVerified,  bool isLinked,  String? businessCurrency,  List<TrainerLocation>? locations,  List<dynamic> services,  Map<String, dynamic>? stats)  $default,) {final _that = this;
switch (_that) {
case _TrainerDetailDto():
return $default(_that.id,_that.name,_that.username,_that.email,_that.profilePhotoPath,_that.bio,_that.averageRating,_that.specialties,_that.certifications,_that.isVerified,_that.isLinked,_that.businessCurrency,_that.locations,_that.services,_that.stats);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? username,  String? email,  String? profilePhotoPath,  String? bio,  double? averageRating, @JsonKey(fromJson: _parseStringList)  List<String> specialties, @JsonKey(fromJson: _parseStringList)  List<String> certifications,  bool isVerified,  bool isLinked,  String? businessCurrency,  List<TrainerLocation>? locations,  List<dynamic> services,  Map<String, dynamic>? stats)?  $default,) {final _that = this;
switch (_that) {
case _TrainerDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.profilePhotoPath,_that.bio,_that.averageRating,_that.specialties,_that.certifications,_that.isVerified,_that.isLinked,_that.businessCurrency,_that.locations,_that.services,_that.stats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerDetailDto implements TrainerDetailDto {
  const _TrainerDetailDto({required this.id, this.name, this.username, this.email, this.profilePhotoPath, this.bio, this.averageRating, @JsonKey(fromJson: _parseStringList) final  List<String> specialties = const <String>[], @JsonKey(fromJson: _parseStringList) final  List<String> certifications = const <String>[], this.isVerified = false, this.isLinked = false, this.businessCurrency, final  List<TrainerLocation>? locations, final  List<dynamic> services = const <dynamic>[], final  Map<String, dynamic>? stats}): _specialties = specialties,_certifications = certifications,_locations = locations,_services = services,_stats = stats;
  factory _TrainerDetailDto.fromJson(Map<String, dynamic> json) => _$TrainerDetailDtoFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? username;
@override final  String? email;
@override final  String? profilePhotoPath;
@override final  String? bio;
@override final  double? averageRating;
 final  List<String> _specialties;
@override@JsonKey(fromJson: _parseStringList) List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

 final  List<String> _certifications;
@override@JsonKey(fromJson: _parseStringList) List<String> get certifications {
  if (_certifications is EqualUnmodifiableListView) return _certifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certifications);
}

@override@JsonKey() final  bool isVerified;
@override@JsonKey() final  bool isLinked;
@override final  String? businessCurrency;
 final  List<TrainerLocation>? _locations;
@override List<TrainerLocation>? get locations {
  final value = _locations;
  if (value == null) return null;
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic> _services;
@override@JsonKey() List<dynamic> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  Map<String, dynamic>? _stats;
@override Map<String, dynamic>? get stats {
  final value = _stats;
  if (value == null) return null;
  if (_stats is EqualUnmodifiableMapView) return _stats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of TrainerDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerDetailDtoCopyWith<_TrainerDetailDto> get copyWith => __$TrainerDetailDtoCopyWithImpl<_TrainerDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._stats, _stats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email,profilePhotoPath,bio,averageRating,const DeepCollectionEquality().hash(_specialties),const DeepCollectionEquality().hash(_certifications),isVerified,isLinked,businessCurrency,const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_stats));

@override
String toString() {
  return 'TrainerDetailDto(id: $id, name: $name, username: $username, email: $email, profilePhotoPath: $profilePhotoPath, bio: $bio, averageRating: $averageRating, specialties: $specialties, certifications: $certifications, isVerified: $isVerified, isLinked: $isLinked, businessCurrency: $businessCurrency, locations: $locations, services: $services, stats: $stats)';
}


}

/// @nodoc
abstract mixin class _$TrainerDetailDtoCopyWith<$Res> implements $TrainerDetailDtoCopyWith<$Res> {
  factory _$TrainerDetailDtoCopyWith(_TrainerDetailDto value, $Res Function(_TrainerDetailDto) _then) = __$TrainerDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? username, String? email, String? profilePhotoPath, String? bio, double? averageRating,@JsonKey(fromJson: _parseStringList) List<String> specialties,@JsonKey(fromJson: _parseStringList) List<String> certifications, bool isVerified, bool isLinked, String? businessCurrency, List<TrainerLocation>? locations, List<dynamic> services, Map<String, dynamic>? stats
});




}
/// @nodoc
class __$TrainerDetailDtoCopyWithImpl<$Res>
    implements _$TrainerDetailDtoCopyWith<$Res> {
  __$TrainerDetailDtoCopyWithImpl(this._self, this._then);

  final _TrainerDetailDto _self;
  final $Res Function(_TrainerDetailDto) _then;

/// Create a copy of TrainerDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? username = freezed,Object? email = freezed,Object? profilePhotoPath = freezed,Object? bio = freezed,Object? averageRating = freezed,Object? specialties = null,Object? certifications = null,Object? isVerified = null,Object? isLinked = null,Object? businessCurrency = freezed,Object? locations = freezed,Object? services = null,Object? stats = freezed,}) {
  return _then(_TrainerDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,certifications: null == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,businessCurrency: freezed == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String?,locations: freezed == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<TrainerLocation>?,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<dynamic>,stats: freezed == stats ? _self._stats : stats // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
