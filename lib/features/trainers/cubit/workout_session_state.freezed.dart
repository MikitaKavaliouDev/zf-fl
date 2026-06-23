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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkoutSessionInitial value)?  initial,TResult Function( WorkoutSessionLoading value)?  loading,TResult Function( WorkoutSessionActive value)?  active,TResult Function( WorkoutSessionCompleted value)?  completed,TResult Function( WorkoutSessionError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial(_that);case WorkoutSessionLoading() when loading != null:
return loading(_that);case WorkoutSessionActive() when active != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkoutSessionInitial value)  initial,required TResult Function( WorkoutSessionLoading value)  loading,required TResult Function( WorkoutSessionActive value)  active,required TResult Function( WorkoutSessionCompleted value)  completed,required TResult Function( WorkoutSessionError value)  error,}){
final _that = this;
switch (_that) {
case WorkoutSessionInitial():
return initial(_that);case WorkoutSessionLoading():
return loading(_that);case WorkoutSessionActive():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkoutSessionInitial value)?  initial,TResult? Function( WorkoutSessionLoading value)?  loading,TResult? Function( WorkoutSessionActive value)?  active,TResult? Function( WorkoutSessionCompleted value)?  completed,TResult? Function( WorkoutSessionError value)?  error,}){
final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial(_that);case WorkoutSessionLoading() when loading != null:
return loading(_that);case WorkoutSessionActive() when active != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( WorkoutSessionDto session,  List<ExerciseLogDto> logs,  Duration elapsed,  bool isPaused,  DateTime? restStartedAt,  Duration restElapsed,  DateTime? startTime,  int? restDuration,  int? restRemaining,  bool showLongSessionWarning,  bool newPrRecord)?  active,TResult Function( WorkoutSessionDto session,  Duration totalDuration,  List<ExerciseLogDto> logs)?  completed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial();case WorkoutSessionLoading() when loading != null:
return loading();case WorkoutSessionActive() when active != null:
return active(_that.session,_that.logs,_that.elapsed,_that.isPaused,_that.restStartedAt,_that.restElapsed,_that.startTime,_that.restDuration,_that.restRemaining,_that.showLongSessionWarning,_that.newPrRecord);case WorkoutSessionCompleted() when completed != null:
return completed(_that.session,_that.totalDuration,_that.logs);case WorkoutSessionError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( WorkoutSessionDto session,  List<ExerciseLogDto> logs,  Duration elapsed,  bool isPaused,  DateTime? restStartedAt,  Duration restElapsed,  DateTime? startTime,  int? restDuration,  int? restRemaining,  bool showLongSessionWarning,  bool newPrRecord)  active,required TResult Function( WorkoutSessionDto session,  Duration totalDuration,  List<ExerciseLogDto> logs)  completed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WorkoutSessionInitial():
return initial();case WorkoutSessionLoading():
return loading();case WorkoutSessionActive():
return active(_that.session,_that.logs,_that.elapsed,_that.isPaused,_that.restStartedAt,_that.restElapsed,_that.startTime,_that.restDuration,_that.restRemaining,_that.showLongSessionWarning,_that.newPrRecord);case WorkoutSessionCompleted():
return completed(_that.session,_that.totalDuration,_that.logs);case WorkoutSessionError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( WorkoutSessionDto session,  List<ExerciseLogDto> logs,  Duration elapsed,  bool isPaused,  DateTime? restStartedAt,  Duration restElapsed,  DateTime? startTime,  int? restDuration,  int? restRemaining,  bool showLongSessionWarning,  bool newPrRecord)?  active,TResult? Function( WorkoutSessionDto session,  Duration totalDuration,  List<ExerciseLogDto> logs)?  completed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WorkoutSessionInitial() when initial != null:
return initial();case WorkoutSessionLoading() when loading != null:
return loading();case WorkoutSessionActive() when active != null:
return active(_that.session,_that.logs,_that.elapsed,_that.isPaused,_that.restStartedAt,_that.restElapsed,_that.startTime,_that.restDuration,_that.restRemaining,_that.showLongSessionWarning,_that.newPrRecord);case WorkoutSessionCompleted() when completed != null:
return completed(_that.session,_that.totalDuration,_that.logs);case WorkoutSessionError() when error != null:
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


class WorkoutSessionActive implements WorkoutSessionState {
  const WorkoutSessionActive({required this.session, final  List<ExerciseLogDto> logs = const <ExerciseLogDto>[], required this.elapsed, this.isPaused = false, this.restStartedAt, this.restElapsed = Duration.zero, this.startTime, this.restDuration, this.restRemaining, this.showLongSessionWarning = false, this.newPrRecord = false}): _logs = logs;
  

 final  WorkoutSessionDto session;
 final  List<ExerciseLogDto> _logs;
@JsonKey() List<ExerciseLogDto> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}

 final  Duration elapsed;
@JsonKey() final  bool isPaused;
 final  DateTime? restStartedAt;
@JsonKey() final  Duration restElapsed;
 final  DateTime? startTime;
 final  int? restDuration;
 final  int? restRemaining;
@JsonKey() final  bool showLongSessionWarning;
@JsonKey() final  bool newPrRecord;

/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionActiveCopyWith<WorkoutSessionActive> get copyWith => _$WorkoutSessionActiveCopyWithImpl<WorkoutSessionActive>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionActive&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other._logs, _logs)&&(identical(other.elapsed, elapsed) || other.elapsed == elapsed)&&(identical(other.isPaused, isPaused) || other.isPaused == isPaused)&&(identical(other.restStartedAt, restStartedAt) || other.restStartedAt == restStartedAt)&&(identical(other.restElapsed, restElapsed) || other.restElapsed == restElapsed)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.restDuration, restDuration) || other.restDuration == restDuration)&&(identical(other.restRemaining, restRemaining) || other.restRemaining == restRemaining)&&(identical(other.showLongSessionWarning, showLongSessionWarning) || other.showLongSessionWarning == showLongSessionWarning)&&(identical(other.newPrRecord, newPrRecord) || other.newPrRecord == newPrRecord));
}


@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_logs),elapsed,isPaused,restStartedAt,restElapsed,startTime,restDuration,restRemaining,showLongSessionWarning,newPrRecord);

@override
String toString() {
  return 'WorkoutSessionState.active(session: $session, logs: $logs, elapsed: $elapsed, isPaused: $isPaused, restStartedAt: $restStartedAt, restElapsed: $restElapsed, startTime: $startTime, restDuration: $restDuration, restRemaining: $restRemaining, showLongSessionWarning: $showLongSessionWarning, newPrRecord: $newPrRecord)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionActiveCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionActiveCopyWith(WorkoutSessionActive value, $Res Function(WorkoutSessionActive) _then) = _$WorkoutSessionActiveCopyWithImpl;
@useResult
$Res call({
 WorkoutSessionDto session, List<ExerciseLogDto> logs, Duration elapsed, bool isPaused, DateTime? restStartedAt, Duration restElapsed, DateTime? startTime, int? restDuration, int? restRemaining, bool showLongSessionWarning, bool newPrRecord
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
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? logs = null,Object? elapsed = null,Object? isPaused = null,Object? restStartedAt = freezed,Object? restElapsed = null,Object? startTime = freezed,Object? restDuration = freezed,Object? restRemaining = freezed,Object? showLongSessionWarning = null,Object? newPrRecord = null,}) {
  return _then(WorkoutSessionActive(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogDto>,elapsed: null == elapsed ? _self.elapsed : elapsed // ignore: cast_nullable_to_non_nullable
as Duration,isPaused: null == isPaused ? _self.isPaused : isPaused // ignore: cast_nullable_to_non_nullable
as bool,restStartedAt: freezed == restStartedAt ? _self.restStartedAt : restStartedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,restElapsed: null == restElapsed ? _self.restElapsed : restElapsed // ignore: cast_nullable_to_non_nullable
as Duration,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,restDuration: freezed == restDuration ? _self.restDuration : restDuration // ignore: cast_nullable_to_non_nullable
as int?,restRemaining: freezed == restRemaining ? _self.restRemaining : restRemaining // ignore: cast_nullable_to_non_nullable
as int?,showLongSessionWarning: null == showLongSessionWarning ? _self.showLongSessionWarning : showLongSessionWarning // ignore: cast_nullable_to_non_nullable
as bool,newPrRecord: null == newPrRecord ? _self.newPrRecord : newPrRecord // ignore: cast_nullable_to_non_nullable
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
  const WorkoutSessionCompleted({required this.session, required this.totalDuration, final  List<ExerciseLogDto> logs = const <ExerciseLogDto>[]}): _logs = logs;
  

 final  WorkoutSessionDto session;
 final  Duration totalDuration;
 final  List<ExerciseLogDto> _logs;
@JsonKey() List<ExerciseLogDto> get logs {
  if (_logs is EqualUnmodifiableListView) return _logs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_logs);
}


/// Create a copy of WorkoutSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionCompletedCopyWith<WorkoutSessionCompleted> get copyWith => _$WorkoutSessionCompletedCopyWithImpl<WorkoutSessionCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionCompleted&&(identical(other.session, session) || other.session == session)&&(identical(other.totalDuration, totalDuration) || other.totalDuration == totalDuration)&&const DeepCollectionEquality().equals(other._logs, _logs));
}


@override
int get hashCode => Object.hash(runtimeType,session,totalDuration,const DeepCollectionEquality().hash(_logs));

@override
String toString() {
  return 'WorkoutSessionState.completed(session: $session, totalDuration: $totalDuration, logs: $logs)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionCompletedCopyWith<$Res> implements $WorkoutSessionStateCopyWith<$Res> {
  factory $WorkoutSessionCompletedCopyWith(WorkoutSessionCompleted value, $Res Function(WorkoutSessionCompleted) _then) = _$WorkoutSessionCompletedCopyWithImpl;
@useResult
$Res call({
 WorkoutSessionDto session, Duration totalDuration, List<ExerciseLogDto> logs
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
@pragma('vm:prefer-inline') $Res call({Object? session = null,Object? totalDuration = null,Object? logs = null,}) {
  return _then(WorkoutSessionCompleted(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto,totalDuration: null == totalDuration ? _self.totalDuration : totalDuration // ignore: cast_nullable_to_non_nullable
as Duration,logs: null == logs ? _self._logs : logs // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogDto>,
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
