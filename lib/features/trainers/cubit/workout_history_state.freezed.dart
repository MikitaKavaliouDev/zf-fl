// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutHistoryState()';
}


}

/// @nodoc
class $WorkoutHistoryStateCopyWith<$Res>  {
$WorkoutHistoryStateCopyWith(WorkoutHistoryState _, $Res Function(WorkoutHistoryState) __);
}


/// Adds pattern-matching-related methods to [WorkoutHistoryState].
extension WorkoutHistoryStatePatterns on WorkoutHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkoutHistoryInitial value)?  initial,TResult Function( WorkoutHistoryLoading value)?  loading,TResult Function( WorkoutHistoryLoaded value)?  loaded,TResult Function( WorkoutHistoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkoutHistoryInitial() when initial != null:
return initial(_that);case WorkoutHistoryLoading() when loading != null:
return loading(_that);case WorkoutHistoryLoaded() when loaded != null:
return loaded(_that);case WorkoutHistoryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkoutHistoryInitial value)  initial,required TResult Function( WorkoutHistoryLoading value)  loading,required TResult Function( WorkoutHistoryLoaded value)  loaded,required TResult Function( WorkoutHistoryError value)  error,}){
final _that = this;
switch (_that) {
case WorkoutHistoryInitial():
return initial(_that);case WorkoutHistoryLoading():
return loading(_that);case WorkoutHistoryLoaded():
return loaded(_that);case WorkoutHistoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkoutHistoryInitial value)?  initial,TResult? Function( WorkoutHistoryLoading value)?  loading,TResult? Function( WorkoutHistoryLoaded value)?  loaded,TResult? Function( WorkoutHistoryError value)?  error,}){
final _that = this;
switch (_that) {
case WorkoutHistoryInitial() when initial != null:
return initial(_that);case WorkoutHistoryLoading() when loading != null:
return loading(_that);case WorkoutHistoryLoaded() when loaded != null:
return loaded(_that);case WorkoutHistoryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<WorkoutSessionDto> sessions,  String? nextCursor,  bool hasMore,  bool isLoadingMore,  bool isRefreshing)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkoutHistoryInitial() when initial != null:
return initial();case WorkoutHistoryLoading() when loading != null:
return loading();case WorkoutHistoryLoaded() when loaded != null:
return loaded(_that.sessions,_that.nextCursor,_that.hasMore,_that.isLoadingMore,_that.isRefreshing);case WorkoutHistoryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<WorkoutSessionDto> sessions,  String? nextCursor,  bool hasMore,  bool isLoadingMore,  bool isRefreshing)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case WorkoutHistoryInitial():
return initial();case WorkoutHistoryLoading():
return loading();case WorkoutHistoryLoaded():
return loaded(_that.sessions,_that.nextCursor,_that.hasMore,_that.isLoadingMore,_that.isRefreshing);case WorkoutHistoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<WorkoutSessionDto> sessions,  String? nextCursor,  bool hasMore,  bool isLoadingMore,  bool isRefreshing)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case WorkoutHistoryInitial() when initial != null:
return initial();case WorkoutHistoryLoading() when loading != null:
return loading();case WorkoutHistoryLoaded() when loaded != null:
return loaded(_that.sessions,_that.nextCursor,_that.hasMore,_that.isLoadingMore,_that.isRefreshing);case WorkoutHistoryError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class WorkoutHistoryInitial implements WorkoutHistoryState {
  const WorkoutHistoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutHistoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutHistoryState.initial()';
}


}




/// @nodoc


class WorkoutHistoryLoading implements WorkoutHistoryState {
  const WorkoutHistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutHistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutHistoryState.loading()';
}


}




/// @nodoc


class WorkoutHistoryLoaded implements WorkoutHistoryState {
  const WorkoutHistoryLoaded({required final  List<WorkoutSessionDto> sessions, this.nextCursor, this.hasMore = false, this.isLoadingMore = false, this.isRefreshing = false}): _sessions = sessions;
  

 final  List<WorkoutSessionDto> _sessions;
 List<WorkoutSessionDto> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

 final  String? nextCursor;
@JsonKey() final  bool hasMore;
@JsonKey() final  bool isLoadingMore;
@JsonKey() final  bool isRefreshing;

/// Create a copy of WorkoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutHistoryLoadedCopyWith<WorkoutHistoryLoaded> get copyWith => _$WorkoutHistoryLoadedCopyWithImpl<WorkoutHistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutHistoryLoaded&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sessions),nextCursor,hasMore,isLoadingMore,isRefreshing);

@override
String toString() {
  return 'WorkoutHistoryState.loaded(sessions: $sessions, nextCursor: $nextCursor, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isRefreshing: $isRefreshing)';
}


}

/// @nodoc
abstract mixin class $WorkoutHistoryLoadedCopyWith<$Res> implements $WorkoutHistoryStateCopyWith<$Res> {
  factory $WorkoutHistoryLoadedCopyWith(WorkoutHistoryLoaded value, $Res Function(WorkoutHistoryLoaded) _then) = _$WorkoutHistoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<WorkoutSessionDto> sessions, String? nextCursor, bool hasMore, bool isLoadingMore, bool isRefreshing
});




}
/// @nodoc
class _$WorkoutHistoryLoadedCopyWithImpl<$Res>
    implements $WorkoutHistoryLoadedCopyWith<$Res> {
  _$WorkoutHistoryLoadedCopyWithImpl(this._self, this._then);

  final WorkoutHistoryLoaded _self;
  final $Res Function(WorkoutHistoryLoaded) _then;

/// Create a copy of WorkoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessions = null,Object? nextCursor = freezed,Object? hasMore = null,Object? isLoadingMore = null,Object? isRefreshing = null,}) {
  return _then(WorkoutHistoryLoaded(
sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<WorkoutSessionDto>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class WorkoutHistoryError implements WorkoutHistoryState {
  const WorkoutHistoryError(this.message);
  

 final  String message;

/// Create a copy of WorkoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutHistoryErrorCopyWith<WorkoutHistoryError> get copyWith => _$WorkoutHistoryErrorCopyWithImpl<WorkoutHistoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutHistoryError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'WorkoutHistoryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $WorkoutHistoryErrorCopyWith<$Res> implements $WorkoutHistoryStateCopyWith<$Res> {
  factory $WorkoutHistoryErrorCopyWith(WorkoutHistoryError value, $Res Function(WorkoutHistoryError) _then) = _$WorkoutHistoryErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$WorkoutHistoryErrorCopyWithImpl<$Res>
    implements $WorkoutHistoryErrorCopyWith<$Res> {
  _$WorkoutHistoryErrorCopyWithImpl(this._self, this._then);

  final WorkoutHistoryError _self;
  final $Res Function(WorkoutHistoryError) _then;

/// Create a copy of WorkoutHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(WorkoutHistoryError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
