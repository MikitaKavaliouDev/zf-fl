// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutSessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutSessionState()';
}


}

/// @nodoc
class $WorkoutSessionStateCopyWith<$Res>  {
$WorkoutSessionStateCopyWith(WorkoutSessionState _, $Res Function(WorkoutSessionState) __);
}


/// Adds pattern-matching-related methods to [WorkoutSessionState].
extension WorkoutSessionStatePatterns on WorkoutSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkoutSessionInitial value)?  initial,TResult Function( WorkoutSessionLoading value)?  loading,TResult Function( WorkoutSessionConflict value)?  conflict,TResult Function( WorkoutSessionExerciseDetailLoading value)?  exerciseDetailLoading,TResult Function( WorkoutSessionExerciseDetailLoaded value)?  exerciseDetailLoaded,TResult Function( WorkoutSessionExerciseDetailError value)?  exerciseDetailError,TResult Function( WorkoutSessionActive value)?  active,TResult Function( WorkoutSessionCompleted value)?  completed,TResult Function( WorkoutSessionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial(_that);case WorkoutSessionLoading() when loading != null:
return loading(_that);case WorkoutSessionConflict() when conflict != null:
return conflict(_that);case WorkoutSessionExerciseDetailLoading() when exerciseDetailLoading != null:
return exerciseDetailLoading(_that);case WorkoutSessionExerciseDetailLoaded() when exerciseDetailLoaded != null:
return exerciseDetailLoaded(_that);case WorkoutSessionExerciseDetailError() when exerciseDetailError != null:
return exerciseDetailError(_that);case WorkoutSessionActive() when active != null:
return active(_that);case WorkoutSessionCompleted() when completed != null:
return completed(_that);case WorkoutSessionError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkoutSessionInitial value)  initial,required TResult Function( WorkoutSessionLoading value)  loading,required TResult Function( WorkoutSessionConflict value)  conflict,required TResult Function( WorkoutSessionExerciseDetailLoading value)  exerciseDetailLoading,required TResult Function( WorkoutSessionExerciseDetailLoaded value)  exerciseDetailLoaded,required TResult Function( WorkoutSessionExerciseDetailError value)  exerciseDetailError,required TResult Function( WorkoutSessionActive value)  active,required TResult Function( WorkoutSessionCompleted value)  completed,required TResult Function( WorkoutSessionError value)  error,}){
final _that = this;
switch (_that) {
case WorkoutSessionInitial():
return initial(_that);case WorkoutSessionLoading():
return loading(_that);case WorkoutSessionConflict():
return conflict(_that);case WorkoutSessionExerciseDetailLoading():
return exerciseDetailLoading(_that);case WorkoutSessionExerciseDetailLoaded():
return exerciseDetailLoaded(_that);case WorkoutSessionExerciseDetailError():
return exerciseDetailError(_that);case WorkoutSessionActive():
return active(_that);case WorkoutSessionCompleted():
return completed(_that);case WorkoutSessionError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkoutSessionInitial value)?  initial,TResult? Function( WorkoutSessionLoading value)?  loading,TResult? Function( WorkoutSessionConflict value)?  conflict,TResult? Function( WorkoutSessionExerciseDetailLoading value)?  exerciseDetailLoading,TResult? Function( WorkoutSessionExerciseDetailLoaded value)?  exerciseDetailLoaded,TResult? Function( WorkoutSessionExerciseDetailError value)?  exerciseDetailError,TResult? Function( WorkoutSessionActive value)?  active,TResult? Function( WorkoutSessionCompleted value)?  completed,TResult? Function( WorkoutSessionError value)?  error,}){
final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial(_that);case WorkoutSessionLoading() when loading != null:
return loading(_that);case WorkoutSessionConflict() when conflict != null:
return conflict(_that);case WorkoutSessionExerciseDetailLoading() when exerciseDetailLoading != null:
return exerciseDetailLoading(_that);case WorkoutSessionExerciseDetailLoaded() when exerciseDetailLoaded != null:
return exerciseDetailLoaded(_that);case WorkoutSessionExerciseDetailError() when exerciseDetailError != null:
return exerciseDetailError(_that);case WorkoutSessionActive() when active != null:
return active(_that);case WorkoutSessionCompleted() when completed != null:
return completed(_that);case WorkoutSessionError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String existingSessionId)?  conflict,TResult Function()?  exerciseDetailLoading,TResult Function( ExerciseDto exercise,  List<WorkoutSessionDto> sessions)?  exerciseDetailLoaded,TResult Function( String message)?  exerciseDetailError,TResult Function( WorkoutSessionDto session,  List<ExerciseLogDto> logs,  Duration elapsed,  bool isPaused,  bool isMinimized,  DateTime? restStartedAt,  Duration restElapsed,  DateTime? startTime,  int? restDuration,  int? restRemaining,  bool showLongSessionWarning,  bool showRestFinishedToast,  List<Map<String, dynamic>> sessionNewRecords,  bool newPrRecord)?  active,TResult Function( WorkoutSessionDto session,  Duration totalDuration,  List<ExerciseLogDto> logs,  List<Map<String, dynamic>> newRecords,  bool showPrToast)?  completed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial();case WorkoutSessionLoading() when loading != null:
return loading();case WorkoutSessionConflict() when conflict != null:
return conflict(_that.existingSessionId);case WorkoutSessionExerciseDetailLoading() when exerciseDetailLoading != null:
return exerciseDetailLoading();case WorkoutSessionExerciseDetailLoaded() when exerciseDetailLoaded != null:
return exerciseDetailLoaded(_that.exercise,_that.sessions);case WorkoutSessionExerciseDetailError() when exerciseDetailError != null:
return exerciseDetailError(_that.message);case WorkoutSessionActive() when active != null:
return active(_that.session,_that.logs,_that.elapsed,_that.isPaused,_that.isMinimized,_that.restStartedAt,_that.restElapsed,_that.startTime,_that.restDuration,_that.restRemaining,_that.showLongSessionWarning,_that.showRestFinishedToast,_that.sessionNewRecords,_that.newPrRecord);case WorkoutSessionCompleted() when completed != null:
return completed(_that.session,_that.totalDuration,_that.logs,_that.newRecords,_that.showPrToast);case WorkoutSessionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String existingSessionId)  conflict,required TResult Function()  exerciseDetailLoading,required TResult Function( ExerciseDto exercise,  List<WorkoutSessionDto> sessions)  exerciseDetailLoaded,required TResult Function( String message)  exerciseDetailError,required TResult Function( WorkoutSessionDto session,  List<ExerciseLogDto> logs,  Duration elapsed,  bool isPaused,  bool isMinimized,  DateTime? restStartedAt,  Duration restElapsed,  DateTime? startTime,  int? restDuration,  int? restRemaining,  bool showLongSessionWarning,  bool showRestFinishedToast,  List<Map<String, dynamic>> sessionNewRecords,  bool newPrRecord)  active,required TResult Function( WorkoutSessionDto session,  Duration totalDuration,  List<ExerciseLogDto> logs,  List<Map<String, dynamic>> newRecords,  bool showPrToast)  completed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WorkoutSessionInitial():
return initial();case WorkoutSessionLoading():
return loading();case WorkoutSessionConflict():
return conflict(_that.existingSessionId);case WorkoutSessionExerciseDetailLoading():
return exerciseDetailLoading();case WorkoutSessionExerciseDetailLoaded():
return exerciseDetailLoaded(_that.exercise,_that.sessions);case WorkoutSessionExerciseDetailError():
return exerciseDetailError(_that.message);case WorkoutSessionActive():
return active(_that.session,_that.logs,_that.elapsed,_that.isPaused,_that.isMinimized,_that.restStartedAt,_that.restElapsed,_that.startTime,_that.restDuration,_that.restRemaining,_that.showLongSessionWarning,_that.showRestFinishedToast,_that.sessionNewRecords,_that.newPrRecord);case WorkoutSessionCompleted():
return completed(_that.session,_that.totalDuration,_that.logs,_that.newRecords,_that.showPrToast);case WorkoutSessionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String existingSessionId)?  conflict,TResult? Function()?  exerciseDetailLoading,TResult? Function( ExerciseDto exercise,  List<WorkoutSessionDto> sessions)?  exerciseDetailLoaded,TResult? Function( String message)?  exerciseDetailError,TResult? Function( WorkoutSessionDto session,  List<ExerciseLogDto> logs,  Duration elapsed,  bool isPaused,  bool isMinimized,  DateTime? restStartedAt,  Duration restElapsed,  DateTime? startTime,  int? restDuration,  int? restRemaining,  bool showLongSessionWarning,  bool showRestFinishedToast,  List<Map<String, dynamic>> sessionNewRecords,  bool newPrRecord)?  active,TResult? Function( WorkoutSessionDto session,  Duration totalDuration,  List<ExerciseLogDto> logs,  List<Map<String, dynamic>> newRecords,  bool showPrToast)?  completed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial();case WorkoutSessionLoading() when loading != null:
return loading();case WorkoutSessionConflict() when conflict != null:
return conflict(_that.existingSessionId);case WorkoutSessionExerciseDetailLoading() when exerciseDetailLoading != null:
return exerciseDetailLoading();case WorkoutSessionExerciseDetailLoaded() when exerciseDetailLoaded != null:
return exerciseDetailLoaded(_that.exercise,_that.sessions);case WorkoutSessionExerciseDetailError() when exerciseDetailError != null:
return exerciseDetailError(_that.message);case WorkoutSessionActive() when active != null:
return active(_that.session,_that.logs,_that.elapsed,_that.isPaused,_that.isMinimized,_that.restStartedAt,_that.restElapsed,_that.startTime,_that.restDuration,_that.restRemaining,_that.showLongSessionWarning,_that.showRestFinishedToast,_that.sessionNewRecords,_that.newPrRecord);case WorkoutSessionCompleted() when completed != null:
return completed(_that.session,_that.totalDuration,_that.logs,_that.newRecords,_that.showPrToast);case WorkoutSessionError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WorkoutSessionInitial implements WorkoutSessionState {
  const WorkoutSessionInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutSessionState.initial()';
}


}




/// @nodoc


class WorkoutSessionLoading implements WorkoutSessionState {
  const WorkoutSessionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutSessionState.loading()';
}


}




/// @nodoc


class WorkoutSessionConflict implements WorkoutSessionState {
  const WorkoutSessionConflict({required this.existingSessionId});
  

 final  String existingSessionId;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionConflictCopyWith<WorkoutSessionConflict> get copyWith => _$WorkoutSessionConflictCopyWithImpl<WorkoutSessionConflict>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionConflict&&(identical(other.existingSessionId, existingSessionId) || other.existingSessionId == existingSessionId));
}


@override
int get hashCode => Object.hash(runtimeType,existingSessionId);

@override
String toString() {
  return 'WorkoutSessionState.conflict(existingSessionId: $existingSessionId)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionConflictCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionConflictCopyWith(WorkoutSessionConflict value, $Res Function(WorkoutSessionConflict) _then) = _$WorkoutSessionConflictCopyWithImpl;
@useResult
$Res call({
 String existingSessionId
});




}
/// @nodoc
class _$WorkoutSessionConflictCopyWithImpl<$Res>
    implements $WorkoutSessionConflictCopyWith<$Res> {
  _$WorkoutSessionConflictCopyWithImpl(this._self, this._then);

  final WorkoutSessionConflict _self;
  final $Res Function(WorkoutSessionConflict) _then;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? existingSessionId = null,}) {
  return _then(WorkoutSessionConflict(
existingSessionId: null == existingSessionId ? _self.existingSessionId : existingSessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WorkoutSessionExerciseDetailLoading implements WorkoutSessionState {
  const WorkoutSessionExerciseDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionExerciseDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutSessionState.exerciseDetailLoading()';
}


}




/// @nodoc


class WorkoutSessionExerciseDetailLoaded implements WorkoutSessionState {
  const WorkoutSessionExerciseDetailLoaded({required this.exercise, required final  List<WorkoutSessionDto> sessions}): _sessions = sessions;
  

 final  ExerciseDto exercise;
 final  List<WorkoutSessionDto> _sessions;
 List<WorkoutSessionDto> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionExerciseDetailLoadedCopyWith<WorkoutSessionExerciseDetailLoaded> get copyWith => _$WorkoutSessionExerciseDetailLoadedCopyWithImpl<WorkoutSessionExerciseDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionExerciseDetailLoaded&&(identical(other.exercise, exercise) || other.exercise == exercise)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}


@override
int get hashCode => Object.hash(runtimeType,exercise,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'WorkoutSessionState.exerciseDetailLoaded(exercise: $exercise, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionExerciseDetailLoadedCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionExerciseDetailLoadedCopyWith(WorkoutSessionExerciseDetailLoaded value, $Res Function(WorkoutSessionExerciseDetailLoaded) _then) = _$WorkoutSessionExerciseDetailLoadedCopyWithImpl;
@useResult
$Res call({
 ExerciseDto exercise, List<WorkoutSessionDto> sessions
});


$ExerciseDtoCopyWith<$Res> get exercise;

}
/// @nodoc
class _$WorkoutSessionExerciseDetailLoadedCopyWithImpl<$Res>
    implements $WorkoutSessionExerciseDetailLoadedCopyWith<$Res> {
  _$WorkoutSessionExerciseDetailLoadedCopyWithImpl(this._self, this._then);

  final WorkoutSessionExerciseDetailLoaded _self;
  final $Res Function(WorkoutSessionExerciseDetailLoaded) _then;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exercise = null,Object? sessions = null,}) {
  return _then(WorkoutSessionExerciseDetailLoaded(
exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as ExerciseDto,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionDto>,
  ));
}

/// Create a copy of WorkoutSessionState
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


class WorkoutSessionExerciseDetailError implements WorkoutSessionState {
  const WorkoutSessionExerciseDetailError(this.message);
  

 final  String message;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionExerciseDetailErrorCopyWith<WorkoutSessionExerciseDetailError> get copyWith => _$WorkoutSessionExerciseDetailErrorCopyWithImpl<WorkoutSessionExerciseDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionExerciseDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WorkoutSessionState.exerciseDetailError(message: $message)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionExerciseDetailErrorCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionExerciseDetailErrorCopyWith(WorkoutSessionExerciseDetailError value, $Res Function(WorkoutSessionExerciseDetailError) _then) = _$WorkoutSessionExerciseDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WorkoutSessionExerciseDetailErrorCopyWithImpl<$Res>
    implements $WorkoutSessionExerciseDetailErrorCopyWith<$Res> {
  _$WorkoutSessionExerciseDetailErrorCopyWithImpl(this._self, this._then);

  final WorkoutSessionExerciseDetailError _self;
  final $Res Function(WorkoutSessionExerciseDetailError) _then;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WorkoutSessionExerciseDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WorkoutSessionActive implements WorkoutSessionState {
  const WorkoutSessionActive({required this.session, final  List<ExerciseLogDto> logs = const <ExerciseLogDto>[], required this.elapsed, this.isPaused = false, this.isMinimized = false, this.restStartedAt, this.restElapsed = Duration.zero, this.startTime, this.restDuration, this.restRemaining, this.showLongSessionWarning = false, this.showRestFinishedToast = false, final  List<Map<String, dynamic>> sessionNewRecords = const <Map<String, dynamic>>[], this.newPrRecord = false}): _logs = logs,_sessionNewRecords = sessionNewRecords;
  

 final  WorkoutSessionDto session;
 final  List<ExerciseLogDto> _logs;
@JsonKey() List<ExerciseLogDto> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

 final  Duration elapsed;
@JsonKey() final  bool isPaused;
@JsonKey() final  bool isMinimized;
 final  DateTime? restStartedAt;
@JsonKey() final  Duration restElapsed;
 final  DateTime? startTime;
 final  int? restDuration;
 final  int? restRemaining;
@JsonKey() final  bool showLongSessionWarning;
@JsonKey() final  bool showRestFinishedToast;
 final  List<Map<String, dynamic>> _sessionNewRecords;
@JsonKey() List<Map<String, dynamic>> get sessionNewRecords {
  if (_sessionNewRecords is EqualUnmodifiableListView) return _sessionNewRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessionNewRecords);
}

@JsonKey() final  bool newPrRecord;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionActiveCopyWith<WorkoutSessionActive> get copyWith => _$WorkoutSessionActiveCopyWithImpl<WorkoutSessionActive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionActive&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other._logs, _logs)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.isMinimized, isMinimized) || other.isMinimized == isMinimized)&&(identical(other.restStartedAt, restStartedAt) || other.restStartedAt == restStartedAt)&&(identical(other.restElapsed, restElapsed) || other.restElapsed == restElapsed)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.restDuration, restDuration) || other.restDuration == restDuration)&&(identical(other.restRemaining, restRemaining) || other.restRemaining == restRemaining)&&(identical(other.showLongSessionWarning, showLongSessionWarning) || other.showLongSessionWarning == showLongSessionWarning)&&(identical(other.showRestFinishedToast, showRestFinishedToast) || other.showRestFinishedToast == showRestFinishedToast)&&const DeepCollectionEquality().equals(other._sessionNewRecords, _sessionNewRecords)&&(identical(other.newPrRecord, newPrRecord) || other.newPrRecord == newPrRecord));
}


@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_logs),elapsed,isPaused,isMinimized,restStartedAt,restElapsed,startTime,restDuration,restRemaining,showLongSessionWarning,showRestFinishedToast,const DeepCollectionEquality().hash(_sessionNewRecords),newPrRecord);

@override
String toString() {
  return 'WorkoutSessionState.active(session: $session, logs: $logs, elapsed: $elapsed, isPaused: $isPaused, isMinimized: $isMinimized, restStartedAt: $restStartedAt, restElapsed: $restElapsed, startTime: $startTime, restDuration: $restDuration, restRemaining: $restRemaining, showLongSessionWarning: $showLongSessionWarning, showRestFinishedToast: $showRestFinishedToast, sessionNewRecords: $sessionNewRecords, newPrRecord: $newPrRecord)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionActiveCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionActiveCopyWith(WorkoutSessionActive value, $Res Function(WorkoutSessionActive) _then) = _$WorkoutSessionActiveCopyWithImpl;
@useResult
$Res call({
 WorkoutSessionDto session, List<ExerciseLogDto> logs, Duration elapsed, bool isPaused, bool isMinimized, DateTime? restStartedAt, Duration restElapsed, DateTime? startTime, int? restDuration, int? restRemaining, bool showLongSessionWarning, bool showRestFinishedToast, List<Map<String, dynamic>> sessionNewRecords, bool newPrRecord
});


$WorkoutSessionDtoCopyWith<$Res> get session;

}
/// @nodoc
class _$WorkoutSessionActiveCopyWithImpl<$Res>
    implements $WorkoutSessionActiveCopyWith<$Res> {
  _$WorkoutSessionActiveCopyWithImpl(this._self, this._then);

  final WorkoutSessionActive _self;
  final $Res Function(WorkoutSessionActive) _then;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? logs = null,Object? elapsed = null,Object? isPaused = null,Object? isMinimized = null,Object? restStartedAt = freezed,Object? restElapsed = null,Object? startTime = freezed,Object? restDuration = freezed,Object? restRemaining = freezed,Object? showLongSessionWarning = null,Object? showRestFinishedToast = null,Object? sessionNewRecords = null,Object? newPrRecord = null,}) {
  return _then(WorkoutSessionActive(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogDto>,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,isMinimized: null == isMinimized ? _self.isMinimized : isMinimized // ignore: cast_nullable_to_non_nullable
as bool,restStartedAt: freezed == restStartedAt ? _self.restStartedAt : restStartedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,restElapsed: null == restElapsed ? _self.restElapsed : restElapsed // ignore: cast_nullable_to_non_nullable
as Duration,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,restDuration: freezed == restDuration ? _self.restDuration : restDuration // ignore: cast_nullable_to_non_nullable
as int?,restRemaining: freezed == restRemaining ? _self.restRemaining : restRemaining // ignore: cast_nullable_to_non_nullable
as int?,showLongSessionWarning: null == showLongSessionWarning ? _self.showLongSessionWarning : showLongSessionWarning // ignore: cast_nullable_to_non_nullable
as bool,showRestFinishedToast: null == showRestFinishedToast ? _self.showRestFinishedToast : showRestFinishedToast // ignore: cast_nullable_to_non_nullable
as bool,sessionNewRecords: null == sessionNewRecords ? _self._sessionNewRecords : sessionNewRecords // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,newPrRecord: null == newPrRecord ? _self.newPrRecord : newPrRecord // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionDtoCopyWith<$Res> get session {
  
  return $WorkoutSessionDtoCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class WorkoutSessionCompleted implements WorkoutSessionState {
  const WorkoutSessionCompleted({required this.session, required this.totalDuration, final  List<ExerciseLogDto> logs = const <ExerciseLogDto>[], final  List<Map<String, dynamic>> newRecords = const <Map<String, dynamic>>[], this.showPrToast = false}): _logs = logs,_newRecords = newRecords;
  

 final  WorkoutSessionDto session;
 final  Duration totalDuration;
 final  List<ExerciseLogDto> _logs;
@JsonKey() List<ExerciseLogDto> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

 final  List<Map<String, dynamic>> _newRecords;
@JsonKey() List<Map<String, dynamic>> get newRecords {
  if (_newRecords is EqualUnmodifiableListView) return _newRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newRecords);
}

@JsonKey() final  bool showPrToast;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionCompletedCopyWith<WorkoutSessionCompleted> get copyWith => _$WorkoutSessionCompletedCopyWithImpl<WorkoutSessionCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionCompleted&&(identical(other.session, session) || other.session == session)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&const DeepCollectionEquality().equals(other._logs, _logs)&&const DeepCollectionEquality().equals(other._newRecords, _newRecords)&&(identical(other.showPrToast, showPrToast) || other.showPrToast == showPrToast));
}


@override
int get hashCode => Object.hash(runtimeType,session,totalDuration,const DeepCollectionEquality().hash(_logs),const DeepCollectionEquality().hash(_newRecords),showPrToast);

@override
String toString() {
  return 'WorkoutSessionState.completed(session: $session, totalDuration: $totalDuration, logs: $logs, newRecords: $newRecords, showPrToast: $showPrToast)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionCompletedCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionCompletedCopyWith(WorkoutSessionCompleted value, $Res Function(WorkoutSessionCompleted) _then) = _$WorkoutSessionCompletedCopyWithImpl;
@useResult
$Res call({
 WorkoutSessionDto session, Duration totalDuration, List<ExerciseLogDto> logs, List<Map<String, dynamic>> newRecords, bool showPrToast
});


$WorkoutSessionDtoCopyWith<$Res> get session;

}
/// @nodoc
class _$WorkoutSessionCompletedCopyWithImpl<$Res>
    implements $WorkoutSessionCompletedCopyWith<$Res> {
  _$WorkoutSessionCompletedCopyWithImpl(this._self, this._then);

  final WorkoutSessionCompleted _self;
  final $Res Function(WorkoutSessionCompleted) _then;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? totalDuration = null,Object? logs = null,Object? newRecords = null,Object? showPrToast = null,}) {
  return _then(WorkoutSessionCompleted(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogDto>,newRecords: null == newRecords ? _self._newRecords : newRecords // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,showPrToast: null == showPrToast ? _self.showPrToast : showPrToast // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionDtoCopyWith<$Res> get session {
  
  return $WorkoutSessionDtoCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

/// @nodoc


class WorkoutSessionError implements WorkoutSessionState {
  const WorkoutSessionError(this.message);
  

 final  String message;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionErrorCopyWith<WorkoutSessionError> get copyWith => _$WorkoutSessionErrorCopyWithImpl<WorkoutSessionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WorkoutSessionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionErrorCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionErrorCopyWith(WorkoutSessionError value, $Res Function(WorkoutSessionError) _then) = _$WorkoutSessionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WorkoutSessionErrorCopyWithImpl<$Res>
    implements $WorkoutSessionErrorCopyWith<$Res> {
  _$WorkoutSessionErrorCopyWithImpl(this._self, this._then);

  final WorkoutSessionError _self;
  final $Res Function(WorkoutSessionError) _then;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WorkoutSessionError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
