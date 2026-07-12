// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storefront_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StorefrontProfileDto {

 String get name; String? get username; String? get bio; String? get philosophy; String? get methodology; List<String> get specialties; String? get certifications; String? get avatarUrl; String? get bannerUrl; List<String> get tags; List<StorefrontPackageDto> get packages; List<StorefrontServiceDto> get services; List<StorefrontSocialLinkDto> get socialLinks; List<StorefrontExternalLinkDto> get externalLinks; List<StorefrontTestimonialDto> get testimonials; List<StorefrontPhotoDto> get transformationPhotos; double? get averageRating; int get reviewCount;
/// Create a copy of StorefrontProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontProfileDtoCopyWith<StorefrontProfileDto> get copyWith => _$StorefrontProfileDtoCopyWithImpl<StorefrontProfileDto>(this as StorefrontProfileDto, _$identity);

  /// Serializes this StorefrontProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontProfileDto&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.philosophy, philosophy) || other.philosophy == philosophy)&&(identical(other.methodology, methodology) || other.methodology == methodology)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.packages, packages)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.socialLinks, socialLinks)&&const DeepCollectionEquality().equals(other.externalLinks, externalLinks)&&const DeepCollectionEquality().equals(other.testimonials, testimonials)&&const DeepCollectionEquality().equals(other.transformationPhotos, transformationPhotos)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,bio,philosophy,methodology,const DeepCollectionEquality().hash(specialties),certifications,avatarUrl,bannerUrl,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(packages),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(socialLinks),const DeepCollectionEquality().hash(externalLinks),const DeepCollectionEquality().hash(testimonials),const DeepCollectionEquality().hash(transformationPhotos),averageRating,reviewCount);

@override
String toString() {
  return 'StorefrontProfileDto(name: $name, username: $username, bio: $bio, philosophy: $philosophy, methodology: $methodology, specialties: $specialties, certifications: $certifications, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, tags: $tags, packages: $packages, services: $services, socialLinks: $socialLinks, externalLinks: $externalLinks, testimonials: $testimonials, transformationPhotos: $transformationPhotos, averageRating: $averageRating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class $StorefrontProfileDtoCopyWith<$Res>  {
  factory $StorefrontProfileDtoCopyWith(StorefrontProfileDto value, $Res Function(StorefrontProfileDto) _then) = _$StorefrontProfileDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? username, String? bio, String? philosophy, String? methodology, List<String> specialties, String? certifications, String? avatarUrl, String? bannerUrl, List<String> tags, List<StorefrontPackageDto> packages, List<StorefrontServiceDto> services, List<StorefrontSocialLinkDto> socialLinks, List<StorefrontExternalLinkDto> externalLinks, List<StorefrontTestimonialDto> testimonials, List<StorefrontPhotoDto> transformationPhotos, double? averageRating, int reviewCount
});




}
/// @nodoc
class _$StorefrontProfileDtoCopyWithImpl<$Res>
    implements $StorefrontProfileDtoCopyWith<$Res> {
  _$StorefrontProfileDtoCopyWithImpl(this._self, this._then);

  final StorefrontProfileDto _self;
  final $Res Function(StorefrontProfileDto) _then;

/// Create a copy of StorefrontProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = freezed,Object? bio = freezed,Object? philosophy = freezed,Object? methodology = freezed,Object? specialties = null,Object? certifications = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? tags = null,Object? packages = null,Object? services = null,Object? socialLinks = null,Object? externalLinks = null,Object? testimonials = null,Object? transformationPhotos = null,Object? averageRating = freezed,Object? reviewCount = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,philosophy: freezed == philosophy ? _self.philosophy : philosophy // ignore: cast_nullable_to_non_nullable
as String?,methodology: freezed == methodology ? _self.methodology : methodology // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,packages: null == packages ? _self.packages : packages // ignore: cast_nullable_to_non_nullable
as List<StorefrontPackageDto>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<StorefrontServiceDto>,socialLinks: null == socialLinks ? _self.socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as List<StorefrontSocialLinkDto>,externalLinks: null == externalLinks ? _self.externalLinks : externalLinks // ignore: cast_nullable_to_non_nullable
as List<StorefrontExternalLinkDto>,testimonials: null == testimonials ? _self.testimonials : testimonials // ignore: cast_nullable_to_non_nullable
as List<StorefrontTestimonialDto>,transformationPhotos: null == transformationPhotos ? _self.transformationPhotos : transformationPhotos // ignore: cast_nullable_to_non_nullable
as List<StorefrontPhotoDto>,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontProfileDto].
extension StorefrontProfileDtoPatterns on StorefrontProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? username,  String? bio,  String? philosophy,  String? methodology,  List<String> specialties,  String? certifications,  String? avatarUrl,  String? bannerUrl,  List<String> tags,  List<StorefrontPackageDto> packages,  List<StorefrontServiceDto> services,  List<StorefrontSocialLinkDto> socialLinks,  List<StorefrontExternalLinkDto> externalLinks,  List<StorefrontTestimonialDto> testimonials,  List<StorefrontPhotoDto> transformationPhotos,  double? averageRating,  int reviewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontProfileDto() when $default != null:
return $default(_that.name,_that.username,_that.bio,_that.philosophy,_that.methodology,_that.specialties,_that.certifications,_that.avatarUrl,_that.bannerUrl,_that.tags,_that.packages,_that.services,_that.socialLinks,_that.externalLinks,_that.testimonials,_that.transformationPhotos,_that.averageRating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? username,  String? bio,  String? philosophy,  String? methodology,  List<String> specialties,  String? certifications,  String? avatarUrl,  String? bannerUrl,  List<String> tags,  List<StorefrontPackageDto> packages,  List<StorefrontServiceDto> services,  List<StorefrontSocialLinkDto> socialLinks,  List<StorefrontExternalLinkDto> externalLinks,  List<StorefrontTestimonialDto> testimonials,  List<StorefrontPhotoDto> transformationPhotos,  double? averageRating,  int reviewCount)  $default,) {final _that = this;
switch (_that) {
case _StorefrontProfileDto():
return $default(_that.name,_that.username,_that.bio,_that.philosophy,_that.methodology,_that.specialties,_that.certifications,_that.avatarUrl,_that.bannerUrl,_that.tags,_that.packages,_that.services,_that.socialLinks,_that.externalLinks,_that.testimonials,_that.transformationPhotos,_that.averageRating,_that.reviewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? username,  String? bio,  String? philosophy,  String? methodology,  List<String> specialties,  String? certifications,  String? avatarUrl,  String? bannerUrl,  List<String> tags,  List<StorefrontPackageDto> packages,  List<StorefrontServiceDto> services,  List<StorefrontSocialLinkDto> socialLinks,  List<StorefrontExternalLinkDto> externalLinks,  List<StorefrontTestimonialDto> testimonials,  List<StorefrontPhotoDto> transformationPhotos,  double? averageRating,  int reviewCount)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontProfileDto() when $default != null:
return $default(_that.name,_that.username,_that.bio,_that.philosophy,_that.methodology,_that.specialties,_that.certifications,_that.avatarUrl,_that.bannerUrl,_that.tags,_that.packages,_that.services,_that.socialLinks,_that.externalLinks,_that.testimonials,_that.transformationPhotos,_that.averageRating,_that.reviewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontProfileDto implements StorefrontProfileDto {
  const _StorefrontProfileDto({required this.name, this.username, this.bio, this.philosophy, this.methodology, final  List<String> specialties = const [], this.certifications, this.avatarUrl, this.bannerUrl, final  List<String> tags = const [], final  List<StorefrontPackageDto> packages = const [], final  List<StorefrontServiceDto> services = const [], final  List<StorefrontSocialLinkDto> socialLinks = const [], final  List<StorefrontExternalLinkDto> externalLinks = const [], final  List<StorefrontTestimonialDto> testimonials = const [], final  List<StorefrontPhotoDto> transformationPhotos = const [], this.averageRating, this.reviewCount = 0}): _specialties = specialties,_tags = tags,_packages = packages,_services = services,_socialLinks = socialLinks,_externalLinks = externalLinks,_testimonials = testimonials,_transformationPhotos = transformationPhotos;
  factory _StorefrontProfileDto.fromJson(Map<String, dynamic> json) => _$StorefrontProfileDtoFromJson(json);

@override final  String name;
@override final  String? username;
@override final  String? bio;
@override final  String? philosophy;
@override final  String? methodology;
 final  List<String> _specialties;
@override@JsonKey() List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

@override final  String? certifications;
@override final  String? avatarUrl;
@override final  String? bannerUrl;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<StorefrontPackageDto> _packages;
@override@JsonKey() List<StorefrontPackageDto> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}

 final  List<StorefrontServiceDto> _services;
@override@JsonKey() List<StorefrontServiceDto> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<StorefrontSocialLinkDto> _socialLinks;
@override@JsonKey() List<StorefrontSocialLinkDto> get socialLinks {
  if (_socialLinks is EqualUnmodifiableListView) return _socialLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socialLinks);
}

 final  List<StorefrontExternalLinkDto> _externalLinks;
@override@JsonKey() List<StorefrontExternalLinkDto> get externalLinks {
  if (_externalLinks is EqualUnmodifiableListView) return _externalLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_externalLinks);
}

 final  List<StorefrontTestimonialDto> _testimonials;
@override@JsonKey() List<StorefrontTestimonialDto> get testimonials {
  if (_testimonials is EqualUnmodifiableListView) return _testimonials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testimonials);
}

 final  List<StorefrontPhotoDto> _transformationPhotos;
@override@JsonKey() List<StorefrontPhotoDto> get transformationPhotos {
  if (_transformationPhotos is EqualUnmodifiableListView) return _transformationPhotos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transformationPhotos);
}

@override final  double? averageRating;
@override@JsonKey() final  int reviewCount;

/// Create a copy of StorefrontProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontProfileDtoCopyWith<_StorefrontProfileDto> get copyWith => __$StorefrontProfileDtoCopyWithImpl<_StorefrontProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontProfileDto&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.philosophy, philosophy) || other.philosophy == philosophy)&&(identical(other.methodology, methodology) || other.methodology == methodology)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&(identical(other.certifications, certifications) || other.certifications == certifications)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._packages, _packages)&&const DeepCollectionEquality().equals(other._services, _services)&&const DeepCollectionEquality().equals(other._socialLinks, _socialLinks)&&const DeepCollectionEquality().equals(other._externalLinks, _externalLinks)&&const DeepCollectionEquality().equals(other._testimonials, _testimonials)&&const DeepCollectionEquality().equals(other._transformationPhotos, _transformationPhotos)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,bio,philosophy,methodology,const DeepCollectionEquality().hash(_specialties),certifications,avatarUrl,bannerUrl,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_packages),const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_socialLinks),const DeepCollectionEquality().hash(_externalLinks),const DeepCollectionEquality().hash(_testimonials),const DeepCollectionEquality().hash(_transformationPhotos),averageRating,reviewCount);

@override
String toString() {
  return 'StorefrontProfileDto(name: $name, username: $username, bio: $bio, philosophy: $philosophy, methodology: $methodology, specialties: $specialties, certifications: $certifications, avatarUrl: $avatarUrl, bannerUrl: $bannerUrl, tags: $tags, packages: $packages, services: $services, socialLinks: $socialLinks, externalLinks: $externalLinks, testimonials: $testimonials, transformationPhotos: $transformationPhotos, averageRating: $averageRating, reviewCount: $reviewCount)';
}


}

/// @nodoc
abstract mixin class _$StorefrontProfileDtoCopyWith<$Res> implements $StorefrontProfileDtoCopyWith<$Res> {
  factory _$StorefrontProfileDtoCopyWith(_StorefrontProfileDto value, $Res Function(_StorefrontProfileDto) _then) = __$StorefrontProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? username, String? bio, String? philosophy, String? methodology, List<String> specialties, String? certifications, String? avatarUrl, String? bannerUrl, List<String> tags, List<StorefrontPackageDto> packages, List<StorefrontServiceDto> services, List<StorefrontSocialLinkDto> socialLinks, List<StorefrontExternalLinkDto> externalLinks, List<StorefrontTestimonialDto> testimonials, List<StorefrontPhotoDto> transformationPhotos, double? averageRating, int reviewCount
});




}
/// @nodoc
class __$StorefrontProfileDtoCopyWithImpl<$Res>
    implements _$StorefrontProfileDtoCopyWith<$Res> {
  __$StorefrontProfileDtoCopyWithImpl(this._self, this._then);

  final _StorefrontProfileDto _self;
  final $Res Function(_StorefrontProfileDto) _then;

/// Create a copy of StorefrontProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = freezed,Object? bio = freezed,Object? philosophy = freezed,Object? methodology = freezed,Object? specialties = null,Object? certifications = freezed,Object? avatarUrl = freezed,Object? bannerUrl = freezed,Object? tags = null,Object? packages = null,Object? services = null,Object? socialLinks = null,Object? externalLinks = null,Object? testimonials = null,Object? transformationPhotos = null,Object? averageRating = freezed,Object? reviewCount = null,}) {
  return _then(_StorefrontProfileDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,philosophy: freezed == philosophy ? _self.philosophy : philosophy // ignore: cast_nullable_to_non_nullable
as String?,methodology: freezed == methodology ? _self.methodology : methodology // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,certifications: freezed == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,packages: null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<StorefrontPackageDto>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<StorefrontServiceDto>,socialLinks: null == socialLinks ? _self._socialLinks : socialLinks // ignore: cast_nullable_to_non_nullable
as List<StorefrontSocialLinkDto>,externalLinks: null == externalLinks ? _self._externalLinks : externalLinks // ignore: cast_nullable_to_non_nullable
as List<StorefrontExternalLinkDto>,testimonials: null == testimonials ? _self._testimonials : testimonials // ignore: cast_nullable_to_non_nullable
as List<StorefrontTestimonialDto>,transformationPhotos: null == transformationPhotos ? _self._transformationPhotos : transformationPhotos // ignore: cast_nullable_to_non_nullable
as List<StorefrontPhotoDto>,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$StorefrontPackageDto {

 String get id; String get name; String? get description; String get price;@JsonKey(name: 'numberOfSessions') int? get duration;
/// Create a copy of StorefrontPackageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontPackageDtoCopyWith<StorefrontPackageDto> get copyWith => _$StorefrontPackageDtoCopyWithImpl<StorefrontPackageDto>(this as StorefrontPackageDto, _$identity);

  /// Serializes this StorefrontPackageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontPackageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,duration);

@override
String toString() {
  return 'StorefrontPackageDto(id: $id, name: $name, description: $description, price: $price, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $StorefrontPackageDtoCopyWith<$Res>  {
  factory $StorefrontPackageDtoCopyWith(StorefrontPackageDto value, $Res Function(StorefrontPackageDto) _then) = _$StorefrontPackageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String price,@JsonKey(name: 'numberOfSessions') int? duration
});




}
/// @nodoc
class _$StorefrontPackageDtoCopyWithImpl<$Res>
    implements $StorefrontPackageDtoCopyWith<$Res> {
  _$StorefrontPackageDtoCopyWithImpl(this._self, this._then);

  final StorefrontPackageDto _self;
  final $Res Function(StorefrontPackageDto) _then;

/// Create a copy of StorefrontPackageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? duration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontPackageDto].
extension StorefrontPackageDtoPatterns on StorefrontPackageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontPackageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontPackageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontPackageDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontPackageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontPackageDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontPackageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String price, @JsonKey(name: 'numberOfSessions')  int? duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontPackageDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String price, @JsonKey(name: 'numberOfSessions')  int? duration)  $default,) {final _that = this;
switch (_that) {
case _StorefrontPackageDto():
return $default(_that.id,_that.name,_that.description,_that.price,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String price, @JsonKey(name: 'numberOfSessions')  int? duration)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontPackageDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontPackageDto implements StorefrontPackageDto {
  const _StorefrontPackageDto({required this.id, required this.name, this.description, required this.price, @JsonKey(name: 'numberOfSessions') this.duration});
  factory _StorefrontPackageDto.fromJson(Map<String, dynamic> json) => _$StorefrontPackageDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String price;
@override@JsonKey(name: 'numberOfSessions') final  int? duration;

/// Create a copy of StorefrontPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontPackageDtoCopyWith<_StorefrontPackageDto> get copyWith => __$StorefrontPackageDtoCopyWithImpl<_StorefrontPackageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontPackageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontPackageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,duration);

@override
String toString() {
  return 'StorefrontPackageDto(id: $id, name: $name, description: $description, price: $price, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$StorefrontPackageDtoCopyWith<$Res> implements $StorefrontPackageDtoCopyWith<$Res> {
  factory _$StorefrontPackageDtoCopyWith(_StorefrontPackageDto value, $Res Function(_StorefrontPackageDto) _then) = __$StorefrontPackageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String price,@JsonKey(name: 'numberOfSessions') int? duration
});




}
/// @nodoc
class __$StorefrontPackageDtoCopyWithImpl<$Res>
    implements _$StorefrontPackageDtoCopyWith<$Res> {
  __$StorefrontPackageDtoCopyWithImpl(this._self, this._then);

  final _StorefrontPackageDto _self;
  final $Res Function(_StorefrontPackageDto) _then;

/// Create a copy of StorefrontPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? duration = freezed,}) {
  return _then(_StorefrontPackageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$StorefrontServiceDto {

 String get id;@JsonKey(name: 'title') String get name; String? get description; String? get price;
/// Create a copy of StorefrontServiceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontServiceDtoCopyWith<StorefrontServiceDto> get copyWith => _$StorefrontServiceDtoCopyWithImpl<StorefrontServiceDto>(this as StorefrontServiceDto, _$identity);

  /// Serializes this StorefrontServiceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontServiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price);

@override
String toString() {
  return 'StorefrontServiceDto(id: $id, name: $name, description: $description, price: $price)';
}


}

/// @nodoc
abstract mixin class $StorefrontServiceDtoCopyWith<$Res>  {
  factory $StorefrontServiceDtoCopyWith(StorefrontServiceDto value, $Res Function(StorefrontServiceDto) _then) = _$StorefrontServiceDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'title') String name, String? description, String? price
});




}
/// @nodoc
class _$StorefrontServiceDtoCopyWithImpl<$Res>
    implements $StorefrontServiceDtoCopyWith<$Res> {
  _$StorefrontServiceDtoCopyWithImpl(this._self, this._then);

  final StorefrontServiceDto _self;
  final $Res Function(StorefrontServiceDto) _then;

/// Create a copy of StorefrontServiceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontServiceDto].
extension StorefrontServiceDtoPatterns on StorefrontServiceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontServiceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontServiceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontServiceDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontServiceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontServiceDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontServiceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title')  String name,  String? description,  String? price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontServiceDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'title')  String name,  String? description,  String? price)  $default,) {final _that = this;
switch (_that) {
case _StorefrontServiceDto():
return $default(_that.id,_that.name,_that.description,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'title')  String name,  String? description,  String? price)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontServiceDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontServiceDto implements StorefrontServiceDto {
  const _StorefrontServiceDto({required this.id, @JsonKey(name: 'title') required this.name, this.description, this.price});
  factory _StorefrontServiceDto.fromJson(Map<String, dynamic> json) => _$StorefrontServiceDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'title') final  String name;
@override final  String? description;
@override final  String? price;

/// Create a copy of StorefrontServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontServiceDtoCopyWith<_StorefrontServiceDto> get copyWith => __$StorefrontServiceDtoCopyWithImpl<_StorefrontServiceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontServiceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontServiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price);

@override
String toString() {
  return 'StorefrontServiceDto(id: $id, name: $name, description: $description, price: $price)';
}


}

/// @nodoc
abstract mixin class _$StorefrontServiceDtoCopyWith<$Res> implements $StorefrontServiceDtoCopyWith<$Res> {
  factory _$StorefrontServiceDtoCopyWith(_StorefrontServiceDto value, $Res Function(_StorefrontServiceDto) _then) = __$StorefrontServiceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'title') String name, String? description, String? price
});




}
/// @nodoc
class __$StorefrontServiceDtoCopyWithImpl<$Res>
    implements _$StorefrontServiceDtoCopyWith<$Res> {
  __$StorefrontServiceDtoCopyWithImpl(this._self, this._then);

  final _StorefrontServiceDto _self;
  final $Res Function(_StorefrontServiceDto) _then;

/// Create a copy of StorefrontServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = freezed,}) {
  return _then(_StorefrontServiceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StorefrontSocialLinkDto {

 String get id; String get platform; String get url;
/// Create a copy of StorefrontSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontSocialLinkDtoCopyWith<StorefrontSocialLinkDto> get copyWith => _$StorefrontSocialLinkDtoCopyWithImpl<StorefrontSocialLinkDto>(this as StorefrontSocialLinkDto, _$identity);

  /// Serializes this StorefrontSocialLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontSocialLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,url);

@override
String toString() {
  return 'StorefrontSocialLinkDto(id: $id, platform: $platform, url: $url)';
}


}

/// @nodoc
abstract mixin class $StorefrontSocialLinkDtoCopyWith<$Res>  {
  factory $StorefrontSocialLinkDtoCopyWith(StorefrontSocialLinkDto value, $Res Function(StorefrontSocialLinkDto) _then) = _$StorefrontSocialLinkDtoCopyWithImpl;
@useResult
$Res call({
 String id, String platform, String url
});




}
/// @nodoc
class _$StorefrontSocialLinkDtoCopyWithImpl<$Res>
    implements $StorefrontSocialLinkDtoCopyWith<$Res> {
  _$StorefrontSocialLinkDtoCopyWithImpl(this._self, this._then);

  final StorefrontSocialLinkDto _self;
  final $Res Function(StorefrontSocialLinkDto) _then;

/// Create a copy of StorefrontSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? platform = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontSocialLinkDto].
extension StorefrontSocialLinkDtoPatterns on StorefrontSocialLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontSocialLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontSocialLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontSocialLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontSocialLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontSocialLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontSocialLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String platform,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontSocialLinkDto() when $default != null:
return $default(_that.id,_that.platform,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String platform,  String url)  $default,) {final _that = this;
switch (_that) {
case _StorefrontSocialLinkDto():
return $default(_that.id,_that.platform,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String platform,  String url)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontSocialLinkDto() when $default != null:
return $default(_that.id,_that.platform,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontSocialLinkDto implements StorefrontSocialLinkDto {
  const _StorefrontSocialLinkDto({required this.id, required this.platform, required this.url});
  factory _StorefrontSocialLinkDto.fromJson(Map<String, dynamic> json) => _$StorefrontSocialLinkDtoFromJson(json);

@override final  String id;
@override final  String platform;
@override final  String url;

/// Create a copy of StorefrontSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontSocialLinkDtoCopyWith<_StorefrontSocialLinkDto> get copyWith => __$StorefrontSocialLinkDtoCopyWithImpl<_StorefrontSocialLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontSocialLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontSocialLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,url);

@override
String toString() {
  return 'StorefrontSocialLinkDto(id: $id, platform: $platform, url: $url)';
}


}

/// @nodoc
abstract mixin class _$StorefrontSocialLinkDtoCopyWith<$Res> implements $StorefrontSocialLinkDtoCopyWith<$Res> {
  factory _$StorefrontSocialLinkDtoCopyWith(_StorefrontSocialLinkDto value, $Res Function(_StorefrontSocialLinkDto) _then) = __$StorefrontSocialLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String platform, String url
});




}
/// @nodoc
class __$StorefrontSocialLinkDtoCopyWithImpl<$Res>
    implements _$StorefrontSocialLinkDtoCopyWith<$Res> {
  __$StorefrontSocialLinkDtoCopyWithImpl(this._self, this._then);

  final _StorefrontSocialLinkDto _self;
  final $Res Function(_StorefrontSocialLinkDto) _then;

/// Create a copy of StorefrontSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? platform = null,Object? url = null,}) {
  return _then(_StorefrontSocialLinkDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StorefrontExternalLinkDto {

 String get id; String get label; String get url;
/// Create a copy of StorefrontExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontExternalLinkDtoCopyWith<StorefrontExternalLinkDto> get copyWith => _$StorefrontExternalLinkDtoCopyWithImpl<StorefrontExternalLinkDto>(this as StorefrontExternalLinkDto, _$identity);

  /// Serializes this StorefrontExternalLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontExternalLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,url);

@override
String toString() {
  return 'StorefrontExternalLinkDto(id: $id, label: $label, url: $url)';
}


}

/// @nodoc
abstract mixin class $StorefrontExternalLinkDtoCopyWith<$Res>  {
  factory $StorefrontExternalLinkDtoCopyWith(StorefrontExternalLinkDto value, $Res Function(StorefrontExternalLinkDto) _then) = _$StorefrontExternalLinkDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label, String url
});




}
/// @nodoc
class _$StorefrontExternalLinkDtoCopyWithImpl<$Res>
    implements $StorefrontExternalLinkDtoCopyWith<$Res> {
  _$StorefrontExternalLinkDtoCopyWithImpl(this._self, this._then);

  final StorefrontExternalLinkDto _self;
  final $Res Function(StorefrontExternalLinkDto) _then;

/// Create a copy of StorefrontExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? url = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontExternalLinkDto].
extension StorefrontExternalLinkDtoPatterns on StorefrontExternalLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontExternalLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontExternalLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontExternalLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontExternalLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontExternalLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontExternalLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontExternalLinkDto() when $default != null:
return $default(_that.id,_that.label,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String url)  $default,) {final _that = this;
switch (_that) {
case _StorefrontExternalLinkDto():
return $default(_that.id,_that.label,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String url)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontExternalLinkDto() when $default != null:
return $default(_that.id,_that.label,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontExternalLinkDto implements StorefrontExternalLinkDto {
  const _StorefrontExternalLinkDto({required this.id, required this.label, required this.url});
  factory _StorefrontExternalLinkDto.fromJson(Map<String, dynamic> json) => _$StorefrontExternalLinkDtoFromJson(json);

@override final  String id;
@override final  String label;
@override final  String url;

/// Create a copy of StorefrontExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontExternalLinkDtoCopyWith<_StorefrontExternalLinkDto> get copyWith => __$StorefrontExternalLinkDtoCopyWithImpl<_StorefrontExternalLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontExternalLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontExternalLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,url);

@override
String toString() {
  return 'StorefrontExternalLinkDto(id: $id, label: $label, url: $url)';
}


}

/// @nodoc
abstract mixin class _$StorefrontExternalLinkDtoCopyWith<$Res> implements $StorefrontExternalLinkDtoCopyWith<$Res> {
  factory _$StorefrontExternalLinkDtoCopyWith(_StorefrontExternalLinkDto value, $Res Function(_StorefrontExternalLinkDto) _then) = __$StorefrontExternalLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String url
});




}
/// @nodoc
class __$StorefrontExternalLinkDtoCopyWithImpl<$Res>
    implements _$StorefrontExternalLinkDtoCopyWith<$Res> {
  __$StorefrontExternalLinkDtoCopyWithImpl(this._self, this._then);

  final _StorefrontExternalLinkDto _self;
  final $Res Function(_StorefrontExternalLinkDto) _then;

/// Create a copy of StorefrontExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? url = null,}) {
  return _then(_StorefrontExternalLinkDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$StorefrontTestimonialDto {

 String get id; String get clientName;@JsonKey(name: 'testimonialText') String get text; double? get rating;@JsonKey(name: 'createdAt') String? get date;
/// Create a copy of StorefrontTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontTestimonialDtoCopyWith<StorefrontTestimonialDto> get copyWith => _$StorefrontTestimonialDtoCopyWithImpl<StorefrontTestimonialDto>(this as StorefrontTestimonialDto, _$identity);

  /// Serializes this StorefrontTestimonialDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontTestimonialDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.text, text) || other.text == text)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientName,text,rating,date);

@override
String toString() {
  return 'StorefrontTestimonialDto(id: $id, clientName: $clientName, text: $text, rating: $rating, date: $date)';
}


}

/// @nodoc
abstract mixin class $StorefrontTestimonialDtoCopyWith<$Res>  {
  factory $StorefrontTestimonialDtoCopyWith(StorefrontTestimonialDto value, $Res Function(StorefrontTestimonialDto) _then) = _$StorefrontTestimonialDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientName,@JsonKey(name: 'testimonialText') String text, double? rating,@JsonKey(name: 'createdAt') String? date
});




}
/// @nodoc
class _$StorefrontTestimonialDtoCopyWithImpl<$Res>
    implements $StorefrontTestimonialDtoCopyWith<$Res> {
  _$StorefrontTestimonialDtoCopyWithImpl(this._self, this._then);

  final StorefrontTestimonialDto _self;
  final $Res Function(StorefrontTestimonialDto) _then;

/// Create a copy of StorefrontTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientName = null,Object? text = null,Object? rating = freezed,Object? date = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontTestimonialDto].
extension StorefrontTestimonialDtoPatterns on StorefrontTestimonialDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontTestimonialDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontTestimonialDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontTestimonialDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontTestimonialDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontTestimonialDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontTestimonialDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientName, @JsonKey(name: 'testimonialText')  String text,  double? rating, @JsonKey(name: 'createdAt')  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontTestimonialDto() when $default != null:
return $default(_that.id,_that.clientName,_that.text,_that.rating,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientName, @JsonKey(name: 'testimonialText')  String text,  double? rating, @JsonKey(name: 'createdAt')  String? date)  $default,) {final _that = this;
switch (_that) {
case _StorefrontTestimonialDto():
return $default(_that.id,_that.clientName,_that.text,_that.rating,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientName, @JsonKey(name: 'testimonialText')  String text,  double? rating, @JsonKey(name: 'createdAt')  String? date)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontTestimonialDto() when $default != null:
return $default(_that.id,_that.clientName,_that.text,_that.rating,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontTestimonialDto implements StorefrontTestimonialDto {
  const _StorefrontTestimonialDto({required this.id, required this.clientName, @JsonKey(name: 'testimonialText') required this.text, this.rating, @JsonKey(name: 'createdAt') this.date});
  factory _StorefrontTestimonialDto.fromJson(Map<String, dynamic> json) => _$StorefrontTestimonialDtoFromJson(json);

@override final  String id;
@override final  String clientName;
@override@JsonKey(name: 'testimonialText') final  String text;
@override final  double? rating;
@override@JsonKey(name: 'createdAt') final  String? date;

/// Create a copy of StorefrontTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontTestimonialDtoCopyWith<_StorefrontTestimonialDto> get copyWith => __$StorefrontTestimonialDtoCopyWithImpl<_StorefrontTestimonialDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontTestimonialDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontTestimonialDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.text, text) || other.text == text)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientName,text,rating,date);

@override
String toString() {
  return 'StorefrontTestimonialDto(id: $id, clientName: $clientName, text: $text, rating: $rating, date: $date)';
}


}

/// @nodoc
abstract mixin class _$StorefrontTestimonialDtoCopyWith<$Res> implements $StorefrontTestimonialDtoCopyWith<$Res> {
  factory _$StorefrontTestimonialDtoCopyWith(_StorefrontTestimonialDto value, $Res Function(_StorefrontTestimonialDto) _then) = __$StorefrontTestimonialDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientName,@JsonKey(name: 'testimonialText') String text, double? rating,@JsonKey(name: 'createdAt') String? date
});




}
/// @nodoc
class __$StorefrontTestimonialDtoCopyWithImpl<$Res>
    implements _$StorefrontTestimonialDtoCopyWith<$Res> {
  __$StorefrontTestimonialDtoCopyWithImpl(this._self, this._then);

  final _StorefrontTestimonialDto _self;
  final $Res Function(_StorefrontTestimonialDto) _then;

/// Create a copy of StorefrontTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientName = null,Object? text = null,Object? rating = freezed,Object? date = freezed,}) {
  return _then(_StorefrontTestimonialDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StorefrontPhotoDto {

 String get id;@JsonKey(name: 'publicUrl') String get url; String? get caption;
/// Create a copy of StorefrontPhotoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorefrontPhotoDtoCopyWith<StorefrontPhotoDto> get copyWith => _$StorefrontPhotoDtoCopyWithImpl<StorefrontPhotoDto>(this as StorefrontPhotoDto, _$identity);

  /// Serializes this StorefrontPhotoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorefrontPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,caption);

@override
String toString() {
  return 'StorefrontPhotoDto(id: $id, url: $url, caption: $caption)';
}


}

/// @nodoc
abstract mixin class $StorefrontPhotoDtoCopyWith<$Res>  {
  factory $StorefrontPhotoDtoCopyWith(StorefrontPhotoDto value, $Res Function(StorefrontPhotoDto) _then) = _$StorefrontPhotoDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'publicUrl') String url, String? caption
});




}
/// @nodoc
class _$StorefrontPhotoDtoCopyWithImpl<$Res>
    implements $StorefrontPhotoDtoCopyWith<$Res> {
  _$StorefrontPhotoDtoCopyWithImpl(this._self, this._then);

  final StorefrontPhotoDto _self;
  final $Res Function(StorefrontPhotoDto) _then;

/// Create a copy of StorefrontPhotoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? caption = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StorefrontPhotoDto].
extension StorefrontPhotoDtoPatterns on StorefrontPhotoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StorefrontPhotoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StorefrontPhotoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StorefrontPhotoDto value)  $default,){
final _that = this;
switch (_that) {
case _StorefrontPhotoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StorefrontPhotoDto value)?  $default,){
final _that = this;
switch (_that) {
case _StorefrontPhotoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'publicUrl')  String url,  String? caption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StorefrontPhotoDto() when $default != null:
return $default(_that.id,_that.url,_that.caption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'publicUrl')  String url,  String? caption)  $default,) {final _that = this;
switch (_that) {
case _StorefrontPhotoDto():
return $default(_that.id,_that.url,_that.caption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'publicUrl')  String url,  String? caption)?  $default,) {final _that = this;
switch (_that) {
case _StorefrontPhotoDto() when $default != null:
return $default(_that.id,_that.url,_that.caption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StorefrontPhotoDto implements StorefrontPhotoDto {
  const _StorefrontPhotoDto({required this.id, @JsonKey(name: 'publicUrl') required this.url, this.caption});
  factory _StorefrontPhotoDto.fromJson(Map<String, dynamic> json) => _$StorefrontPhotoDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'publicUrl') final  String url;
@override final  String? caption;

/// Create a copy of StorefrontPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StorefrontPhotoDtoCopyWith<_StorefrontPhotoDto> get copyWith => __$StorefrontPhotoDtoCopyWithImpl<_StorefrontPhotoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StorefrontPhotoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StorefrontPhotoDto&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.caption, caption) || other.caption == caption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,caption);

@override
String toString() {
  return 'StorefrontPhotoDto(id: $id, url: $url, caption: $caption)';
}


}

/// @nodoc
abstract mixin class _$StorefrontPhotoDtoCopyWith<$Res> implements $StorefrontPhotoDtoCopyWith<$Res> {
  factory _$StorefrontPhotoDtoCopyWith(_StorefrontPhotoDto value, $Res Function(_StorefrontPhotoDto) _then) = __$StorefrontPhotoDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'publicUrl') String url, String? caption
});




}
/// @nodoc
class __$StorefrontPhotoDtoCopyWithImpl<$Res>
    implements _$StorefrontPhotoDtoCopyWith<$Res> {
  __$StorefrontPhotoDtoCopyWithImpl(this._self, this._then);

  final _StorefrontPhotoDto _self;
  final $Res Function(_StorefrontPhotoDto) _then;

/// Create a copy of StorefrontPhotoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? caption = freezed,}) {
  return _then(_StorefrontPhotoDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
