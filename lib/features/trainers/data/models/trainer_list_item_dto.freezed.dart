// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_list_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerProfileSummary {

 String? get profilePhotoPath; List<String> get certifications; List<dynamic> get locations; List<dynamic> get services; double? get averageRating; String? get businessCurrency; String? get name; String? get bio;
/// Create a copy of TrainerProfileSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerProfileSummaryCopyWith<TrainerProfileSummary> get copyWith => _$TrainerProfileSummaryCopyWithImpl<TrainerProfileSummary>(this as TrainerProfileSummary, _$identity);

  /// Serializes this TrainerProfileSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProfileSummary&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&const DeepCollectionEquality().equals(other.certifications, certifications)&&const DeepCollectionEquality().equals(other.locations, locations)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profilePhotoPath,const DeepCollectionEquality().hash(certifications),const DeepCollectionEquality().hash(locations),const DeepCollectionEquality().hash(services),averageRating,businessCurrency,name,bio);

@override
String toString() {
  return 'TrainerProfileSummary(profilePhotoPath: $profilePhotoPath, certifications: $certifications, locations: $locations, services: $services, averageRating: $averageRating, businessCurrency: $businessCurrency, name: $name, bio: $bio)';
}


}

/// @nodoc
abstract mixin class $TrainerProfileSummaryCopyWith<$Res>  {
  factory $TrainerProfileSummaryCopyWith(TrainerProfileSummary value, $Res Function(TrainerProfileSummary) _then) = _$TrainerProfileSummaryCopyWithImpl;
@useResult
$Res call({
 String? profilePhotoPath, List<String> certifications, List<dynamic> locations, List<dynamic> services, double? averageRating, String? businessCurrency, String? name, String? bio
});




}
/// @nodoc
class _$TrainerProfileSummaryCopyWithImpl<$Res>
    implements $TrainerProfileSummaryCopyWith<$Res> {
  _$TrainerProfileSummaryCopyWithImpl(this._self, this._then);

  final TrainerProfileSummary _self;
  final $Res Function(TrainerProfileSummary) _then;

/// Create a copy of TrainerProfileSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profilePhotoPath = freezed,Object? certifications = null,Object? locations = null,Object? services = null,Object? averageRating = freezed,Object? businessCurrency = freezed,Object? name = freezed,Object? bio = freezed,}) {
  return _then(_self.copyWith(
profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,certifications: null == certifications ? _self.certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>,locations: null == locations ? _self.locations : locations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<dynamic>,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,businessCurrency: freezed == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerProfileSummary].
extension TrainerProfileSummaryPatterns on TrainerProfileSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerProfileSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerProfileSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerProfileSummary value)  $default,){
final _that = this;
switch (_that) {
case _TrainerProfileSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerProfileSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerProfileSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? profilePhotoPath,  List<String> certifications,  List<dynamic> locations,  List<dynamic> services,  double? averageRating,  String? businessCurrency,  String? name,  String? bio)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerProfileSummary() when $default != null:
return $default(_that.profilePhotoPath,_that.certifications,_that.locations,_that.services,_that.averageRating,_that.businessCurrency,_that.name,_that.bio);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? profilePhotoPath,  List<String> certifications,  List<dynamic> locations,  List<dynamic> services,  double? averageRating,  String? businessCurrency,  String? name,  String? bio)  $default,) {final _that = this;
switch (_that) {
case _TrainerProfileSummary():
return $default(_that.profilePhotoPath,_that.certifications,_that.locations,_that.services,_that.averageRating,_that.businessCurrency,_that.name,_that.bio);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? profilePhotoPath,  List<String> certifications,  List<dynamic> locations,  List<dynamic> services,  double? averageRating,  String? businessCurrency,  String? name,  String? bio)?  $default,) {final _that = this;
switch (_that) {
case _TrainerProfileSummary() when $default != null:
return $default(_that.profilePhotoPath,_that.certifications,_that.locations,_that.services,_that.averageRating,_that.businessCurrency,_that.name,_that.bio);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerProfileSummary implements TrainerProfileSummary {
  const _TrainerProfileSummary({this.profilePhotoPath, final  List<String> certifications = const <String>[], final  List<dynamic> locations = const <dynamic>[], final  List<dynamic> services = const <dynamic>[], this.averageRating, this.businessCurrency, this.name, this.bio}): _certifications = certifications,_locations = locations,_services = services;
  factory _TrainerProfileSummary.fromJson(Map<String, dynamic> json) => _$TrainerProfileSummaryFromJson(json);

@override final  String? profilePhotoPath;
 final  List<String> _certifications;
@override@JsonKey() List<String> get certifications {
  if (_certifications is EqualUnmodifiableListView) return _certifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_certifications);
}

 final  List<dynamic> _locations;
@override@JsonKey() List<dynamic> get locations {
  if (_locations is EqualUnmodifiableListView) return _locations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_locations);
}

 final  List<dynamic> _services;
@override@JsonKey() List<dynamic> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override final  double? averageRating;
@override final  String? businessCurrency;
@override final  String? name;
@override final  String? bio;

/// Create a copy of TrainerProfileSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerProfileSummaryCopyWith<_TrainerProfileSummary> get copyWith => __$TrainerProfileSummaryCopyWithImpl<_TrainerProfileSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerProfileSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerProfileSummary&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&const DeepCollectionEquality().equals(other._certifications, _certifications)&&const DeepCollectionEquality().equals(other._locations, _locations)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.businessCurrency, businessCurrency) || other.businessCurrency == businessCurrency)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,profilePhotoPath,const DeepCollectionEquality().hash(_certifications),const DeepCollectionEquality().hash(_locations),const DeepCollectionEquality().hash(_services),averageRating,businessCurrency,name,bio);

@override
String toString() {
  return 'TrainerProfileSummary(profilePhotoPath: $profilePhotoPath, certifications: $certifications, locations: $locations, services: $services, averageRating: $averageRating, businessCurrency: $businessCurrency, name: $name, bio: $bio)';
}


}

/// @nodoc
abstract mixin class _$TrainerProfileSummaryCopyWith<$Res> implements $TrainerProfileSummaryCopyWith<$Res> {
  factory _$TrainerProfileSummaryCopyWith(_TrainerProfileSummary value, $Res Function(_TrainerProfileSummary) _then) = __$TrainerProfileSummaryCopyWithImpl;
@override @useResult
$Res call({
 String? profilePhotoPath, List<String> certifications, List<dynamic> locations, List<dynamic> services, double? averageRating, String? businessCurrency, String? name, String? bio
});




}
/// @nodoc
class __$TrainerProfileSummaryCopyWithImpl<$Res>
    implements _$TrainerProfileSummaryCopyWith<$Res> {
  __$TrainerProfileSummaryCopyWithImpl(this._self, this._then);

  final _TrainerProfileSummary _self;
  final $Res Function(_TrainerProfileSummary) _then;

/// Create a copy of TrainerProfileSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profilePhotoPath = freezed,Object? certifications = null,Object? locations = null,Object? services = null,Object? averageRating = freezed,Object? businessCurrency = freezed,Object? name = freezed,Object? bio = freezed,}) {
  return _then(_TrainerProfileSummary(
profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,certifications: null == certifications ? _self._certifications : certifications // ignore: cast_nullable_to_non_nullable
as List<String>,locations: null == locations ? _self._locations : locations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<dynamic>,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,businessCurrency: freezed == businessCurrency ? _self.businessCurrency : businessCurrency // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TrainerStats {

 int get reviewCount; int get clientsCoached;
/// Create a copy of TrainerStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerStatsCopyWith<TrainerStats> get copyWith => _$TrainerStatsCopyWithImpl<TrainerStats>(this as TrainerStats, _$identity);

  /// Serializes this TrainerStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerStats&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.clientsCoached, clientsCoached) || other.clientsCoached == clientsCoached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewCount,clientsCoached);

@override
String toString() {
  return 'TrainerStats(reviewCount: $reviewCount, clientsCoached: $clientsCoached)';
}


}

/// @nodoc
abstract mixin class $TrainerStatsCopyWith<$Res>  {
  factory $TrainerStatsCopyWith(TrainerStats value, $Res Function(TrainerStats) _then) = _$TrainerStatsCopyWithImpl;
@useResult
$Res call({
 int reviewCount, int clientsCoached
});




}
/// @nodoc
class _$TrainerStatsCopyWithImpl<$Res>
    implements $TrainerStatsCopyWith<$Res> {
  _$TrainerStatsCopyWithImpl(this._self, this._then);

  final TrainerStats _self;
  final $Res Function(TrainerStats) _then;

/// Create a copy of TrainerStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reviewCount = null,Object? clientsCoached = null,}) {
  return _then(_self.copyWith(
reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,clientsCoached: null == clientsCoached ? _self.clientsCoached : clientsCoached // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerStats].
extension TrainerStatsPatterns on TrainerStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerStats value)  $default,){
final _that = this;
switch (_that) {
case _TrainerStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerStats value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int reviewCount,  int clientsCoached)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerStats() when $default != null:
return $default(_that.reviewCount,_that.clientsCoached);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int reviewCount,  int clientsCoached)  $default,) {final _that = this;
switch (_that) {
case _TrainerStats():
return $default(_that.reviewCount,_that.clientsCoached);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int reviewCount,  int clientsCoached)?  $default,) {final _that = this;
switch (_that) {
case _TrainerStats() when $default != null:
return $default(_that.reviewCount,_that.clientsCoached);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerStats implements TrainerStats {
  const _TrainerStats({this.reviewCount = 0, this.clientsCoached = 0});
  factory _TrainerStats.fromJson(Map<String, dynamic> json) => _$TrainerStatsFromJson(json);

@override@JsonKey() final  int reviewCount;
@override@JsonKey() final  int clientsCoached;

/// Create a copy of TrainerStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerStatsCopyWith<_TrainerStats> get copyWith => __$TrainerStatsCopyWithImpl<_TrainerStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerStats&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.clientsCoached, clientsCoached) || other.clientsCoached == clientsCoached));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reviewCount,clientsCoached);

@override
String toString() {
  return 'TrainerStats(reviewCount: $reviewCount, clientsCoached: $clientsCoached)';
}


}

/// @nodoc
abstract mixin class _$TrainerStatsCopyWith<$Res> implements $TrainerStatsCopyWith<$Res> {
  factory _$TrainerStatsCopyWith(_TrainerStats value, $Res Function(_TrainerStats) _then) = __$TrainerStatsCopyWithImpl;
@override @useResult
$Res call({
 int reviewCount, int clientsCoached
});




}
/// @nodoc
class __$TrainerStatsCopyWithImpl<$Res>
    implements _$TrainerStatsCopyWith<$Res> {
  __$TrainerStatsCopyWithImpl(this._self, this._then);

  final _TrainerStats _self;
  final $Res Function(_TrainerStats) _then;

/// Create a copy of TrainerStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reviewCount = null,Object? clientsCoached = null,}) {
  return _then(_TrainerStats(
reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,clientsCoached: null == clientsCoached ? _self.clientsCoached : clientsCoached // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TrainerListItemDto {

 String get id; String get username; TrainerProfileSummary? get profile; TrainerStats? get stats; double? get distance; bool get isLinked;
/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListItemDtoCopyWith<TrainerListItemDto> get copyWith => _$TrainerListItemDtoCopyWithImpl<TrainerListItemDto>(this as TrainerListItemDto, _$identity);

  /// Serializes this TrainerListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profile,stats,distance,isLinked);

@override
String toString() {
  return 'TrainerListItemDto(id: $id, username: $username, profile: $profile, stats: $stats, distance: $distance, isLinked: $isLinked)';
}


}

/// @nodoc
abstract mixin class $TrainerListItemDtoCopyWith<$Res>  {
  factory $TrainerListItemDtoCopyWith(TrainerListItemDto value, $Res Function(TrainerListItemDto) _then) = _$TrainerListItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String username, TrainerProfileSummary? profile, TrainerStats? stats, double? distance, bool isLinked
});


$TrainerProfileSummaryCopyWith<$Res>? get profile;$TrainerStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class _$TrainerListItemDtoCopyWithImpl<$Res>
    implements $TrainerListItemDtoCopyWith<$Res> {
  _$TrainerListItemDtoCopyWithImpl(this._self, this._then);

  final TrainerListItemDto _self;
  final $Res Function(TrainerListItemDto) _then;

/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? profile = freezed,Object? stats = freezed,Object? distance = freezed,Object? isLinked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as TrainerProfileSummary?,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as TrainerStats?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerProfileSummaryCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $TrainerProfileSummaryCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $TrainerStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainerListItemDto].
extension TrainerListItemDtoPatterns on TrainerListItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerListItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerListItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerListItemDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerListItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerListItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerListItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  TrainerProfileSummary? profile,  TrainerStats? stats,  double? distance,  bool isLinked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerListItemDto() when $default != null:
return $default(_that.id,_that.username,_that.profile,_that.stats,_that.distance,_that.isLinked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  TrainerProfileSummary? profile,  TrainerStats? stats,  double? distance,  bool isLinked)  $default,) {final _that = this;
switch (_that) {
case _TrainerListItemDto():
return $default(_that.id,_that.username,_that.profile,_that.stats,_that.distance,_that.isLinked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  TrainerProfileSummary? profile,  TrainerStats? stats,  double? distance,  bool isLinked)?  $default,) {final _that = this;
switch (_that) {
case _TrainerListItemDto() when $default != null:
return $default(_that.id,_that.username,_that.profile,_that.stats,_that.distance,_that.isLinked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerListItemDto implements TrainerListItemDto {
  const _TrainerListItemDto({required this.id, required this.username, this.profile, this.stats, this.distance, this.isLinked = false});
  factory _TrainerListItemDto.fromJson(Map<String, dynamic> json) => _$TrainerListItemDtoFromJson(json);

@override final  String id;
@override final  String username;
@override final  TrainerProfileSummary? profile;
@override final  TrainerStats? stats;
@override final  double? distance;
@override@JsonKey() final  bool isLinked;

/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerListItemDtoCopyWith<_TrainerListItemDto> get copyWith => __$TrainerListItemDtoCopyWithImpl<_TrainerListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerListItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.stats, stats) || other.stats == stats)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.isLinked, isLinked) || other.isLinked == isLinked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,profile,stats,distance,isLinked);

@override
String toString() {
  return 'TrainerListItemDto(id: $id, username: $username, profile: $profile, stats: $stats, distance: $distance, isLinked: $isLinked)';
}


}

/// @nodoc
abstract mixin class _$TrainerListItemDtoCopyWith<$Res> implements $TrainerListItemDtoCopyWith<$Res> {
  factory _$TrainerListItemDtoCopyWith(_TrainerListItemDto value, $Res Function(_TrainerListItemDto) _then) = __$TrainerListItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, TrainerProfileSummary? profile, TrainerStats? stats, double? distance, bool isLinked
});


@override $TrainerProfileSummaryCopyWith<$Res>? get profile;@override $TrainerStatsCopyWith<$Res>? get stats;

}
/// @nodoc
class __$TrainerListItemDtoCopyWithImpl<$Res>
    implements _$TrainerListItemDtoCopyWith<$Res> {
  __$TrainerListItemDtoCopyWithImpl(this._self, this._then);

  final _TrainerListItemDto _self;
  final $Res Function(_TrainerListItemDto) _then;

/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? profile = freezed,Object? stats = freezed,Object? distance = freezed,Object? isLinked = null,}) {
  return _then(_TrainerListItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as TrainerProfileSummary?,stats: freezed == stats ? _self.stats : stats // ignore: cast_nullable_to_non_nullable
as TrainerStats?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,isLinked: null == isLinked ? _self.isLinked : isLinked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerProfileSummaryCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $TrainerProfileSummaryCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of TrainerListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerStatsCopyWith<$Res>? get stats {
    if (_self.stats == null) {
    return null;
  }

  return $TrainerStatsCopyWith<$Res>(_self.stats!, (value) {
    return _then(_self.copyWith(stats: value));
  });
}
}


/// @nodoc
mixin _$TrainerListResponse {

 List<TrainerListItemDto> get trainers; int get totalTrainers; int get currentPage; int get totalPages;
/// Create a copy of TrainerListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListResponseCopyWith<TrainerListResponse> get copyWith => _$TrainerListResponseCopyWithImpl<TrainerListResponse>(this as TrainerListResponse, _$identity);

  /// Serializes this TrainerListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListResponse&&const DeepCollectionEquality().equals(other.trainers, trainers)&&(identical(other.totalTrainers, totalTrainers) || other.totalTrainers == totalTrainers)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(trainers),totalTrainers,currentPage,totalPages);

@override
String toString() {
  return 'TrainerListResponse(trainers: $trainers, totalTrainers: $totalTrainers, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class $TrainerListResponseCopyWith<$Res>  {
  factory $TrainerListResponseCopyWith(TrainerListResponse value, $Res Function(TrainerListResponse) _then) = _$TrainerListResponseCopyWithImpl;
@useResult
$Res call({
 List<TrainerListItemDto> trainers, int totalTrainers, int currentPage, int totalPages
});




}
/// @nodoc
class _$TrainerListResponseCopyWithImpl<$Res>
    implements $TrainerListResponseCopyWith<$Res> {
  _$TrainerListResponseCopyWithImpl(this._self, this._then);

  final TrainerListResponse _self;
  final $Res Function(TrainerListResponse) _then;

/// Create a copy of TrainerListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? trainers = null,Object? totalTrainers = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_self.copyWith(
trainers: null == trainers ? _self.trainers : trainers // ignore: cast_nullable_to_non_nullable
as List<TrainerListItemDto>,totalTrainers: null == totalTrainers ? _self.totalTrainers : totalTrainers // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerListResponse].
extension TrainerListResponsePatterns on TrainerListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerListResponse value)  $default,){
final _that = this;
switch (_that) {
case _TrainerListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrainerListItemDto> trainers,  int totalTrainers,  int currentPage,  int totalPages)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerListResponse() when $default != null:
return $default(_that.trainers,_that.totalTrainers,_that.currentPage,_that.totalPages);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrainerListItemDto> trainers,  int totalTrainers,  int currentPage,  int totalPages)  $default,) {final _that = this;
switch (_that) {
case _TrainerListResponse():
return $default(_that.trainers,_that.totalTrainers,_that.currentPage,_that.totalPages);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrainerListItemDto> trainers,  int totalTrainers,  int currentPage,  int totalPages)?  $default,) {final _that = this;
switch (_that) {
case _TrainerListResponse() when $default != null:
return $default(_that.trainers,_that.totalTrainers,_that.currentPage,_that.totalPages);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerListResponse implements TrainerListResponse {
  const _TrainerListResponse({final  List<TrainerListItemDto> trainers = const <TrainerListItemDto>[], this.totalTrainers = 0, this.currentPage = 1, this.totalPages = 1}): _trainers = trainers;
  factory _TrainerListResponse.fromJson(Map<String, dynamic> json) => _$TrainerListResponseFromJson(json);

 final  List<TrainerListItemDto> _trainers;
@override@JsonKey() List<TrainerListItemDto> get trainers {
  if (_trainers is EqualUnmodifiableListView) return _trainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainers);
}

@override@JsonKey() final  int totalTrainers;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int totalPages;

/// Create a copy of TrainerListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerListResponseCopyWith<_TrainerListResponse> get copyWith => __$TrainerListResponseCopyWithImpl<_TrainerListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerListResponse&&const DeepCollectionEquality().equals(other._trainers, _trainers)&&(identical(other.totalTrainers, totalTrainers) || other.totalTrainers == totalTrainers)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trainers),totalTrainers,currentPage,totalPages);

@override
String toString() {
  return 'TrainerListResponse(trainers: $trainers, totalTrainers: $totalTrainers, currentPage: $currentPage, totalPages: $totalPages)';
}


}

/// @nodoc
abstract mixin class _$TrainerListResponseCopyWith<$Res> implements $TrainerListResponseCopyWith<$Res> {
  factory _$TrainerListResponseCopyWith(_TrainerListResponse value, $Res Function(_TrainerListResponse) _then) = __$TrainerListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TrainerListItemDto> trainers, int totalTrainers, int currentPage, int totalPages
});




}
/// @nodoc
class __$TrainerListResponseCopyWithImpl<$Res>
    implements _$TrainerListResponseCopyWith<$Res> {
  __$TrainerListResponseCopyWithImpl(this._self, this._then);

  final _TrainerListResponse _self;
  final $Res Function(_TrainerListResponse) _then;

/// Create a copy of TrainerListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? trainers = null,Object? totalTrainers = null,Object? currentPage = null,Object? totalPages = null,}) {
  return _then(_TrainerListResponse(
trainers: null == trainers ? _self._trainers : trainers // ignore: cast_nullable_to_non_nullable
as List<TrainerListItemDto>,totalTrainers: null == totalTrainers ? _self.totalTrainers : totalTrainers // ignore: cast_nullable_to_non_nullable
as int,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
