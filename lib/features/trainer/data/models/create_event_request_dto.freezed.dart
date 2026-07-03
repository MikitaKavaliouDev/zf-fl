// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateEventRequestDto {

 String get title; String? get startTime; String? get endTime; double get price; int get capacity; String get locationName; String get address; String? get city; String? get description; double? get latitude; double? get longitude; String? get imageUrl; String? get category;
/// Create a copy of CreateEventRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateEventRequestDtoCopyWith<CreateEventRequestDto> get copyWith => _$CreateEventRequestDtoCopyWithImpl<CreateEventRequestDto>(this as CreateEventRequestDto, _$identity);

  /// Serializes this CreateEventRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateEventRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.price, price) || other.price == price)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,startTime,endTime,price,capacity,locationName,address,city,description,latitude,longitude,imageUrl,category);

@override
String toString() {
  return 'CreateEventRequestDto(title: $title, startTime: $startTime, endTime: $endTime, price: $price, capacity: $capacity, locationName: $locationName, address: $address, city: $city, description: $description, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, category: $category)';
}


}

/// @nodoc
abstract mixin class $CreateEventRequestDtoCopyWith<$Res>  {
  factory $CreateEventRequestDtoCopyWith(CreateEventRequestDto value, $Res Function(CreateEventRequestDto) _then) = _$CreateEventRequestDtoCopyWithImpl;
@useResult
$Res call({
 String title, String? startTime, String? endTime, double price, int capacity, String locationName, String address, String? city, String? description, double? latitude, double? longitude, String? imageUrl, String? category
});




}
/// @nodoc
class _$CreateEventRequestDtoCopyWithImpl<$Res>
    implements $CreateEventRequestDtoCopyWith<$Res> {
  _$CreateEventRequestDtoCopyWithImpl(this._self, this._then);

  final CreateEventRequestDto _self;
  final $Res Function(CreateEventRequestDto) _then;

/// Create a copy of CreateEventRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? startTime = freezed,Object? endTime = freezed,Object? price = null,Object? capacity = null,Object? locationName = null,Object? address = null,Object? city = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? category = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateEventRequestDto].
extension CreateEventRequestDtoPatterns on CreateEventRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateEventRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateEventRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateEventRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateEventRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateEventRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateEventRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? startTime,  String? endTime,  double price,  int capacity,  String locationName,  String address,  String? city,  String? description,  double? latitude,  double? longitude,  String? imageUrl,  String? category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateEventRequestDto() when $default != null:
return $default(_that.title,_that.startTime,_that.endTime,_that.price,_that.capacity,_that.locationName,_that.address,_that.city,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? startTime,  String? endTime,  double price,  int capacity,  String locationName,  String address,  String? city,  String? description,  double? latitude,  double? longitude,  String? imageUrl,  String? category)  $default,) {final _that = this;
switch (_that) {
case _CreateEventRequestDto():
return $default(_that.title,_that.startTime,_that.endTime,_that.price,_that.capacity,_that.locationName,_that.address,_that.city,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? startTime,  String? endTime,  double price,  int capacity,  String locationName,  String address,  String? city,  String? description,  double? latitude,  double? longitude,  String? imageUrl,  String? category)?  $default,) {final _that = this;
switch (_that) {
case _CreateEventRequestDto() when $default != null:
return $default(_that.title,_that.startTime,_that.endTime,_that.price,_that.capacity,_that.locationName,_that.address,_that.city,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateEventRequestDto implements CreateEventRequestDto {
  const _CreateEventRequestDto({required this.title, this.startTime, this.endTime, this.price = 0, this.capacity = 1, this.locationName = '', this.address = '', this.city, this.description, this.latitude, this.longitude, this.imageUrl, this.category});
  factory _CreateEventRequestDto.fromJson(Map<String, dynamic> json) => _$CreateEventRequestDtoFromJson(json);

@override final  String title;
@override final  String? startTime;
@override final  String? endTime;
@override@JsonKey() final  double price;
@override@JsonKey() final  int capacity;
@override@JsonKey() final  String locationName;
@override@JsonKey() final  String address;
@override final  String? city;
@override final  String? description;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? imageUrl;
@override final  String? category;

/// Create a copy of CreateEventRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateEventRequestDtoCopyWith<_CreateEventRequestDto> get copyWith => __$CreateEventRequestDtoCopyWithImpl<_CreateEventRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateEventRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateEventRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.price, price) || other.price == price)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,startTime,endTime,price,capacity,locationName,address,city,description,latitude,longitude,imageUrl,category);

@override
String toString() {
  return 'CreateEventRequestDto(title: $title, startTime: $startTime, endTime: $endTime, price: $price, capacity: $capacity, locationName: $locationName, address: $address, city: $city, description: $description, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, category: $category)';
}


}

/// @nodoc
abstract mixin class _$CreateEventRequestDtoCopyWith<$Res> implements $CreateEventRequestDtoCopyWith<$Res> {
  factory _$CreateEventRequestDtoCopyWith(_CreateEventRequestDto value, $Res Function(_CreateEventRequestDto) _then) = __$CreateEventRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String? startTime, String? endTime, double price, int capacity, String locationName, String address, String? city, String? description, double? latitude, double? longitude, String? imageUrl, String? category
});




}
/// @nodoc
class __$CreateEventRequestDtoCopyWithImpl<$Res>
    implements _$CreateEventRequestDtoCopyWith<$Res> {
  __$CreateEventRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateEventRequestDto _self;
  final $Res Function(_CreateEventRequestDto) _then;

/// Create a copy of CreateEventRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? startTime = freezed,Object? endTime = freezed,Object? price = null,Object? capacity = null,Object? locationName = null,Object? address = null,Object? city = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? category = freezed,}) {
  return _then(_CreateEventRequestDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
