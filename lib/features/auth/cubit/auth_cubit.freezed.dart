// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckAuthStatus value)?  checkAuthStatus,TResult Function( LoginSubmitted value)?  login,TResult Function( RegisterSubmitted value)?  register,TResult Function( CompleteOnboarding value)?  completeOnboarding,TResult Function( LogoutRequested value)?  logout,TResult Function( ClearError value)?  clearError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case LoginSubmitted() when login != null:
return login(_that);case RegisterSubmitted() when register != null:
return register(_that);case CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that);case LogoutRequested() when logout != null:
return logout(_that);case ClearError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckAuthStatus value)  checkAuthStatus,required TResult Function( LoginSubmitted value)  login,required TResult Function( RegisterSubmitted value)  register,required TResult Function( CompleteOnboarding value)  completeOnboarding,required TResult Function( LogoutRequested value)  logout,required TResult Function( ClearError value)  clearError,}){
final _that = this;
switch (_that) {
case CheckAuthStatus():
return checkAuthStatus(_that);case LoginSubmitted():
return login(_that);case RegisterSubmitted():
return register(_that);case CompleteOnboarding():
return completeOnboarding(_that);case LogoutRequested():
return logout(_that);case ClearError():
return clearError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckAuthStatus value)?  checkAuthStatus,TResult? Function( LoginSubmitted value)?  login,TResult? Function( RegisterSubmitted value)?  register,TResult? Function( CompleteOnboarding value)?  completeOnboarding,TResult? Function( LogoutRequested value)?  logout,TResult? Function( ClearError value)?  clearError,}){
final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus(_that);case LoginSubmitted() when login != null:
return login(_that);case RegisterSubmitted() when register != null:
return register(_that);case CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that);case LogoutRequested() when logout != null:
return logout(_that);case ClearError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuthStatus,TResult Function( String email,  String password)?  login,TResult Function( String email,  String password,  String? name,  String? trainerId)?  register,TResult Function( String role,  String name,  String? bio,  String? location)?  completeOnboarding,TResult Function()?  logout,TResult Function()?  clearError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case LoginSubmitted() when login != null:
return login(_that.email,_that.password);case RegisterSubmitted() when register != null:
return register(_that.email,_that.password,_that.name,_that.trainerId);case CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that.role,_that.name,_that.bio,_that.location);case LogoutRequested() when logout != null:
return logout();case ClearError() when clearError != null:
return clearError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuthStatus,required TResult Function( String email,  String password)  login,required TResult Function( String email,  String password,  String? name,  String? trainerId)  register,required TResult Function( String role,  String name,  String? bio,  String? location)  completeOnboarding,required TResult Function()  logout,required TResult Function()  clearError,}) {final _that = this;
switch (_that) {
case CheckAuthStatus():
return checkAuthStatus();case LoginSubmitted():
return login(_that.email,_that.password);case RegisterSubmitted():
return register(_that.email,_that.password,_that.name,_that.trainerId);case CompleteOnboarding():
return completeOnboarding(_that.role,_that.name,_that.bio,_that.location);case LogoutRequested():
return logout();case ClearError():
return clearError();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuthStatus,TResult? Function( String email,  String password)?  login,TResult? Function( String email,  String password,  String? name,  String? trainerId)?  register,TResult? Function( String role,  String name,  String? bio,  String? location)?  completeOnboarding,TResult? Function()?  logout,TResult? Function()?  clearError,}) {final _that = this;
switch (_that) {
case CheckAuthStatus() when checkAuthStatus != null:
return checkAuthStatus();case LoginSubmitted() when login != null:
return login(_that.email,_that.password);case RegisterSubmitted() when register != null:
return register(_that.email,_that.password,_that.name,_that.trainerId);case CompleteOnboarding() when completeOnboarding != null:
return completeOnboarding(_that.role,_that.name,_that.bio,_that.location);case LogoutRequested() when logout != null:
return logout();case ClearError() when clearError != null:
return clearError();case _:
  return null;

}
}

}

/// @nodoc


class CheckAuthStatus with DiagnosticableTreeMixin implements AuthEvent {
  const CheckAuthStatus();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.checkAuthStatus'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAuthStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.checkAuthStatus()';
}


}




/// @nodoc


class LoginSubmitted with DiagnosticableTreeMixin implements AuthEvent {
  const LoginSubmitted({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginSubmittedCopyWith<LoginSubmitted> get copyWith => _$LoginSubmittedCopyWithImpl<LoginSubmitted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.login'))
    ..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('password', password));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.login(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $LoginSubmittedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $LoginSubmittedCopyWith(LoginSubmitted value, $Res Function(LoginSubmitted) _then) = _$LoginSubmittedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$LoginSubmittedCopyWithImpl<$Res>
    implements $LoginSubmittedCopyWith<$Res> {
  _$LoginSubmittedCopyWithImpl(this._self, this._then);

  final LoginSubmitted _self;
  final $Res Function(LoginSubmitted) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(LoginSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegisterSubmitted with DiagnosticableTreeMixin implements AuthEvent {
  const RegisterSubmitted({required this.email, required this.password, this.name, this.trainerId});
  

 final  String email;
 final  String password;
 final  String? name;
 final  String? trainerId;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterSubmittedCopyWith<RegisterSubmitted> get copyWith => _$RegisterSubmittedCopyWithImpl<RegisterSubmitted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.register'))
    ..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('password', password))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('trainerId', trainerId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterSubmitted&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.name, name) || other.name == name)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,name,trainerId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.register(email: $email, password: $password, name: $name, trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class $RegisterSubmittedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $RegisterSubmittedCopyWith(RegisterSubmitted value, $Res Function(RegisterSubmitted) _then) = _$RegisterSubmittedCopyWithImpl;
@useResult
$Res call({
 String email, String password, String? name, String? trainerId
});




}
/// @nodoc
class _$RegisterSubmittedCopyWithImpl<$Res>
    implements $RegisterSubmittedCopyWith<$Res> {
  _$RegisterSubmittedCopyWithImpl(this._self, this._then);

  final RegisterSubmitted _self;
  final $Res Function(RegisterSubmitted) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? name = freezed,Object? trainerId = freezed,}) {
  return _then(RegisterSubmitted(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CompleteOnboarding with DiagnosticableTreeMixin implements AuthEvent {
  const CompleteOnboarding({required this.role, required this.name, this.bio, this.location});
  

 final  String role;
 final  String name;
 final  String? bio;
 final  String? location;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompleteOnboardingCopyWith<CompleteOnboarding> get copyWith => _$CompleteOnboardingCopyWithImpl<CompleteOnboarding>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.completeOnboarding'))
    ..add(DiagnosticsProperty('role', role))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('bio', bio))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CompleteOnboarding&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode => Object.hash(runtimeType,role,name,bio,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.completeOnboarding(role: $role, name: $name, bio: $bio, location: $location)';
}


}

/// @nodoc
abstract mixin class $CompleteOnboardingCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $CompleteOnboardingCopyWith(CompleteOnboarding value, $Res Function(CompleteOnboarding) _then) = _$CompleteOnboardingCopyWithImpl;
@useResult
$Res call({
 String role, String name, String? bio, String? location
});




}
/// @nodoc
class _$CompleteOnboardingCopyWithImpl<$Res>
    implements $CompleteOnboardingCopyWith<$Res> {
  _$CompleteOnboardingCopyWithImpl(this._self, this._then);

  final CompleteOnboarding _self;
  final $Res Function(CompleteOnboarding) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,Object? name = null,Object? bio = freezed,Object? location = freezed,}) {
  return _then(CompleteOnboarding(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class LogoutRequested with DiagnosticableTreeMixin implements AuthEvent {
  const LogoutRequested();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.logout'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class ClearError with DiagnosticableTreeMixin implements AuthEvent {
  const ClearError();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AuthEvent.clearError'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClearError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AuthEvent.clearError()';
}


}




// dart format on
