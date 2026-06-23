// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_recent_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientRecentSession {

 String get id; DateTime get startTime; DateTime? get endTime; String get status; String get name; double? get volume; double? get totalVolume; int? get durationSeconds;
/// Create a copy of ClientRecentSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientRecentSessionCopyWith<ClientRecentSession> get copyWith => _$ClientRecentSessionCopyWithImpl<ClientRecentSession>(this as ClientRecentSession, _$identity);

  /// Serializes this ClientRecentSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientRecentSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startTime,endTime,status,name,volume,totalVolume,durationSeconds);

@override
String toString() {
  return 'ClientRecentSession(id: $id, startTime: $startTime, endTime: $endTime, status: $status, name: $name, volume: $volume, totalVolume: $totalVolume, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class $ClientRecentSessionCopyWith<$Res>  {
  factory $ClientRecentSessionCopyWith(ClientRecentSession value, $Res Function(ClientRecentSession) _then) = _$ClientRecentSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startTime, DateTime? endTime, String status, String name, double? volume, double? totalVolume, int? durationSeconds
});




}
/// @nodoc
class _$ClientRecentSessionCopyWithImpl<$Res>
    implements $ClientRecentSessionCopyWith<$Res> {
  _$ClientRecentSessionCopyWithImpl(this._self, this._then);

  final ClientRecentSession _self;
  final $Res Function(ClientRecentSession) _then;

/// Create a copy of ClientRecentSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? name = null,Object? volume = freezed,Object? totalVolume = freezed,Object? durationSeconds = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,volume: freezed == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double?,totalVolume: freezed == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientRecentSession].
extension ClientRecentSessionPatterns on ClientRecentSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientRecentSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientRecentSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientRecentSession value)  $default,){
final _that = this;
switch (_that) {
case _ClientRecentSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientRecentSession value)?  $default,){
final _that = this;
switch (_that) {
case _ClientRecentSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startTime,  DateTime? endTime,  String status,  String name,  double? volume,  double? totalVolume,  int? durationSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientRecentSession() when $default != null:
return $default(_that.id,_that.startTime,_that.endTime,_that.status,_that.name,_that.volume,_that.totalVolume,_that.durationSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startTime,  DateTime? endTime,  String status,  String name,  double? volume,  double? totalVolume,  int? durationSeconds)  $default,) {final _that = this;
switch (_that) {
case _ClientRecentSession():
return $default(_that.id,_that.startTime,_that.endTime,_that.status,_that.name,_that.volume,_that.totalVolume,_that.durationSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startTime,  DateTime? endTime,  String status,  String name,  double? volume,  double? totalVolume,  int? durationSeconds)?  $default,) {final _that = this;
switch (_that) {
case _ClientRecentSession() when $default != null:
return $default(_that.id,_that.startTime,_that.endTime,_that.status,_that.name,_that.volume,_that.totalVolume,_that.durationSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientRecentSession extends ClientRecentSession {
  const _ClientRecentSession({required this.id, required this.startTime, this.endTime, required this.status, required this.name, this.volume, this.totalVolume, this.durationSeconds}): super._();
  factory _ClientRecentSession.fromJson(Map<String, dynamic> json) => _$ClientRecentSessionFromJson(json);

@override final  String id;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override final  String status;
@override final  String name;
@override final  double? volume;
@override final  double? totalVolume;
@override final  int? durationSeconds;

/// Create a copy of ClientRecentSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientRecentSessionCopyWith<_ClientRecentSession> get copyWith => __$ClientRecentSessionCopyWithImpl<_ClientRecentSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientRecentSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientRecentSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.totalVolume, totalVolume) || other.totalVolume == totalVolume)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startTime,endTime,status,name,volume,totalVolume,durationSeconds);

@override
String toString() {
  return 'ClientRecentSession(id: $id, startTime: $startTime, endTime: $endTime, status: $status, name: $name, volume: $volume, totalVolume: $totalVolume, durationSeconds: $durationSeconds)';
}


}

/// @nodoc
abstract mixin class _$ClientRecentSessionCopyWith<$Res> implements $ClientRecentSessionCopyWith<$Res> {
  factory _$ClientRecentSessionCopyWith(_ClientRecentSession value, $Res Function(_ClientRecentSession) _then) = __$ClientRecentSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startTime, DateTime? endTime, String status, String name, double? volume, double? totalVolume, int? durationSeconds
});




}
/// @nodoc
class __$ClientRecentSessionCopyWithImpl<$Res>
    implements _$ClientRecentSessionCopyWith<$Res> {
  __$ClientRecentSessionCopyWithImpl(this._self, this._then);

  final _ClientRecentSession _self;
  final $Res Function(_ClientRecentSession) _then;

/// Create a copy of ClientRecentSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? name = null,Object? volume = freezed,Object? totalVolume = freezed,Object? durationSeconds = freezed,}) {
  return _then(_ClientRecentSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,volume: freezed == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double?,totalVolume: freezed == totalVolume ? _self.totalVolume : totalVolume // ignore: cast_nullable_to_non_nullable
as double?,durationSeconds: freezed == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
