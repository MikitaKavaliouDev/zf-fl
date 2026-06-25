// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fitness_goals_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FitnessGoalsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessGoalsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FitnessGoalsState()';
}


}

/// @nodoc
class $FitnessGoalsStateCopyWith<$Res>  {
$FitnessGoalsStateCopyWith(FitnessGoalsState _, $Res Function(FitnessGoalsState) __);
}


/// Adds pattern-matching-related methods to [FitnessGoalsState].
extension FitnessGoalsStatePatterns on FitnessGoalsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FitnessGoalsInitial value)?  initial,TResult Function( FitnessGoalsLoading value)?  loading,TResult Function( FitnessGoalsLoaded value)?  loaded,TResult Function( FitnessGoalsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FitnessGoalsInitial() when initial != null:
return initial(_that);case FitnessGoalsLoading() when loading != null:
return loading(_that);case FitnessGoalsLoaded() when loaded != null:
return loaded(_that);case FitnessGoalsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FitnessGoalsInitial value)  initial,required TResult Function( FitnessGoalsLoading value)  loading,required TResult Function( FitnessGoalsLoaded value)  loaded,required TResult Function( FitnessGoalsError value)  error,}){
final _that = this;
switch (_that) {
case FitnessGoalsInitial():
return initial(_that);case FitnessGoalsLoading():
return loading(_that);case FitnessGoalsLoaded():
return loaded(_that);case FitnessGoalsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FitnessGoalsInitial value)?  initial,TResult? Function( FitnessGoalsLoading value)?  loading,TResult? Function( FitnessGoalsLoaded value)?  loaded,TResult? Function( FitnessGoalsError value)?  error,}){
final _that = this;
switch (_that) {
case FitnessGoalsInitial() when initial != null:
return initial(_that);case FitnessGoalsLoading() when loading != null:
return loading(_that);case FitnessGoalsLoaded() when loaded != null:
return loaded(_that);case FitnessGoalsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<FitnessGoalDto> goals)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FitnessGoalsInitial() when initial != null:
return initial();case FitnessGoalsLoading() when loading != null:
return loading();case FitnessGoalsLoaded() when loaded != null:
return loaded(_that.goals);case FitnessGoalsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<FitnessGoalDto> goals)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case FitnessGoalsInitial():
return initial();case FitnessGoalsLoading():
return loading();case FitnessGoalsLoaded():
return loaded(_that.goals);case FitnessGoalsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<FitnessGoalDto> goals)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case FitnessGoalsInitial() when initial != null:
return initial();case FitnessGoalsLoading() when loading != null:
return loading();case FitnessGoalsLoaded() when loaded != null:
return loaded(_that.goals);case FitnessGoalsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class FitnessGoalsInitial implements FitnessGoalsState {
  const FitnessGoalsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessGoalsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FitnessGoalsState.initial()';
}


}




/// @nodoc


class FitnessGoalsLoading implements FitnessGoalsState {
  const FitnessGoalsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessGoalsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FitnessGoalsState.loading()';
}


}




/// @nodoc


class FitnessGoalsLoaded implements FitnessGoalsState {
  const FitnessGoalsLoaded({required final  List<FitnessGoalDto> goals}): _goals = goals;
  

 final  List<FitnessGoalDto> _goals;
 List<FitnessGoalDto> get goals {
  if (_goals is EqualUnmodifiableListView) return _goals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_goals);
}


/// Create a copy of FitnessGoalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitnessGoalsLoadedCopyWith<FitnessGoalsLoaded> get copyWith => _$FitnessGoalsLoadedCopyWithImpl<FitnessGoalsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessGoalsLoaded&&const DeepCollectionEquality().equals(other._goals, _goals));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_goals));

@override
String toString() {
  return 'FitnessGoalsState.loaded(goals: $goals)';
}


}

/// @nodoc
abstract mixin class $FitnessGoalsLoadedCopyWith<$Res> implements $FitnessGoalsStateCopyWith<$Res> {
  factory $FitnessGoalsLoadedCopyWith(FitnessGoalsLoaded value, $Res Function(FitnessGoalsLoaded) _then) = _$FitnessGoalsLoadedCopyWithImpl;
@useResult
$Res call({
 List<FitnessGoalDto> goals
});




}
/// @nodoc
class _$FitnessGoalsLoadedCopyWithImpl<$Res>
    implements $FitnessGoalsLoadedCopyWith<$Res> {
  _$FitnessGoalsLoadedCopyWithImpl(this._self, this._then);

  final FitnessGoalsLoaded _self;
  final $Res Function(FitnessGoalsLoaded) _then;

/// Create a copy of FitnessGoalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goals = null,}) {
  return _then(FitnessGoalsLoaded(
goals: null == goals ? _self._goals : goals // ignore: cast_nullable_to_non_nullable
as List<FitnessGoalDto>,
  ));
}


}

/// @nodoc


class FitnessGoalsError implements FitnessGoalsState {
  const FitnessGoalsError(this.message);
  

 final  String message;

/// Create a copy of FitnessGoalsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitnessGoalsErrorCopyWith<FitnessGoalsError> get copyWith => _$FitnessGoalsErrorCopyWithImpl<FitnessGoalsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessGoalsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'FitnessGoalsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $FitnessGoalsErrorCopyWith<$Res> implements $FitnessGoalsStateCopyWith<$Res> {
  factory $FitnessGoalsErrorCopyWith(FitnessGoalsError value, $Res Function(FitnessGoalsError) _then) = _$FitnessGoalsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$FitnessGoalsErrorCopyWithImpl<$Res>
    implements $FitnessGoalsErrorCopyWith<$Res> {
  _$FitnessGoalsErrorCopyWithImpl(this._self, this._then);

  final FitnessGoalsError _self;
  final $Res Function(FitnessGoalsError) _then;

/// Create a copy of FitnessGoalsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(FitnessGoalsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
