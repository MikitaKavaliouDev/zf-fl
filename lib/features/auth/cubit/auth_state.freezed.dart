// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthInitial value)?  initial,TResult Function( AuthLoading value)?  loading,TResult Function( AuthUnauthenticated value)?  unauthenticated,TResult Function( AuthAuthenticated value)?  authenticated,TResult Function( AuthPendingRole value)?  pendingRole,TResult Function( AuthNeedsOnboarding value)?  needsOnboarding,TResult Function( AuthRegisterSuccess value)?  registerSuccess,TResult Function( AuthError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthPendingRole() when pendingRole != null:
return pendingRole(_that);case AuthNeedsOnboarding() when needsOnboarding != null:
return needsOnboarding(_that);case AuthRegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthInitial value)  initial,required TResult Function( AuthLoading value)  loading,required TResult Function( AuthUnauthenticated value)  unauthenticated,required TResult Function( AuthAuthenticated value)  authenticated,required TResult Function( AuthPendingRole value)  pendingRole,required TResult Function( AuthNeedsOnboarding value)  needsOnboarding,required TResult Function( AuthRegisterSuccess value)  registerSuccess,required TResult Function( AuthError value)  error,}){
final _that = this;
switch (_that) {
case AuthInitial():
return initial(_that);case AuthLoading():
return loading(_that);case AuthUnauthenticated():
return unauthenticated(_that);case AuthAuthenticated():
return authenticated(_that);case AuthPendingRole():
return pendingRole(_that);case AuthNeedsOnboarding():
return needsOnboarding(_that);case AuthRegisterSuccess():
return registerSuccess(_that);case AuthError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthInitial value)?  initial,TResult? Function( AuthLoading value)?  loading,TResult? Function( AuthUnauthenticated value)?  unauthenticated,TResult? Function( AuthAuthenticated value)?  authenticated,TResult? Function( AuthPendingRole value)?  pendingRole,TResult? Function( AuthNeedsOnboarding value)?  needsOnboarding,TResult? Function( AuthRegisterSuccess value)?  registerSuccess,TResult? Function( AuthError value)?  error,}){
final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial(_that);case AuthLoading() when loading != null:
return loading(_that);case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case AuthAuthenticated() when authenticated != null:
return authenticated(_that);case AuthPendingRole() when pendingRole != null:
return pendingRole(_that);case AuthNeedsOnboarding() when needsOnboarding != null:
return needsOnboarding(_that);case AuthRegisterSuccess() when registerSuccess != null:
return registerSuccess(_that);case AuthError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  unauthenticated,TResult Function( User user,  bool isOffline,  bool isTrainer)?  authenticated,TResult Function( User user)?  pendingRole,TResult Function( User user)?  needsOnboarding,TResult Function( String email,  RegisterResponse response)?  registerSuccess,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.isOffline,_that.isTrainer);case AuthPendingRole() when pendingRole != null:
return pendingRole(_that.user);case AuthNeedsOnboarding() when needsOnboarding != null:
return needsOnboarding(_that.user);case AuthRegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.email,_that.response);case AuthError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  unauthenticated,required TResult Function( User user,  bool isOffline,  bool isTrainer)  authenticated,required TResult Function( User user)  pendingRole,required TResult Function( User user)  needsOnboarding,required TResult Function( String email,  RegisterResponse response)  registerSuccess,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case AuthInitial():
return initial();case AuthLoading():
return loading();case AuthUnauthenticated():
return unauthenticated();case AuthAuthenticated():
return authenticated(_that.user,_that.isOffline,_that.isTrainer);case AuthPendingRole():
return pendingRole(_that.user);case AuthNeedsOnboarding():
return needsOnboarding(_that.user);case AuthRegisterSuccess():
return registerSuccess(_that.email,_that.response);case AuthError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  unauthenticated,TResult? Function( User user,  bool isOffline,  bool isTrainer)?  authenticated,TResult? Function( User user)?  pendingRole,TResult? Function( User user)?  needsOnboarding,TResult? Function( String email,  RegisterResponse response)?  registerSuccess,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case AuthInitial() when initial != null:
return initial();case AuthLoading() when loading != null:
return loading();case AuthUnauthenticated() when unauthenticated != null:
return unauthenticated();case AuthAuthenticated() when authenticated != null:
return authenticated(_that.user,_that.isOffline,_that.isTrainer);case AuthPendingRole() when pendingRole != null:
return pendingRole(_that.user);case AuthNeedsOnboarding() when needsOnboarding != null:
return needsOnboarding(_that.user);case AuthRegisterSuccess() when registerSuccess != null:
return registerSuccess(_that.email,_that.response);case AuthError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AuthInitial implements AuthState {
  const AuthInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.initial()';
}


}




/// @nodoc


class AuthLoading implements AuthState {
  const AuthLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.loading()';
}


}




/// @nodoc


class AuthUnauthenticated implements AuthState {
  const AuthUnauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class AuthAuthenticated implements AuthState {
  const AuthAuthenticated({required this.user, this.isOffline = false, this.isTrainer = false});
  

 final  User user;
@JsonKey() final  bool isOffline;
@JsonKey() final  bool isTrainer;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthAuthenticatedCopyWith<AuthAuthenticated> get copyWith => _$AuthAuthenticatedCopyWithImpl<AuthAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAuthenticated&&(identical(other.user, user) || other.user == user)&&(identical(other.isOffline, isOffline) || other.isOffline == isOffline)&&(identical(other.isTrainer, isTrainer) || other.isTrainer == isTrainer));
}


@override
int get hashCode => Object.hash(runtimeType,user,isOffline,isTrainer);

@override
String toString() {
  return 'AuthState.authenticated(user: $user, isOffline: $isOffline, isTrainer: $isTrainer)';
}


}

/// @nodoc
abstract mixin class $AuthAuthenticatedCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthAuthenticatedCopyWith(AuthAuthenticated value, $Res Function(AuthAuthenticated) _then) = _$AuthAuthenticatedCopyWithImpl;
@useResult
$Res call({
 User user, bool isOffline, bool isTrainer
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthAuthenticatedCopyWithImpl<$Res>
    implements $AuthAuthenticatedCopyWith<$Res> {
  _$AuthAuthenticatedCopyWithImpl(this._self, this._then);

  final AuthAuthenticated _self;
  final $Res Function(AuthAuthenticated) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,Object? isOffline = null,Object? isTrainer = null,}) {
  return _then(AuthAuthenticated(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,isOffline: null == isOffline ? _self.isOffline : isOffline // ignore: cast_nullable_to_non_nullable
as bool,isTrainer: null == isTrainer ? _self.isTrainer : isTrainer // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthPendingRole implements AuthState {
  const AuthPendingRole({required this.user});
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthPendingRoleCopyWith<AuthPendingRole> get copyWith => _$AuthPendingRoleCopyWithImpl<AuthPendingRole>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPendingRole&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.pendingRole(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthPendingRoleCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthPendingRoleCopyWith(AuthPendingRole value, $Res Function(AuthPendingRole) _then) = _$AuthPendingRoleCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthPendingRoleCopyWithImpl<$Res>
    implements $AuthPendingRoleCopyWith<$Res> {
  _$AuthPendingRoleCopyWithImpl(this._self, this._then);

  final AuthPendingRole _self;
  final $Res Function(AuthPendingRole) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthPendingRole(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthNeedsOnboarding implements AuthState {
  const AuthNeedsOnboarding({required this.user});
  

 final  User user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthNeedsOnboardingCopyWith<AuthNeedsOnboarding> get copyWith => _$AuthNeedsOnboardingCopyWithImpl<AuthNeedsOnboarding>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthNeedsOnboarding&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.needsOnboarding(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthNeedsOnboardingCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthNeedsOnboardingCopyWith(AuthNeedsOnboarding value, $Res Function(AuthNeedsOnboarding) _then) = _$AuthNeedsOnboardingCopyWithImpl;
@useResult
$Res call({
 User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$AuthNeedsOnboardingCopyWithImpl<$Res>
    implements $AuthNeedsOnboardingCopyWith<$Res> {
  _$AuthNeedsOnboardingCopyWithImpl(this._self, this._then);

  final AuthNeedsOnboarding _self;
  final $Res Function(AuthNeedsOnboarding) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthNeedsOnboarding(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

/// @nodoc


class AuthRegisterSuccess implements AuthState {
  const AuthRegisterSuccess({required this.email, required this.response});
  

 final  String email;
 final  RegisterResponse response;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthRegisterSuccessCopyWith<AuthRegisterSuccess> get copyWith => _$AuthRegisterSuccessCopyWithImpl<AuthRegisterSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRegisterSuccess&&(identical(other.email, email) || other.email == email)&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,email,response);

@override
String toString() {
  return 'AuthState.registerSuccess(email: $email, response: $response)';
}


}

/// @nodoc
abstract mixin class $AuthRegisterSuccessCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthRegisterSuccessCopyWith(AuthRegisterSuccess value, $Res Function(AuthRegisterSuccess) _then) = _$AuthRegisterSuccessCopyWithImpl;
@useResult
$Res call({
 String email, RegisterResponse response
});


$RegisterResponseCopyWith<$Res> get response;

}
/// @nodoc
class _$AuthRegisterSuccessCopyWithImpl<$Res>
    implements $AuthRegisterSuccessCopyWith<$Res> {
  _$AuthRegisterSuccessCopyWithImpl(this._self, this._then);

  final AuthRegisterSuccess _self;
  final $Res Function(AuthRegisterSuccess) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? response = null,}) {
  return _then(AuthRegisterSuccess(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,response: null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as RegisterResponse,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterResponseCopyWith<$Res> get response {
  
  return $RegisterResponseCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

/// @nodoc


class AuthError implements AuthState {
  const AuthError({required this.message});
  

 final  String message;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AuthState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AuthError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
