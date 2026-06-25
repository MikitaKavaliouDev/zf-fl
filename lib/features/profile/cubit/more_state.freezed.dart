// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState()';
}


}

/// @nodoc
class $MoreStateCopyWith<$Res>  {
$MoreStateCopyWith(MoreState _, $Res Function(MoreState) __);
}


/// Adds pattern-matching-related methods to [MoreState].
extension MoreStatePatterns on MoreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MoreInitial value)?  initial,TResult Function( MoreLoading value)?  loading,TResult Function( MoreLoaded value)?  loaded,TResult Function( MoreError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MoreInitial() when initial != null:
return initial(_that);case MoreLoading() when loading != null:
return loading(_that);case MoreLoaded() when loaded != null:
return loaded(_that);case MoreError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MoreInitial value)  initial,required TResult Function( MoreLoading value)  loading,required TResult Function( MoreLoaded value)  loaded,required TResult Function( MoreError value)  error,}){
final _that = this;
switch (_that) {
case MoreInitial():
return initial(_that);case MoreLoading():
return loading(_that);case MoreLoaded():
return loaded(_that);case MoreError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MoreInitial value)?  initial,TResult? Function( MoreLoading value)?  loading,TResult? Function( MoreLoaded value)?  loaded,TResult? Function( MoreError value)?  error,}){
final _that = this;
switch (_that) {
case MoreInitial() when initial != null:
return initial(_that);case MoreLoading() when loading != null:
return loading(_that);case MoreLoaded() when loaded != null:
return loaded(_that);case MoreError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( User? user,  PrivacySettingsDto? privacy)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MoreInitial() when initial != null:
return initial();case MoreLoading() when loading != null:
return loading();case MoreLoaded() when loaded != null:
return loaded(_that.user,_that.privacy);case MoreError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( User? user,  PrivacySettingsDto? privacy)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case MoreInitial():
return initial();case MoreLoading():
return loading();case MoreLoaded():
return loaded(_that.user,_that.privacy);case MoreError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( User? user,  PrivacySettingsDto? privacy)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case MoreInitial() when initial != null:
return initial();case MoreLoading() when loading != null:
return loading();case MoreLoaded() when loaded != null:
return loaded(_that.user,_that.privacy);case MoreError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class MoreInitial implements MoreState {
  const MoreInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState.initial()';
}


}




/// @nodoc


class MoreLoading implements MoreState {
  const MoreLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoreState.loading()';
}


}




/// @nodoc


class MoreLoaded implements MoreState {
  const MoreLoaded({this.user, this.privacy});
  

 final  User? user;
 final  PrivacySettingsDto? privacy;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoreLoadedCopyWith<MoreLoaded> get copyWith => _$MoreLoadedCopyWithImpl<MoreLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreLoaded&&(identical(other.user, user) || other.user == user)&&(identical(other.privacy, privacy) || other.privacy == privacy));
}


@override
int get hashCode => Object.hash(runtimeType,user,privacy);

@override
String toString() {
  return 'MoreState.loaded(user: $user, privacy: $privacy)';
}


}

/// @nodoc
abstract mixin class $MoreLoadedCopyWith<$Res> implements $MoreStateCopyWith<$Res> {
  factory $MoreLoadedCopyWith(MoreLoaded value, $Res Function(MoreLoaded) _then) = _$MoreLoadedCopyWithImpl;
@useResult
$Res call({
 User? user, PrivacySettingsDto? privacy
});


$UserCopyWith<$Res>? get user;$PrivacySettingsDtoCopyWith<$Res>? get privacy;

}
/// @nodoc
class _$MoreLoadedCopyWithImpl<$Res>
    implements $MoreLoadedCopyWith<$Res> {
  _$MoreLoadedCopyWithImpl(this._self, this._then);

  final MoreLoaded _self;
  final $Res Function(MoreLoaded) _then;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = freezed,Object? privacy = freezed,}) {
  return _then(MoreLoaded(
user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,privacy: freezed == privacy ? _self.privacy : privacy // ignore: cast_nullable_to_non_nullable
as PrivacySettingsDto?,
  ));
}

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PrivacySettingsDtoCopyWith<$Res>? get privacy {
    if (_self.privacy == null) {
    return null;
  }

  return $PrivacySettingsDtoCopyWith<$Res>(_self.privacy!, (value) {
    return _then(_self.copyWith(privacy: value));
  });
}
}

/// @nodoc


class MoreError implements MoreState {
  const MoreError(this.message);
  

 final  String message;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoreErrorCopyWith<MoreError> get copyWith => _$MoreErrorCopyWithImpl<MoreError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoreError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MoreState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $MoreErrorCopyWith<$Res> implements $MoreStateCopyWith<$Res> {
  factory $MoreErrorCopyWith(MoreError value, $Res Function(MoreError) _then) = _$MoreErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MoreErrorCopyWithImpl<$Res>
    implements $MoreErrorCopyWith<$Res> {
  _$MoreErrorCopyWithImpl(this._self, this._then);

  final MoreError _self;
  final $Res Function(MoreError) _then;

/// Create a copy of MoreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MoreError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
