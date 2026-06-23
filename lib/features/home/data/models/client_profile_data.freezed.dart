// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientProfileData {

 String get id; String get userId; String get name; String get email; ClientDashboardTrainer? get trainer; List<ClientRecentSession> get workoutSessions; List<DashboardMeasurement> get measurements; int? get remainingCredits;
/// Create a copy of ClientProfileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProfileDataCopyWith<ClientProfileData> get copyWith => _$ClientProfileDataCopyWithImpl<ClientProfileData>(this as ClientProfileData, _$identity);

  /// Serializes this ClientProfileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.trainer, trainer) || other.trainer == trainer)&&const DeepCollectionEquality().equals(other.workoutSessions, workoutSessions)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&(identical(other.remainingCredits, remainingCredits) || other.remainingCredits == remainingCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,email,trainer,const DeepCollectionEquality().hash(workoutSessions),const DeepCollectionEquality().hash(measurements),remainingCredits);

@override
String toString() {
  return 'ClientProfileData(id: $id, userId: $userId, name: $name, email: $email, trainer: $trainer, workoutSessions: $workoutSessions, measurements: $measurements, remainingCredits: $remainingCredits)';
}


}

/// @nodoc
abstract mixin class $ClientProfileDataCopyWith<$Res>  {
  factory $ClientProfileDataCopyWith(ClientProfileData value, $Res Function(ClientProfileData) _then) = _$ClientProfileDataCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String name, String email, ClientDashboardTrainer? trainer, List<ClientRecentSession> workoutSessions, List<DashboardMeasurement> measurements, int? remainingCredits
});


$ClientDashboardTrainerCopyWith<$Res>? get trainer;

}
/// @nodoc
class _$ClientProfileDataCopyWithImpl<$Res>
    implements $ClientProfileDataCopyWith<$Res> {
  _$ClientProfileDataCopyWithImpl(this._self, this._then);

  final ClientProfileData _self;
  final $Res Function(ClientProfileData) _then;

/// Create a copy of ClientProfileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? trainer = freezed,Object? workoutSessions = null,Object? measurements = null,Object? remainingCredits = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,trainer: freezed == trainer ? _self.trainer : trainer // ignore: cast_nullable_to_non_nullable
as ClientDashboardTrainer?,workoutSessions: null == workoutSessions ? _self.workoutSessions : workoutSessions // ignore: cast_nullable_to_non_nullable
as List<ClientRecentSession>,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<DashboardMeasurement>,remainingCredits: freezed == remainingCredits ? _self.remainingCredits : remainingCredits // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of ClientProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientDashboardTrainerCopyWith<$Res>? get trainer {
    if (_self.trainer == null) {
    return null;
  }

  return $ClientDashboardTrainerCopyWith<$Res>(_self.trainer!, (value) {
    return _then(_self.copyWith(trainer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ClientProfileData].
extension ClientProfileDataPatterns on ClientProfileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientProfileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientProfileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientProfileData value)  $default,){
final _that = this;
switch (_that) {
case _ClientProfileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientProfileData value)?  $default,){
final _that = this;
switch (_that) {
case _ClientProfileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String email,  ClientDashboardTrainer? trainer,  List<ClientRecentSession> workoutSessions,  List<DashboardMeasurement> measurements,  int? remainingCredits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientProfileData() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.trainer,_that.workoutSessions,_that.measurements,_that.remainingCredits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String name,  String email,  ClientDashboardTrainer? trainer,  List<ClientRecentSession> workoutSessions,  List<DashboardMeasurement> measurements,  int? remainingCredits)  $default,) {final _that = this;
switch (_that) {
case _ClientProfileData():
return $default(_that.id,_that.userId,_that.name,_that.email,_that.trainer,_that.workoutSessions,_that.measurements,_that.remainingCredits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String name,  String email,  ClientDashboardTrainer? trainer,  List<ClientRecentSession> workoutSessions,  List<DashboardMeasurement> measurements,  int? remainingCredits)?  $default,) {final _that = this;
switch (_that) {
case _ClientProfileData() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.email,_that.trainer,_that.workoutSessions,_that.measurements,_that.remainingCredits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientProfileData implements ClientProfileData {
  const _ClientProfileData({required this.id, required this.userId, required this.name, required this.email, this.trainer, final  List<ClientRecentSession> workoutSessions = const <ClientRecentSession>[], final  List<DashboardMeasurement> measurements = const <DashboardMeasurement>[], this.remainingCredits}): _workoutSessions = workoutSessions,_measurements = measurements;
  factory _ClientProfileData.fromJson(Map<String, dynamic> json) => _$ClientProfileDataFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String name;
@override final  String email;
@override final  ClientDashboardTrainer? trainer;
 final  List<ClientRecentSession> _workoutSessions;
@override@JsonKey() List<ClientRecentSession> get workoutSessions {
  if (_workoutSessions is EqualUnmodifiableListView) return _workoutSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_workoutSessions);
}

 final  List<DashboardMeasurement> _measurements;
@override@JsonKey() List<DashboardMeasurement> get measurements {
  if (_measurements is EqualUnmodifiableListView) return _measurements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_measurements);
}

@override final  int? remainingCredits;

/// Create a copy of ClientProfileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientProfileDataCopyWith<_ClientProfileData> get copyWith => __$ClientProfileDataCopyWithImpl<_ClientProfileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientProfileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.trainer, trainer) || other.trainer == trainer)&&const DeepCollectionEquality().equals(other._workoutSessions, _workoutSessions)&&const DeepCollectionEquality().equals(other._measurements, _measurements)&&(identical(other.remainingCredits, remainingCredits) || other.remainingCredits == remainingCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,email,trainer,const DeepCollectionEquality().hash(_workoutSessions),const DeepCollectionEquality().hash(_measurements),remainingCredits);

@override
String toString() {
  return 'ClientProfileData(id: $id, userId: $userId, name: $name, email: $email, trainer: $trainer, workoutSessions: $workoutSessions, measurements: $measurements, remainingCredits: $remainingCredits)';
}


}

/// @nodoc
abstract mixin class _$ClientProfileDataCopyWith<$Res> implements $ClientProfileDataCopyWith<$Res> {
  factory _$ClientProfileDataCopyWith(_ClientProfileData value, $Res Function(_ClientProfileData) _then) = __$ClientProfileDataCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String name, String email, ClientDashboardTrainer? trainer, List<ClientRecentSession> workoutSessions, List<DashboardMeasurement> measurements, int? remainingCredits
});


@override $ClientDashboardTrainerCopyWith<$Res>? get trainer;

}
/// @nodoc
class __$ClientProfileDataCopyWithImpl<$Res>
    implements _$ClientProfileDataCopyWith<$Res> {
  __$ClientProfileDataCopyWithImpl(this._self, this._then);

  final _ClientProfileData _self;
  final $Res Function(_ClientProfileData) _then;

/// Create a copy of ClientProfileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? email = null,Object? trainer = freezed,Object? workoutSessions = null,Object? measurements = null,Object? remainingCredits = freezed,}) {
  return _then(_ClientProfileData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,trainer: freezed == trainer ? _self.trainer : trainer // ignore: cast_nullable_to_non_nullable
as ClientDashboardTrainer?,workoutSessions: null == workoutSessions ? _self._workoutSessions : workoutSessions // ignore: cast_nullable_to_non_nullable
as List<ClientRecentSession>,measurements: null == measurements ? _self._measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<DashboardMeasurement>,remainingCredits: freezed == remainingCredits ? _self.remainingCredits : remainingCredits // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of ClientProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientDashboardTrainerCopyWith<$Res>? get trainer {
    if (_self.trainer == null) {
    return null;
  }

  return $ClientDashboardTrainerCopyWith<$Res>(_self.trainer!, (value) {
    return _then(_self.copyWith(trainer: value));
  });
}
}

// dart format on
