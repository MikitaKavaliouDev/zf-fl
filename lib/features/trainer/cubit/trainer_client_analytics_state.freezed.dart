// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientAnalyticsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientAnalyticsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientAnalyticsState()';
}


}

/// @nodoc
class $TrainerClientAnalyticsStateCopyWith<$Res>  {
$TrainerClientAnalyticsStateCopyWith(TrainerClientAnalyticsState _, $Res Function(TrainerClientAnalyticsState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientAnalyticsState].
extension TrainerClientAnalyticsStatePatterns on TrainerClientAnalyticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientAnalyticsInitial value)?  initial,TResult Function( TrainerClientAnalyticsLoading value)?  loading,TResult Function( TrainerClientAnalyticsLoaded value)?  loaded,TResult Function( TrainerClientAnalyticsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientAnalyticsInitial() when initial != null:
return initial(_that);case TrainerClientAnalyticsLoading() when loading != null:
return loading(_that);case TrainerClientAnalyticsLoaded() when loaded != null:
return loaded(_that);case TrainerClientAnalyticsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientAnalyticsInitial value)  initial,required TResult Function( TrainerClientAnalyticsLoading value)  loading,required TResult Function( TrainerClientAnalyticsLoaded value)  loaded,required TResult Function( TrainerClientAnalyticsError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientAnalyticsInitial():
return initial(_that);case TrainerClientAnalyticsLoading():
return loading(_that);case TrainerClientAnalyticsLoaded():
return loaded(_that);case TrainerClientAnalyticsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientAnalyticsInitial value)?  initial,TResult? Function( TrainerClientAnalyticsLoading value)?  loading,TResult? Function( TrainerClientAnalyticsLoaded value)?  loaded,TResult? Function( TrainerClientAnalyticsError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientAnalyticsInitial() when initial != null:
return initial(_that);case TrainerClientAnalyticsLoading() when loading != null:
return loading(_that);case TrainerClientAnalyticsLoaded() when loaded != null:
return loaded(_that);case TrainerClientAnalyticsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ClientAnalyticsDto analytics)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientAnalyticsInitial() when initial != null:
return initial();case TrainerClientAnalyticsLoading() when loading != null:
return loading();case TrainerClientAnalyticsLoaded() when loaded != null:
return loaded(_that.analytics);case TrainerClientAnalyticsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ClientAnalyticsDto analytics)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientAnalyticsInitial():
return initial();case TrainerClientAnalyticsLoading():
return loading();case TrainerClientAnalyticsLoaded():
return loaded(_that.analytics);case TrainerClientAnalyticsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ClientAnalyticsDto analytics)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientAnalyticsInitial() when initial != null:
return initial();case TrainerClientAnalyticsLoading() when loading != null:
return loading();case TrainerClientAnalyticsLoaded() when loaded != null:
return loaded(_that.analytics);case TrainerClientAnalyticsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientAnalyticsInitial implements TrainerClientAnalyticsState {
  const TrainerClientAnalyticsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientAnalyticsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientAnalyticsState.initial()';
}


}




/// @nodoc


class TrainerClientAnalyticsLoading implements TrainerClientAnalyticsState {
  const TrainerClientAnalyticsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientAnalyticsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientAnalyticsState.loading()';
}


}




/// @nodoc


class TrainerClientAnalyticsLoaded implements TrainerClientAnalyticsState {
  const TrainerClientAnalyticsLoaded(this.analytics);
  

 final  ClientAnalyticsDto analytics;

/// Create a copy of TrainerClientAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientAnalyticsLoadedCopyWith<TrainerClientAnalyticsLoaded> get copyWith => _$TrainerClientAnalyticsLoadedCopyWithImpl<TrainerClientAnalyticsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientAnalyticsLoaded&&(identical(other.analytics, analytics) || other.analytics == analytics));
}


@override
int get hashCode => Object.hash(runtimeType,analytics);

@override
String toString() {
  return 'TrainerClientAnalyticsState.loaded(analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class $TrainerClientAnalyticsLoadedCopyWith<$Res> implements $TrainerClientAnalyticsStateCopyWith<$Res> {
  factory $TrainerClientAnalyticsLoadedCopyWith(TrainerClientAnalyticsLoaded value, $Res Function(TrainerClientAnalyticsLoaded) _then) = _$TrainerClientAnalyticsLoadedCopyWithImpl;
@useResult
$Res call({
 ClientAnalyticsDto analytics
});


$ClientAnalyticsDtoCopyWith<$Res> get analytics;

}
/// @nodoc
class _$TrainerClientAnalyticsLoadedCopyWithImpl<$Res>
    implements $TrainerClientAnalyticsLoadedCopyWith<$Res> {
  _$TrainerClientAnalyticsLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientAnalyticsLoaded _self;
  final $Res Function(TrainerClientAnalyticsLoaded) _then;

/// Create a copy of TrainerClientAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? analytics = null,}) {
  return _then(TrainerClientAnalyticsLoaded(
null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as ClientAnalyticsDto,
  ));
}

/// Create a copy of TrainerClientAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientAnalyticsDtoCopyWith<$Res> get analytics {
  
  return $ClientAnalyticsDtoCopyWith<$Res>(_self.analytics, (value) {
    return _then(_self.copyWith(analytics: value));
  });
}
}

/// @nodoc


class TrainerClientAnalyticsError implements TrainerClientAnalyticsState {
  const TrainerClientAnalyticsError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientAnalyticsErrorCopyWith<TrainerClientAnalyticsError> get copyWith => _$TrainerClientAnalyticsErrorCopyWithImpl<TrainerClientAnalyticsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientAnalyticsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientAnalyticsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientAnalyticsErrorCopyWith<$Res> implements $TrainerClientAnalyticsStateCopyWith<$Res> {
  factory $TrainerClientAnalyticsErrorCopyWith(TrainerClientAnalyticsError value, $Res Function(TrainerClientAnalyticsError) _then) = _$TrainerClientAnalyticsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientAnalyticsErrorCopyWithImpl<$Res>
    implements $TrainerClientAnalyticsErrorCopyWith<$Res> {
  _$TrainerClientAnalyticsErrorCopyWithImpl(this._self, this._then);

  final TrainerClientAnalyticsError _self;
  final $Res Function(TrainerClientAnalyticsError) _then;

/// Create a copy of TrainerClientAnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientAnalyticsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
