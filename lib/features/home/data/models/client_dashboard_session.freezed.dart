// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dashboard_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDashboardSession {

 String get id; String get title; DateTime get date; int get duration;@JsonKey(name: 'is_trainer_assigned') bool? get isTrainerAssigned;
/// Create a copy of ClientDashboardSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientDashboardSessionCopyWith<ClientDashboardSession> get copyWith => _$ClientDashboardSessionCopyWithImpl<ClientDashboardSession>(this as ClientDashboardSession, _$identity);

  /// Serializes this ClientDashboardSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientDashboardSession&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isTrainerAssigned, isTrainerAssigned) || other.isTrainerAssigned == isTrainerAssigned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,date,duration,isTrainerAssigned);

@override
String toString() {
  return 'ClientDashboardSession(id: $id, title: $title, date: $date, duration: $duration, isTrainerAssigned: $isTrainerAssigned)';
}


}

/// @nodoc
abstract mixin class $ClientDashboardSessionCopyWith<$Res>  {
  factory $ClientDashboardSessionCopyWith(ClientDashboardSession value, $Res Function(ClientDashboardSession) _then) = _$ClientDashboardSessionCopyWithImpl;
@useResult
$Res call({
 String id, String title, DateTime date, int duration,@JsonKey(name: 'is_trainer_assigned') bool? isTrainerAssigned
});




}
/// @nodoc
class _$ClientDashboardSessionCopyWithImpl<$Res>
    implements $ClientDashboardSessionCopyWith<$Res> {
  _$ClientDashboardSessionCopyWithImpl(this._self, this._then);

  final ClientDashboardSession _self;
  final $Res Function(ClientDashboardSession) _then;

/// Create a copy of ClientDashboardSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? date = null,Object? duration = null,Object? isTrainerAssigned = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,isTrainerAssigned: freezed == isTrainerAssigned ? _self.isTrainerAssigned : isTrainerAssigned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientDashboardSession].
extension ClientDashboardSessionPatterns on ClientDashboardSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientDashboardSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientDashboardSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientDashboardSession value)  $default,){
final _that = this;
switch (_that) {
case _ClientDashboardSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientDashboardSession value)?  $default,){
final _that = this;
switch (_that) {
case _ClientDashboardSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  DateTime date,  int duration, @JsonKey(name: 'is_trainer_assigned')  bool? isTrainerAssigned)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientDashboardSession() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.duration,_that.isTrainerAssigned);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  DateTime date,  int duration, @JsonKey(name: 'is_trainer_assigned')  bool? isTrainerAssigned)  $default,) {final _that = this;
switch (_that) {
case _ClientDashboardSession():
return $default(_that.id,_that.title,_that.date,_that.duration,_that.isTrainerAssigned);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  DateTime date,  int duration, @JsonKey(name: 'is_trainer_assigned')  bool? isTrainerAssigned)?  $default,) {final _that = this;
switch (_that) {
case _ClientDashboardSession() when $default != null:
return $default(_that.id,_that.title,_that.date,_that.duration,_that.isTrainerAssigned);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientDashboardSession implements ClientDashboardSession {
  const _ClientDashboardSession({required this.id, required this.title, required this.date, required this.duration, @JsonKey(name: 'is_trainer_assigned') this.isTrainerAssigned});
  factory _ClientDashboardSession.fromJson(Map<String, dynamic> json) => _$ClientDashboardSessionFromJson(json);

@override final  String id;
@override final  String title;
@override final  DateTime date;
@override final  int duration;
@override@JsonKey(name: 'is_trainer_assigned') final  bool? isTrainerAssigned;

/// Create a copy of ClientDashboardSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientDashboardSessionCopyWith<_ClientDashboardSession> get copyWith => __$ClientDashboardSessionCopyWithImpl<_ClientDashboardSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientDashboardSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientDashboardSession&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.date, date) || other.date == date)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isTrainerAssigned, isTrainerAssigned) || other.isTrainerAssigned == isTrainerAssigned));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,date,duration,isTrainerAssigned);

@override
String toString() {
  return 'ClientDashboardSession(id: $id, title: $title, date: $date, duration: $duration, isTrainerAssigned: $isTrainerAssigned)';
}


}

/// @nodoc
abstract mixin class _$ClientDashboardSessionCopyWith<$Res> implements $ClientDashboardSessionCopyWith<$Res> {
  factory _$ClientDashboardSessionCopyWith(_ClientDashboardSession value, $Res Function(_ClientDashboardSession) _then) = __$ClientDashboardSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, DateTime date, int duration,@JsonKey(name: 'is_trainer_assigned') bool? isTrainerAssigned
});




}
/// @nodoc
class __$ClientDashboardSessionCopyWithImpl<$Res>
    implements _$ClientDashboardSessionCopyWith<$Res> {
  __$ClientDashboardSessionCopyWithImpl(this._self, this._then);

  final _ClientDashboardSession _self;
  final $Res Function(_ClientDashboardSession) _then;

/// Create a copy of ClientDashboardSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? date = null,Object? duration = null,Object? isTrainerAssigned = freezed,}) {
  return _then(_ClientDashboardSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int,isTrainerAssigned: freezed == isTrainerAssigned ? _self.isTrainerAssigned : isTrainerAssigned // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
