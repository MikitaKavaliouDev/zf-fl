// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payouts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PayoutsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PayoutsState()';
}


}

/// @nodoc
class $PayoutsStateCopyWith<$Res>  {
$PayoutsStateCopyWith(PayoutsState _, $Res Function(PayoutsState) __);
}


/// Adds pattern-matching-related methods to [PayoutsState].
extension PayoutsStatePatterns on PayoutsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PayoutsInitial value)?  initial,TResult Function( PayoutsLoading value)?  loading,TResult Function( PayoutsLoaded value)?  loaded,TResult Function( PayoutsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PayoutsInitial() when initial != null:
return initial(_that);case PayoutsLoading() when loading != null:
return loading(_that);case PayoutsLoaded() when loaded != null:
return loaded(_that);case PayoutsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PayoutsInitial value)  initial,required TResult Function( PayoutsLoading value)  loading,required TResult Function( PayoutsLoaded value)  loaded,required TResult Function( PayoutsError value)  error,}){
final _that = this;
switch (_that) {
case PayoutsInitial():
return initial(_that);case PayoutsLoading():
return loading(_that);case PayoutsLoaded():
return loaded(_that);case PayoutsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PayoutsInitial value)?  initial,TResult? Function( PayoutsLoading value)?  loading,TResult? Function( PayoutsLoaded value)?  loaded,TResult? Function( PayoutsError value)?  error,}){
final _that = this;
switch (_that) {
case PayoutsInitial() when initial != null:
return initial(_that);case PayoutsLoading() when loading != null:
return loading(_that);case PayoutsLoaded() when loaded != null:
return loaded(_that);case PayoutsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( StripeStatusDto status)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PayoutsInitial() when initial != null:
return initial();case PayoutsLoading() when loading != null:
return loading();case PayoutsLoaded() when loaded != null:
return loaded(_that.status);case PayoutsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( StripeStatusDto status)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case PayoutsInitial():
return initial();case PayoutsLoading():
return loading();case PayoutsLoaded():
return loaded(_that.status);case PayoutsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( StripeStatusDto status)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case PayoutsInitial() when initial != null:
return initial();case PayoutsLoading() when loading != null:
return loading();case PayoutsLoaded() when loaded != null:
return loaded(_that.status);case PayoutsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class PayoutsInitial implements PayoutsState {
  const PayoutsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PayoutsState.initial()';
}


}




/// @nodoc


class PayoutsLoading implements PayoutsState {
  const PayoutsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PayoutsState.loading()';
}


}




/// @nodoc


class PayoutsLoaded implements PayoutsState {
  const PayoutsLoaded(this.status);
  

 final  StripeStatusDto status;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutsLoadedCopyWith<PayoutsLoaded> get copyWith => _$PayoutsLoadedCopyWithImpl<PayoutsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsLoaded&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'PayoutsState.loaded(status: $status)';
}


}

/// @nodoc
abstract mixin class $PayoutsLoadedCopyWith<$Res> implements $PayoutsStateCopyWith<$Res> {
  factory $PayoutsLoadedCopyWith(PayoutsLoaded value, $Res Function(PayoutsLoaded) _then) = _$PayoutsLoadedCopyWithImpl;
@useResult
$Res call({
 StripeStatusDto status
});


$StripeStatusDtoCopyWith<$Res> get status;

}
/// @nodoc
class _$PayoutsLoadedCopyWithImpl<$Res>
    implements $PayoutsLoadedCopyWith<$Res> {
  _$PayoutsLoadedCopyWithImpl(this._self, this._then);

  final PayoutsLoaded _self;
  final $Res Function(PayoutsLoaded) _then;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(PayoutsLoaded(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StripeStatusDto,
  ));
}

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StripeStatusDtoCopyWith<$Res> get status {
  
  return $StripeStatusDtoCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}

/// @nodoc


class PayoutsError implements PayoutsState {
  const PayoutsError(this.message);
  

 final  String message;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutsErrorCopyWith<PayoutsError> get copyWith => _$PayoutsErrorCopyWithImpl<PayoutsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PayoutsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $PayoutsErrorCopyWith<$Res> implements $PayoutsStateCopyWith<$Res> {
  factory $PayoutsErrorCopyWith(PayoutsError value, $Res Function(PayoutsError) _then) = _$PayoutsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$PayoutsErrorCopyWithImpl<$Res>
    implements $PayoutsErrorCopyWith<$Res> {
  _$PayoutsErrorCopyWithImpl(this._self, this._then);

  final PayoutsError _self;
  final $Res Function(PayoutsError) _then;

/// Create a copy of PayoutsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(PayoutsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
