// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExploreCity {

 String get id; String get name; String? get imageUrl; double? get latitude; double? get longitude; bool get isCurrentLocation;
/// Create a copy of ExploreCity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreCityCopyWith<ExploreCity> get copyWith => _$ExploreCityCopyWithImpl<ExploreCity>(this as ExploreCity, _$identity);

  /// Serializes this ExploreCity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreCity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.isCurrentLocation, isCurrentLocation) || other.isCurrentLocation == isCurrentLocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,latitude,longitude,isCurrentLocation);

@override
String toString() {
  return 'ExploreCity(id: $id, name: $name, imageUrl: $imageUrl, latitude: $latitude, longitude: $longitude, isCurrentLocation: $isCurrentLocation)';
}


}

/// @nodoc
abstract mixin class $ExploreCityCopyWith<$Res>  {
  factory $ExploreCityCopyWith(ExploreCity value, $Res Function(ExploreCity) _then) = _$ExploreCityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? imageUrl, double? latitude, double? longitude, bool isCurrentLocation
});




}
/// @nodoc
class _$ExploreCityCopyWithImpl<$Res>
    implements $ExploreCityCopyWith<$Res> {
  _$ExploreCityCopyWithImpl(this._self, this._then);

  final ExploreCity _self;
  final $Res Function(ExploreCity) _then;

/// Create a copy of ExploreCity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? isCurrentLocation = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,isCurrentLocation: null == isCurrentLocation ? _self.isCurrentLocation : isCurrentLocation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExploreCity].
extension ExploreCityPatterns on ExploreCity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreCity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreCity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreCity value)  $default,){
final _that = this;
switch (_that) {
case _ExploreCity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreCity value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreCity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? imageUrl,  double? latitude,  double? longitude,  bool isCurrentLocation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreCity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.latitude,_that.longitude,_that.isCurrentLocation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? imageUrl,  double? latitude,  double? longitude,  bool isCurrentLocation)  $default,) {final _that = this;
switch (_that) {
case _ExploreCity():
return $default(_that.id,_that.name,_that.imageUrl,_that.latitude,_that.longitude,_that.isCurrentLocation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? imageUrl,  double? latitude,  double? longitude,  bool isCurrentLocation)?  $default,) {final _that = this;
switch (_that) {
case _ExploreCity() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.latitude,_that.longitude,_that.isCurrentLocation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExploreCity implements ExploreCity {
  const _ExploreCity({required this.id, required this.name, this.imageUrl, this.latitude, this.longitude, this.isCurrentLocation = false});
  factory _ExploreCity.fromJson(Map<String, dynamic> json) => _$ExploreCityFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? imageUrl;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey() final  bool isCurrentLocation;

/// Create a copy of ExploreCity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreCityCopyWith<_ExploreCity> get copyWith => __$ExploreCityCopyWithImpl<_ExploreCity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExploreCityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreCity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.isCurrentLocation, isCurrentLocation) || other.isCurrentLocation == isCurrentLocation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,imageUrl,latitude,longitude,isCurrentLocation);

@override
String toString() {
  return 'ExploreCity(id: $id, name: $name, imageUrl: $imageUrl, latitude: $latitude, longitude: $longitude, isCurrentLocation: $isCurrentLocation)';
}


}

/// @nodoc
abstract mixin class _$ExploreCityCopyWith<$Res> implements $ExploreCityCopyWith<$Res> {
  factory _$ExploreCityCopyWith(_ExploreCity value, $Res Function(_ExploreCity) _then) = __$ExploreCityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? imageUrl, double? latitude, double? longitude, bool isCurrentLocation
});




}
/// @nodoc
class __$ExploreCityCopyWithImpl<$Res>
    implements _$ExploreCityCopyWith<$Res> {
  __$ExploreCityCopyWithImpl(this._self, this._then);

  final _ExploreCity _self;
  final $Res Function(_ExploreCity) _then;

/// Create a copy of ExploreCity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? isCurrentLocation = null,}) {
  return _then(_ExploreCity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,isCurrentLocation: null == isCurrentLocation ? _self.isCurrentLocation : isCurrentLocation // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
