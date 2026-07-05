// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_check_in_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RequestCheckInDto {

 String get clientId; String get checkInType; String get dueDate; String? get message;
/// Create a copy of RequestCheckInDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestCheckInDtoCopyWith<RequestCheckInDto> get copyWith => _$RequestCheckInDtoCopyWithImpl<RequestCheckInDto>(this as RequestCheckInDto, _$identity);

  /// Serializes this RequestCheckInDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestCheckInDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.checkInType, checkInType) || other.checkInType == checkInType)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,checkInType,dueDate,message);

@override
String toString() {
  return 'RequestCheckInDto(clientId: $clientId, checkInType: $checkInType, dueDate: $dueDate, message: $message)';
}


}

/// @nodoc
abstract mixin class $RequestCheckInDtoCopyWith<$Res>  {
  factory $RequestCheckInDtoCopyWith(RequestCheckInDto value, $Res Function(RequestCheckInDto) _then) = _$RequestCheckInDtoCopyWithImpl;
@useResult
$Res call({
 String clientId, String checkInType, String dueDate, String? message
});




}
/// @nodoc
class _$RequestCheckInDtoCopyWithImpl<$Res>
    implements $RequestCheckInDtoCopyWith<$Res> {
  _$RequestCheckInDtoCopyWithImpl(this._self, this._then);

  final RequestCheckInDto _self;
  final $Res Function(RequestCheckInDto) _then;

/// Create a copy of RequestCheckInDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? checkInType = null,Object? dueDate = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,checkInType: null == checkInType ? _self.checkInType : checkInType // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RequestCheckInDto].
extension RequestCheckInDtoPatterns on RequestCheckInDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RequestCheckInDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCheckInDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RequestCheckInDto value)  $default,){
final _that = this;
switch (_that) {
case _RequestCheckInDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RequestCheckInDto value)?  $default,){
final _that = this;
switch (_that) {
case _RequestCheckInDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId,  String checkInType,  String dueDate,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCheckInDto() when $default != null:
return $default(_that.clientId,_that.checkInType,_that.dueDate,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId,  String checkInType,  String dueDate,  String? message)  $default,) {final _that = this;
switch (_that) {
case _RequestCheckInDto():
return $default(_that.clientId,_that.checkInType,_that.dueDate,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId,  String checkInType,  String dueDate,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _RequestCheckInDto() when $default != null:
return $default(_that.clientId,_that.checkInType,_that.dueDate,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RequestCheckInDto implements RequestCheckInDto {
  const _RequestCheckInDto({required this.clientId, required this.checkInType, required this.dueDate, this.message});
  factory _RequestCheckInDto.fromJson(Map<String, dynamic> json) => _$RequestCheckInDtoFromJson(json);

@override final  String clientId;
@override final  String checkInType;
@override final  String dueDate;
@override final  String? message;

/// Create a copy of RequestCheckInDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequestCheckInDtoCopyWith<_RequestCheckInDto> get copyWith => __$RequestCheckInDtoCopyWithImpl<_RequestCheckInDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequestCheckInDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCheckInDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.checkInType, checkInType) || other.checkInType == checkInType)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,checkInType,dueDate,message);

@override
String toString() {
  return 'RequestCheckInDto(clientId: $clientId, checkInType: $checkInType, dueDate: $dueDate, message: $message)';
}


}

/// @nodoc
abstract mixin class _$RequestCheckInDtoCopyWith<$Res> implements $RequestCheckInDtoCopyWith<$Res> {
  factory _$RequestCheckInDtoCopyWith(_RequestCheckInDto value, $Res Function(_RequestCheckInDto) _then) = __$RequestCheckInDtoCopyWithImpl;
@override @useResult
$Res call({
 String clientId, String checkInType, String dueDate, String? message
});




}
/// @nodoc
class __$RequestCheckInDtoCopyWithImpl<$Res>
    implements _$RequestCheckInDtoCopyWith<$Res> {
  __$RequestCheckInDtoCopyWithImpl(this._self, this._then);

  final _RequestCheckInDto _self;
  final $Res Function(_RequestCheckInDto) _then;

/// Create a copy of RequestCheckInDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? checkInType = null,Object? dueDate = null,Object? message = freezed,}) {
  return _then(_RequestCheckInDto(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,checkInType: null == checkInType ? _self.checkInType : checkInType // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
