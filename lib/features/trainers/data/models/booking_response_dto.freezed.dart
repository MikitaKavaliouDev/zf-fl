// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingResponseDto {

 String get id; String get trainerId; String? get clientId; String? get clientName; String? get clientEmail; String? get clientNotes; String get startTime; String get endTime; String get status; String? get createdAt; String? get updatedAt;
/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingResponseDtoCopyWith<BookingResponseDto> get copyWith => _$BookingResponseDtoCopyWithImpl<BookingResponseDto>(this as BookingResponseDto, _$identity);

  /// Serializes this BookingResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientEmail, clientEmail) || other.clientEmail == clientEmail)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainerId,clientId,clientName,clientEmail,clientNotes,startTime,endTime,status,createdAt,updatedAt);

@override
String toString() {
  return 'BookingResponseDto(id: $id, trainerId: $trainerId, clientId: $clientId, clientName: $clientName, clientEmail: $clientEmail, clientNotes: $clientNotes, startTime: $startTime, endTime: $endTime, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BookingResponseDtoCopyWith<$Res>  {
  factory $BookingResponseDtoCopyWith(BookingResponseDto value, $Res Function(BookingResponseDto) _then) = _$BookingResponseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String trainerId, String? clientId, String? clientName, String? clientEmail, String? clientNotes, String startTime, String endTime, String status, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$BookingResponseDtoCopyWithImpl<$Res>
    implements $BookingResponseDtoCopyWith<$Res> {
  _$BookingResponseDtoCopyWithImpl(this._self, this._then);

  final BookingResponseDto _self;
  final $Res Function(BookingResponseDto) _then;

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trainerId = null,Object? clientId = freezed,Object? clientName = freezed,Object? clientEmail = freezed,Object? clientNotes = freezed,Object? startTime = null,Object? endTime = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainerId: null == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,clientEmail: freezed == clientEmail ? _self.clientEmail : clientEmail // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: freezed == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookingResponseDto].
extension BookingResponseDtoPatterns on BookingResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _BookingResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String trainerId,  String? clientId,  String? clientName,  String? clientEmail,  String? clientNotes,  String startTime,  String endTime,  String status,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
return $default(_that.id,_that.trainerId,_that.clientId,_that.clientName,_that.clientEmail,_that.clientNotes,_that.startTime,_that.endTime,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String trainerId,  String? clientId,  String? clientName,  String? clientEmail,  String? clientNotes,  String startTime,  String endTime,  String status,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BookingResponseDto():
return $default(_that.id,_that.trainerId,_that.clientId,_that.clientName,_that.clientEmail,_that.clientNotes,_that.startTime,_that.endTime,_that.status,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String trainerId,  String? clientId,  String? clientName,  String? clientEmail,  String? clientNotes,  String startTime,  String endTime,  String status,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BookingResponseDto() when $default != null:
return $default(_that.id,_that.trainerId,_that.clientId,_that.clientName,_that.clientEmail,_that.clientNotes,_that.startTime,_that.endTime,_that.status,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingResponseDto implements BookingResponseDto {
  const _BookingResponseDto({required this.id, required this.trainerId, this.clientId, this.clientName, this.clientEmail, this.clientNotes, required this.startTime, required this.endTime, required this.status, this.createdAt, this.updatedAt});
  factory _BookingResponseDto.fromJson(Map<String, dynamic> json) => _$BookingResponseDtoFromJson(json);

@override final  String id;
@override final  String trainerId;
@override final  String? clientId;
@override final  String? clientName;
@override final  String? clientEmail;
@override final  String? clientNotes;
@override final  String startTime;
@override final  String endTime;
@override final  String status;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingResponseDtoCopyWith<_BookingResponseDto> get copyWith => __$BookingResponseDtoCopyWithImpl<_BookingResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientEmail, clientEmail) || other.clientEmail == clientEmail)&&(identical(other.clientNotes, clientNotes) || other.clientNotes == clientNotes)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainerId,clientId,clientName,clientEmail,clientNotes,startTime,endTime,status,createdAt,updatedAt);

@override
String toString() {
  return 'BookingResponseDto(id: $id, trainerId: $trainerId, clientId: $clientId, clientName: $clientName, clientEmail: $clientEmail, clientNotes: $clientNotes, startTime: $startTime, endTime: $endTime, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BookingResponseDtoCopyWith<$Res> implements $BookingResponseDtoCopyWith<$Res> {
  factory _$BookingResponseDtoCopyWith(_BookingResponseDto value, $Res Function(_BookingResponseDto) _then) = __$BookingResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String trainerId, String? clientId, String? clientName, String? clientEmail, String? clientNotes, String startTime, String endTime, String status, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$BookingResponseDtoCopyWithImpl<$Res>
    implements _$BookingResponseDtoCopyWith<$Res> {
  __$BookingResponseDtoCopyWithImpl(this._self, this._then);

  final _BookingResponseDto _self;
  final $Res Function(_BookingResponseDto) _then;

/// Create a copy of BookingResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trainerId = null,Object? clientId = freezed,Object? clientName = freezed,Object? clientEmail = freezed,Object? clientNotes = freezed,Object? startTime = null,Object? endTime = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BookingResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainerId: null == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientName: freezed == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String?,clientEmail: freezed == clientEmail ? _self.clientEmail : clientEmail // ignore: cast_nullable_to_non_nullable
as String?,clientNotes: freezed == clientNotes ? _self.clientNotes : clientNotes // ignore: cast_nullable_to_non_nullable
as String?,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
