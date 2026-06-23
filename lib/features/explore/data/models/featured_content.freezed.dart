// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'featured_content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FeaturedContent {

 List<FeaturedTrainerDto> get featuredTrainers; List<ExploreEventDto> get featuredEvents;
/// Create a copy of FeaturedContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeaturedContentCopyWith<FeaturedContent> get copyWith => _$FeaturedContentCopyWithImpl<FeaturedContent>(this as FeaturedContent, _$identity);

  /// Serializes this FeaturedContent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturedContent&&const DeepCollectionEquality().equals(other.featuredTrainers, featuredTrainers)&&const DeepCollectionEquality().equals(other.featuredEvents, featuredEvents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(featuredTrainers),const DeepCollectionEquality().hash(featuredEvents));

@override
String toString() {
  return 'FeaturedContent(featuredTrainers: $featuredTrainers, featuredEvents: $featuredEvents)';
}


}

/// @nodoc
abstract mixin class $FeaturedContentCopyWith<$Res>  {
  factory $FeaturedContentCopyWith(FeaturedContent value, $Res Function(FeaturedContent) _then) = _$FeaturedContentCopyWithImpl;
@useResult
$Res call({
 List<FeaturedTrainerDto> featuredTrainers, List<ExploreEventDto> featuredEvents
});




}
/// @nodoc
class _$FeaturedContentCopyWithImpl<$Res>
    implements $FeaturedContentCopyWith<$Res> {
  _$FeaturedContentCopyWithImpl(this._self, this._then);

  final FeaturedContent _self;
  final $Res Function(FeaturedContent) _then;

/// Create a copy of FeaturedContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? featuredTrainers = null,Object? featuredEvents = null,}) {
  return _then(_self.copyWith(
featuredTrainers: null == featuredTrainers ? _self.featuredTrainers : featuredTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,featuredEvents: null == featuredEvents ? _self.featuredEvents : featuredEvents // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [FeaturedContent].
extension FeaturedContentPatterns on FeaturedContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeaturedContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeaturedContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeaturedContent value)  $default,){
final _that = this;
switch (_that) {
case _FeaturedContent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeaturedContent value)?  $default,){
final _that = this;
switch (_that) {
case _FeaturedContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FeaturedTrainerDto> featuredTrainers,  List<ExploreEventDto> featuredEvents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeaturedContent() when $default != null:
return $default(_that.featuredTrainers,_that.featuredEvents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FeaturedTrainerDto> featuredTrainers,  List<ExploreEventDto> featuredEvents)  $default,) {final _that = this;
switch (_that) {
case _FeaturedContent():
return $default(_that.featuredTrainers,_that.featuredEvents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FeaturedTrainerDto> featuredTrainers,  List<ExploreEventDto> featuredEvents)?  $default,) {final _that = this;
switch (_that) {
case _FeaturedContent() when $default != null:
return $default(_that.featuredTrainers,_that.featuredEvents);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeaturedContent implements FeaturedContent {
  const _FeaturedContent({final  List<FeaturedTrainerDto> featuredTrainers = const <FeaturedTrainerDto>[], final  List<ExploreEventDto> featuredEvents = const <ExploreEventDto>[]}): _featuredTrainers = featuredTrainers,_featuredEvents = featuredEvents;
  factory _FeaturedContent.fromJson(Map<String, dynamic> json) => _$FeaturedContentFromJson(json);

 final  List<FeaturedTrainerDto> _featuredTrainers;
@override@JsonKey() List<FeaturedTrainerDto> get featuredTrainers {
  if (_featuredTrainers is EqualUnmodifiableListView) return _featuredTrainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredTrainers);
}

 final  List<ExploreEventDto> _featuredEvents;
@override@JsonKey() List<ExploreEventDto> get featuredEvents {
  if (_featuredEvents is EqualUnmodifiableListView) return _featuredEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredEvents);
}


/// Create a copy of FeaturedContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeaturedContentCopyWith<_FeaturedContent> get copyWith => __$FeaturedContentCopyWithImpl<_FeaturedContent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeaturedContentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturedContent&&const DeepCollectionEquality().equals(other._featuredTrainers, _featuredTrainers)&&const DeepCollectionEquality().equals(other._featuredEvents, _featuredEvents));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_featuredTrainers),const DeepCollectionEquality().hash(_featuredEvents));

@override
String toString() {
  return 'FeaturedContent(featuredTrainers: $featuredTrainers, featuredEvents: $featuredEvents)';
}


}

/// @nodoc
abstract mixin class _$FeaturedContentCopyWith<$Res> implements $FeaturedContentCopyWith<$Res> {
  factory _$FeaturedContentCopyWith(_FeaturedContent value, $Res Function(_FeaturedContent) _then) = __$FeaturedContentCopyWithImpl;
@override @useResult
$Res call({
 List<FeaturedTrainerDto> featuredTrainers, List<ExploreEventDto> featuredEvents
});




}
/// @nodoc
class __$FeaturedContentCopyWithImpl<$Res>
    implements _$FeaturedContentCopyWith<$Res> {
  __$FeaturedContentCopyWithImpl(this._self, this._then);

  final _FeaturedContent _self;
  final $Res Function(_FeaturedContent) _then;

/// Create a copy of FeaturedContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? featuredTrainers = null,Object? featuredEvents = null,}) {
  return _then(_FeaturedContent(
featuredTrainers: null == featuredTrainers ? _self._featuredTrainers : featuredTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,featuredEvents: null == featuredEvents ? _self._featuredEvents : featuredEvents // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,
  ));
}


}


/// @nodoc
mixin _$FeaturedTrainerDto {

 String get id; String get name; String? get username; String? get avatarUrl; double get rating; bool get isVerified; List<String> get specialties; String? get tier; String get source;
/// Create a copy of FeaturedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FeaturedTrainerDtoCopyWith<FeaturedTrainerDto> get copyWith => _$FeaturedTrainerDtoCopyWithImpl<FeaturedTrainerDto>(this as FeaturedTrainerDto, _$identity);

  /// Serializes this FeaturedTrainerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FeaturedTrainerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,avatarUrl,rating,isVerified,const DeepCollectionEquality().hash(specialties),tier,source);

@override
String toString() {
  return 'FeaturedTrainerDto(id: $id, name: $name, username: $username, avatarUrl: $avatarUrl, rating: $rating, isVerified: $isVerified, specialties: $specialties, tier: $tier, source: $source)';
}


}

/// @nodoc
abstract mixin class $FeaturedTrainerDtoCopyWith<$Res>  {
  factory $FeaturedTrainerDtoCopyWith(FeaturedTrainerDto value, $Res Function(FeaturedTrainerDto) _then) = _$FeaturedTrainerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? username, String? avatarUrl, double rating, bool isVerified, List<String> specialties, String? tier, String source
});




}
/// @nodoc
class _$FeaturedTrainerDtoCopyWithImpl<$Res>
    implements $FeaturedTrainerDtoCopyWith<$Res> {
  _$FeaturedTrainerDtoCopyWithImpl(this._self, this._then);

  final FeaturedTrainerDto _self;
  final $Res Function(FeaturedTrainerDto) _then;

/// Create a copy of FeaturedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? username = freezed,Object? avatarUrl = freezed,Object? rating = null,Object? isVerified = null,Object? specialties = null,Object? tier = freezed,Object? source = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FeaturedTrainerDto].
extension FeaturedTrainerDtoPatterns on FeaturedTrainerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FeaturedTrainerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FeaturedTrainerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FeaturedTrainerDto value)  $default,){
final _that = this;
switch (_that) {
case _FeaturedTrainerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FeaturedTrainerDto value)?  $default,){
final _that = this;
switch (_that) {
case _FeaturedTrainerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? username,  String? avatarUrl,  double rating,  bool isVerified,  List<String> specialties,  String? tier,  String source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FeaturedTrainerDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.avatarUrl,_that.rating,_that.isVerified,_that.specialties,_that.tier,_that.source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? username,  String? avatarUrl,  double rating,  bool isVerified,  List<String> specialties,  String? tier,  String source)  $default,) {final _that = this;
switch (_that) {
case _FeaturedTrainerDto():
return $default(_that.id,_that.name,_that.username,_that.avatarUrl,_that.rating,_that.isVerified,_that.specialties,_that.tier,_that.source);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? username,  String? avatarUrl,  double rating,  bool isVerified,  List<String> specialties,  String? tier,  String source)?  $default,) {final _that = this;
switch (_that) {
case _FeaturedTrainerDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.avatarUrl,_that.rating,_that.isVerified,_that.specialties,_that.tier,_that.source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FeaturedTrainerDto implements FeaturedTrainerDto {
  const _FeaturedTrainerDto({required this.id, this.name = 'Trainer', this.username, this.avatarUrl, this.rating = 5.0, this.isVerified = false, final  List<String> specialties = const <String>[], this.tier, this.source = 'algorithm'}): _specialties = specialties;
  factory _FeaturedTrainerDto.fromJson(Map<String, dynamic> json) => _$FeaturedTrainerDtoFromJson(json);

@override final  String id;
@override@JsonKey() final  String name;
@override final  String? username;
@override final  String? avatarUrl;
@override@JsonKey() final  double rating;
@override@JsonKey() final  bool isVerified;
 final  List<String> _specialties;
@override@JsonKey() List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

@override final  String? tier;
@override@JsonKey() final  String source;

/// Create a copy of FeaturedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FeaturedTrainerDtoCopyWith<_FeaturedTrainerDto> get copyWith => __$FeaturedTrainerDtoCopyWithImpl<_FeaturedTrainerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FeaturedTrainerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FeaturedTrainerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.source, source) || other.source == source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,avatarUrl,rating,isVerified,const DeepCollectionEquality().hash(_specialties),tier,source);

@override
String toString() {
  return 'FeaturedTrainerDto(id: $id, name: $name, username: $username, avatarUrl: $avatarUrl, rating: $rating, isVerified: $isVerified, specialties: $specialties, tier: $tier, source: $source)';
}


}

/// @nodoc
abstract mixin class _$FeaturedTrainerDtoCopyWith<$Res> implements $FeaturedTrainerDtoCopyWith<$Res> {
  factory _$FeaturedTrainerDtoCopyWith(_FeaturedTrainerDto value, $Res Function(_FeaturedTrainerDto) _then) = __$FeaturedTrainerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? username, String? avatarUrl, double rating, bool isVerified, List<String> specialties, String? tier, String source
});




}
/// @nodoc
class __$FeaturedTrainerDtoCopyWithImpl<$Res>
    implements _$FeaturedTrainerDtoCopyWith<$Res> {
  __$FeaturedTrainerDtoCopyWithImpl(this._self, this._then);

  final _FeaturedTrainerDto _self;
  final $Res Function(_FeaturedTrainerDto) _then;

/// Create a copy of FeaturedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? username = freezed,Object? avatarUrl = freezed,Object? rating = null,Object? isVerified = null,Object? specialties = null,Object? tier = freezed,Object? source = null,}) {
  return _then(_FeaturedTrainerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
