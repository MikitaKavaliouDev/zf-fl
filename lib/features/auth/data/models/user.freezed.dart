// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get email; String? get name; String get role; String? get username; String? get tier;/// Whether onboarding is complete.
/// Login API user object omits this, /api/auth/me includes it.
/// Defaults to true so login flow routes to authenticated directly.
 bool get hasCompletedOnboarding; String? get clientId; String? get subscriptionStatus; String? get profilePhotoPath; bool? get isFreeAccessModeEnabled; Map<String, dynamic> get metadata;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.username, username) || other.username == username)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.hasCompletedOnboarding, hasCompletedOnboarding) || other.hasCompletedOnboarding == hasCompletedOnboarding)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.isFreeAccessModeEnabled, isFreeAccessModeEnabled) || other.isFreeAccessModeEnabled == isFreeAccessModeEnabled)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,role,username,tier,hasCompletedOnboarding,clientId,subscriptionStatus,profilePhotoPath,isFreeAccessModeEnabled,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'User(id: $id, email: $email, name: $name, role: $role, username: $username, tier: $tier, hasCompletedOnboarding: $hasCompletedOnboarding, clientId: $clientId, subscriptionStatus: $subscriptionStatus, profilePhotoPath: $profilePhotoPath, isFreeAccessModeEnabled: $isFreeAccessModeEnabled, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String email, String? name, String role, String? username, String? tier, bool hasCompletedOnboarding, String? clientId, String? subscriptionStatus, String? profilePhotoPath, bool? isFreeAccessModeEnabled, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? name = freezed,Object? role = null,Object? username = freezed,Object? tier = freezed,Object? hasCompletedOnboarding = null,Object? clientId = freezed,Object? subscriptionStatus = freezed,Object? profilePhotoPath = freezed,Object? isFreeAccessModeEnabled = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,hasCompletedOnboarding: null == hasCompletedOnboarding ? _self.hasCompletedOnboarding : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
as bool,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,subscriptionStatus: freezed == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,isFreeAccessModeEnabled: freezed == isFreeAccessModeEnabled ? _self.isFreeAccessModeEnabled : isFreeAccessModeEnabled // ignore: cast_nullable_to_non_nullable
as bool?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String? name,  String role,  String? username,  String? tier,  bool hasCompletedOnboarding,  String? clientId,  String? subscriptionStatus,  String? profilePhotoPath,  bool? isFreeAccessModeEnabled,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.role,_that.username,_that.tier,_that.hasCompletedOnboarding,_that.clientId,_that.subscriptionStatus,_that.profilePhotoPath,_that.isFreeAccessModeEnabled,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String? name,  String role,  String? username,  String? tier,  bool hasCompletedOnboarding,  String? clientId,  String? subscriptionStatus,  String? profilePhotoPath,  bool? isFreeAccessModeEnabled,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.email,_that.name,_that.role,_that.username,_that.tier,_that.hasCompletedOnboarding,_that.clientId,_that.subscriptionStatus,_that.profilePhotoPath,_that.isFreeAccessModeEnabled,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String? name,  String role,  String? username,  String? tier,  bool hasCompletedOnboarding,  String? clientId,  String? subscriptionStatus,  String? profilePhotoPath,  bool? isFreeAccessModeEnabled,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.email,_that.name,_that.role,_that.username,_that.tier,_that.hasCompletedOnboarding,_that.clientId,_that.subscriptionStatus,_that.profilePhotoPath,_that.isFreeAccessModeEnabled,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.email, this.name, required this.role, this.username, this.tier, this.hasCompletedOnboarding = true, this.clientId, this.subscriptionStatus, this.profilePhotoPath, this.isFreeAccessModeEnabled, final  Map<String, dynamic> metadata = const <String, dynamic>{}}): _metadata = metadata;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String email;
@override final  String? name;
@override final  String role;
@override final  String? username;
@override final  String? tier;
/// Whether onboarding is complete.
/// Login API user object omits this, /api/auth/me includes it.
/// Defaults to true so login flow routes to authenticated directly.
@override@JsonKey() final  bool hasCompletedOnboarding;
@override final  String? clientId;
@override final  String? subscriptionStatus;
@override final  String? profilePhotoPath;
@override final  bool? isFreeAccessModeEnabled;
 final  Map<String, dynamic> _metadata;
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.username, username) || other.username == username)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.hasCompletedOnboarding, hasCompletedOnboarding) || other.hasCompletedOnboarding == hasCompletedOnboarding)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.profilePhotoPath, profilePhotoPath) || other.profilePhotoPath == profilePhotoPath)&&(identical(other.isFreeAccessModeEnabled, isFreeAccessModeEnabled) || other.isFreeAccessModeEnabled == isFreeAccessModeEnabled)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,name,role,username,tier,hasCompletedOnboarding,clientId,subscriptionStatus,profilePhotoPath,isFreeAccessModeEnabled,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'User(id: $id, email: $email, name: $name, role: $role, username: $username, tier: $tier, hasCompletedOnboarding: $hasCompletedOnboarding, clientId: $clientId, subscriptionStatus: $subscriptionStatus, profilePhotoPath: $profilePhotoPath, isFreeAccessModeEnabled: $isFreeAccessModeEnabled, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String? name, String role, String? username, String? tier, bool hasCompletedOnboarding, String? clientId, String? subscriptionStatus, String? profilePhotoPath, bool? isFreeAccessModeEnabled, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? name = freezed,Object? role = null,Object? username = freezed,Object? tier = freezed,Object? hasCompletedOnboarding = null,Object? clientId = freezed,Object? subscriptionStatus = freezed,Object? profilePhotoPath = freezed,Object? isFreeAccessModeEnabled = freezed,Object? metadata = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,hasCompletedOnboarding: null == hasCompletedOnboarding ? _self.hasCompletedOnboarding : hasCompletedOnboarding // ignore: cast_nullable_to_non_nullable
as bool,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,subscriptionStatus: freezed == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String?,profilePhotoPath: freezed == profilePhotoPath ? _self.profilePhotoPath : profilePhotoPath // ignore: cast_nullable_to_non_nullable
as String?,isFreeAccessModeEnabled: freezed == isFreeAccessModeEnabled ? _self.isFreeAccessModeEnabled : isFreeAccessModeEnabled // ignore: cast_nullable_to_non_nullable
as bool?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
