// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventDetailDto {

 String get id; String get title; String? get description;@JsonKey(name: 'startTime') DateTime get date;@JsonKey(name: 'locationName') String? get location;@JsonKey(name: 'category') String? get category; double get price;@JsonKey(name: 'latitude') double? get lat;@JsonKey(name: 'longitude') double? get lon;@JsonKey(name: 'trainer') CreatedBy? get createdBy;@JsonKey(name: 'enrolledCount') int get bookingCount;@JsonKey(name: 'capacity') int? get maxAttendees;
/// Create a copy of EventDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventDetailDtoCopyWith<EventDetailDto> get copyWith => _$EventDetailDtoCopyWithImpl<EventDetailDto>(this as EventDetailDto, _$identity);

  /// Serializes this EventDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.location, location) || other.location == location)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.bookingCount, bookingCount) || other.bookingCount == bookingCount)&&(identical(other.maxAttendees, maxAttendees) || other.maxAttendees == maxAttendees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,date,location,category,price,lat,lon,createdBy,bookingCount,maxAttendees);

@override
String toString() {
  return 'EventDetailDto(id: $id, title: $title, description: $description, date: $date, location: $location, category: $category, price: $price, lat: $lat, lon: $lon, createdBy: $createdBy, bookingCount: $bookingCount, maxAttendees: $maxAttendees)';
}


}

/// @nodoc
abstract mixin class $EventDetailDtoCopyWith<$Res>  {
  factory $EventDetailDtoCopyWith(EventDetailDto value, $Res Function(EventDetailDto) _then) = _$EventDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'startTime') DateTime date,@JsonKey(name: 'locationName') String? location,@JsonKey(name: 'category') String? category, double price,@JsonKey(name: 'latitude') double? lat,@JsonKey(name: 'longitude') double? lon,@JsonKey(name: 'trainer') CreatedBy? createdBy,@JsonKey(name: 'enrolledCount') int bookingCount,@JsonKey(name: 'capacity') int? maxAttendees
});


$CreatedByCopyWith<$Res>? get createdBy;

}
/// @nodoc
class _$EventDetailDtoCopyWithImpl<$Res>
    implements $EventDetailDtoCopyWith<$Res> {
  _$EventDetailDtoCopyWithImpl(this._self, this._then);

  final EventDetailDto _self;
  final $Res Function(EventDetailDto) _then;

/// Create a copy of EventDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? date = null,Object? location = freezed,Object? category = freezed,Object? price = null,Object? lat = freezed,Object? lon = freezed,Object? createdBy = freezed,Object? bookingCount = null,Object? maxAttendees = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedBy?,bookingCount: null == bookingCount ? _self.bookingCount : bookingCount // ignore: cast_nullable_to_non_nullable
as int,maxAttendees: freezed == maxAttendees ? _self.maxAttendees : maxAttendees // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of EventDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// Adds pattern-matching-related methods to [EventDetailDto].
extension EventDetailDtoPatterns on EventDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _EventDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _EventDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'startTime')  DateTime date, @JsonKey(name: 'locationName')  String? location, @JsonKey(name: 'category')  String? category,  double price, @JsonKey(name: 'latitude')  double? lat, @JsonKey(name: 'longitude')  double? lon, @JsonKey(name: 'trainer')  CreatedBy? createdBy, @JsonKey(name: 'enrolledCount')  int bookingCount, @JsonKey(name: 'capacity')  int? maxAttendees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventDetailDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.date,_that.location,_that.category,_that.price,_that.lat,_that.lon,_that.createdBy,_that.bookingCount,_that.maxAttendees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description, @JsonKey(name: 'startTime')  DateTime date, @JsonKey(name: 'locationName')  String? location, @JsonKey(name: 'category')  String? category,  double price, @JsonKey(name: 'latitude')  double? lat, @JsonKey(name: 'longitude')  double? lon, @JsonKey(name: 'trainer')  CreatedBy? createdBy, @JsonKey(name: 'enrolledCount')  int bookingCount, @JsonKey(name: 'capacity')  int? maxAttendees)  $default,) {final _that = this;
switch (_that) {
case _EventDetailDto():
return $default(_that.id,_that.title,_that.description,_that.date,_that.location,_that.category,_that.price,_that.lat,_that.lon,_that.createdBy,_that.bookingCount,_that.maxAttendees);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description, @JsonKey(name: 'startTime')  DateTime date, @JsonKey(name: 'locationName')  String? location, @JsonKey(name: 'category')  String? category,  double price, @JsonKey(name: 'latitude')  double? lat, @JsonKey(name: 'longitude')  double? lon, @JsonKey(name: 'trainer')  CreatedBy? createdBy, @JsonKey(name: 'enrolledCount')  int bookingCount, @JsonKey(name: 'capacity')  int? maxAttendees)?  $default,) {final _that = this;
switch (_that) {
case _EventDetailDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.date,_that.location,_that.category,_that.price,_that.lat,_that.lon,_that.createdBy,_that.bookingCount,_that.maxAttendees);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventDetailDto extends EventDetailDto {
  const _EventDetailDto({required this.id, required this.title, this.description, @JsonKey(name: 'startTime') required this.date, @JsonKey(name: 'locationName') this.location, @JsonKey(name: 'category') this.category, this.price = 0, @JsonKey(name: 'latitude') this.lat, @JsonKey(name: 'longitude') this.lon, @JsonKey(name: 'trainer') this.createdBy, @JsonKey(name: 'enrolledCount') this.bookingCount = 0, @JsonKey(name: 'capacity') this.maxAttendees}): super._();
  factory _EventDetailDto.fromJson(Map<String, dynamic> json) => _$EventDetailDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey(name: 'startTime') final  DateTime date;
@override@JsonKey(name: 'locationName') final  String? location;
@override@JsonKey(name: 'category') final  String? category;
@override@JsonKey() final  double price;
@override@JsonKey(name: 'latitude') final  double? lat;
@override@JsonKey(name: 'longitude') final  double? lon;
@override@JsonKey(name: 'trainer') final  CreatedBy? createdBy;
@override@JsonKey(name: 'enrolledCount') final  int bookingCount;
@override@JsonKey(name: 'capacity') final  int? maxAttendees;

/// Create a copy of EventDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventDetailDtoCopyWith<_EventDetailDto> get copyWith => __$EventDetailDtoCopyWithImpl<_EventDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.date, date) || other.date == date)&&(identical(other.location, location) || other.location == location)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lon, lon) || other.lon == lon)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.bookingCount, bookingCount) || other.bookingCount == bookingCount)&&(identical(other.maxAttendees, maxAttendees) || other.maxAttendees == maxAttendees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,date,location,category,price,lat,lon,createdBy,bookingCount,maxAttendees);

@override
String toString() {
  return 'EventDetailDto(id: $id, title: $title, description: $description, date: $date, location: $location, category: $category, price: $price, lat: $lat, lon: $lon, createdBy: $createdBy, bookingCount: $bookingCount, maxAttendees: $maxAttendees)';
}


}

/// @nodoc
abstract mixin class _$EventDetailDtoCopyWith<$Res> implements $EventDetailDtoCopyWith<$Res> {
  factory _$EventDetailDtoCopyWith(_EventDetailDto value, $Res Function(_EventDetailDto) _then) = __$EventDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description,@JsonKey(name: 'startTime') DateTime date,@JsonKey(name: 'locationName') String? location,@JsonKey(name: 'category') String? category, double price,@JsonKey(name: 'latitude') double? lat,@JsonKey(name: 'longitude') double? lon,@JsonKey(name: 'trainer') CreatedBy? createdBy,@JsonKey(name: 'enrolledCount') int bookingCount,@JsonKey(name: 'capacity') int? maxAttendees
});


@override $CreatedByCopyWith<$Res>? get createdBy;

}
/// @nodoc
class __$EventDetailDtoCopyWithImpl<$Res>
    implements _$EventDetailDtoCopyWith<$Res> {
  __$EventDetailDtoCopyWithImpl(this._self, this._then);

  final _EventDetailDto _self;
  final $Res Function(_EventDetailDto) _then;

/// Create a copy of EventDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? date = null,Object? location = freezed,Object? category = freezed,Object? price = null,Object? lat = freezed,Object? lon = freezed,Object? createdBy = freezed,Object? bookingCount = null,Object? maxAttendees = freezed,}) {
  return _then(_EventDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lon: freezed == lon ? _self.lon : lon // ignore: cast_nullable_to_non_nullable
as double?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as CreatedBy?,bookingCount: null == bookingCount ? _self.bookingCount : bookingCount // ignore: cast_nullable_to_non_nullable
as int,maxAttendees: freezed == maxAttendees ? _self.maxAttendees : maxAttendees // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of EventDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreatedByCopyWith<$Res>? get createdBy {
    if (_self.createdBy == null) {
    return null;
  }

  return $CreatedByCopyWith<$Res>(_self.createdBy!, (value) {
    return _then(_self.copyWith(createdBy: value));
  });
}
}


/// @nodoc
mixin _$CreatedBy {

 String get id; String? get name; String? get username; String? get profilePhotoPath; String? get aboutMe;
/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatedByCopyWith<CreatedBy> get copyWith => _$CreatedByCopyWithImpl<CreatedBy>(this as CreatedBy, _$identity);

  /// Serializes this CreatedBy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatedBy&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,profilePhotoPath,aboutMe);

@override
String toString() {
  return 'CreatedBy(id: $id, name: $name, username: $username, profilePhotoPath: $profilePhotoPath, aboutMe: $aboutMe)';
}


}

/// @nodoc
abstract mixin class $CreatedByCopyWith<$Res>  {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) _then) = _$CreatedByCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? username, String? profilePhotoPath, String? aboutMe
});




}
/// @nodoc
class _$CreatedByCopyWithImpl<$Res>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._self, this._then);

  final CreatedBy _self;
  final $Res Function(CreatedBy) _then;

/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? username = freezed,Object? profilePhotoPath = freezed,Object? aboutMe = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatedBy].
extension CreatedByPatterns on CreatedBy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatedBy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatedBy value)  $default,){
final _that = this;
switch (_that) {
case _CreatedBy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatedBy value)?  $default,){
final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? username,  String? profilePhotoPath,  String? aboutMe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.profilePhotoPath,_that.aboutMe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? username,  String? profilePhotoPath,  String? aboutMe)  $default,) {final _that = this;
switch (_that) {
case _CreatedBy():
return $default(_that.id,_that.name,_that.username,_that.profilePhotoPath,_that.aboutMe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? username,  String? profilePhotoPath,  String? aboutMe)?  $default,) {final _that = this;
switch (_that) {
case _CreatedBy() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.profilePhotoPath,_that.aboutMe);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatedBy implements CreatedBy {
  const _CreatedBy({this.id = '', this.name, this.username, this.profilePhotoPath, this.aboutMe});
  factory _CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);

@override@JsonKey() final  String id;
@override final  String? name;
@override final  String? username;
@override final  String? profilePhotoPath;
@override final  String? aboutMe;

/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatedByCopyWith<_CreatedBy> get copyWith => __$CreatedByCopyWithImpl<_CreatedBy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatedByToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatedBy&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,profilePhotoPath,aboutMe);

@override
String toString() {
  return 'CreatedBy(id: $id, name: $name, username: $username, profilePhotoPath: $profilePhotoPath, aboutMe: $aboutMe)';
}


}

/// @nodoc
abstract mixin class _$CreatedByCopyWith<$Res> implements $CreatedByCopyWith<$Res> {
  factory _$CreatedByCopyWith(_CreatedBy value, $Res Function(_CreatedBy) _then) = __$CreatedByCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? username, String? profilePhotoPath, String? aboutMe
});




}
/// @nodoc
class __$CreatedByCopyWithImpl<$Res>
    implements _$CreatedByCopyWith<$Res> {
  __$CreatedByCopyWithImpl(this._self, this._then);

  final _CreatedBy _self;
  final $Res Function(_CreatedBy) _then;

/// Create a copy of CreatedBy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? username = freezed,Object? profilePhotoPath = freezed,Object? aboutMe = freezed,}) {
  return _then(_CreatedBy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
