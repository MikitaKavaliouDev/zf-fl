// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExerciseDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseDetailState()';
}


}

/// @nodoc
class $ExerciseDetailStateCopyWith<$Res>  {
$ExerciseDetailStateCopyWith(ExerciseDetailState _, $Res Function(ExerciseDetailState) __);
}


/// Adds pattern-matching-related methods to [ExerciseDetailState].
extension ExerciseDetailStatePatterns on ExerciseDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExerciseDetailInitial value)?  initial,TResult Function( ExerciseDetailLoading value)?  loading,TResult Function( ExerciseDetailLoaded value)?  loaded,TResult Function( ExerciseDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExerciseDetailInitial() when initial != null:
return initial(_that);case ExerciseDetailLoading() when loading != null:
return loading(_that);case ExerciseDetailLoaded() when loaded != null:
return loaded(_that);case ExerciseDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExerciseDetailInitial value)  initial,required TResult Function( ExerciseDetailLoading value)  loading,required TResult Function( ExerciseDetailLoaded value)  loaded,required TResult Function( ExerciseDetailError value)  error,}){
final _that = this;
switch (_that) {
case ExerciseDetailInitial():
return initial(_that);case ExerciseDetailLoading():
return loading(_that);case ExerciseDetailLoaded():
return loaded(_that);case ExerciseDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExerciseDetailInitial value)?  initial,TResult? Function( ExerciseDetailLoading value)?  loading,TResult? Function( ExerciseDetailLoaded value)?  loaded,TResult? Function( ExerciseDetailError value)?  error,}){
final _that = this;
switch (_that) {
case ExerciseDetailInitial() when initial != null:
return initial(_that);case ExerciseDetailLoading() when loading != null:
return loading(_that);case ExerciseDetailLoaded() when loaded != null:
return loaded(_that);case ExerciseDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExerciseDto exercise,  List<WorkoutSessionDto> sessions,  List<ExerciseStatPoint> e1rmHistory,  List<ExerciseStatPoint> volumeHistory,  List<ExerciseStatPoint> bestSetVolumeHistory)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExerciseDetailInitial() when initial != null:
return initial();case ExerciseDetailLoading() when loading != null:
return loading();case ExerciseDetailLoaded() when loaded != null:
return loaded(_that.exercise,_that.sessions,_that.e1rmHistory,_that.volumeHistory,_that.bestSetVolumeHistory);case ExerciseDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExerciseDto exercise,  List<WorkoutSessionDto> sessions,  List<ExerciseStatPoint> e1rmHistory,  List<ExerciseStatPoint> volumeHistory,  List<ExerciseStatPoint> bestSetVolumeHistory)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ExerciseDetailInitial():
return initial();case ExerciseDetailLoading():
return loading();case ExerciseDetailLoaded():
return loaded(_that.exercise,_that.sessions,_that.e1rmHistory,_that.volumeHistory,_that.bestSetVolumeHistory);case ExerciseDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExerciseDto exercise,  List<WorkoutSessionDto> sessions,  List<ExerciseStatPoint> e1rmHistory,  List<ExerciseStatPoint> volumeHistory,  List<ExerciseStatPoint> bestSetVolumeHistory)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ExerciseDetailInitial() when initial != null:
return initial();case ExerciseDetailLoading() when loading != null:
return loading();case ExerciseDetailLoaded() when loaded != null:
return loaded(_that.exercise,_that.sessions,_that.e1rmHistory,_that.volumeHistory,_that.bestSetVolumeHistory);case ExerciseDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ExerciseDetailInitial implements ExerciseDetailState {
  const ExerciseDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseDetailState.initial()';
}


}




/// @nodoc


class ExerciseDetailLoading implements ExerciseDetailState {
  const ExerciseDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExerciseDetailState.loading()';
}


}




/// @nodoc


class ExerciseDetailLoaded implements ExerciseDetailState {
  const ExerciseDetailLoaded({required this.exercise, required final  List<WorkoutSessionDto> sessions, required final  List<ExerciseStatPoint> e1rmHistory, required final  List<ExerciseStatPoint> volumeHistory, required final  List<ExerciseStatPoint> bestSetVolumeHistory}): _sessions = sessions,_e1rmHistory = e1rmHistory,_volumeHistory = volumeHistory,_bestSetVolumeHistory = bestSetVolumeHistory;
  

 final  ExerciseDto exercise;
 final  List<WorkoutSessionDto> _sessions;
 List<WorkoutSessionDto> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

 final  List<ExerciseStatPoint> _e1rmHistory;
 List<ExerciseStatPoint> get e1rmHistory {
  if (_e1rmHistory is EqualUnmodifiableListView) return _e1rmHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_e1rmHistory);
}

 final  List<ExerciseStatPoint> _volumeHistory;
 List<ExerciseStatPoint> get volumeHistory {
  if (_volumeHistory is EqualUnmodifiableListView) return _volumeHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volumeHistory);
}

 final  List<ExerciseStatPoint> _bestSetVolumeHistory;
 List<ExerciseStatPoint> get bestSetVolumeHistory {
  if (_bestSetVolumeHistory is EqualUnmodifiableListView) return _bestSetVolumeHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bestSetVolumeHistory);
}


/// Create a copy of ExerciseDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseDetailLoadedCopyWith<ExerciseDetailLoaded> get copyWith => _$ExerciseDetailLoadedCopyWithImpl<ExerciseDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDetailLoaded&&(identical(other.exercise, exercise) || other.exercise == exercise)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&const DeepCollectionEquality().equals(other._e1rmHistory, _e1rmHistory)&&const DeepCollectionEquality().equals(other._volumeHistory, _volumeHistory)&&const DeepCollectionEquality().equals(other._bestSetVolumeHistory, _bestSetVolumeHistory));
}


@override
int get hashCode => Object.hash(runtimeType,exercise,const DeepCollectionEquality().hash(_sessions),const DeepCollectionEquality().hash(_e1rmHistory),const DeepCollectionEquality().hash(_volumeHistory),const DeepCollectionEquality().hash(_bestSetVolumeHistory));

@override
String toString() {
  return 'ExerciseDetailState.loaded(exercise: $exercise, sessions: $sessions, e1rmHistory: $e1rmHistory, volumeHistory: $volumeHistory, bestSetVolumeHistory: $bestSetVolumeHistory)';
}


}

/// @nodoc
abstract mixin class $ExerciseDetailLoadedCopyWith<$Res> implements $ExerciseDetailStateCopyWith<$Res> {
  factory $ExerciseDetailLoadedCopyWith(ExerciseDetailLoaded value, $Res Function(ExerciseDetailLoaded) _then) = _$ExerciseDetailLoadedCopyWithImpl;
@useResult
$Res call({
 ExerciseDto exercise, List<WorkoutSessionDto> sessions, List<ExerciseStatPoint> e1rmHistory, List<ExerciseStatPoint> volumeHistory, List<ExerciseStatPoint> bestSetVolumeHistory
});


$ExerciseDtoCopyWith<$Res> get exercise;

}
/// @nodoc
class _$ExerciseDetailLoadedCopyWithImpl<$Res>
    implements $ExerciseDetailLoadedCopyWith<$Res> {
  _$ExerciseDetailLoadedCopyWithImpl(this._self, this._then);

  final ExerciseDetailLoaded _self;
  final $Res Function(ExerciseDetailLoaded) _then;

/// Create a copy of ExerciseDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exercise = null,Object? sessions = null,Object? e1rmHistory = null,Object? volumeHistory = null,Object? bestSetVolumeHistory = null,}) {
  return _then(ExerciseDetailLoaded(
exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDto,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionDto>,e1rmHistory: null == e1rmHistory ? _self._e1rmHistory : e1rmHistory // ignore: cast_nullable_to_non_nullable
as List<ExerciseStatPoint>,volumeHistory: null == volumeHistory ? _self._volumeHistory : volumeHistory // ignore: cast_nullable_to_non_nullable
as List<ExerciseStatPoint>,bestSetVolumeHistory: null == bestSetVolumeHistory ? _self._bestSetVolumeHistory : bestSetVolumeHistory // ignore: cast_nullable_to_non_nullable
as List<ExerciseStatPoint>,
  ));
}

/// Create a copy of ExerciseDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseDtoCopyWith<$Res> get exercise {
  
  return $ExerciseDtoCopyWith<$Res>(_self.exercise, (value) {
    return _then(_self.copyWith(exercise: value));
  });
}
}

/// @nodoc


class ExerciseDetailError implements ExerciseDetailState {
  const ExerciseDetailError(this.message);
  

 final  String message;

/// Create a copy of ExerciseDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExerciseDetailErrorCopyWith<ExerciseDetailError> get copyWith => _$ExerciseDetailErrorCopyWithImpl<ExerciseDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExerciseDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExerciseDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ExerciseDetailErrorCopyWith<$Res> implements $ExerciseDetailStateCopyWith<$Res> {
  factory $ExerciseDetailErrorCopyWith(ExerciseDetailError value, $Res Function(ExerciseDetailError) _then) = _$ExerciseDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ExerciseDetailErrorCopyWithImpl<$Res>
    implements $ExerciseDetailErrorCopyWith<$Res> {
  _$ExerciseDetailErrorCopyWithImpl(this._self, this._then);

  final ExerciseDetailError _self;
  final $Res Function(ExerciseDetailError) _then;

/// Create a copy of ExerciseDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ExerciseDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
