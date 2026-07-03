// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_check_in_list_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerCheckInListItemDto {

 String get id; String get clientId; String get date; String get status; String? get trainerResponse; String? get reviewedAt; CheckInClientRefDto get client;
/// Create a copy of TrainerCheckInListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCheckInListItemDtoCopyWith<TrainerCheckInListItemDto> get copyWith => _$TrainerCheckInListItemDtoCopyWithImpl<TrainerCheckInListItemDto>(this as TrainerCheckInListItemDto, _$identity);

  /// Serializes this TrainerCheckInListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInListItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.trainerResponse, trainerResponse) || other.trainerResponse == trainerResponse)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.client, client) || other.client == client));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,date,status,trainerResponse,reviewedAt,client);

@override
String toString() {
  return 'TrainerCheckInListItemDto(id: $id, clientId: $clientId, date: $date, status: $status, trainerResponse: $trainerResponse, reviewedAt: $reviewedAt, client: $client)';
}


}

/// @nodoc
abstract mixin class $TrainerCheckInListItemDtoCopyWith<$Res>  {
  factory $TrainerCheckInListItemDtoCopyWith(TrainerCheckInListItemDto value, $Res Function(TrainerCheckInListItemDto) _then) = _$TrainerCheckInListItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String date, String status, String? trainerResponse, String? reviewedAt, CheckInClientRefDto client
});


$CheckInClientRefDtoCopyWith<$Res> get client;

}
/// @nodoc
class _$TrainerCheckInListItemDtoCopyWithImpl<$Res>
    implements $TrainerCheckInListItemDtoCopyWith<$Res> {
  _$TrainerCheckInListItemDtoCopyWithImpl(this._self, this._then);

  final TrainerCheckInListItemDto _self;
  final $Res Function(TrainerCheckInListItemDto) _then;

/// Create a copy of TrainerCheckInListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? date = null,Object? status = null,Object? trainerResponse = freezed,Object? reviewedAt = freezed,Object? client = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,trainerResponse: freezed == trainerResponse ? _self.trainerResponse : trainerResponse // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as String?,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as CheckInClientRefDto,
  ));
}
/// Create a copy of TrainerCheckInListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInClientRefDtoCopyWith<$Res> get client {
  
  return $CheckInClientRefDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainerCheckInListItemDto].
extension TrainerCheckInListItemDtoPatterns on TrainerCheckInListItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerCheckInListItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerCheckInListItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerCheckInListItemDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerCheckInListItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerCheckInListItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerCheckInListItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String date,  String status,  String? trainerResponse,  String? reviewedAt,  CheckInClientRefDto client)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerCheckInListItemDto() when $default != null:
return $default(_that.id,_that.clientId,_that.date,_that.status,_that.trainerResponse,_that.reviewedAt,_that.client);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String date,  String status,  String? trainerResponse,  String? reviewedAt,  CheckInClientRefDto client)  $default,) {final _that = this;
switch (_that) {
case _TrainerCheckInListItemDto():
return $default(_that.id,_that.clientId,_that.date,_that.status,_that.trainerResponse,_that.reviewedAt,_that.client);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String date,  String status,  String? trainerResponse,  String? reviewedAt,  CheckInClientRefDto client)?  $default,) {final _that = this;
switch (_that) {
case _TrainerCheckInListItemDto() when $default != null:
return $default(_that.id,_that.clientId,_that.date,_that.status,_that.trainerResponse,_that.reviewedAt,_that.client);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerCheckInListItemDto implements TrainerCheckInListItemDto {
  const _TrainerCheckInListItemDto({required this.id, required this.clientId, required this.date, required this.status, this.trainerResponse, this.reviewedAt, required this.client});
  factory _TrainerCheckInListItemDto.fromJson(Map<String, dynamic> json) => _$TrainerCheckInListItemDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String date;
@override final  String status;
@override final  String? trainerResponse;
@override final  String? reviewedAt;
@override final  CheckInClientRefDto client;

/// Create a copy of TrainerCheckInListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerCheckInListItemDtoCopyWith<_TrainerCheckInListItemDto> get copyWith => __$TrainerCheckInListItemDtoCopyWithImpl<_TrainerCheckInListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerCheckInListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerCheckInListItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.trainerResponse, trainerResponse) || other.trainerResponse == trainerResponse)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt)&&(identical(other.client, client) || other.client == client));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,date,status,trainerResponse,reviewedAt,client);

@override
String toString() {
  return 'TrainerCheckInListItemDto(id: $id, clientId: $clientId, date: $date, status: $status, trainerResponse: $trainerResponse, reviewedAt: $reviewedAt, client: $client)';
}


}

/// @nodoc
abstract mixin class _$TrainerCheckInListItemDtoCopyWith<$Res> implements $TrainerCheckInListItemDtoCopyWith<$Res> {
  factory _$TrainerCheckInListItemDtoCopyWith(_TrainerCheckInListItemDto value, $Res Function(_TrainerCheckInListItemDto) _then) = __$TrainerCheckInListItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String date, String status, String? trainerResponse, String? reviewedAt, CheckInClientRefDto client
});


@override $CheckInClientRefDtoCopyWith<$Res> get client;

}
/// @nodoc
class __$TrainerCheckInListItemDtoCopyWithImpl<$Res>
    implements _$TrainerCheckInListItemDtoCopyWith<$Res> {
  __$TrainerCheckInListItemDtoCopyWithImpl(this._self, this._then);

  final _TrainerCheckInListItemDto _self;
  final $Res Function(_TrainerCheckInListItemDto) _then;

/// Create a copy of TrainerCheckInListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? date = null,Object? status = null,Object? trainerResponse = freezed,Object? reviewedAt = freezed,Object? client = null,}) {
  return _then(_TrainerCheckInListItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,trainerResponse: freezed == trainerResponse ? _self.trainerResponse : trainerResponse // ignore: cast_nullable_to_non_nullable
as String?,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as String?,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as CheckInClientRefDto,
  ));
}

/// Create a copy of TrainerCheckInListItemDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInClientRefDtoCopyWith<$Res> get client {
  
  return $CheckInClientRefDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

// dart format on
