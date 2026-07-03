// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerDashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDashboardState()';
}


}

/// @nodoc
class $TrainerDashboardStateCopyWith<$Res>  {
$TrainerDashboardStateCopyWith(TrainerDashboardState _, $Res Function(TrainerDashboardState) __);
}


/// Adds pattern-matching-related methods to [TrainerDashboardState].
extension TrainerDashboardStatePatterns on TrainerDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerDashboardInitial value)?  initial,TResult Function( TrainerDashboardLoading value)?  loading,TResult Function( TrainerDashboardLoaded value)?  loaded,TResult Function( TrainerDashboardError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerDashboardInitial() when initial != null:
return initial(_that);case TrainerDashboardLoading() when loading != null:
return loading(_that);case TrainerDashboardLoaded() when loaded != null:
return loaded(_that);case TrainerDashboardError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerDashboardInitial value)  initial,required TResult Function( TrainerDashboardLoading value)  loading,required TResult Function( TrainerDashboardLoaded value)  loaded,required TResult Function( TrainerDashboardError value)  error,}){
final _that = this;
switch (_that) {
case TrainerDashboardInitial():
return initial(_that);case TrainerDashboardLoading():
return loading(_that);case TrainerDashboardLoaded():
return loaded(_that);case TrainerDashboardError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerDashboardInitial value)?  initial,TResult? Function( TrainerDashboardLoading value)?  loading,TResult? Function( TrainerDashboardLoaded value)?  loaded,TResult? Function( TrainerDashboardError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerDashboardInitial() when initial != null:
return initial(_that);case TrainerDashboardLoading() when loading != null:
return loading(_that);case TrainerDashboardLoaded() when loaded != null:
return loaded(_that);case TrainerDashboardError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String greeting,  int activeClientsCount,  int pendingCheckIns,  int pendingBookings,  String revenue,  String revenueTrend,  List<TrainerCalendarEventDto> upcomingSessions)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerDashboardInitial() when initial != null:
return initial();case TrainerDashboardLoading() when loading != null:
return loading();case TrainerDashboardLoaded() when loaded != null:
return loaded(_that.greeting,_that.activeClientsCount,_that.pendingCheckIns,_that.pendingBookings,_that.revenue,_that.revenueTrend,_that.upcomingSessions);case TrainerDashboardError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String greeting,  int activeClientsCount,  int pendingCheckIns,  int pendingBookings,  String revenue,  String revenueTrend,  List<TrainerCalendarEventDto> upcomingSessions)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerDashboardInitial():
return initial();case TrainerDashboardLoading():
return loading();case TrainerDashboardLoaded():
return loaded(_that.greeting,_that.activeClientsCount,_that.pendingCheckIns,_that.pendingBookings,_that.revenue,_that.revenueTrend,_that.upcomingSessions);case TrainerDashboardError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String greeting,  int activeClientsCount,  int pendingCheckIns,  int pendingBookings,  String revenue,  String revenueTrend,  List<TrainerCalendarEventDto> upcomingSessions)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerDashboardInitial() when initial != null:
return initial();case TrainerDashboardLoading() when loading != null:
return loading();case TrainerDashboardLoaded() when loaded != null:
return loaded(_that.greeting,_that.activeClientsCount,_that.pendingCheckIns,_that.pendingBookings,_that.revenue,_that.revenueTrend,_that.upcomingSessions);case TrainerDashboardError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerDashboardInitial implements TrainerDashboardState {
  const TrainerDashboardInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDashboardInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDashboardState.initial()';
}


}




/// @nodoc


class TrainerDashboardLoading implements TrainerDashboardState {
  const TrainerDashboardLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDashboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDashboardState.loading()';
}


}




/// @nodoc


class TrainerDashboardLoaded implements TrainerDashboardState {
  const TrainerDashboardLoaded({required this.greeting, required this.activeClientsCount, required this.pendingCheckIns, required this.pendingBookings, required this.revenue, required this.revenueTrend, final  List<TrainerCalendarEventDto> upcomingSessions = const []}): _upcomingSessions = upcomingSessions;
  

 final  String greeting;
 final  int activeClientsCount;
 final  int pendingCheckIns;
 final  int pendingBookings;
 final  String revenue;
 final  String revenueTrend;
 final  List<TrainerCalendarEventDto> _upcomingSessions;
@JsonKey() List<TrainerCalendarEventDto> get upcomingSessions {
  if (_upcomingSessions is EqualUnmodifiableListView) return _upcomingSessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingSessions);
}


/// Create a copy of TrainerDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDashboardLoadedCopyWith<TrainerDashboardLoaded> get copyWith => _$TrainerDashboardLoadedCopyWithImpl<TrainerDashboardLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDashboardLoaded&&(identical(other.greeting, greeting) || other.greeting == greeting)&&(identical(other.activeClientsCount, activeClientsCount) || other.activeClientsCount == activeClientsCount)&&(identical(other.pendingCheckIns, pendingCheckIns) || other.pendingCheckIns == pendingCheckIns)&&(identical(other.pendingBookings, pendingBookings) || other.pendingBookings == pendingBookings)&&(identical(other.revenue, revenue) || other.revenue == revenue)&&(identical(other.revenueTrend, revenueTrend) || other.revenueTrend == revenueTrend)&&const DeepCollectionEquality().equals(other._upcomingSessions, _upcomingSessions));
}


@override
int get hashCode => Object.hash(runtimeType,greeting,activeClientsCount,pendingCheckIns,pendingBookings,revenue,revenueTrend,const DeepCollectionEquality().hash(_upcomingSessions));

@override
String toString() {
  return 'TrainerDashboardState.loaded(greeting: $greeting, activeClientsCount: $activeClientsCount, pendingCheckIns: $pendingCheckIns, pendingBookings: $pendingBookings, revenue: $revenue, revenueTrend: $revenueTrend, upcomingSessions: $upcomingSessions)';
}


}

/// @nodoc
abstract mixin class $TrainerDashboardLoadedCopyWith<$Res> implements $TrainerDashboardStateCopyWith<$Res> {
  factory $TrainerDashboardLoadedCopyWith(TrainerDashboardLoaded value, $Res Function(TrainerDashboardLoaded) _then) = _$TrainerDashboardLoadedCopyWithImpl;
@useResult
$Res call({
 String greeting, int activeClientsCount, int pendingCheckIns, int pendingBookings, String revenue, String revenueTrend, List<TrainerCalendarEventDto> upcomingSessions
});




}
/// @nodoc
class _$TrainerDashboardLoadedCopyWithImpl<$Res>
    implements $TrainerDashboardLoadedCopyWith<$Res> {
  _$TrainerDashboardLoadedCopyWithImpl(this._self, this._then);

  final TrainerDashboardLoaded _self;
  final $Res Function(TrainerDashboardLoaded) _then;

/// Create a copy of TrainerDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? greeting = null,Object? activeClientsCount = null,Object? pendingCheckIns = null,Object? pendingBookings = null,Object? revenue = null,Object? revenueTrend = null,Object? upcomingSessions = null,}) {
  return _then(TrainerDashboardLoaded(
greeting: null == greeting ? _self.greeting : greeting // ignore: cast_nullable_to_non_nullable
as String,activeClientsCount: null == activeClientsCount ? _self.activeClientsCount : activeClientsCount // ignore: cast_nullable_to_non_nullable
as int,pendingCheckIns: null == pendingCheckIns ? _self.pendingCheckIns : pendingCheckIns // ignore: cast_nullable_to_non_nullable
as int,pendingBookings: null == pendingBookings ? _self.pendingBookings : pendingBookings // ignore: cast_nullable_to_non_nullable
as int,revenue: null == revenue ? _self.revenue : revenue // ignore: cast_nullable_to_non_nullable
as String,revenueTrend: null == revenueTrend ? _self.revenueTrend : revenueTrend // ignore: cast_nullable_to_non_nullable
as String,upcomingSessions: null == upcomingSessions ? _self._upcomingSessions : upcomingSessions // ignore: cast_nullable_to_non_nullable
as List<TrainerCalendarEventDto>,
  ));
}


}

/// @nodoc


class TrainerDashboardError implements TrainerDashboardState {
  const TrainerDashboardError(this.message);
  

 final  String message;

/// Create a copy of TrainerDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDashboardErrorCopyWith<TrainerDashboardError> get copyWith => _$TrainerDashboardErrorCopyWithImpl<TrainerDashboardError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDashboardError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerDashboardState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerDashboardErrorCopyWith<$Res> implements $TrainerDashboardStateCopyWith<$Res> {
  factory $TrainerDashboardErrorCopyWith(TrainerDashboardError value, $Res Function(TrainerDashboardError) _then) = _$TrainerDashboardErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerDashboardErrorCopyWithImpl<$Res>
    implements $TrainerDashboardErrorCopyWith<$Res> {
  _$TrainerDashboardErrorCopyWithImpl(this._self, this._then);

  final TrainerDashboardError _self;
  final $Res Function(TrainerDashboardError) _then;

/// Create a copy of TrainerDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerDashboardError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
