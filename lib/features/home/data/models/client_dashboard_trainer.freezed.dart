// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_dashboard_trainer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientDashboardTrainer {

 String get id; String get name; String get username; String get email;
/// Create a copy of ClientDashboardTrainer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientDashboardTrainerCopyWith<ClientDashboardTrainer> get copyWith => _$ClientDashboardTrainerCopyWithImpl<ClientDashboardTrainer>(this as ClientDashboardTrainer, _$identity);

  /// Serializes this ClientDashboardTrainer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientDashboardTrainer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email);

@override
String toString() {
  return 'ClientDashboardTrainer(id: $id, name: $name, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class $ClientDashboardTrainerCopyWith<$Res>  {
  factory $ClientDashboardTrainerCopyWith(ClientDashboardTrainer value, $Res Function(ClientDashboardTrainer) _then) = _$ClientDashboardTrainerCopyWithImpl;
@useResult
$Res call({
 String id, String name, String username, String email
});




}
/// @nodoc
class _$ClientDashboardTrainerCopyWithImpl<$Res>
    implements $ClientDashboardTrainerCopyWith<$Res> {
  _$ClientDashboardTrainerCopyWithImpl(this._self, this._then);

  final ClientDashboardTrainer _self;
  final $Res Function(ClientDashboardTrainer) _then;

/// Create a copy of ClientDashboardTrainer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? username = null,Object? email = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientDashboardTrainer].
extension ClientDashboardTrainerPatterns on ClientDashboardTrainer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientDashboardTrainer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientDashboardTrainer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientDashboardTrainer value)  $default,){
final _that = this;
switch (_that) {
case _ClientDashboardTrainer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientDashboardTrainer value)?  $default,){
final _that = this;
switch (_that) {
case _ClientDashboardTrainer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String username,  String email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientDashboardTrainer() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String username,  String email)  $default,) {final _that = this;
switch (_that) {
case _ClientDashboardTrainer():
return $default(_that.id,_that.name,_that.username,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String username,  String email)?  $default,) {final _that = this;
switch (_that) {
case _ClientDashboardTrainer() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientDashboardTrainer implements ClientDashboardTrainer {
  const _ClientDashboardTrainer({required this.id, required this.name, required this.username, required this.email});
  factory _ClientDashboardTrainer.fromJson(Map<String, dynamic> json) => _$ClientDashboardTrainerFromJson(json);

@override final  String id;
@override final  String name;
@override final  String username;
@override final  String email;

/// Create a copy of ClientDashboardTrainer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientDashboardTrainerCopyWith<_ClientDashboardTrainer> get copyWith => __$ClientDashboardTrainerCopyWithImpl<_ClientDashboardTrainer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientDashboardTrainerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientDashboardTrainer&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,email);

@override
String toString() {
  return 'ClientDashboardTrainer(id: $id, name: $name, username: $username, email: $email)';
}


}

/// @nodoc
abstract mixin class _$ClientDashboardTrainerCopyWith<$Res> implements $ClientDashboardTrainerCopyWith<$Res> {
  factory _$ClientDashboardTrainerCopyWith(_ClientDashboardTrainer value, $Res Function(_ClientDashboardTrainer) _then) = __$ClientDashboardTrainerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String username, String email
});




}
/// @nodoc
class __$ClientDashboardTrainerCopyWithImpl<$Res>
    implements _$ClientDashboardTrainerCopyWith<$Res> {
  __$ClientDashboardTrainerCopyWithImpl(this._self, this._then);

  final _ClientDashboardTrainer _self;
  final $Res Function(_ClientDashboardTrainer) _then;

/// Create a copy of ClientDashboardTrainer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? username = null,Object? email = null,}) {
  return _then(_ClientDashboardTrainer(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
