// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_add_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerAddClientState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerAddClientState()';
}


}

/// @nodoc
class $TrainerAddClientStateCopyWith<$Res>  {
$TrainerAddClientStateCopyWith(TrainerAddClientState _, $Res Function(TrainerAddClientState) __);
}


/// Adds pattern-matching-related methods to [TrainerAddClientState].
extension TrainerAddClientStatePatterns on TrainerAddClientState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerAddClientInitial value)?  initial,TResult Function( TrainerAddClientLoading value)?  loading,TResult Function( TrainerAddClientLoaded value)?  loaded,TResult Function( TrainerAddClientEmailAlreadyExists value)?  emailAlreadyExists,TResult Function( TrainerAddClientLinkAlreadyPending value)?  linkAlreadyPending,TResult Function( TrainerAddClientLimitReached value)?  limitReached,TResult Function( TrainerAddClientError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerAddClientInitial() when initial != null:
return initial(_that);case TrainerAddClientLoading() when loading != null:
return loading(_that);case TrainerAddClientLoaded() when loaded != null:
return loaded(_that);case TrainerAddClientEmailAlreadyExists() when emailAlreadyExists != null:
return emailAlreadyExists(_that);case TrainerAddClientLinkAlreadyPending() when linkAlreadyPending != null:
return linkAlreadyPending(_that);case TrainerAddClientLimitReached() when limitReached != null:
return limitReached(_that);case TrainerAddClientError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerAddClientInitial value)  initial,required TResult Function( TrainerAddClientLoading value)  loading,required TResult Function( TrainerAddClientLoaded value)  loaded,required TResult Function( TrainerAddClientEmailAlreadyExists value)  emailAlreadyExists,required TResult Function( TrainerAddClientLinkAlreadyPending value)  linkAlreadyPending,required TResult Function( TrainerAddClientLimitReached value)  limitReached,required TResult Function( TrainerAddClientError value)  error,}){
final _that = this;
switch (_that) {
case TrainerAddClientInitial():
return initial(_that);case TrainerAddClientLoading():
return loading(_that);case TrainerAddClientLoaded():
return loaded(_that);case TrainerAddClientEmailAlreadyExists():
return emailAlreadyExists(_that);case TrainerAddClientLinkAlreadyPending():
return linkAlreadyPending(_that);case TrainerAddClientLimitReached():
return limitReached(_that);case TrainerAddClientError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerAddClientInitial value)?  initial,TResult? Function( TrainerAddClientLoading value)?  loading,TResult? Function( TrainerAddClientLoaded value)?  loaded,TResult? Function( TrainerAddClientEmailAlreadyExists value)?  emailAlreadyExists,TResult? Function( TrainerAddClientLinkAlreadyPending value)?  linkAlreadyPending,TResult? Function( TrainerAddClientLimitReached value)?  limitReached,TResult? Function( TrainerAddClientError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerAddClientInitial() when initial != null:
return initial(_that);case TrainerAddClientLoading() when loading != null:
return loading(_that);case TrainerAddClientLoaded() when loaded != null:
return loaded(_that);case TrainerAddClientEmailAlreadyExists() when emailAlreadyExists != null:
return emailAlreadyExists(_that);case TrainerAddClientLinkAlreadyPending() when linkAlreadyPending != null:
return linkAlreadyPending(_that);case TrainerAddClientLimitReached() when limitReached != null:
return limitReached(_that);case TrainerAddClientError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? successMessage)?  loaded,TResult Function()?  emailAlreadyExists,TResult Function()?  linkAlreadyPending,TResult Function()?  limitReached,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerAddClientInitial() when initial != null:
return initial();case TrainerAddClientLoading() when loading != null:
return loading();case TrainerAddClientLoaded() when loaded != null:
return loaded(_that.successMessage);case TrainerAddClientEmailAlreadyExists() when emailAlreadyExists != null:
return emailAlreadyExists();case TrainerAddClientLinkAlreadyPending() when linkAlreadyPending != null:
return linkAlreadyPending();case TrainerAddClientLimitReached() when limitReached != null:
return limitReached();case TrainerAddClientError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? successMessage)  loaded,required TResult Function()  emailAlreadyExists,required TResult Function()  linkAlreadyPending,required TResult Function()  limitReached,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerAddClientInitial():
return initial();case TrainerAddClientLoading():
return loading();case TrainerAddClientLoaded():
return loaded(_that.successMessage);case TrainerAddClientEmailAlreadyExists():
return emailAlreadyExists();case TrainerAddClientLinkAlreadyPending():
return linkAlreadyPending();case TrainerAddClientLimitReached():
return limitReached();case TrainerAddClientError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? successMessage)?  loaded,TResult? Function()?  emailAlreadyExists,TResult? Function()?  linkAlreadyPending,TResult? Function()?  limitReached,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerAddClientInitial() when initial != null:
return initial();case TrainerAddClientLoading() when loading != null:
return loading();case TrainerAddClientLoaded() when loaded != null:
return loaded(_that.successMessage);case TrainerAddClientEmailAlreadyExists() when emailAlreadyExists != null:
return emailAlreadyExists();case TrainerAddClientLinkAlreadyPending() when linkAlreadyPending != null:
return linkAlreadyPending();case TrainerAddClientLimitReached() when limitReached != null:
return limitReached();case TrainerAddClientError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerAddClientInitial implements TrainerAddClientState {
  const TrainerAddClientInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerAddClientState.initial()';
}


}




/// @nodoc


class TrainerAddClientLoading implements TrainerAddClientState {
  const TrainerAddClientLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerAddClientState.loading()';
}


}




/// @nodoc


class TrainerAddClientLoaded implements TrainerAddClientState {
  const TrainerAddClientLoaded({this.successMessage});
  

 final  String? successMessage;

/// Create a copy of TrainerAddClientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerAddClientLoadedCopyWith<TrainerAddClientLoaded> get copyWith => _$TrainerAddClientLoadedCopyWithImpl<TrainerAddClientLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientLoaded&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,successMessage);

@override
String toString() {
  return 'TrainerAddClientState.loaded(successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $TrainerAddClientLoadedCopyWith<$Res> implements $TrainerAddClientStateCopyWith<$Res> {
  factory $TrainerAddClientLoadedCopyWith(TrainerAddClientLoaded value, $Res Function(TrainerAddClientLoaded) _then) = _$TrainerAddClientLoadedCopyWithImpl;
@useResult
$Res call({
 String? successMessage
});




}
/// @nodoc
class _$TrainerAddClientLoadedCopyWithImpl<$Res>
    implements $TrainerAddClientLoadedCopyWith<$Res> {
  _$TrainerAddClientLoadedCopyWithImpl(this._self, this._then);

  final TrainerAddClientLoaded _self;
  final $Res Function(TrainerAddClientLoaded) _then;

/// Create a copy of TrainerAddClientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? successMessage = freezed,}) {
  return _then(TrainerAddClientLoaded(
successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TrainerAddClientEmailAlreadyExists implements TrainerAddClientState {
  const TrainerAddClientEmailAlreadyExists();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientEmailAlreadyExists);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerAddClientState.emailAlreadyExists()';
}


}




/// @nodoc


class TrainerAddClientLinkAlreadyPending implements TrainerAddClientState {
  const TrainerAddClientLinkAlreadyPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientLinkAlreadyPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerAddClientState.linkAlreadyPending()';
}


}




/// @nodoc


class TrainerAddClientLimitReached implements TrainerAddClientState {
  const TrainerAddClientLimitReached();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientLimitReached);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerAddClientState.limitReached()';
}


}




/// @nodoc


class TrainerAddClientError implements TrainerAddClientState {
  const TrainerAddClientError(this.message);
  

 final  String message;

/// Create a copy of TrainerAddClientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerAddClientErrorCopyWith<TrainerAddClientError> get copyWith => _$TrainerAddClientErrorCopyWithImpl<TrainerAddClientError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerAddClientError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerAddClientState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerAddClientErrorCopyWith<$Res> implements $TrainerAddClientStateCopyWith<$Res> {
  factory $TrainerAddClientErrorCopyWith(TrainerAddClientError value, $Res Function(TrainerAddClientError) _then) = _$TrainerAddClientErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerAddClientErrorCopyWithImpl<$Res>
    implements $TrainerAddClientErrorCopyWith<$Res> {
  _$TrainerAddClientErrorCopyWithImpl(this._self, this._then);

  final TrainerAddClientError _self;
  final $Res Function(TrainerAddClientError) _then;

/// Create a copy of TrainerAddClientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerAddClientError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
