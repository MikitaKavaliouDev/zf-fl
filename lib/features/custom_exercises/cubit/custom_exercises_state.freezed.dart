// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_exercises_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CustomExercisesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomExercisesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomExercisesState()';
}


}

/// @nodoc
class $CustomExercisesStateCopyWith<$Res>  {
$CustomExercisesStateCopyWith(CustomExercisesState _, $Res Function(CustomExercisesState) __);
}


/// Adds pattern-matching-related methods to [CustomExercisesState].
extension CustomExercisesStatePatterns on CustomExercisesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CustomExercisesInitial value)?  initial,TResult Function( CustomExercisesLoading value)?  loading,TResult Function( CustomExercisesLoaded value)?  loaded,TResult Function( CustomExercisesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CustomExercisesInitial() when initial != null:
return initial(_that);case CustomExercisesLoading() when loading != null:
return loading(_that);case CustomExercisesLoaded() when loaded != null:
return loaded(_that);case CustomExercisesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CustomExercisesInitial value)  initial,required TResult Function( CustomExercisesLoading value)  loading,required TResult Function( CustomExercisesLoaded value)  loaded,required TResult Function( CustomExercisesError value)  error,}){
final _that = this;
switch (_that) {
case CustomExercisesInitial():
return initial(_that);case CustomExercisesLoading():
return loading(_that);case CustomExercisesLoaded():
return loaded(_that);case CustomExercisesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CustomExercisesInitial value)?  initial,TResult? Function( CustomExercisesLoading value)?  loading,TResult? Function( CustomExercisesLoaded value)?  loaded,TResult? Function( CustomExercisesError value)?  error,}){
final _that = this;
switch (_that) {
case CustomExercisesInitial() when initial != null:
return initial(_that);case CustomExercisesLoading() when loading != null:
return loading(_that);case CustomExercisesLoaded() when loaded != null:
return loaded(_that);case CustomExercisesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CustomExerciseDto> exercises)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CustomExercisesInitial() when initial != null:
return initial();case CustomExercisesLoading() when loading != null:
return loading();case CustomExercisesLoaded() when loaded != null:
return loaded(_that.exercises);case CustomExercisesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CustomExerciseDto> exercises)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CustomExercisesInitial():
return initial();case CustomExercisesLoading():
return loading();case CustomExercisesLoaded():
return loaded(_that.exercises);case CustomExercisesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CustomExerciseDto> exercises)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CustomExercisesInitial() when initial != null:
return initial();case CustomExercisesLoading() when loading != null:
return loading();case CustomExercisesLoaded() when loaded != null:
return loaded(_that.exercises);case CustomExercisesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CustomExercisesInitial implements CustomExercisesState {
  const CustomExercisesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomExercisesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomExercisesState.initial()';
}


}




/// @nodoc


class CustomExercisesLoading implements CustomExercisesState {
  const CustomExercisesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomExercisesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CustomExercisesState.loading()';
}


}




/// @nodoc


class CustomExercisesLoaded implements CustomExercisesState {
  const CustomExercisesLoaded({required final  List<CustomExerciseDto> exercises}): _exercises = exercises;
  

 final  List<CustomExerciseDto> _exercises;
 List<CustomExerciseDto> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of CustomExercisesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomExercisesLoadedCopyWith<CustomExercisesLoaded> get copyWith => _$CustomExercisesLoadedCopyWithImpl<CustomExercisesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomExercisesLoaded&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'CustomExercisesState.loaded(exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $CustomExercisesLoadedCopyWith<$Res> implements $CustomExercisesStateCopyWith<$Res> {
  factory $CustomExercisesLoadedCopyWith(CustomExercisesLoaded value, $Res Function(CustomExercisesLoaded) _then) = _$CustomExercisesLoadedCopyWithImpl;
@useResult
$Res call({
 List<CustomExerciseDto> exercises
});




}
/// @nodoc
class _$CustomExercisesLoadedCopyWithImpl<$Res>
    implements $CustomExercisesLoadedCopyWith<$Res> {
  _$CustomExercisesLoadedCopyWithImpl(this._self, this._then);

  final CustomExercisesLoaded _self;
  final $Res Function(CustomExercisesLoaded) _then;

/// Create a copy of CustomExercisesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exercises = null,}) {
  return _then(CustomExercisesLoaded(
exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<CustomExerciseDto>,
  ));
}


}

/// @nodoc


class CustomExercisesError implements CustomExercisesState {
  const CustomExercisesError(this.message);
  

 final  String message;

/// Create a copy of CustomExercisesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomExercisesErrorCopyWith<CustomExercisesError> get copyWith => _$CustomExercisesErrorCopyWithImpl<CustomExercisesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomExercisesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CustomExercisesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CustomExercisesErrorCopyWith<$Res> implements $CustomExercisesStateCopyWith<$Res> {
  factory $CustomExercisesErrorCopyWith(CustomExercisesError value, $Res Function(CustomExercisesError) _then) = _$CustomExercisesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CustomExercisesErrorCopyWithImpl<$Res>
    implements $CustomExercisesErrorCopyWith<$Res> {
  _$CustomExercisesErrorCopyWithImpl(this._self, this._then);

  final CustomExercisesError _self;
  final $Res Function(CustomExercisesError) _then;

/// Create a copy of CustomExercisesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CustomExercisesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
