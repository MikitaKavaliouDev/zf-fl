// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerScheduleDto {

 Map<String, List<String>> get availability; List<BookingDto> get bookings;
/// Create a copy of TrainerScheduleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerScheduleDtoCopyWith<TrainerScheduleDto> get copyWith => _$TrainerScheduleDtoCopyWithImpl<TrainerScheduleDto>(this as TrainerScheduleDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerScheduleDto&&const DeepCollectionEquality().equals(other.availability, availability)&&const DeepCollectionEquality().equals(other.bookings, bookings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availability),const DeepCollectionEquality().hash(bookings));

@override
String toString() {
  return 'TrainerScheduleDto(availability: $availability, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class $TrainerScheduleDtoCopyWith<$Res>  {
  factory $TrainerScheduleDtoCopyWith(TrainerScheduleDto value, $Res Function(TrainerScheduleDto) _then) = _$TrainerScheduleDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, List<String>> availability, List<BookingDto> bookings
});




}
/// @nodoc
class _$TrainerScheduleDtoCopyWithImpl<$Res>
    implements $TrainerScheduleDtoCopyWith<$Res> {
  _$TrainerScheduleDtoCopyWithImpl(this._self, this._then);

  final TrainerScheduleDto _self;
  final $Res Function(TrainerScheduleDto) _then;

/// Create a copy of TrainerScheduleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availability = null,Object? bookings = null,}) {
  return _then(_self.copyWith(
availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,bookings: null == bookings ? _self.bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<BookingDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerScheduleDto].
extension TrainerScheduleDtoPatterns on TrainerScheduleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerScheduleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerScheduleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerScheduleDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerScheduleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerScheduleDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerScheduleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, List<String>> availability,  List<BookingDto> bookings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerScheduleDto() when $default != null:
return $default(_that.availability,_that.bookings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, List<String>> availability,  List<BookingDto> bookings)  $default,) {final _that = this;
switch (_that) {
case _TrainerScheduleDto():
return $default(_that.availability,_that.bookings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, List<String>> availability,  List<BookingDto> bookings)?  $default,) {final _that = this;
switch (_that) {
case _TrainerScheduleDto() when $default != null:
return $default(_that.availability,_that.bookings);case _:
  return null;

}
}

}

/// @nodoc


class _TrainerScheduleDto implements TrainerScheduleDto {
  const _TrainerScheduleDto({final  Map<String, List<String>> availability = const <String, List<String>>{}, final  List<BookingDto> bookings = const <BookingDto>[]}): _availability = availability,_bookings = bookings;
  

 final  Map<String, List<String>> _availability;
@override@JsonKey() Map<String, List<String>> get availability {
  if (_availability is EqualUnmodifiableMapView) return _availability;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_availability);
}

 final  List<BookingDto> _bookings;
@override@JsonKey() List<BookingDto> get bookings {
  if (_bookings is EqualUnmodifiableListView) return _bookings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bookings);
}


/// Create a copy of TrainerScheduleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerScheduleDtoCopyWith<_TrainerScheduleDto> get copyWith => __$TrainerScheduleDtoCopyWithImpl<_TrainerScheduleDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerScheduleDto&&const DeepCollectionEquality().equals(other._availability, _availability)&&const DeepCollectionEquality().equals(other._bookings, _bookings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availability),const DeepCollectionEquality().hash(_bookings));

@override
String toString() {
  return 'TrainerScheduleDto(availability: $availability, bookings: $bookings)';
}


}

/// @nodoc
abstract mixin class _$TrainerScheduleDtoCopyWith<$Res> implements $TrainerScheduleDtoCopyWith<$Res> {
  factory _$TrainerScheduleDtoCopyWith(_TrainerScheduleDto value, $Res Function(_TrainerScheduleDto) _then) = __$TrainerScheduleDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, List<String>> availability, List<BookingDto> bookings
});




}
/// @nodoc
class __$TrainerScheduleDtoCopyWithImpl<$Res>
    implements _$TrainerScheduleDtoCopyWith<$Res> {
  __$TrainerScheduleDtoCopyWithImpl(this._self, this._then);

  final _TrainerScheduleDto _self;
  final $Res Function(_TrainerScheduleDto) _then;

/// Create a copy of TrainerScheduleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availability = null,Object? bookings = null,}) {
  return _then(_TrainerScheduleDto(
availability: null == availability ? _self._availability : availability // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,bookings: null == bookings ? _self._bookings : bookings // ignore: cast_nullable_to_non_nullable
as List<BookingDto>,
  ));
}


}


/// @nodoc
mixin _$BookingDto {

 String get startTime; String get endTime;
/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingDtoCopyWith<BookingDto> get copyWith => _$BookingDtoCopyWithImpl<BookingDto>(this as BookingDto, _$identity);

  /// Serializes this BookingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingDto&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime);

@override
String toString() {
  return 'BookingDto(startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class $BookingDtoCopyWith<$Res>  {
  factory $BookingDtoCopyWith(BookingDto value, $Res Function(BookingDto) _then) = _$BookingDtoCopyWithImpl;
@useResult
$Res call({
 String startTime, String endTime
});




}
/// @nodoc
class _$BookingDtoCopyWithImpl<$Res>
    implements $BookingDtoCopyWith<$Res> {
  _$BookingDtoCopyWithImpl(this._self, this._then);

  final BookingDto _self;
  final $Res Function(BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? endTime = null,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingDto].
extension BookingDtoPatterns on BookingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String startTime,  String endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String startTime,  String endTime)  $default,) {final _that = this;
switch (_that) {
case _BookingDto():
return $default(_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String startTime,  String endTime)?  $default,) {final _that = this;
switch (_that) {
case _BookingDto() when $default != null:
return $default(_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingDto implements BookingDto {
  const _BookingDto({required this.startTime, required this.endTime});
  factory _BookingDto.fromJson(Map<String, dynamic> json) => _$BookingDtoFromJson(json);

@override final  String startTime;
@override final  String endTime;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingDtoCopyWith<_BookingDto> get copyWith => __$BookingDtoCopyWithImpl<_BookingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingDto&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime);

@override
String toString() {
  return 'BookingDto(startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$BookingDtoCopyWith<$Res> implements $BookingDtoCopyWith<$Res> {
  factory _$BookingDtoCopyWith(_BookingDto value, $Res Function(_BookingDto) _then) = __$BookingDtoCopyWithImpl;
@override @useResult
$Res call({
 String startTime, String endTime
});




}
/// @nodoc
class __$BookingDtoCopyWithImpl<$Res>
    implements _$BookingDtoCopyWith<$Res> {
  __$BookingDtoCopyWithImpl(this._self, this._then);

  final _BookingDto _self;
  final $Res Function(_BookingDto) _then;

/// Create a copy of BookingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? endTime = null,}) {
  return _then(_BookingDto(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
