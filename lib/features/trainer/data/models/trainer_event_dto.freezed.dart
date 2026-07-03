// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerEventDto {

 String get id; String get title; String get startTime; String get endTime;@JsonKey(fromJson: stringFromNum) double get price; int get capacity; String get locationName; String get address; String? get city; String? get description; double? get latitude; double? get longitude; String? get imageUrl; String? get category; String? get currency; int get enrolledCount; String? get status; bool get isPromoted; String get createdAt;
/// Create a copy of TrainerEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerEventDtoCopyWith<TrainerEventDto> get copyWith => _$TrainerEventDtoCopyWithImpl<TrainerEventDto>(this as TrainerEventDto, _$identity);

  /// Serializes this TrainerEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.price, price) || other.price == price)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.enrolledCount, enrolledCount) || other.enrolledCount == enrolledCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,startTime,endTime,price,capacity,locationName,address,city,description,latitude,longitude,imageUrl,category,currency,enrolledCount,status,isPromoted,createdAt]);

@override
String toString() {
  return 'TrainerEventDto(id: $id, title: $title, startTime: $startTime, endTime: $endTime, price: $price, capacity: $capacity, locationName: $locationName, address: $address, city: $city, description: $description, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, category: $category, currency: $currency, enrolledCount: $enrolledCount, status: $status, isPromoted: $isPromoted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainerEventDtoCopyWith<$Res>  {
  factory $TrainerEventDtoCopyWith(TrainerEventDto value, $Res Function(TrainerEventDto) _then) = _$TrainerEventDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String startTime, String endTime,@JsonKey(fromJson: stringFromNum) double price, int capacity, String locationName, String address, String? city, String? description, double? latitude, double? longitude, String? imageUrl, String? category, String? currency, int enrolledCount, String? status, bool isPromoted, String createdAt
});




}
/// @nodoc
class _$TrainerEventDtoCopyWithImpl<$Res>
    implements $TrainerEventDtoCopyWith<$Res> {
  _$TrainerEventDtoCopyWithImpl(this._self, this._then);

  final TrainerEventDto _self;
  final $Res Function(TrainerEventDto) _then;

/// Create a copy of TrainerEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? price = null,Object? capacity = null,Object? locationName = null,Object? address = null,Object? city = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? category = freezed,Object? currency = freezed,Object? enrolledCount = null,Object? status = freezed,Object? isPromoted = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,enrolledCount: null == enrolledCount ? _self.enrolledCount : enrolledCount // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isPromoted: null == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerEventDto].
extension TrainerEventDtoPatterns on TrainerEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerEventDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String startTime,  String endTime, @JsonKey(fromJson: stringFromNum)  double price,  int capacity,  String locationName,  String address,  String? city,  String? description,  double? latitude,  double? longitude,  String? imageUrl,  String? category,  String? currency,  int enrolledCount,  String? status,  bool isPromoted,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerEventDto() when $default != null:
return $default(_that.id,_that.title,_that.startTime,_that.endTime,_that.price,_that.capacity,_that.locationName,_that.address,_that.city,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.category,_that.currency,_that.enrolledCount,_that.status,_that.isPromoted,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String startTime,  String endTime, @JsonKey(fromJson: stringFromNum)  double price,  int capacity,  String locationName,  String address,  String? city,  String? description,  double? latitude,  double? longitude,  String? imageUrl,  String? category,  String? currency,  int enrolledCount,  String? status,  bool isPromoted,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerEventDto():
return $default(_that.id,_that.title,_that.startTime,_that.endTime,_that.price,_that.capacity,_that.locationName,_that.address,_that.city,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.category,_that.currency,_that.enrolledCount,_that.status,_that.isPromoted,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String startTime,  String endTime, @JsonKey(fromJson: stringFromNum)  double price,  int capacity,  String locationName,  String address,  String? city,  String? description,  double? latitude,  double? longitude,  String? imageUrl,  String? category,  String? currency,  int enrolledCount,  String? status,  bool isPromoted,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerEventDto() when $default != null:
return $default(_that.id,_that.title,_that.startTime,_that.endTime,_that.price,_that.capacity,_that.locationName,_that.address,_that.city,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.category,_that.currency,_that.enrolledCount,_that.status,_that.isPromoted,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerEventDto implements TrainerEventDto {
  const _TrainerEventDto({required this.id, required this.title, required this.startTime, required this.endTime, @JsonKey(fromJson: stringFromNum) required this.price, required this.capacity, required this.locationName, required this.address, this.city, this.description, this.latitude, this.longitude, this.imageUrl, this.category, this.currency, this.enrolledCount = 0, this.status, this.isPromoted = false, required this.createdAt});
  factory _TrainerEventDto.fromJson(Map<String, dynamic> json) => _$TrainerEventDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String startTime;
@override final  String endTime;
@override@JsonKey(fromJson: stringFromNum) final  double price;
@override final  int capacity;
@override final  String locationName;
@override final  String address;
@override final  String? city;
@override final  String? description;
@override final  double? latitude;
@override final  double? longitude;
@override final  String? imageUrl;
@override final  String? category;
@override final  String? currency;
@override@JsonKey() final  int enrolledCount;
@override final  String? status;
@override@JsonKey() final  bool isPromoted;
@override final  String createdAt;

/// Create a copy of TrainerEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerEventDtoCopyWith<_TrainerEventDto> get copyWith => __$TrainerEventDtoCopyWithImpl<_TrainerEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.price, price) || other.price == price)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.category, category) || other.category == category)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.enrolledCount, enrolledCount) || other.enrolledCount == enrolledCount)&&(identical(other.status, status) || other.status == status)&&(identical(other.isPromoted, isPromoted) || other.isPromoted == isPromoted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,startTime,endTime,price,capacity,locationName,address,city,description,latitude,longitude,imageUrl,category,currency,enrolledCount,status,isPromoted,createdAt]);

@override
String toString() {
  return 'TrainerEventDto(id: $id, title: $title, startTime: $startTime, endTime: $endTime, price: $price, capacity: $capacity, locationName: $locationName, address: $address, city: $city, description: $description, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, category: $category, currency: $currency, enrolledCount: $enrolledCount, status: $status, isPromoted: $isPromoted, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerEventDtoCopyWith<$Res> implements $TrainerEventDtoCopyWith<$Res> {
  factory _$TrainerEventDtoCopyWith(_TrainerEventDto value, $Res Function(_TrainerEventDto) _then) = __$TrainerEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String startTime, String endTime,@JsonKey(fromJson: stringFromNum) double price, int capacity, String locationName, String address, String? city, String? description, double? latitude, double? longitude, String? imageUrl, String? category, String? currency, int enrolledCount, String? status, bool isPromoted, String createdAt
});




}
/// @nodoc
class __$TrainerEventDtoCopyWithImpl<$Res>
    implements _$TrainerEventDtoCopyWith<$Res> {
  __$TrainerEventDtoCopyWithImpl(this._self, this._then);

  final _TrainerEventDto _self;
  final $Res Function(_TrainerEventDto) _then;

/// Create a copy of TrainerEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? startTime = null,Object? endTime = null,Object? price = null,Object? capacity = null,Object? locationName = null,Object? address = null,Object? city = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? category = freezed,Object? currency = freezed,Object? enrolledCount = null,Object? status = freezed,Object? isPromoted = null,Object? createdAt = null,}) {
  return _then(_TrainerEventDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,enrolledCount: null == enrolledCount ? _self.enrolledCount : enrolledCount // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,isPromoted: null == isPromoted ? _self.isPromoted : isPromoted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
