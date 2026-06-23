// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDashboardResponse {

 ClientProfileData get clientData; String get weightUnit; List<ClientDashboardSession> get upcomingClientSessions; DateTime? get lastCheckIn;
/// Create a copy of ClientDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientDashboardResponseCopyWith<ClientDashboardResponse> get copyWith => _$ClientDashboardResponseCopyWithImpl<ClientDashboardResponse>(this as ClientDashboardResponse, _$identity);

  /// Serializes this ClientDashboardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientDashboardResponse&&(identical(other.clientData, clientData) || other.clientData == clientData)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&const DeepCollectionEquality().equals(other.upcomingClientSessions, upcomingClientSessions)&&(identical(other.lastCheckIn, lastCheckIn) || other.lastCheckIn == lastCheckIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientData,weightUnit,const DeepCollectionEquality().hash(upcomingClientSessions),lastCheckIn);

@override
String toString() {
  return 'ClientDashboardResponse(clientData: $clientData, weightUnit: $weightUnit, upcomingClientSessions: $upcomingClientSessions, lastCheckIn: $lastCheckIn)';
}


}

/// @nodoc
abstract mixin class $ClientDashboardResponseCopyWith<$Res>  {
  factory $ClientDashboardResponseCopyWith(ClientDashboardResponse value, $Res Function(ClientDashboardResponse) _then) = _$ClientDashboardResponseCopyWithImpl;
@useResult
$Res call({
 ClientProfileData clientData, String weightUnit, List<ClientDashboardSession> upcomingClientSessions, DateTime? lastCheckIn
});


$ClientProfileDataCopyWith<$Res> get clientData;

}
/// @nodoc
class _$ClientDashboardResponseCopyWithImpl<$Res>
    implements $ClientDashboardResponseCopyWith<$Res> {
  _$ClientDashboardResponseCopyWithImpl(this._self, this._then);

  final ClientDashboardResponse _self;
  final $Res Function(ClientDashboardResponse) _then;

/// Create a copy of ClientDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientData = null,Object? weightUnit = null,Object? upcomingClientSessions = null,Object? lastCheckIn = freezed,}) {
  return _then(_self.copyWith(
clientData: null == clientData ? _self.clientData : clientData // ignore: cast_nullable_to_non_nullable
as ClientProfileData,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as String,upcomingClientSessions: null == upcomingClientSessions ? _self.upcomingClientSessions : upcomingClientSessions // ignore: cast_nullable_to_non_nullable
as List<ClientDashboardSession>,lastCheckIn: freezed == lastCheckIn ? _self.lastCheckIn : lastCheckIn // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ClientDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientProfileDataCopyWith<$Res> get clientData {
  
  return $ClientProfileDataCopyWith<$Res>(_self.clientData, (value) {
    return _then(_self.copyWith(clientData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientDashboardResponse].
extension ClientDashboardResponsePatterns on ClientDashboardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientDashboardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientDashboardResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClientDashboardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientDashboardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClientDashboardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ClientProfileData clientData,  String weightUnit,  List<ClientDashboardSession> upcomingClientSessions,  DateTime? lastCheckIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientDashboardResponse() when $default != null:
return $default(_that.clientData,_that.weightUnit,_that.upcomingClientSessions,_that.lastCheckIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ClientProfileData clientData,  String weightUnit,  List<ClientDashboardSession> upcomingClientSessions,  DateTime? lastCheckIn)  $default,) {final _that = this;
switch (_that) {
case _ClientDashboardResponse():
return $default(_that.clientData,_that.weightUnit,_that.upcomingClientSessions,_that.lastCheckIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ClientProfileData clientData,  String weightUnit,  List<ClientDashboardSession> upcomingClientSessions,  DateTime? lastCheckIn)?  $default,) {final _that = this;
switch (_that) {
case _ClientDashboardResponse() when $default != null:
return $default(_that.clientData,_that.weightUnit,_that.upcomingClientSessions,_that.lastCheckIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientDashboardResponse implements ClientDashboardResponse {
  const _ClientDashboardResponse({required this.clientData, required this.weightUnit, final  List<ClientDashboardSession> upcomingClientSessions = const <ClientDashboardSession>[], this.lastCheckIn}): _upcomingClientSessions = upcomingClientSessions;
  factory _ClientDashboardResponse.fromJson(Map<String, dynamic> json) => _$ClientDashboardResponseFromJson(json);

@override final  ClientProfileData clientData;
@override final  String weightUnit;
 final  List<ClientDashboardSession> _upcomingClientSessions;
@override@JsonKey() List<ClientDashboardSession> get upcomingClientSessions {
  if (_upcomingClientSessions is EqualUnmodifiableListView) return _upcomingClientSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingClientSessions);
}

@override final  DateTime? lastCheckIn;

/// Create a copy of ClientDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientDashboardResponseCopyWith<_ClientDashboardResponse> get copyWith => __$ClientDashboardResponseCopyWithImpl<_ClientDashboardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientDashboardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientDashboardResponse&&(identical(other.clientData, clientData) || other.clientData == clientData)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&const DeepCollectionEquality().equals(other._upcomingClientSessions, _upcomingClientSessions)&&(identical(other.lastCheckIn, lastCheckIn) || other.lastCheckIn == lastCheckIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientData,weightUnit,const DeepCollectionEquality().hash(_upcomingClientSessions),lastCheckIn);

@override
String toString() {
  return 'ClientDashboardResponse(clientData: $clientData, weightUnit: $weightUnit, upcomingClientSessions: $upcomingClientSessions, lastCheckIn: $lastCheckIn)';
}


}

/// @nodoc
abstract mixin class _$ClientDashboardResponseCopyWith<$Res> implements $ClientDashboardResponseCopyWith<$Res> {
  factory _$ClientDashboardResponseCopyWith(_ClientDashboardResponse value, $Res Function(_ClientDashboardResponse) _then) = __$ClientDashboardResponseCopyWithImpl;
@override @useResult
$Res call({
 ClientProfileData clientData, String weightUnit, List<ClientDashboardSession> upcomingClientSessions, DateTime? lastCheckIn
});


@override $ClientProfileDataCopyWith<$Res> get clientData;

}
/// @nodoc
class __$ClientDashboardResponseCopyWithImpl<$Res>
    implements _$ClientDashboardResponseCopyWith<$Res> {
  __$ClientDashboardResponseCopyWithImpl(this._self, this._then);

  final _ClientDashboardResponse _self;
  final $Res Function(_ClientDashboardResponse) _then;

/// Create a copy of ClientDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientData = null,Object? weightUnit = null,Object? upcomingClientSessions = null,Object? lastCheckIn = freezed,}) {
  return _then(_ClientDashboardResponse(
clientData: null == clientData ? _self.clientData : clientData // ignore: cast_nullable_to_non_nullable
as ClientProfileData,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as String,upcomingClientSessions: null == upcomingClientSessions ? _self._upcomingClientSessions : upcomingClientSessions // ignore: cast_nullable_to_non_nullable
as List<ClientDashboardSession>,lastCheckIn: freezed == lastCheckIn ? _self.lastCheckIn : lastCheckIn // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ClientDashboardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientProfileDataCopyWith<$Res> get clientData {
  
  return $ClientProfileDataCopyWith<$Res>(_self.clientData, (value) {
    return _then(_self.copyWith(clientData: value));
  });
}
}

// dart format on
