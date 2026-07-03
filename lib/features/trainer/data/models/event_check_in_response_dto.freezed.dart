// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_check_in_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EventCheckInResponseDto {

 Map<String, dynamic>? get booking; Map<String, dynamic>? get event; Map<String, dynamic>? get attendee; String? get checkedInAt;
/// Create a copy of EventCheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EventCheckInResponseDtoCopyWith<EventCheckInResponseDto> get copyWith => _$EventCheckInResponseDtoCopyWithImpl<EventCheckInResponseDto>(this as EventCheckInResponseDto, _$identity);

  /// Serializes this EventCheckInResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EventCheckInResponseDto&&const DeepCollectionEquality().equals(other.booking, booking)&&const DeepCollectionEquality().equals(other.event, event)&&const DeepCollectionEquality().equals(other.attendee, attendee)&&(identical(other.checkedInAt, checkedInAt) || other.checkedInAt == checkedInAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(booking),const DeepCollectionEquality().hash(event),const DeepCollectionEquality().hash(attendee),checkedInAt);

@override
String toString() {
  return 'EventCheckInResponseDto(booking: $booking, event: $event, attendee: $attendee, checkedInAt: $checkedInAt)';
}


}

/// @nodoc
abstract mixin class $EventCheckInResponseDtoCopyWith<$Res>  {
  factory $EventCheckInResponseDtoCopyWith(EventCheckInResponseDto value, $Res Function(EventCheckInResponseDto) _then) = _$EventCheckInResponseDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? booking, Map<String, dynamic>? event, Map<String, dynamic>? attendee, String? checkedInAt
});




}
/// @nodoc
class _$EventCheckInResponseDtoCopyWithImpl<$Res>
    implements $EventCheckInResponseDtoCopyWith<$Res> {
  _$EventCheckInResponseDtoCopyWithImpl(this._self, this._then);

  final EventCheckInResponseDto _self;
  final $Res Function(EventCheckInResponseDto) _then;

/// Create a copy of EventCheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? booking = freezed,Object? event = freezed,Object? attendee = freezed,Object? checkedInAt = freezed,}) {
  return _then(_self.copyWith(
booking: freezed == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,attendee: freezed == attendee ? _self.attendee : attendee // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,checkedInAt: freezed == checkedInAt ? _self.checkedInAt : checkedInAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EventCheckInResponseDto].
extension EventCheckInResponseDtoPatterns on EventCheckInResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EventCheckInResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventCheckInResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EventCheckInResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _EventCheckInResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EventCheckInResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _EventCheckInResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic>? booking,  Map<String, dynamic>? event,  Map<String, dynamic>? attendee,  String? checkedInAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventCheckInResponseDto() when $default != null:
return $default(_that.booking,_that.event,_that.attendee,_that.checkedInAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic>? booking,  Map<String, dynamic>? event,  Map<String, dynamic>? attendee,  String? checkedInAt)  $default,) {final _that = this;
switch (_that) {
case _EventCheckInResponseDto():
return $default(_that.booking,_that.event,_that.attendee,_that.checkedInAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic>? booking,  Map<String, dynamic>? event,  Map<String, dynamic>? attendee,  String? checkedInAt)?  $default,) {final _that = this;
switch (_that) {
case _EventCheckInResponseDto() when $default != null:
return $default(_that.booking,_that.event,_that.attendee,_that.checkedInAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EventCheckInResponseDto implements EventCheckInResponseDto {
  const _EventCheckInResponseDto({final  Map<String, dynamic>? booking, final  Map<String, dynamic>? event, final  Map<String, dynamic>? attendee, this.checkedInAt}): _booking = booking,_event = event,_attendee = attendee;
  factory _EventCheckInResponseDto.fromJson(Map<String, dynamic> json) => _$EventCheckInResponseDtoFromJson(json);

 final  Map<String, dynamic>? _booking;
@override Map<String, dynamic>? get booking {
  final value = _booking;
  if (value == null) return null;
  if (_booking is EqualUnmodifiableMapView) return _booking;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _event;
@override Map<String, dynamic>? get event {
  final value = _event;
  if (value == null) return null;
  if (_event is EqualUnmodifiableMapView) return _event;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _attendee;
@override Map<String, dynamic>? get attendee {
  final value = _attendee;
  if (value == null) return null;
  if (_attendee is EqualUnmodifiableMapView) return _attendee;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? checkedInAt;

/// Create a copy of EventCheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventCheckInResponseDtoCopyWith<_EventCheckInResponseDto> get copyWith => __$EventCheckInResponseDtoCopyWithImpl<_EventCheckInResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EventCheckInResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventCheckInResponseDto&&const DeepCollectionEquality().equals(other._booking, _booking)&&const DeepCollectionEquality().equals(other._event, _event)&&const DeepCollectionEquality().equals(other._attendee, _attendee)&&(identical(other.checkedInAt, checkedInAt) || other.checkedInAt == checkedInAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_booking),const DeepCollectionEquality().hash(_event),const DeepCollectionEquality().hash(_attendee),checkedInAt);

@override
String toString() {
  return 'EventCheckInResponseDto(booking: $booking, event: $event, attendee: $attendee, checkedInAt: $checkedInAt)';
}


}

/// @nodoc
abstract mixin class _$EventCheckInResponseDtoCopyWith<$Res> implements $EventCheckInResponseDtoCopyWith<$Res> {
  factory _$EventCheckInResponseDtoCopyWith(_EventCheckInResponseDto value, $Res Function(_EventCheckInResponseDto) _then) = __$EventCheckInResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic>? booking, Map<String, dynamic>? event, Map<String, dynamic>? attendee, String? checkedInAt
});




}
/// @nodoc
class __$EventCheckInResponseDtoCopyWithImpl<$Res>
    implements _$EventCheckInResponseDtoCopyWith<$Res> {
  __$EventCheckInResponseDtoCopyWithImpl(this._self, this._then);

  final _EventCheckInResponseDto _self;
  final $Res Function(_EventCheckInResponseDto) _then;

/// Create a copy of EventCheckInResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? booking = freezed,Object? event = freezed,Object? attendee = freezed,Object? checkedInAt = freezed,}) {
  return _then(_EventCheckInResponseDto(
booking: freezed == booking ? _self._booking : booking // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,event: freezed == event ? _self._event : event // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,attendee: freezed == attendee ? _self._attendee : attendee // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,checkedInAt: freezed == checkedInAt ? _self.checkedInAt : checkedInAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
