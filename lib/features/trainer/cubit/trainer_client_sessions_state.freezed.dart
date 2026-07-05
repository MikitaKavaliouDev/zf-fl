// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_sessions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientSessionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientSessionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientSessionsState()';
}


}

/// @nodoc
class $TrainerClientSessionsStateCopyWith<$Res>  {
$TrainerClientSessionsStateCopyWith(TrainerClientSessionsState _, $Res Function(TrainerClientSessionsState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientSessionsState].
extension TrainerClientSessionsStatePatterns on TrainerClientSessionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientSessionsInitial value)?  initial,TResult Function( TrainerClientSessionsLoading value)?  loading,TResult Function( TrainerClientSessionsLoaded value)?  loaded,TResult Function( TrainerClientSessionsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientSessionsInitial() when initial != null:
return initial(_that);case TrainerClientSessionsLoading() when loading != null:
return loading(_that);case TrainerClientSessionsLoaded() when loaded != null:
return loaded(_that);case TrainerClientSessionsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientSessionsInitial value)  initial,required TResult Function( TrainerClientSessionsLoading value)  loading,required TResult Function( TrainerClientSessionsLoaded value)  loaded,required TResult Function( TrainerClientSessionsError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientSessionsInitial():
return initial(_that);case TrainerClientSessionsLoading():
return loading(_that);case TrainerClientSessionsLoaded():
return loaded(_that);case TrainerClientSessionsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientSessionsInitial value)?  initial,TResult? Function( TrainerClientSessionsLoading value)?  loading,TResult? Function( TrainerClientSessionsLoaded value)?  loaded,TResult? Function( TrainerClientSessionsError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientSessionsInitial() when initial != null:
return initial(_that);case TrainerClientSessionsLoading() when loading != null:
return loading(_that);case TrainerClientSessionsLoaded() when loaded != null:
return loaded(_that);case TrainerClientSessionsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerClientSessionDto> sessions)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientSessionsInitial() when initial != null:
return initial();case TrainerClientSessionsLoading() when loading != null:
return loading();case TrainerClientSessionsLoaded() when loaded != null:
return loaded(_that.sessions);case TrainerClientSessionsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerClientSessionDto> sessions)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientSessionsInitial():
return initial();case TrainerClientSessionsLoading():
return loading();case TrainerClientSessionsLoaded():
return loaded(_that.sessions);case TrainerClientSessionsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerClientSessionDto> sessions)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientSessionsInitial() when initial != null:
return initial();case TrainerClientSessionsLoading() when loading != null:
return loading();case TrainerClientSessionsLoaded() when loaded != null:
return loaded(_that.sessions);case TrainerClientSessionsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientSessionsInitial implements TrainerClientSessionsState {
  const TrainerClientSessionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientSessionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientSessionsState.initial()';
}


}




/// @nodoc


class TrainerClientSessionsLoading implements TrainerClientSessionsState {
  const TrainerClientSessionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientSessionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientSessionsState.loading()';
}


}




/// @nodoc


class TrainerClientSessionsLoaded implements TrainerClientSessionsState {
  const TrainerClientSessionsLoaded(final  List<TrainerClientSessionDto> sessions): _sessions = sessions;
  

 final  List<TrainerClientSessionDto> _sessions;
 List<TrainerClientSessionDto> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of TrainerClientSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientSessionsLoadedCopyWith<TrainerClientSessionsLoaded> get copyWith => _$TrainerClientSessionsLoadedCopyWithImpl<TrainerClientSessionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientSessionsLoaded&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'TrainerClientSessionsState.loaded(sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $TrainerClientSessionsLoadedCopyWith<$Res> implements $TrainerClientSessionsStateCopyWith<$Res> {
  factory $TrainerClientSessionsLoadedCopyWith(TrainerClientSessionsLoaded value, $Res Function(TrainerClientSessionsLoaded) _then) = _$TrainerClientSessionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerClientSessionDto> sessions
});




}
/// @nodoc
class _$TrainerClientSessionsLoadedCopyWithImpl<$Res>
    implements $TrainerClientSessionsLoadedCopyWith<$Res> {
  _$TrainerClientSessionsLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientSessionsLoaded _self;
  final $Res Function(TrainerClientSessionsLoaded) _then;

/// Create a copy of TrainerClientSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessions = null,}) {
  return _then(TrainerClientSessionsLoaded(
null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<TrainerClientSessionDto>,
  ));
}


}

/// @nodoc


class TrainerClientSessionsError implements TrainerClientSessionsState {
  const TrainerClientSessionsError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientSessionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientSessionsErrorCopyWith<TrainerClientSessionsError> get copyWith => _$TrainerClientSessionsErrorCopyWithImpl<TrainerClientSessionsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientSessionsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientSessionsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientSessionsErrorCopyWith<$Res> implements $TrainerClientSessionsStateCopyWith<$Res> {
  factory $TrainerClientSessionsErrorCopyWith(TrainerClientSessionsError value, $Res Function(TrainerClientSessionsError) _then) = _$TrainerClientSessionsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientSessionsErrorCopyWithImpl<$Res>
    implements $TrainerClientSessionsErrorCopyWith<$Res> {
  _$TrainerClientSessionsErrorCopyWithImpl(this._self, this._then);

  final TrainerClientSessionsError _self;
  final $Res Function(TrainerClientSessionsError) _then;

/// Create a copy of TrainerClientSessionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientSessionsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
