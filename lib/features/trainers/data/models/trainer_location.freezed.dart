// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerLocation {

 String get id; String? get address; double? get latitude; double? get longitude;
/// Create a copy of TrainerLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerLocationCopyWith<TrainerLocation> get copyWith => _$TrainerLocationCopyWithImpl<TrainerLocation>(this as TrainerLocation, _$identity);

  /// Serializes this TrainerLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,latitude,longitude);

@override
String toString() {
  return 'TrainerLocation(id: $id, address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $TrainerLocationCopyWith<$Res>  {
  factory $TrainerLocationCopyWith(TrainerLocation value, $Res Function(TrainerLocation) _then) = _$TrainerLocationCopyWithImpl;
@useResult
$Res call({
 String id, String? address, double? latitude, double? longitude
});




}
/// @nodoc
class _$TrainerLocationCopyWithImpl<$Res>
    implements $TrainerLocationCopyWith<$Res> {
  _$TrainerLocationCopyWithImpl(this._self, this._then);

  final TrainerLocation _self;
  final $Res Function(TrainerLocation) _then;

/// Create a copy of TrainerLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerLocation].
extension TrainerLocationPatterns on TrainerLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerLocation value)  $default,){
final _that = this;
switch (_that) {
case _TrainerLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerLocation value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? address,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerLocation() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? address,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _TrainerLocation():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? address,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _TrainerLocation() when $default != null:
return $default(_that.id,_that.address,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerLocation implements TrainerLocation {
  const _TrainerLocation({required this.id, this.address, this.latitude, this.longitude});
  factory _TrainerLocation.fromJson(Map<String, dynamic> json) => _$TrainerLocationFromJson(json);

@override final  String id;
@override final  String? address;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of TrainerLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerLocationCopyWith<_TrainerLocation> get copyWith => __$TrainerLocationCopyWithImpl<_TrainerLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,address,latitude,longitude);

@override
String toString() {
  return 'TrainerLocation(id: $id, address: $address, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$TrainerLocationCopyWith<$Res> implements $TrainerLocationCopyWith<$Res> {
  factory _$TrainerLocationCopyWith(_TrainerLocation value, $Res Function(_TrainerLocation) _then) = __$TrainerLocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String? address, double? latitude, double? longitude
});




}
/// @nodoc
class __$TrainerLocationCopyWithImpl<$Res>
    implements _$TrainerLocationCopyWith<$Res> {
  __$TrainerLocationCopyWithImpl(this._self, this._then);

  final _TrainerLocation _self;
  final $Res Function(_TrainerLocation) _then;

/// Create a copy of TrainerLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? address = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_TrainerLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
