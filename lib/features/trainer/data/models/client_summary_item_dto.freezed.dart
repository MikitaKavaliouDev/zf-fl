// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_summary_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientSummaryItemDto {

 String get date; String get clientId; String get clientFirstName; String get clientLastName; String? get clientAvatarUrl;
/// Create a copy of ClientSummaryItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSummaryItemDtoCopyWith<ClientSummaryItemDto> get copyWith => _$ClientSummaryItemDtoCopyWithImpl<ClientSummaryItemDto>(this as ClientSummaryItemDto, _$identity);

  /// Serializes this ClientSummaryItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSummaryItemDto&&(identical(other.date, date) || other.date == date)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientFirstName, clientFirstName) || other.clientFirstName == clientFirstName)&&(identical(other.clientLastName, clientLastName) || other.clientLastName == clientLastName)&&(identical(other.clientAvatarUrl, clientAvatarUrl) || other.clientAvatarUrl == clientAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,clientId,clientFirstName,clientLastName,clientAvatarUrl);

@override
String toString() {
  return 'ClientSummaryItemDto(date: $date, clientId: $clientId, clientFirstName: $clientFirstName, clientLastName: $clientLastName, clientAvatarUrl: $clientAvatarUrl)';
}


}

/// @nodoc
abstract mixin class $ClientSummaryItemDtoCopyWith<$Res>  {
  factory $ClientSummaryItemDtoCopyWith(ClientSummaryItemDto value, $Res Function(ClientSummaryItemDto) _then) = _$ClientSummaryItemDtoCopyWithImpl;
@useResult
$Res call({
 String date, String clientId, String clientFirstName, String clientLastName, String? clientAvatarUrl
});




}
/// @nodoc
class _$ClientSummaryItemDtoCopyWithImpl<$Res>
    implements $ClientSummaryItemDtoCopyWith<$Res> {
  _$ClientSummaryItemDtoCopyWithImpl(this._self, this._then);

  final ClientSummaryItemDto _self;
  final $Res Function(ClientSummaryItemDto) _then;

/// Create a copy of ClientSummaryItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? clientId = null,Object? clientFirstName = null,Object? clientLastName = null,Object? clientAvatarUrl = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientFirstName: null == clientFirstName ? _self.clientFirstName : clientFirstName // ignore: cast_nullable_to_non_nullable
as String,clientLastName: null == clientLastName ? _self.clientLastName : clientLastName // ignore: cast_nullable_to_non_nullable
as String,clientAvatarUrl: freezed == clientAvatarUrl ? _self.clientAvatarUrl : clientAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientSummaryItemDto].
extension ClientSummaryItemDtoPatterns on ClientSummaryItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientSummaryItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientSummaryItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientSummaryItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientSummaryItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientSummaryItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientSummaryItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  String clientId,  String clientFirstName,  String clientLastName,  String? clientAvatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientSummaryItemDto() when $default != null:
return $default(_that.date,_that.clientId,_that.clientFirstName,_that.clientLastName,_that.clientAvatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  String clientId,  String clientFirstName,  String clientLastName,  String? clientAvatarUrl)  $default,) {final _that = this;
switch (_that) {
case _ClientSummaryItemDto():
return $default(_that.date,_that.clientId,_that.clientFirstName,_that.clientLastName,_that.clientAvatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  String clientId,  String clientFirstName,  String clientLastName,  String? clientAvatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _ClientSummaryItemDto() when $default != null:
return $default(_that.date,_that.clientId,_that.clientFirstName,_that.clientLastName,_that.clientAvatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientSummaryItemDto implements ClientSummaryItemDto {
  const _ClientSummaryItemDto({required this.date, required this.clientId, required this.clientFirstName, required this.clientLastName, this.clientAvatarUrl});
  factory _ClientSummaryItemDto.fromJson(Map<String, dynamic> json) => _$ClientSummaryItemDtoFromJson(json);

@override final  String date;
@override final  String clientId;
@override final  String clientFirstName;
@override final  String clientLastName;
@override final  String? clientAvatarUrl;

/// Create a copy of ClientSummaryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientSummaryItemDtoCopyWith<_ClientSummaryItemDto> get copyWith => __$ClientSummaryItemDtoCopyWithImpl<_ClientSummaryItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientSummaryItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientSummaryItemDto&&(identical(other.date, date) || other.date == date)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientFirstName, clientFirstName) || other.clientFirstName == clientFirstName)&&(identical(other.clientLastName, clientLastName) || other.clientLastName == clientLastName)&&(identical(other.clientAvatarUrl, clientAvatarUrl) || other.clientAvatarUrl == clientAvatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,clientId,clientFirstName,clientLastName,clientAvatarUrl);

@override
String toString() {
  return 'ClientSummaryItemDto(date: $date, clientId: $clientId, clientFirstName: $clientFirstName, clientLastName: $clientLastName, clientAvatarUrl: $clientAvatarUrl)';
}


}

/// @nodoc
abstract mixin class _$ClientSummaryItemDtoCopyWith<$Res> implements $ClientSummaryItemDtoCopyWith<$Res> {
  factory _$ClientSummaryItemDtoCopyWith(_ClientSummaryItemDto value, $Res Function(_ClientSummaryItemDto) _then) = __$ClientSummaryItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String date, String clientId, String clientFirstName, String clientLastName, String? clientAvatarUrl
});




}
/// @nodoc
class __$ClientSummaryItemDtoCopyWithImpl<$Res>
    implements _$ClientSummaryItemDtoCopyWith<$Res> {
  __$ClientSummaryItemDtoCopyWithImpl(this._self, this._then);

  final _ClientSummaryItemDto _self;
  final $Res Function(_ClientSummaryItemDto) _then;

/// Create a copy of ClientSummaryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? clientId = null,Object? clientFirstName = null,Object? clientLastName = null,Object? clientAvatarUrl = freezed,}) {
  return _then(_ClientSummaryItemDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientFirstName: null == clientFirstName ? _self.clientFirstName : clientFirstName // ignore: cast_nullable_to_non_nullable
as String,clientLastName: null == clientLastName ? _self.clientLastName : clientLastName // ignore: cast_nullable_to_non_nullable
as String,clientAvatarUrl: freezed == clientAvatarUrl ? _self.clientAvatarUrl : clientAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
