// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExploreEventDto {

 String get id; String get title; String? get description; DateTime get startTime; DateTime? get endTime;@JsonKey(name: 'locationName') String get locationName; String? get address;@JsonKey(name: 'latitude') double get latitude;@JsonKey(name: 'longitude') double get longitude; String? get imageUrl;@JsonKey(name: 'category') String? get categoryId;@JsonKey(name: 'city') String? get cityId; double get price; String get currency; int get capacity; int get enrolledCount; bool get isNearCapacity; bool get isBooked;@JsonKey(name: 'trainerName') String? get hostName;@JsonKey(name: 'trainerId') String? get hostId; double? get distance; String? get organizerType; List<String> get highlights; TrainerInfo? get trainer;
/// Create a copy of ExploreEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreEventDtoCopyWith<ExploreEventDto> get copyWith => _$ExploreEventDtoCopyWithImpl<ExploreEventDto>(this as ExploreEventDto, _$identity);

  /// Serializes this ExploreEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.enrolledCount, enrolledCount) || other.enrolledCount == enrolledCount)&&(identical(other.isNearCapacity, isNearCapacity) || other.isNearCapacity == isNearCapacity)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.organizerType, organizerType) || other.organizerType == organizerType)&&const DeepCollectionEquality().equals(other.highlights, highlights)&&(identical(other.trainer, trainer) || other.trainer == trainer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,startTime,endTime,locationName,address,latitude,longitude,imageUrl,categoryId,cityId,price,currency,capacity,enrolledCount,isNearCapacity,isBooked,hostName,hostId,distance,organizerType,const DeepCollectionEquality().hash(highlights),trainer]);

@override
String toString() {
  return 'ExploreEventDto(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, locationName: $locationName, address: $address, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, categoryId: $categoryId, cityId: $cityId, price: $price, currency: $currency, capacity: $capacity, enrolledCount: $enrolledCount, isNearCapacity: $isNearCapacity, isBooked: $isBooked, hostName: $hostName, hostId: $hostId, distance: $distance, organizerType: $organizerType, highlights: $highlights, trainer: $trainer)';
}


}

/// @nodoc
abstract mixin class $ExploreEventDtoCopyWith<$Res>  {
  factory $ExploreEventDtoCopyWith(ExploreEventDto value, $Res Function(ExploreEventDto) _then) = _$ExploreEventDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, DateTime startTime, DateTime? endTime,@JsonKey(name: 'locationName') String locationName, String? address,@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude, String? imageUrl,@JsonKey(name: 'category') String? categoryId,@JsonKey(name: 'city') String? cityId, double price, String currency, int capacity, int enrolledCount, bool isNearCapacity, bool isBooked,@JsonKey(name: 'trainerName') String? hostName,@JsonKey(name: 'trainerId') String? hostId, double? distance, String? organizerType, List<String> highlights, TrainerInfo? trainer
});


$TrainerInfoCopyWith<$Res>? get trainer;

}
/// @nodoc
class _$ExploreEventDtoCopyWithImpl<$Res>
    implements $ExploreEventDtoCopyWith<$Res> {
  _$ExploreEventDtoCopyWithImpl(this._self, this._then);

  final ExploreEventDto _self;
  final $Res Function(ExploreEventDto) _then;

/// Create a copy of ExploreEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? startTime = null,Object? endTime = freezed,Object? locationName = null,Object? address = freezed,Object? latitude = null,Object? longitude = null,Object? imageUrl = freezed,Object? categoryId = freezed,Object? cityId = freezed,Object? price = null,Object? currency = null,Object? capacity = null,Object? enrolledCount = null,Object? isNearCapacity = null,Object? isBooked = null,Object? hostName = freezed,Object? hostId = freezed,Object? distance = freezed,Object? organizerType = freezed,Object? highlights = null,Object? trainer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,enrolledCount: null == enrolledCount ? _self.enrolledCount : enrolledCount // ignore: cast_nullable_to_non_nullable
as int,isNearCapacity: null == isNearCapacity ? _self.isNearCapacity : isNearCapacity // ignore: cast_nullable_to_non_nullable
as bool,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,hostName: freezed == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String?,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,organizerType: freezed == organizerType ? _self.organizerType : organizerType // ignore: cast_nullable_to_non_nullable
as String?,highlights: null == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<String>,trainer: freezed == trainer ? _self.trainer : trainer // ignore: cast_nullable_to_non_nullable
as TrainerInfo?,
  ));
}
/// Create a copy of ExploreEventDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerInfoCopyWith<$Res>? get trainer {
    if (_self.trainer == null) {
    return null;
  }

  return $TrainerInfoCopyWith<$Res>(_self.trainer!, (value) {
    return _then(_self.copyWith(trainer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExploreEventDto].
extension ExploreEventDtoPatterns on ExploreEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreEventDto value)  $default,){
final _that = this;
switch (_that) {
case _ExploreEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  DateTime startTime,  DateTime? endTime, @JsonKey(name: 'locationName')  String locationName,  String? address, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude,  String? imageUrl, @JsonKey(name: 'category')  String? categoryId, @JsonKey(name: 'city')  String? cityId,  double price,  String currency,  int capacity,  int enrolledCount,  bool isNearCapacity,  bool isBooked, @JsonKey(name: 'trainerName')  String? hostName, @JsonKey(name: 'trainerId')  String? hostId,  double? distance,  String? organizerType,  List<String> highlights,  TrainerInfo? trainer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreEventDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.locationName,_that.address,_that.latitude,_that.longitude,_that.imageUrl,_that.categoryId,_that.cityId,_that.price,_that.currency,_that.capacity,_that.enrolledCount,_that.isNearCapacity,_that.isBooked,_that.hostName,_that.hostId,_that.distance,_that.organizerType,_that.highlights,_that.trainer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  DateTime startTime,  DateTime? endTime, @JsonKey(name: 'locationName')  String locationName,  String? address, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude,  String? imageUrl, @JsonKey(name: 'category')  String? categoryId, @JsonKey(name: 'city')  String? cityId,  double price,  String currency,  int capacity,  int enrolledCount,  bool isNearCapacity,  bool isBooked, @JsonKey(name: 'trainerName')  String? hostName, @JsonKey(name: 'trainerId')  String? hostId,  double? distance,  String? organizerType,  List<String> highlights,  TrainerInfo? trainer)  $default,) {final _that = this;
switch (_that) {
case _ExploreEventDto():
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.locationName,_that.address,_that.latitude,_that.longitude,_that.imageUrl,_that.categoryId,_that.cityId,_that.price,_that.currency,_that.capacity,_that.enrolledCount,_that.isNearCapacity,_that.isBooked,_that.hostName,_that.hostId,_that.distance,_that.organizerType,_that.highlights,_that.trainer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  DateTime startTime,  DateTime? endTime, @JsonKey(name: 'locationName')  String locationName,  String? address, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude,  String? imageUrl, @JsonKey(name: 'category')  String? categoryId, @JsonKey(name: 'city')  String? cityId,  double price,  String currency,  int capacity,  int enrolledCount,  bool isNearCapacity,  bool isBooked, @JsonKey(name: 'trainerName')  String? hostName, @JsonKey(name: 'trainerId')  String? hostId,  double? distance,  String? organizerType,  List<String> highlights,  TrainerInfo? trainer)?  $default,) {final _that = this;
switch (_that) {
case _ExploreEventDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.locationName,_that.address,_that.latitude,_that.longitude,_that.imageUrl,_that.categoryId,_that.cityId,_that.price,_that.currency,_that.capacity,_that.enrolledCount,_that.isNearCapacity,_that.isBooked,_that.hostName,_that.hostId,_that.distance,_that.organizerType,_that.highlights,_that.trainer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExploreEventDto extends ExploreEventDto {
  const _ExploreEventDto({required this.id, required this.title, this.description, required this.startTime, this.endTime, @JsonKey(name: 'locationName') required this.locationName, this.address, @JsonKey(name: 'latitude') this.latitude = 0, @JsonKey(name: 'longitude') this.longitude = 0, this.imageUrl, @JsonKey(name: 'category') this.categoryId, @JsonKey(name: 'city') this.cityId, this.price = 0, this.currency = 'PLN', this.capacity = 0, this.enrolledCount = 0, this.isNearCapacity = false, this.isBooked = false, @JsonKey(name: 'trainerName') this.hostName, @JsonKey(name: 'trainerId') this.hostId, this.distance, this.organizerType, final  List<String> highlights = const <String>[], this.trainer}): _highlights = highlights,super._();
  factory _ExploreEventDto.fromJson(Map<String, dynamic> json) => _$ExploreEventDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override@JsonKey(name: 'locationName') final  String locationName;
@override final  String? address;
@override@JsonKey(name: 'latitude') final  double latitude;
@override@JsonKey(name: 'longitude') final  double longitude;
@override final  String? imageUrl;
@override@JsonKey(name: 'category') final  String? categoryId;
@override@JsonKey(name: 'city') final  String? cityId;
@override@JsonKey() final  double price;
@override@JsonKey() final  String currency;
@override@JsonKey() final  int capacity;
@override@JsonKey() final  int enrolledCount;
@override@JsonKey() final  bool isNearCapacity;
@override@JsonKey() final  bool isBooked;
@override@JsonKey(name: 'trainerName') final  String? hostName;
@override@JsonKey(name: 'trainerId') final  String? hostId;
@override final  double? distance;
@override final  String? organizerType;
 final  List<String> _highlights;
@override@JsonKey() List<String> get highlights {
  if (_highlights is EqualUnmodifiableListView) return _highlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlights);
}

@override final  TrainerInfo? trainer;

/// Create a copy of ExploreEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreEventDtoCopyWith<_ExploreEventDto> get copyWith => __$ExploreEventDtoCopyWithImpl<_ExploreEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExploreEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.address, address) || other.address == address)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.cityId, cityId) || other.cityId == cityId)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.enrolledCount, enrolledCount) || other.enrolledCount == enrolledCount)&&(identical(other.isNearCapacity, isNearCapacity) || other.isNearCapacity == isNearCapacity)&&(identical(other.isBooked, isBooked) || other.isBooked == isBooked)&&(identical(other.hostName, hostName) || other.hostName == hostName)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.organizerType, organizerType) || other.organizerType == organizerType)&&const DeepCollectionEquality().equals(other._highlights, _highlights)&&(identical(other.trainer, trainer) || other.trainer == trainer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,title,description,startTime,endTime,locationName,address,latitude,longitude,imageUrl,categoryId,cityId,price,currency,capacity,enrolledCount,isNearCapacity,isBooked,hostName,hostId,distance,organizerType,const DeepCollectionEquality().hash(_highlights),trainer]);

@override
String toString() {
  return 'ExploreEventDto(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, locationName: $locationName, address: $address, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, categoryId: $categoryId, cityId: $cityId, price: $price, currency: $currency, capacity: $capacity, enrolledCount: $enrolledCount, isNearCapacity: $isNearCapacity, isBooked: $isBooked, hostName: $hostName, hostId: $hostId, distance: $distance, organizerType: $organizerType, highlights: $highlights, trainer: $trainer)';
}


}

/// @nodoc
abstract mixin class _$ExploreEventDtoCopyWith<$Res> implements $ExploreEventDtoCopyWith<$Res> {
  factory _$ExploreEventDtoCopyWith(_ExploreEventDto value, $Res Function(_ExploreEventDto) _then) = __$ExploreEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, DateTime startTime, DateTime? endTime,@JsonKey(name: 'locationName') String locationName, String? address,@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude, String? imageUrl,@JsonKey(name: 'category') String? categoryId,@JsonKey(name: 'city') String? cityId, double price, String currency, int capacity, int enrolledCount, bool isNearCapacity, bool isBooked,@JsonKey(name: 'trainerName') String? hostName,@JsonKey(name: 'trainerId') String? hostId, double? distance, String? organizerType, List<String> highlights, TrainerInfo? trainer
});


@override $TrainerInfoCopyWith<$Res>? get trainer;

}
/// @nodoc
class __$ExploreEventDtoCopyWithImpl<$Res>
    implements _$ExploreEventDtoCopyWith<$Res> {
  __$ExploreEventDtoCopyWithImpl(this._self, this._then);

  final _ExploreEventDto _self;
  final $Res Function(_ExploreEventDto) _then;

/// Create a copy of ExploreEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? startTime = null,Object? endTime = freezed,Object? locationName = null,Object? address = freezed,Object? latitude = null,Object? longitude = null,Object? imageUrl = freezed,Object? categoryId = freezed,Object? cityId = freezed,Object? price = null,Object? currency = null,Object? capacity = null,Object? enrolledCount = null,Object? isNearCapacity = null,Object? isBooked = null,Object? hostName = freezed,Object? hostId = freezed,Object? distance = freezed,Object? organizerType = freezed,Object? highlights = null,Object? trainer = freezed,}) {
  return _then(_ExploreEventDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,cityId: freezed == cityId ? _self.cityId : cityId // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,enrolledCount: null == enrolledCount ? _self.enrolledCount : enrolledCount // ignore: cast_nullable_to_non_nullable
as int,isNearCapacity: null == isNearCapacity ? _self.isNearCapacity : isNearCapacity // ignore: cast_nullable_to_non_nullable
as bool,isBooked: null == isBooked ? _self.isBooked : isBooked // ignore: cast_nullable_to_non_nullable
as bool,hostName: freezed == hostName ? _self.hostName : hostName // ignore: cast_nullable_to_non_nullable
as String?,hostId: freezed == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String?,distance: freezed == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double?,organizerType: freezed == organizerType ? _self.organizerType : organizerType // ignore: cast_nullable_to_non_nullable
as String?,highlights: null == highlights ? _self._highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<String>,trainer: freezed == trainer ? _self.trainer : trainer // ignore: cast_nullable_to_non_nullable
as TrainerInfo?,
  ));
}

/// Create a copy of ExploreEventDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerInfoCopyWith<$Res>? get trainer {
    if (_self.trainer == null) {
    return null;
  }

  return $TrainerInfoCopyWith<$Res>(_self.trainer!, (value) {
    return _then(_self.copyWith(trainer: value));
  });
}
}


/// @nodoc
mixin _$TrainerInfo {

 String get name; String? get username; String? get profilePhotoPath; String? get aboutMe;
/// Create a copy of TrainerInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerInfoCopyWith<TrainerInfo> get copyWith => _$TrainerInfoCopyWithImpl<TrainerInfo>(this as TrainerInfo, _$identity);

  /// Serializes this TrainerInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,profilePhotoPath,aboutMe);

@override
String toString() {
  return 'TrainerInfo(name: $name, username: $username, profilePhotoPath: $profilePhotoPath, aboutMe: $aboutMe)';
}


}

/// @nodoc
abstract mixin class $TrainerInfoCopyWith<$Res>  {
  factory $TrainerInfoCopyWith(TrainerInfo value, $Res Function(TrainerInfo) _then) = _$TrainerInfoCopyWithImpl;
@useResult
$Res call({
 String name, String? username, String? profilePhotoPath, String? aboutMe
});




}
/// @nodoc
class _$TrainerInfoCopyWithImpl<$Res>
    implements $TrainerInfoCopyWith<$Res> {
  _$TrainerInfoCopyWithImpl(this._self, this._then);

  final TrainerInfo _self;
  final $Res Function(TrainerInfo) _then;

/// Create a copy of TrainerInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? username = freezed,Object? profilePhotoPath = freezed,Object? aboutMe = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerInfo].
extension TrainerInfoPatterns on TrainerInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerInfo value)  $default,){
final _that = this;
switch (_that) {
case _TrainerInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? username,  String? profilePhotoPath,  String? aboutMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerInfo() when $default != null:
return $default(_that.name,_that.username,_that.profilePhotoPath,_that.aboutMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? username,  String? profilePhotoPath,  String? aboutMe)  $default,) {final _that = this;
switch (_that) {
case _TrainerInfo():
return $default(_that.name,_that.username,_that.profilePhotoPath,_that.aboutMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? username,  String? profilePhotoPath,  String? aboutMe)?  $default,) {final _that = this;
switch (_that) {
case _TrainerInfo() when $default != null:
return $default(_that.name,_that.username,_that.profilePhotoPath,_that.aboutMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerInfo implements TrainerInfo {
  const _TrainerInfo({required this.name, this.username, this.profilePhotoPath, this.aboutMe});
  factory _TrainerInfo.fromJson(Map<String, dynamic> json) => _$TrainerInfoFromJson(json);

@override final  String name;
@override final  String? username;
@override final  String? profilePhotoPath;
@override final  String? aboutMe;

/// Create a copy of TrainerInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerInfoCopyWith<_TrainerInfo> get copyWith => __$TrainerInfoCopyWithImpl<_TrainerInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,username,profilePhotoPath,aboutMe);

@override
String toString() {
  return 'TrainerInfo(name: $name, username: $username, profilePhotoPath: $profilePhotoPath, aboutMe: $aboutMe)';
}


}

/// @nodoc
abstract mixin class _$TrainerInfoCopyWith<$Res> implements $TrainerInfoCopyWith<$Res> {
  factory _$TrainerInfoCopyWith(_TrainerInfo value, $Res Function(_TrainerInfo) _then) = __$TrainerInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? username, String? profilePhotoPath, String? aboutMe
});




}
/// @nodoc
class __$TrainerInfoCopyWithImpl<$Res>
    implements _$TrainerInfoCopyWith<$Res> {
  __$TrainerInfoCopyWithImpl(this._self, this._then);

  final _TrainerInfo _self;
  final $Res Function(_TrainerInfo) _then;

/// Create a copy of TrainerInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? username = freezed,Object? profilePhotoPath = freezed,Object? aboutMe = freezed,}) {
  return _then(_TrainerInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
