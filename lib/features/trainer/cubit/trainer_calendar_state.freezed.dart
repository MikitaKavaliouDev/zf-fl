// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_calendar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerCalendarState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCalendarState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCalendarState()';
}


}

/// @nodoc
class $TrainerCalendarStateCopyWith<$Res>  {
$TrainerCalendarStateCopyWith(TrainerCalendarState _, $Res Function(TrainerCalendarState) __);
}


/// Adds pattern-matching-related methods to [TrainerCalendarState].
extension TrainerCalendarStatePatterns on TrainerCalendarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerCalendarInitial value)?  initial,TResult Function( TrainerCalendarLoading value)?  loading,TResult Function( TrainerCalendarLoaded value)?  loaded,TResult Function( TrainerCalendarError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerCalendarInitial() when initial != null:
return initial(_that);case TrainerCalendarLoading() when loading != null:
return loading(_that);case TrainerCalendarLoaded() when loaded != null:
return loaded(_that);case TrainerCalendarError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerCalendarInitial value)  initial,required TResult Function( TrainerCalendarLoading value)  loading,required TResult Function( TrainerCalendarLoaded value)  loaded,required TResult Function( TrainerCalendarError value)  error,}){
final _that = this;
switch (_that) {
case TrainerCalendarInitial():
return initial(_that);case TrainerCalendarLoading():
return loading(_that);case TrainerCalendarLoaded():
return loaded(_that);case TrainerCalendarError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerCalendarInitial value)?  initial,TResult? Function( TrainerCalendarLoading value)?  loading,TResult? Function( TrainerCalendarLoaded value)?  loaded,TResult? Function( TrainerCalendarError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerCalendarInitial() when initial != null:
return initial(_that);case TrainerCalendarLoading() when loading != null:
return loading(_that);case TrainerCalendarLoaded() when loaded != null:
return loaded(_that);case TrainerCalendarError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( DateTime focusedDate,  CalendarViewMode viewMode,  List<TrainerCalendarEventDto> events)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerCalendarInitial() when initial != null:
return initial();case TrainerCalendarLoading() when loading != null:
return loading();case TrainerCalendarLoaded() when loaded != null:
return loaded(_that.focusedDate,_that.viewMode,_that.events);case TrainerCalendarError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( DateTime focusedDate,  CalendarViewMode viewMode,  List<TrainerCalendarEventDto> events)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerCalendarInitial():
return initial();case TrainerCalendarLoading():
return loading();case TrainerCalendarLoaded():
return loaded(_that.focusedDate,_that.viewMode,_that.events);case TrainerCalendarError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( DateTime focusedDate,  CalendarViewMode viewMode,  List<TrainerCalendarEventDto> events)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerCalendarInitial() when initial != null:
return initial();case TrainerCalendarLoading() when loading != null:
return loading();case TrainerCalendarLoaded() when loaded != null:
return loaded(_that.focusedDate,_that.viewMode,_that.events);case TrainerCalendarError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerCalendarInitial implements TrainerCalendarState {
  const TrainerCalendarInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCalendarInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCalendarState.initial()';
}


}




/// @nodoc


class TrainerCalendarLoading implements TrainerCalendarState {
  const TrainerCalendarLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCalendarLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCalendarState.loading()';
}


}




/// @nodoc


class TrainerCalendarLoaded implements TrainerCalendarState {
  const TrainerCalendarLoaded({required this.focusedDate, this.viewMode = CalendarViewMode.agenda, final  List<TrainerCalendarEventDto> events = const []}): _events = events;
  

 final  DateTime focusedDate;
@JsonKey() final  CalendarViewMode viewMode;
 final  List<TrainerCalendarEventDto> _events;
@JsonKey() List<TrainerCalendarEventDto> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}


/// Create a copy of TrainerCalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCalendarLoadedCopyWith<TrainerCalendarLoaded> get copyWith => _$TrainerCalendarLoadedCopyWithImpl<TrainerCalendarLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCalendarLoaded&&(identical(other.focusedDate, focusedDate) || other.focusedDate == focusedDate)&&(identical(other.viewMode, viewMode) || other.viewMode == viewMode)&&const DeepCollectionEquality().equals(other._events, _events));
}


@override
int get hashCode => Object.hash(runtimeType,focusedDate,viewMode,const DeepCollectionEquality().hash(_events));

@override
String toString() {
  return 'TrainerCalendarState.loaded(focusedDate: $focusedDate, viewMode: $viewMode, events: $events)';
}


}

/// @nodoc
abstract mixin class $TrainerCalendarLoadedCopyWith<$Res> implements $TrainerCalendarStateCopyWith<$Res> {
  factory $TrainerCalendarLoadedCopyWith(TrainerCalendarLoaded value, $Res Function(TrainerCalendarLoaded) _then) = _$TrainerCalendarLoadedCopyWithImpl;
@useResult
$Res call({
 DateTime focusedDate, CalendarViewMode viewMode, List<TrainerCalendarEventDto> events
});




}
/// @nodoc
class _$TrainerCalendarLoadedCopyWithImpl<$Res>
    implements $TrainerCalendarLoadedCopyWith<$Res> {
  _$TrainerCalendarLoadedCopyWithImpl(this._self, this._then);

  final TrainerCalendarLoaded _self;
  final $Res Function(TrainerCalendarLoaded) _then;

/// Create a copy of TrainerCalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? focusedDate = null,Object? viewMode = null,Object? events = null,}) {
  return _then(TrainerCalendarLoaded(
focusedDate: null == focusedDate ? _self.focusedDate : focusedDate // ignore: cast_nullable_to_non_nullable
as DateTime,viewMode: null == viewMode ? _self.viewMode : viewMode // ignore: cast_nullable_to_non_nullable
as CalendarViewMode,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<TrainerCalendarEventDto>,
  ));
}


}

/// @nodoc


class TrainerCalendarError implements TrainerCalendarState {
  const TrainerCalendarError(this.message);
  

 final  String message;

/// Create a copy of TrainerCalendarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCalendarErrorCopyWith<TrainerCalendarError> get copyWith => _$TrainerCalendarErrorCopyWithImpl<TrainerCalendarError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCalendarError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerCalendarState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerCalendarErrorCopyWith<$Res> implements $TrainerCalendarStateCopyWith<$Res> {
  factory $TrainerCalendarErrorCopyWith(TrainerCalendarError value, $Res Function(TrainerCalendarError) _then) = _$TrainerCalendarErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerCalendarErrorCopyWithImpl<$Res>
    implements $TrainerCalendarErrorCopyWith<$Res> {
  _$TrainerCalendarErrorCopyWithImpl(this._self, this._then);

  final TrainerCalendarError _self;
  final $Res Function(TrainerCalendarError) _then;

/// Create a copy of TrainerCalendarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerCalendarError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
