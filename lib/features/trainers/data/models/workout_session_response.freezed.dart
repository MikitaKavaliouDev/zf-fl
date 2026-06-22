// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StartSessionResponse {

 WorkoutSessionDto get session;
/// Create a copy of StartSessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartSessionResponseCopyWith<StartSessionResponse> get copyWith => _$StartSessionResponseCopyWithImpl<StartSessionResponse>(this as StartSessionResponse, _$identity);

  /// Serializes this StartSessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartSessionResponse&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'StartSessionResponse(session: $session)';
}


}

/// @nodoc
abstract mixin class $StartSessionResponseCopyWith<$Res>  {
  factory $StartSessionResponseCopyWith(StartSessionResponse value, $Res Function(StartSessionResponse) _then) = _$StartSessionResponseCopyWithImpl;
@useResult
$Res call({
 WorkoutSessionDto session
});


$WorkoutSessionDtoCopyWith<$Res> get session;

}
/// @nodoc
class _$StartSessionResponseCopyWithImpl<$Res>
    implements $StartSessionResponseCopyWith<$Res> {
  _$StartSessionResponseCopyWithImpl(this._self, this._then);

  final StartSessionResponse _self;
  final $Res Function(StartSessionResponse) _then;

/// Create a copy of StartSessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto,
  ));
}
/// Create a copy of StartSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionDtoCopyWith<$Res> get session {
  
  return $WorkoutSessionDtoCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [StartSessionResponse].
extension StartSessionResponsePatterns on StartSessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartSessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartSessionResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartSessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _StartSessionResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartSessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StartSessionResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkoutSessionDto session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartSessionResponse() when $default != null:
return $default(_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkoutSessionDto session)  $default,) {final _that = this;
switch (_that) {
case _StartSessionResponse():
return $default(_that.session);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkoutSessionDto session)?  $default,) {final _that = this;
switch (_that) {
case _StartSessionResponse() when $default != null:
return $default(_that.session);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartSessionResponse implements StartSessionResponse {
  const _StartSessionResponse({required this.session});
  factory _StartSessionResponse.fromJson(Map<String, dynamic> json) => _$StartSessionResponseFromJson(json);

@override final  WorkoutSessionDto session;

/// Create a copy of StartSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartSessionResponseCopyWith<_StartSessionResponse> get copyWith => __$StartSessionResponseCopyWithImpl<_StartSessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartSessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartSessionResponse&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'StartSessionResponse(session: $session)';
}


}

/// @nodoc
abstract mixin class _$StartSessionResponseCopyWith<$Res> implements $StartSessionResponseCopyWith<$Res> {
  factory _$StartSessionResponseCopyWith(_StartSessionResponse value, $Res Function(_StartSessionResponse) _then) = __$StartSessionResponseCopyWithImpl;
@override @useResult
$Res call({
 WorkoutSessionDto session
});


@override $WorkoutSessionDtoCopyWith<$Res> get session;

}
/// @nodoc
class __$StartSessionResponseCopyWithImpl<$Res>
    implements _$StartSessionResponseCopyWith<$Res> {
  __$StartSessionResponseCopyWithImpl(this._self, this._then);

  final _StartSessionResponse _self;
  final $Res Function(_StartSessionResponse) _then;

/// Create a copy of StartSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(_StartSessionResponse(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto,
  ));
}

/// Create a copy of StartSessionResponse
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
mixin _$LiveSessionResponse {

 WorkoutSessionDto? get session; List<ExerciseLogDto> get exerciseLogs;
/// Create a copy of LiveSessionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveSessionResponseCopyWith<LiveSessionResponse> get copyWith => _$LiveSessionResponseCopyWithImpl<LiveSessionResponse>(this as LiveSessionResponse, _$identity);

  /// Serializes this LiveSessionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveSessionResponse&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other.exerciseLogs, exerciseLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(exerciseLogs));

@override
String toString() {
  return 'LiveSessionResponse(session: $session, exerciseLogs: $exerciseLogs)';
}


}

/// @nodoc
abstract mixin class $LiveSessionResponseCopyWith<$Res>  {
  factory $LiveSessionResponseCopyWith(LiveSessionResponse value, $Res Function(LiveSessionResponse) _then) = _$LiveSessionResponseCopyWithImpl;
@useResult
$Res call({
 WorkoutSessionDto? session, List<ExerciseLogDto> exerciseLogs
});


$WorkoutSessionDtoCopyWith<$Res>? get session;

}
/// @nodoc
class _$LiveSessionResponseCopyWithImpl<$Res>
    implements $LiveSessionResponseCopyWith<$Res> {
  _$LiveSessionResponseCopyWithImpl(this._self, this._then);

  final LiveSessionResponse _self;
  final $Res Function(LiveSessionResponse) _then;

/// Create a copy of LiveSessionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = freezed,Object? exerciseLogs = null,}) {
  return _then(_self.copyWith(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto?,exerciseLogs: null == exerciseLogs ? _self.exerciseLogs : exerciseLogs // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogDto>,
  ));
}
/// Create a copy of LiveSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionDtoCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $WorkoutSessionDtoCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveSessionResponse].
extension LiveSessionResponsePatterns on LiveSessionResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveSessionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveSessionResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveSessionResponse value)  $default,){
final _that = this;
switch (_that) {
case _LiveSessionResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveSessionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LiveSessionResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkoutSessionDto? session,  List<ExerciseLogDto> exerciseLogs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveSessionResponse() when $default != null:
return $default(_that.session,_that.exerciseLogs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkoutSessionDto? session,  List<ExerciseLogDto> exerciseLogs)  $default,) {final _that = this;
switch (_that) {
case _LiveSessionResponse():
return $default(_that.session,_that.exerciseLogs);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkoutSessionDto? session,  List<ExerciseLogDto> exerciseLogs)?  $default,) {final _that = this;
switch (_that) {
case _LiveSessionResponse() when $default != null:
return $default(_that.session,_that.exerciseLogs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveSessionResponse implements LiveSessionResponse {
  const _LiveSessionResponse({this.session, final  List<ExerciseLogDto> exerciseLogs = const []}): _exerciseLogs = exerciseLogs;
  factory _LiveSessionResponse.fromJson(Map<String, dynamic> json) => _$LiveSessionResponseFromJson(json);

@override final  WorkoutSessionDto? session;
 final  List<ExerciseLogDto> _exerciseLogs;
@override@JsonKey() List<ExerciseLogDto> get exerciseLogs {
  if (_exerciseLogs is EqualUnmodifiableListView) return _exerciseLogs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exerciseLogs);
}


/// Create a copy of LiveSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveSessionResponseCopyWith<_LiveSessionResponse> get copyWith => __$LiveSessionResponseCopyWithImpl<_LiveSessionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveSessionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveSessionResponse&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other._exerciseLogs, _exerciseLogs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_exerciseLogs));

@override
String toString() {
  return 'LiveSessionResponse(session: $session, exerciseLogs: $exerciseLogs)';
}


}

/// @nodoc
abstract mixin class _$LiveSessionResponseCopyWith<$Res> implements $LiveSessionResponseCopyWith<$Res> {
  factory _$LiveSessionResponseCopyWith(_LiveSessionResponse value, $Res Function(_LiveSessionResponse) _then) = __$LiveSessionResponseCopyWithImpl;
@override @useResult
$Res call({
 WorkoutSessionDto? session, List<ExerciseLogDto> exerciseLogs
});


@override $WorkoutSessionDtoCopyWith<$Res>? get session;

}
/// @nodoc
class __$LiveSessionResponseCopyWithImpl<$Res>
    implements _$LiveSessionResponseCopyWith<$Res> {
  __$LiveSessionResponseCopyWithImpl(this._self, this._then);

  final _LiveSessionResponse _self;
  final $Res Function(_LiveSessionResponse) _then;

/// Create a copy of LiveSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? exerciseLogs = null,}) {
  return _then(_LiveSessionResponse(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSessionDto?,exerciseLogs: null == exerciseLogs ? _self._exerciseLogs : exerciseLogs // ignore: cast_nullable_to_non_nullable
as List<ExerciseLogDto>,
  ));
}

/// Create a copy of LiveSessionResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkoutSessionDtoCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $WorkoutSessionDtoCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// @nodoc
mixin _$LogExerciseResponse {

 ExerciseLogDto get log; List<dynamic>? get newRecords;
/// Create a copy of LogExerciseResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogExerciseResponseCopyWith<LogExerciseResponse> get copyWith => _$LogExerciseResponseCopyWithImpl<LogExerciseResponse>(this as LogExerciseResponse, _$identity);

  /// Serializes this LogExerciseResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogExerciseResponse&&(identical(other.log, log) || other.log == log)&&const DeepCollectionEquality().equals(other.newRecords, newRecords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,log,const DeepCollectionEquality().hash(newRecords));

@override
String toString() {
  return 'LogExerciseResponse(log: $log, newRecords: $newRecords)';
}


}

/// @nodoc
abstract mixin class $LogExerciseResponseCopyWith<$Res>  {
  factory $LogExerciseResponseCopyWith(LogExerciseResponse value, $Res Function(LogExerciseResponse) _then) = _$LogExerciseResponseCopyWithImpl;
@useResult
$Res call({
 ExerciseLogDto log, List<dynamic>? newRecords
});


$ExerciseLogDtoCopyWith<$Res> get log;

}
/// @nodoc
class _$LogExerciseResponseCopyWithImpl<$Res>
    implements $LogExerciseResponseCopyWith<$Res> {
  _$LogExerciseResponseCopyWithImpl(this._self, this._then);

  final LogExerciseResponse _self;
  final $Res Function(LogExerciseResponse) _then;

/// Create a copy of LogExerciseResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? log = null,Object? newRecords = freezed,}) {
  return _then(_self.copyWith(
log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as ExerciseLogDto,newRecords: freezed == newRecords ? _self.newRecords : newRecords // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}
/// Create a copy of LogExerciseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseLogDtoCopyWith<$Res> get log {
  
  return $ExerciseLogDtoCopyWith<$Res>(_self.log, (value) {
    return _then(_self.copyWith(log: value));
  });
}
}


/// Adds pattern-matching-related methods to [LogExerciseResponse].
extension LogExerciseResponsePatterns on LogExerciseResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogExerciseResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogExerciseResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogExerciseResponse value)  $default,){
final _that = this;
switch (_that) {
case _LogExerciseResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogExerciseResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LogExerciseResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ExerciseLogDto log,  List<dynamic>? newRecords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogExerciseResponse() when $default != null:
return $default(_that.log,_that.newRecords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ExerciseLogDto log,  List<dynamic>? newRecords)  $default,) {final _that = this;
switch (_that) {
case _LogExerciseResponse():
return $default(_that.log,_that.newRecords);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ExerciseLogDto log,  List<dynamic>? newRecords)?  $default,) {final _that = this;
switch (_that) {
case _LogExerciseResponse() when $default != null:
return $default(_that.log,_that.newRecords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LogExerciseResponse implements LogExerciseResponse {
  const _LogExerciseResponse({required this.log, final  List<dynamic>? newRecords}): _newRecords = newRecords;
  factory _LogExerciseResponse.fromJson(Map<String, dynamic> json) => _$LogExerciseResponseFromJson(json);

@override final  ExerciseLogDto log;
 final  List<dynamic>? _newRecords;
@override List<dynamic>? get newRecords {
  final value = _newRecords;
  if (value == null) return null;
  if (_newRecords is EqualUnmodifiableListView) return _newRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LogExerciseResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogExerciseResponseCopyWith<_LogExerciseResponse> get copyWith => __$LogExerciseResponseCopyWithImpl<_LogExerciseResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogExerciseResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogExerciseResponse&&(identical(other.log, log) || other.log == log)&&const DeepCollectionEquality().equals(other._newRecords, _newRecords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,log,const DeepCollectionEquality().hash(_newRecords));

@override
String toString() {
  return 'LogExerciseResponse(log: $log, newRecords: $newRecords)';
}


}

/// @nodoc
abstract mixin class _$LogExerciseResponseCopyWith<$Res> implements $LogExerciseResponseCopyWith<$Res> {
  factory _$LogExerciseResponseCopyWith(_LogExerciseResponse value, $Res Function(_LogExerciseResponse) _then) = __$LogExerciseResponseCopyWithImpl;
@override @useResult
$Res call({
 ExerciseLogDto log, List<dynamic>? newRecords
});


@override $ExerciseLogDtoCopyWith<$Res> get log;

}
/// @nodoc
class __$LogExerciseResponseCopyWithImpl<$Res>
    implements _$LogExerciseResponseCopyWith<$Res> {
  __$LogExerciseResponseCopyWithImpl(this._self, this._then);

  final _LogExerciseResponse _self;
  final $Res Function(_LogExerciseResponse) _then;

/// Create a copy of LogExerciseResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? log = null,Object? newRecords = freezed,}) {
  return _then(_LogExerciseResponse(
log: null == log ? _self.log : log // ignore: cast_nullable_to_non_nullable
as ExerciseLogDto,newRecords: freezed == newRecords ? _self._newRecords : newRecords // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

/// Create a copy of LogExerciseResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExerciseLogDtoCopyWith<$Res> get log {
  
  return $ExerciseLogDtoCopyWith<$Res>(_self.log, (value) {
    return _then(_self.copyWith(log: value));
  });
}
}


/// @nodoc
mixin _$SessionHistoryResponse {

 List<WorkoutSessionDto> get sessions; String? get nextCursor; bool get hasMore;
/// Create a copy of SessionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionHistoryResponseCopyWith<SessionHistoryResponse> get copyWith => _$SessionHistoryResponseCopyWithImpl<SessionHistoryResponse>(this as SessionHistoryResponse, _$identity);

  /// Serializes this SessionHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionHistoryResponse&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sessions),nextCursor,hasMore);

@override
String toString() {
  return 'SessionHistoryResponse(sessions: $sessions, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $SessionHistoryResponseCopyWith<$Res>  {
  factory $SessionHistoryResponseCopyWith(SessionHistoryResponse value, $Res Function(SessionHistoryResponse) _then) = _$SessionHistoryResponseCopyWithImpl;
@useResult
$Res call({
 List<WorkoutSessionDto> sessions, String? nextCursor, bool hasMore
});




}
/// @nodoc
class _$SessionHistoryResponseCopyWithImpl<$Res>
    implements $SessionHistoryResponseCopyWith<$Res> {
  _$SessionHistoryResponseCopyWithImpl(this._self, this._then);

  final SessionHistoryResponse _self;
  final $Res Function(SessionHistoryResponse) _then;

/// Create a copy of SessionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionHistoryResponse].
extension SessionHistoryResponsePatterns on SessionHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionHistoryResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _SessionHistoryResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SessionHistoryResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WorkoutSessionDto> sessions,  String? nextCursor,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionHistoryResponse() when $default != null:
return $default(_that.sessions,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WorkoutSessionDto> sessions,  String? nextCursor,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _SessionHistoryResponse():
return $default(_that.sessions,_that.nextCursor,_that.hasMore);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WorkoutSessionDto> sessions,  String? nextCursor,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _SessionHistoryResponse() when $default != null:
return $default(_that.sessions,_that.nextCursor,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionHistoryResponse implements SessionHistoryResponse {
  const _SessionHistoryResponse({required final  List<WorkoutSessionDto> sessions, this.nextCursor, this.hasMore = false}): _sessions = sessions;
  factory _SessionHistoryResponse.fromJson(Map<String, dynamic> json) => _$SessionHistoryResponseFromJson(json);

 final  List<WorkoutSessionDto> _sessions;
@override List<WorkoutSessionDto> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override final  String? nextCursor;
@override@JsonKey() final  bool hasMore;

/// Create a copy of SessionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionHistoryResponseCopyWith<_SessionHistoryResponse> get copyWith => __$SessionHistoryResponseCopyWithImpl<_SessionHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionHistoryResponse&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions),nextCursor,hasMore);

@override
String toString() {
  return 'SessionHistoryResponse(sessions: $sessions, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$SessionHistoryResponseCopyWith<$Res> implements $SessionHistoryResponseCopyWith<$Res> {
  factory _$SessionHistoryResponseCopyWith(_SessionHistoryResponse value, $Res Function(_SessionHistoryResponse) _then) = __$SessionHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<WorkoutSessionDto> sessions, String? nextCursor, bool hasMore
});




}
/// @nodoc
class __$SessionHistoryResponseCopyWithImpl<$Res>
    implements _$SessionHistoryResponseCopyWith<$Res> {
  __$SessionHistoryResponseCopyWithImpl(this._self, this._then);

  final _SessionHistoryResponse _self;
  final $Res Function(_SessionHistoryResponse) _then;

/// Create a copy of SessionHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_SessionHistoryResponse(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
