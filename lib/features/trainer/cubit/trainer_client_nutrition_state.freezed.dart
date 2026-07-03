// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_nutrition_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientNutritionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientNutritionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientNutritionState()';
}


}

/// @nodoc
class $TrainerClientNutritionStateCopyWith<$Res>  {
$TrainerClientNutritionStateCopyWith(TrainerClientNutritionState _, $Res Function(TrainerClientNutritionState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientNutritionState].
extension TrainerClientNutritionStatePatterns on TrainerClientNutritionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientNutritionInitial value)?  initial,TResult Function( TrainerClientNutritionLoading value)?  loading,TResult Function( TrainerClientNutritionLoaded value)?  loaded,TResult Function( TrainerClientNutritionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientNutritionInitial() when initial != null:
return initial(_that);case TrainerClientNutritionLoading() when loading != null:
return loading(_that);case TrainerClientNutritionLoaded() when loaded != null:
return loaded(_that);case TrainerClientNutritionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientNutritionInitial value)  initial,required TResult Function( TrainerClientNutritionLoading value)  loading,required TResult Function( TrainerClientNutritionLoaded value)  loaded,required TResult Function( TrainerClientNutritionError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientNutritionInitial():
return initial(_that);case TrainerClientNutritionLoading():
return loading(_that);case TrainerClientNutritionLoaded():
return loaded(_that);case TrainerClientNutritionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientNutritionInitial value)?  initial,TResult? Function( TrainerClientNutritionLoading value)?  loading,TResult? Function( TrainerClientNutritionLoaded value)?  loaded,TResult? Function( TrainerClientNutritionError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientNutritionInitial() when initial != null:
return initial(_that);case TrainerClientNutritionLoading() when loading != null:
return loading(_that);case TrainerClientNutritionLoaded() when loaded != null:
return loaded(_that);case TrainerClientNutritionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TrainerNutritionPlanDto? plan)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientNutritionInitial() when initial != null:
return initial();case TrainerClientNutritionLoading() when loading != null:
return loading();case TrainerClientNutritionLoaded() when loaded != null:
return loaded(_that.plan);case TrainerClientNutritionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TrainerNutritionPlanDto? plan)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientNutritionInitial():
return initial();case TrainerClientNutritionLoading():
return loading();case TrainerClientNutritionLoaded():
return loaded(_that.plan);case TrainerClientNutritionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TrainerNutritionPlanDto? plan)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientNutritionInitial() when initial != null:
return initial();case TrainerClientNutritionLoading() when loading != null:
return loading();case TrainerClientNutritionLoaded() when loaded != null:
return loaded(_that.plan);case TrainerClientNutritionError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientNutritionInitial implements TrainerClientNutritionState {
  const TrainerClientNutritionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientNutritionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientNutritionState.initial()';
}


}




/// @nodoc


class TrainerClientNutritionLoading implements TrainerClientNutritionState {
  const TrainerClientNutritionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientNutritionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientNutritionState.loading()';
}


}




/// @nodoc


class TrainerClientNutritionLoaded implements TrainerClientNutritionState {
  const TrainerClientNutritionLoaded(this.plan);
  

 final  TrainerNutritionPlanDto? plan;

/// Create a copy of TrainerClientNutritionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientNutritionLoadedCopyWith<TrainerClientNutritionLoaded> get copyWith => _$TrainerClientNutritionLoadedCopyWithImpl<TrainerClientNutritionLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientNutritionLoaded&&(identical(other.plan, plan) || other.plan == plan));
}


@override
int get hashCode => Object.hash(runtimeType,plan);

@override
String toString() {
  return 'TrainerClientNutritionState.loaded(plan: $plan)';
}


}

/// @nodoc
abstract mixin class $TrainerClientNutritionLoadedCopyWith<$Res> implements $TrainerClientNutritionStateCopyWith<$Res> {
  factory $TrainerClientNutritionLoadedCopyWith(TrainerClientNutritionLoaded value, $Res Function(TrainerClientNutritionLoaded) _then) = _$TrainerClientNutritionLoadedCopyWithImpl;
@useResult
$Res call({
 TrainerNutritionPlanDto? plan
});


$TrainerNutritionPlanDtoCopyWith<$Res>? get plan;

}
/// @nodoc
class _$TrainerClientNutritionLoadedCopyWithImpl<$Res>
    implements $TrainerClientNutritionLoadedCopyWith<$Res> {
  _$TrainerClientNutritionLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientNutritionLoaded _self;
  final $Res Function(TrainerClientNutritionLoaded) _then;

/// Create a copy of TrainerClientNutritionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = freezed,}) {
  return _then(TrainerClientNutritionLoaded(
freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as TrainerNutritionPlanDto?,
  ));
}

/// Create a copy of TrainerClientNutritionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerNutritionPlanDtoCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $TrainerNutritionPlanDtoCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}

/// @nodoc


class TrainerClientNutritionError implements TrainerClientNutritionState {
  const TrainerClientNutritionError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientNutritionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientNutritionErrorCopyWith<TrainerClientNutritionError> get copyWith => _$TrainerClientNutritionErrorCopyWithImpl<TrainerClientNutritionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientNutritionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientNutritionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientNutritionErrorCopyWith<$Res> implements $TrainerClientNutritionStateCopyWith<$Res> {
  factory $TrainerClientNutritionErrorCopyWith(TrainerClientNutritionError value, $Res Function(TrainerClientNutritionError) _then) = _$TrainerClientNutritionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientNutritionErrorCopyWithImpl<$Res>
    implements $TrainerClientNutritionErrorCopyWith<$Res> {
  _$TrainerClientNutritionErrorCopyWithImpl(this._self, this._then);

  final TrainerClientNutritionError _self;
  final $Res Function(TrainerClientNutritionError) _then;

/// Create a copy of TrainerClientNutritionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientNutritionError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
