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

 String get id; String? get name; String? get username; String? get email; String? get role; String? get tier; bool get isLinked; String? get profilePhotoPath; String? get bannerImagePath; String? get aboutMe; String? get philosophy; String? get methodology; String? get branding; String? get certifications;@JsonKey(fromJson: _parseStringList) List<String> get specialties;@JsonKey(fromJson: _parseStringList) List<String> get trainingTypes; String? get minServicePrice; double? get averageRating; String? get businessCurrency; List<TrainerLocation> get locations; List<TrainerServiceDto> get services; List<TrainerTestimonialDto> get testimonials; List<TrainerTransformationPhotoDto> get transformationPhotos; List<TrainerSocialLinkDto> get socialLinks; List<TrainerExternalLinkDto> get externalLinks; List<TrainerBenefitDto> get benefits; int get reviewCount; int get clientsCoached; List<TrainerPackageDto> get packages;
/// Create a copy of TrainerDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDetailDtoCopyWith<TrainerDetailDto> get copyWith => _$TrainerDetailDtoCopyWithImpl<TrainerDetailDto>(this as TrainerDetailDto, _$identity);

  /// Serializes this TrainerDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.bannerImagePath, bannerImagePath) || other.bannerImagePath == bannerImagePath)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.philosophy, philosophy) || other.philosophy == philosophy)&&(identical(other.methodology, methodology) || other.methodology == methodology)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&const DeepCollectionEquality().equals(other.trainingTypes, trainingTypes)&&(identical(other.minServicePrice, minServicePrice) || other.minServicePrice == minServicePrice)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.testimonials, testimonials)&&const DeepCollectionEquality().equals(other.transformationPhotos, transformationPhotos)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks)&&const DeepCollectionEquality().equals(other.externalLinks, externalLinks)&&const DeepCollectionEquality().equals(other.benefits, benefits)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.clientsCoached, clientsCoached) || other.clientsCoached == clientsCoached)&&const DeepCollectionEquality().equals(other.packages, packages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,username,email,role,tier,isLinked,profilePhotoPath,bannerImagePath,aboutMe,philosophy,methodology,branding,certifications,const DeepCollectionEquality().hash(specialties),const DeepCollectionEquality().hash(trainingTypes),minServicePrice,averageRating,businessCurrency,const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(testimonials),const DeepCollectionEquality().hash(transformationPhotos),const DeepCollectionEquality().hash(socialLinks),const DeepCollectionEquality().hash(externalLinks),const DeepCollectionEquality().hash(benefits),reviewCount,clientsCoached,const DeepCollectionEquality().hash(packages)]);

@override
String toString() {
  return 'TrainerDetailDto(id: $id, name: $name, username: $username, email: $email, role: $role, tier: $tier, isLinked: $isLinked, profilePhotoPath: $profilePhotoPath, bannerImagePath: $bannerImagePath, aboutMe: $aboutMe, philosophy: $philosophy, methodology: $methodology, branding: $branding, certifications: $certifications, specialties: $specialties, trainingTypes: $trainingTypes, minServicePrice: $minServicePrice, averageRating: $averageRating, businessCurrency: $businessCurrency, locations: $locations, services: $services, testimonials: $testimonials, transformationPhotos: $transformationPhotos, socialLinks: $socialLinks, externalLinks: $externalLinks, benefits: $benefits, reviewCount: $reviewCount, clientsCoached: $clientsCoached, packages: $packages)';
}


}

/// @nodoc
abstract mixin class $TrainerDetailDtoCopyWith<$Res>  {
  factory $TrainerDetailDtoCopyWith(TrainerDetailDto value, $Res Function(TrainerDetailDto) _then) = _$TrainerDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? username, String? email, String? role, String? tier, bool isLinked, String? profilePhotoPath, String? bannerImagePath, String? aboutMe, String? philosophy, String? methodology, String? branding, String? certifications,@JsonKey(fromJson: _parseStringList) List<String> specialties,@JsonKey(fromJson: _parseStringList) List<String> trainingTypes, String? minServicePrice, double? averageRating, String? businessCurrency, List<TrainerLocation> locations, List<TrainerServiceDto> services, List<TrainerTestimonialDto> testimonials, List<TrainerTransformationPhotoDto> transformationPhotos, List<TrainerSocialLinkDto> socialLinks, List<TrainerExternalLinkDto> externalLinks, List<TrainerBenefitDto> benefits, int reviewCount, int clientsCoached, List<TrainerPackageDto> packages
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? username = freezed,Object? email = freezed,Object? role = freezed,Object? tier = freezed,Object? isLinked = null,Object? profilePhotoPath = freezed,Object? bannerImagePath = freezed,Object? aboutMe = freezed,Object? philosophy = freezed,Object? methodology = freezed,Object? branding = freezed,Object? certifications = freezed,Object? specialties = null,Object? trainingTypes = null,Object? minServicePrice = freezed,Object? averageRating = freezed,Object? businessCurrency = freezed,Object? locations = null,Object? services = null,Object? testimonials = null,Object? transformationPhotos = null,Object? socialLinks = null,Object? externalLinks = null,Object? benefits = null,Object? reviewCount = null,Object? clientsCoached = null,Object? packages = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,bannerImagePath: freezed == bannerImagePath ? _self.bannerImagePath : bannerImagePath // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,philosophy: freezed == philosophy ? _self.philosophy : philosophy // ignore: cast_nullable_to_non_nullable
as String?,methodology: freezed == methodology ? _self.methodology : methodology // ignore: cast_nullable_to_non_nullable
as String?,branding: freezed == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self.trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,minServicePrice: freezed == minServicePrice ? _self.minServicePrice : minServicePrice // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,businessCurrency: freezed == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String?,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<TrainerLocation>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<TrainerServiceDto>,testimonials: null == testimonials ? _self.testimonials : testimonials // ignore: cast_nullable_to_non_nullable
as List<TrainerTestimonialDto>,transformationPhotos: null == transformationPhotos ? _self.transformationPhotos : transformationPhotos // ignore: cast_nullable_to_non_nullable
as List<TrainerTransformationPhotoDto>,socialLinks: null == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as List<TrainerSocialLinkDto>,externalLinks: null == externalLinks ? _self.externalLinks : externalLinks // ignore: cast_nullable_to_non_nullable
as List<TrainerExternalLinkDto>,benefits: null == benefits ? _self.benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<TrainerBenefitDto>,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,clientsCoached: null == clientsCoached ? _self.clientsCoached : clientsCoached // ignore: cast_nullable_to_non_nullable
as int,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<TrainerPackageDto>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? username,  String? email,  String? role,  String? tier,  bool isLinked,  String? profilePhotoPath,  String? bannerImagePath,  String? aboutMe,  String? philosophy,  String? methodology,  String? branding,  String? certifications, @JsonKey(fromJson: _parseStringList)  List<String> specialties, @JsonKey(fromJson: _parseStringList)  List<String> trainingTypes,  String? minServicePrice,  double? averageRating,  String? businessCurrency,  List<TrainerLocation> locations,  List<TrainerServiceDto> services,  List<TrainerTestimonialDto> testimonials,  List<TrainerTransformationPhotoDto> transformationPhotos,  List<TrainerSocialLinkDto> socialLinks,  List<TrainerExternalLinkDto> externalLinks,  List<TrainerBenefitDto> benefits,  int reviewCount,  int clientsCoached,  List<TrainerPackageDto> packages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.role,_that.tier,_that.isLinked,_that.profilePhotoPath,_that.bannerImagePath,_that.aboutMe,_that.philosophy,_that.methodology,_that.branding,_that.certifications,_that.specialties,_that.trainingTypes,_that.minServicePrice,_that.averageRating,_that.businessCurrency,_that.locations,_that.services,_that.testimonials,_that.transformationPhotos,_that.socialLinks,_that.externalLinks,_that.benefits,_that.reviewCount,_that.clientsCoached,_that.packages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? username,  String? email,  String? role,  String? tier,  bool isLinked,  String? profilePhotoPath,  String? bannerImagePath,  String? aboutMe,  String? philosophy,  String? methodology,  String? branding,  String? certifications, @JsonKey(fromJson: _parseStringList)  List<String> specialties, @JsonKey(fromJson: _parseStringList)  List<String> trainingTypes,  String? minServicePrice,  double? averageRating,  String? businessCurrency,  List<TrainerLocation> locations,  List<TrainerServiceDto> services,  List<TrainerTestimonialDto> testimonials,  List<TrainerTransformationPhotoDto> transformationPhotos,  List<TrainerSocialLinkDto> socialLinks,  List<TrainerExternalLinkDto> externalLinks,  List<TrainerBenefitDto> benefits,  int reviewCount,  int clientsCoached,  List<TrainerPackageDto> packages)  $default,) {final _that = this;
switch (_that) {
case _TrainerDetailDto():
return $default(_that.id,_that.name,_that.username,_that.email,_that.role,_that.tier,_that.isLinked,_that.profilePhotoPath,_that.bannerImagePath,_that.aboutMe,_that.philosophy,_that.methodology,_that.branding,_that.certifications,_that.specialties,_that.trainingTypes,_that.minServicePrice,_that.averageRating,_that.businessCurrency,_that.locations,_that.services,_that.testimonials,_that.transformationPhotos,_that.socialLinks,_that.externalLinks,_that.benefits,_that.reviewCount,_that.clientsCoached,_that.packages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? username,  String? email,  String? role,  String? tier,  bool isLinked,  String? profilePhotoPath,  String? bannerImagePath,  String? aboutMe,  String? philosophy,  String? methodology,  String? branding,  String? certifications, @JsonKey(fromJson: _parseStringList)  List<String> specialties, @JsonKey(fromJson: _parseStringList)  List<String> trainingTypes,  String? minServicePrice,  double? averageRating,  String? businessCurrency,  List<TrainerLocation> locations,  List<TrainerServiceDto> services,  List<TrainerTestimonialDto> testimonials,  List<TrainerTransformationPhotoDto> transformationPhotos,  List<TrainerSocialLinkDto> socialLinks,  List<TrainerExternalLinkDto> externalLinks,  List<TrainerBenefitDto> benefits,  int reviewCount,  int clientsCoached,  List<TrainerPackageDto> packages)?  $default,) {final _that = this;
switch (_that) {
case _TrainerDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email,_that.role,_that.tier,_that.isLinked,_that.profilePhotoPath,_that.bannerImagePath,_that.aboutMe,_that.philosophy,_that.methodology,_that.branding,_that.certifications,_that.specialties,_that.trainingTypes,_that.minServicePrice,_that.averageRating,_that.businessCurrency,_that.locations,_that.services,_that.testimonials,_that.transformationPhotos,_that.socialLinks,_that.externalLinks,_that.benefits,_that.reviewCount,_that.clientsCoached,_that.packages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerDetailDto implements TrainerDetailDto {
  const _TrainerDetailDto({required this.id, this.name, this.username, this.email, this.role, this.tier, this.isLinked = false, this.profilePhotoPath, this.bannerImagePath, this.aboutMe, this.philosophy, this.methodology, this.branding, this.certifications, @JsonKey(fromJson: _parseStringList) final  List<String> specialties = const <String>[], @JsonKey(fromJson: _parseStringList) final  List<String> trainingTypes = const <String>[], this.minServicePrice, this.averageRating, this.businessCurrency, final  List<TrainerLocation> locations = const <TrainerLocation>[], final  List<TrainerServiceDto> services = const <TrainerServiceDto>[], final  List<TrainerTestimonialDto> testimonials = const <TrainerTestimonialDto>[], final  List<TrainerTransformationPhotoDto> transformationPhotos = const <TrainerTransformationPhotoDto>[], final  List<TrainerSocialLinkDto> socialLinks = const <TrainerSocialLinkDto>[], final  List<TrainerExternalLinkDto> externalLinks = const <TrainerExternalLinkDto>[], final  List<TrainerBenefitDto> benefits = const <TrainerBenefitDto>[], this.reviewCount = 0, this.clientsCoached = 0, final  List<TrainerPackageDto> packages = const <TrainerPackageDto>[]}): _specialties = specialties,_trainingTypes = trainingTypes,_locations = locations,_services = services,_testimonials = testimonials,_transformationPhotos = transformationPhotos,_socialLinks = socialLinks,_externalLinks = externalLinks,_benefits = benefits,_packages = packages;
  factory _TrainerDetailDto.fromJson(Map<String, dynamic> json) => _$TrainerDetailDtoFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? username;
@override final  String? email;
@override final  String? role;
@override final  String? tier;
@override@JsonKey() final  bool isLinked;
@override final  String? profilePhotoPath;
@override final  String? bannerImagePath;
@override final  String? aboutMe;
@override final  String? philosophy;
@override final  String? methodology;
@override final  String? branding;
@override final  String? certifications;
 final  List<String> _specialties;
@override@JsonKey(fromJson: _parseStringList) List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

 final  List<String> _trainingTypes;
@override@JsonKey(fromJson: _parseStringList) List<String> get trainingTypes {
  if (_trainingTypes is EqualUnmodifiableListView) return _trainingTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingTypes);
}

@override final  String? minServicePrice;
@override final  double? averageRating;
@override final  String? businessCurrency;
 final  List<TrainerLocation> _locations;
@override@JsonKey() List<TrainerLocation> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

 final  List<TrainerServiceDto> _services;
@override@JsonKey() List<TrainerServiceDto> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<TrainerTestimonialDto> _testimonials;
@override@JsonKey() List<TrainerTestimonialDto> get testimonials {
  if (_testimonials is EqualUnmodifiableListView) return _testimonials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testimonials);
}

 final  List<TrainerTransformationPhotoDto> _transformationPhotos;
@override@JsonKey() List<TrainerTransformationPhotoDto> get transformationPhotos {
  if (_transformationPhotos is EqualUnmodifiableListView) return _transformationPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transformationPhotos);
}

 final  List<TrainerSocialLinkDto> _socialLinks;
@override@JsonKey() List<TrainerSocialLinkDto> get socialLinks {
  if (_socialLinks is EqualUnmodifiableListView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socialLinks);
}

 final  List<TrainerExternalLinkDto> _externalLinks;
@override@JsonKey() List<TrainerExternalLinkDto> get externalLinks {
  if (_externalLinks is EqualUnmodifiableListView) return _externalLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_externalLinks);
}

 final  List<TrainerBenefitDto> _benefits;
@override@JsonKey() List<TrainerBenefitDto> get benefits {
  if (_benefits is EqualUnmodifiableListView) return _benefits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_benefits);
}

@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  int clientsCoached;
 final  List<TrainerPackageDto> _packages;
@override@JsonKey() List<TrainerPackageDto> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.role, role) || other.role == role)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.bannerImagePath, bannerImagePath) || other.bannerImagePath == bannerImagePath)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.philosophy, philosophy) || other.philosophy == philosophy)&&(identical(other.methodology, methodology) || other.methodology == methodology)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&const DeepCollectionEquality().equals(other._trainingTypes, _trainingTypes)&&(identical(other.minServicePrice, minServicePrice) || other.minServicePrice == minServicePrice)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._testimonials, _testimonials)&&const DeepCollectionEquality().equals(other._transformationPhotos, _transformationPhotos)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks)&&const DeepCollectionEquality().equals(other._externalLinks, _externalLinks)&&const DeepCollectionEquality().equals(other._benefits, _benefits)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.clientsCoached, clientsCoached) || other.clientsCoached == clientsCoached)&&const DeepCollectionEquality().equals(other._packages, _packages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,username,email,role,tier,isLinked,profilePhotoPath,bannerImagePath,aboutMe,philosophy,methodology,branding,certifications,const DeepCollectionEquality().hash(_specialties),const DeepCollectionEquality().hash(_trainingTypes),minServicePrice,averageRating,businessCurrency,const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_testimonials),const DeepCollectionEquality().hash(_transformationPhotos),const DeepCollectionEquality().hash(_socialLinks),const DeepCollectionEquality().hash(_externalLinks),const DeepCollectionEquality().hash(_benefits),reviewCount,clientsCoached,const DeepCollectionEquality().hash(_packages)]);

@override
String toString() {
  return 'TrainerDetailDto(id: $id, name: $name, username: $username, email: $email, role: $role, tier: $tier, isLinked: $isLinked, profilePhotoPath: $profilePhotoPath, bannerImagePath: $bannerImagePath, aboutMe: $aboutMe, philosophy: $philosophy, methodology: $methodology, branding: $branding, certifications: $certifications, specialties: $specialties, trainingTypes: $trainingTypes, minServicePrice: $minServicePrice, averageRating: $averageRating, businessCurrency: $businessCurrency, locations: $locations, services: $services, testimonials: $testimonials, transformationPhotos: $transformationPhotos, socialLinks: $socialLinks, externalLinks: $externalLinks, benefits: $benefits, reviewCount: $reviewCount, clientsCoached: $clientsCoached, packages: $packages)';
}


}

/// @nodoc
abstract mixin class _$TrainerDetailDtoCopyWith<$Res> implements $TrainerDetailDtoCopyWith<$Res> {
  factory _$TrainerDetailDtoCopyWith(_TrainerDetailDto value, $Res Function(_TrainerDetailDto) _then) = __$TrainerDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? username, String? email, String? role, String? tier, bool isLinked, String? profilePhotoPath, String? bannerImagePath, String? aboutMe, String? philosophy, String? methodology, String? branding, String? certifications,@JsonKey(fromJson: _parseStringList) List<String> specialties,@JsonKey(fromJson: _parseStringList) List<String> trainingTypes, String? minServicePrice, double? averageRating, String? businessCurrency, List<TrainerLocation> locations, List<TrainerServiceDto> services, List<TrainerTestimonialDto> testimonials, List<TrainerTransformationPhotoDto> transformationPhotos, List<TrainerSocialLinkDto> socialLinks, List<TrainerExternalLinkDto> externalLinks, List<TrainerBenefitDto> benefits, int reviewCount, int clientsCoached, List<TrainerPackageDto> packages
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? username = freezed,Object? email = freezed,Object? role = freezed,Object? tier = freezed,Object? isLinked = null,Object? profilePhotoPath = freezed,Object? bannerImagePath = freezed,Object? aboutMe = freezed,Object? philosophy = freezed,Object? methodology = freezed,Object? branding = freezed,Object? certifications = freezed,Object? specialties = null,Object? trainingTypes = null,Object? minServicePrice = freezed,Object? averageRating = freezed,Object? businessCurrency = freezed,Object? locations = null,Object? services = null,Object? testimonials = null,Object? transformationPhotos = null,Object? socialLinks = null,Object? externalLinks = null,Object? benefits = null,Object? reviewCount = null,Object? clientsCoached = null,Object? packages = null,}) {
  return _then(_TrainerDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,bannerImagePath: freezed == bannerImagePath ? _self.bannerImagePath : bannerImagePath // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,philosophy: freezed == philosophy ? _self.philosophy : philosophy // ignore: cast_nullable_to_non_nullable
as String?,methodology: freezed == methodology ? _self.methodology : methodology // ignore: cast_nullable_to_non_nullable
as String?,branding: freezed == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String?,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self._trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,minServicePrice: freezed == minServicePrice ? _self.minServicePrice : minServicePrice // ignore: cast_nullable_to_non_nullable
as String?,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,businessCurrency: freezed == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String?,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<TrainerLocation>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<TrainerServiceDto>,testimonials: null == testimonials ? _self._testimonials : testimonials // ignore: cast_nullable_to_non_nullable
as List<TrainerTestimonialDto>,transformationPhotos: null == transformationPhotos ? _self._transformationPhotos : transformationPhotos // ignore: cast_nullable_to_non_nullable
as List<TrainerTransformationPhotoDto>,socialLinks: null == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as List<TrainerSocialLinkDto>,externalLinks: null == externalLinks ? _self._externalLinks : externalLinks // ignore: cast_nullable_to_non_nullable
as List<TrainerExternalLinkDto>,benefits: null == benefits ? _self._benefits : benefits // ignore: cast_nullable_to_non_nullable
as List<TrainerBenefitDto>,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,clientsCoached: null == clientsCoached ? _self.clientsCoached : clientsCoached // ignore: cast_nullable_to_non_nullable
as int,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<TrainerPackageDto>,
  ));
}


}

// dart format on
