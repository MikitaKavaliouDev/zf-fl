// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_client_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateClientRequestDto {

 String? get name; String? get email; String? get phone; String? get status; int? get checkInDay; int? get checkInHour;
/// Create a copy of UpdateClientRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateClientRequestDtoCopyWith<UpdateClientRequestDto> get copyWith => _$UpdateClientRequestDtoCopyWithImpl<UpdateClientRequestDto>(this as UpdateClientRequestDto, _$identity);

  /// Serializes this UpdateClientRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateClientRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInDay, checkInDay) || other.checkInDay == checkInDay)&&(identical(other.checkInHour, checkInHour) || other.checkInHour == checkInHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,status,checkInDay,checkInHour);

@override
String toString() {
  return 'UpdateClientRequestDto(name: $name, email: $email, phone: $phone, status: $status, checkInDay: $checkInDay, checkInHour: $checkInHour)';
}


}

/// @nodoc
abstract mixin class $UpdateClientRequestDtoCopyWith<$Res>  {
  factory $UpdateClientRequestDtoCopyWith(UpdateClientRequestDto value, $Res Function(UpdateClientRequestDto) _then) = _$UpdateClientRequestDtoCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? phone, String? status, int? checkInDay, int? checkInHour
});




}
/// @nodoc
class _$UpdateClientRequestDtoCopyWithImpl<$Res>
    implements $UpdateClientRequestDtoCopyWith<$Res> {
  _$UpdateClientRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateClientRequestDto _self;
  final $Res Function(UpdateClientRequestDto) _then;

/// Create a copy of UpdateClientRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? status = freezed,Object? checkInDay = freezed,Object? checkInHour = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,checkInDay: freezed == checkInDay ? _self.checkInDay : checkInDay // ignore: cast_nullable_to_non_nullable
as int?,checkInHour: freezed == checkInHour ? _self.checkInHour : checkInHour // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateClientRequestDto].
extension UpdateClientRequestDtoPatterns on UpdateClientRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateClientRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateClientRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateClientRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateClientRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateClientRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateClientRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  String? status,  int? checkInDay,  int? checkInHour)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateClientRequestDto() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.status,_that.checkInDay,_that.checkInHour);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  String? status,  int? checkInDay,  int? checkInHour)  $default,) {final _that = this;
switch (_that) {
case _UpdateClientRequestDto():
return $default(_that.name,_that.email,_that.phone,_that.status,_that.checkInDay,_that.checkInHour);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? phone,  String? status,  int? checkInDay,  int? checkInHour)?  $default,) {final _that = this;
switch (_that) {
case _UpdateClientRequestDto() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.status,_that.checkInDay,_that.checkInHour);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateClientRequestDto implements UpdateClientRequestDto {
  const _UpdateClientRequestDto({this.name, this.email, this.phone, this.status, this.checkInDay, this.checkInHour});
  factory _UpdateClientRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateClientRequestDtoFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  String? status;
@override final  int? checkInDay;
@override final  int? checkInHour;

/// Create a copy of UpdateClientRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateClientRequestDtoCopyWith<_UpdateClientRequestDto> get copyWith => __$UpdateClientRequestDtoCopyWithImpl<_UpdateClientRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateClientRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateClientRequestDto&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkInDay, checkInDay) || other.checkInDay == checkInDay)&&(identical(other.checkInHour, checkInHour) || other.checkInHour == checkInHour));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,email,phone,status,checkInDay,checkInHour);

@override
String toString() {
  return 'UpdateClientRequestDto(name: $name, email: $email, phone: $phone, status: $status, checkInDay: $checkInDay, checkInHour: $checkInHour)';
}


}

/// @nodoc
abstract mixin class _$UpdateClientRequestDtoCopyWith<$Res> implements $UpdateClientRequestDtoCopyWith<$Res> {
  factory _$UpdateClientRequestDtoCopyWith(_UpdateClientRequestDto value, $Res Function(_UpdateClientRequestDto) _then) = __$UpdateClientRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? phone, String? status, int? checkInDay, int? checkInHour
});




}
/// @nodoc
class __$UpdateClientRequestDtoCopyWithImpl<$Res>
    implements _$UpdateClientRequestDtoCopyWith<$Res> {
  __$UpdateClientRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateClientRequestDto _self;
  final $Res Function(_UpdateClientRequestDto) _then;

/// Create a copy of UpdateClientRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? status = freezed,Object? checkInDay = freezed,Object? checkInHour = freezed,}) {
  return _then(_UpdateClientRequestDto(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,checkInDay: freezed == checkInDay ? _self.checkInDay : checkInDay // ignore: cast_nullable_to_non_nullable
as int?,checkInHour: freezed == checkInHour ? _self.checkInHour : checkInHour // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
