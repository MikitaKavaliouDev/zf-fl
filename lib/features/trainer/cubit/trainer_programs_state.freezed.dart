// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_programs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerProgramsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProgramsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerProgramsState()';
}


}

/// @nodoc
class $TrainerProgramsStateCopyWith<$Res>  {
$TrainerProgramsStateCopyWith(TrainerProgramsState _, $Res Function(TrainerProgramsState) __);
}


/// Adds pattern-matching-related methods to [TrainerProgramsState].
extension TrainerProgramsStatePatterns on TrainerProgramsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerProgramsInitial value)?  initial,TResult Function( TrainerProgramsLoading value)?  loading,TResult Function( TrainerProgramsLoaded value)?  loaded,TResult Function( TrainerProgramsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerProgramsInitial() when initial != null:
return initial(_that);case TrainerProgramsLoading() when loading != null:
return loading(_that);case TrainerProgramsLoaded() when loaded != null:
return loaded(_that);case TrainerProgramsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerProgramsInitial value)  initial,required TResult Function( TrainerProgramsLoading value)  loading,required TResult Function( TrainerProgramsLoaded value)  loaded,required TResult Function( TrainerProgramsError value)  error,}){
final _that = this;
switch (_that) {
case TrainerProgramsInitial():
return initial(_that);case TrainerProgramsLoading():
return loading(_that);case TrainerProgramsLoaded():
return loaded(_that);case TrainerProgramsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerProgramsInitial value)?  initial,TResult? Function( TrainerProgramsLoading value)?  loading,TResult? Function( TrainerProgramsLoaded value)?  loaded,TResult? Function( TrainerProgramsError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerProgramsInitial() when initial != null:
return initial(_that);case TrainerProgramsLoading() when loading != null:
return loading(_that);case TrainerProgramsLoaded() when loaded != null:
return loaded(_that);case TrainerProgramsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerProgramBriefDto> programs,  List<ActiveProgramItemDto> activePrograms,  List<TrainerTemplateSummaryDto> systemTemplates,  List<TrainerTemplateSummaryDto> userTemplates,  ProgramAnalyticsDto? analytics)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerProgramsInitial() when initial != null:
return initial();case TrainerProgramsLoading() when loading != null:
return loading();case TrainerProgramsLoaded() when loaded != null:
return loaded(_that.programs,_that.activePrograms,_that.systemTemplates,_that.userTemplates,_that.analytics);case TrainerProgramsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerProgramBriefDto> programs,  List<ActiveProgramItemDto> activePrograms,  List<TrainerTemplateSummaryDto> systemTemplates,  List<TrainerTemplateSummaryDto> userTemplates,  ProgramAnalyticsDto? analytics)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerProgramsInitial():
return initial();case TrainerProgramsLoading():
return loading();case TrainerProgramsLoaded():
return loaded(_that.programs,_that.activePrograms,_that.systemTemplates,_that.userTemplates,_that.analytics);case TrainerProgramsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerProgramBriefDto> programs,  List<ActiveProgramItemDto> activePrograms,  List<TrainerTemplateSummaryDto> systemTemplates,  List<TrainerTemplateSummaryDto> userTemplates,  ProgramAnalyticsDto? analytics)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerProgramsInitial() when initial != null:
return initial();case TrainerProgramsLoading() when loading != null:
return loading();case TrainerProgramsLoaded() when loaded != null:
return loaded(_that.programs,_that.activePrograms,_that.systemTemplates,_that.userTemplates,_that.analytics);case TrainerProgramsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerProgramsInitial implements TrainerProgramsState {
  const TrainerProgramsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProgramsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerProgramsState.initial()';
}


}




/// @nodoc


class TrainerProgramsLoading implements TrainerProgramsState {
  const TrainerProgramsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProgramsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerProgramsState.loading()';
}


}




/// @nodoc


class TrainerProgramsLoaded implements TrainerProgramsState {
  const TrainerProgramsLoaded({final  List<TrainerProgramBriefDto> programs = const [], final  List<ActiveProgramItemDto> activePrograms = const [], final  List<TrainerTemplateSummaryDto> systemTemplates = const [], final  List<TrainerTemplateSummaryDto> userTemplates = const [], this.analytics}): _programs = programs,_activePrograms = activePrograms,_systemTemplates = systemTemplates,_userTemplates = userTemplates;
  

 final  List<TrainerProgramBriefDto> _programs;
@JsonKey() List<TrainerProgramBriefDto> get programs {
  if (_programs is EqualUnmodifiableListView) return _programs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_programs);
}

 final  List<ActiveProgramItemDto> _activePrograms;
@JsonKey() List<ActiveProgramItemDto> get activePrograms {
  if (_activePrograms is EqualUnmodifiableListView) return _activePrograms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activePrograms);
}

 final  List<TrainerTemplateSummaryDto> _systemTemplates;
@JsonKey() List<TrainerTemplateSummaryDto> get systemTemplates {
  if (_systemTemplates is EqualUnmodifiableListView) return _systemTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_systemTemplates);
}

 final  List<TrainerTemplateSummaryDto> _userTemplates;
@JsonKey() List<TrainerTemplateSummaryDto> get userTemplates {
  if (_userTemplates is EqualUnmodifiableListView) return _userTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userTemplates);
}

 final  ProgramAnalyticsDto? analytics;

/// Create a copy of TrainerProgramsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerProgramsLoadedCopyWith<TrainerProgramsLoaded> get copyWith => _$TrainerProgramsLoadedCopyWithImpl<TrainerProgramsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProgramsLoaded&&const DeepCollectionEquality().equals(other._programs, _programs)&&const DeepCollectionEquality().equals(other._activePrograms, _activePrograms)&&const DeepCollectionEquality().equals(other._systemTemplates, _systemTemplates)&&const DeepCollectionEquality().equals(other._userTemplates, _userTemplates)&&(identical(other.analytics, analytics) || other.analytics == analytics));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_programs),const DeepCollectionEquality().hash(_activePrograms),const DeepCollectionEquality().hash(_systemTemplates),const DeepCollectionEquality().hash(_userTemplates),analytics);

@override
String toString() {
  return 'TrainerProgramsState.loaded(programs: $programs, activePrograms: $activePrograms, systemTemplates: $systemTemplates, userTemplates: $userTemplates, analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class $TrainerProgramsLoadedCopyWith<$Res> implements $TrainerProgramsStateCopyWith<$Res> {
  factory $TrainerProgramsLoadedCopyWith(TrainerProgramsLoaded value, $Res Function(TrainerProgramsLoaded) _then) = _$TrainerProgramsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerProgramBriefDto> programs, List<ActiveProgramItemDto> activePrograms, List<TrainerTemplateSummaryDto> systemTemplates, List<TrainerTemplateSummaryDto> userTemplates, ProgramAnalyticsDto? analytics
});


$ProgramAnalyticsDtoCopyWith<$Res>? get analytics;

}
/// @nodoc
class _$TrainerProgramsLoadedCopyWithImpl<$Res>
    implements $TrainerProgramsLoadedCopyWith<$Res> {
  _$TrainerProgramsLoadedCopyWithImpl(this._self, this._then);

  final TrainerProgramsLoaded _self;
  final $Res Function(TrainerProgramsLoaded) _then;

/// Create a copy of TrainerProgramsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? programs = null,Object? activePrograms = null,Object? systemTemplates = null,Object? userTemplates = null,Object? analytics = freezed,}) {
  return _then(TrainerProgramsLoaded(
programs: null == programs ? _self._programs : programs // ignore: cast_nullable_to_non_nullable
as List<TrainerProgramBriefDto>,activePrograms: null == activePrograms ? _self._activePrograms : activePrograms // ignore: cast_nullable_to_non_nullable
as List<ActiveProgramItemDto>,systemTemplates: null == systemTemplates ? _self._systemTemplates : systemTemplates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,userTemplates: null == userTemplates ? _self._userTemplates : userTemplates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as ProgramAnalyticsDto?,
  ));
}

/// Create a copy of TrainerProgramsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgramAnalyticsDtoCopyWith<$Res>? get analytics {
    if (_self.analytics == null) {
    return null;
  }

  return $ProgramAnalyticsDtoCopyWith<$Res>(_self.analytics!, (value) {
    return _then(_self.copyWith(analytics: value));
  });
}
}

/// @nodoc


class TrainerProgramsError implements TrainerProgramsState {
  const TrainerProgramsError(this.message);
  

 final  String message;

/// Create a copy of TrainerProgramsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerProgramsErrorCopyWith<TrainerProgramsError> get copyWith => _$TrainerProgramsErrorCopyWithImpl<TrainerProgramsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProgramsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerProgramsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerProgramsErrorCopyWith<$Res> implements $TrainerProgramsStateCopyWith<$Res> {
  factory $TrainerProgramsErrorCopyWith(TrainerProgramsError value, $Res Function(TrainerProgramsError) _then) = _$TrainerProgramsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerProgramsErrorCopyWithImpl<$Res>
    implements $TrainerProgramsErrorCopyWith<$Res> {
  _$TrainerProgramsErrorCopyWithImpl(this._self, this._then);

  final TrainerProgramsError _self;
  final $Res Function(TrainerProgramsError) _then;

/// Create a copy of TrainerProgramsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerProgramsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
