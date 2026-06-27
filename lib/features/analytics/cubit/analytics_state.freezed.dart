// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AnalyticsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState()';
}


}

/// @nodoc
class $AnalyticsStateCopyWith<$Res>  {
$AnalyticsStateCopyWith(AnalyticsState _, $Res Function(AnalyticsState) __);
}


/// Adds pattern-matching-related methods to [AnalyticsState].
extension AnalyticsStatePatterns on AnalyticsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AnalyticsInitial value)?  initial,TResult Function( AnalyticsLoading value)?  loading,TResult Function( AnalyticsLoaded value)?  loaded,TResult Function( AnalyticsError value)?  error,TResult Function( AnalyticsMeasurementSaving value)?  measurementSaving,TResult Function( AnalyticsMeasurementSaved value)?  measurementSaved,TResult Function( AnalyticsMeasurementSaveError value)?  measurementSaveError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial(_that);case AnalyticsLoading() when loading != null:
return loading(_that);case AnalyticsLoaded() when loaded != null:
return loaded(_that);case AnalyticsError() when error != null:
return error(_that);case AnalyticsMeasurementSaving() when measurementSaving != null:
return measurementSaving(_that);case AnalyticsMeasurementSaved() when measurementSaved != null:
return measurementSaved(_that);case AnalyticsMeasurementSaveError() when measurementSaveError != null:
return measurementSaveError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AnalyticsInitial value)  initial,required TResult Function( AnalyticsLoading value)  loading,required TResult Function( AnalyticsLoaded value)  loaded,required TResult Function( AnalyticsError value)  error,required TResult Function( AnalyticsMeasurementSaving value)  measurementSaving,required TResult Function( AnalyticsMeasurementSaved value)  measurementSaved,required TResult Function( AnalyticsMeasurementSaveError value)  measurementSaveError,}){
final _that = this;
switch (_that) {
case AnalyticsInitial():
return initial(_that);case AnalyticsLoading():
return loading(_that);case AnalyticsLoaded():
return loaded(_that);case AnalyticsError():
return error(_that);case AnalyticsMeasurementSaving():
return measurementSaving(_that);case AnalyticsMeasurementSaved():
return measurementSaved(_that);case AnalyticsMeasurementSaveError():
return measurementSaveError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AnalyticsInitial value)?  initial,TResult? Function( AnalyticsLoading value)?  loading,TResult? Function( AnalyticsLoaded value)?  loaded,TResult? Function( AnalyticsError value)?  error,TResult? Function( AnalyticsMeasurementSaving value)?  measurementSaving,TResult? Function( AnalyticsMeasurementSaved value)?  measurementSaved,TResult? Function( AnalyticsMeasurementSaveError value)?  measurementSaveError,}){
final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial(_that);case AnalyticsLoading() when loading != null:
return loading(_that);case AnalyticsLoaded() when loaded != null:
return loaded(_that);case AnalyticsError() when error != null:
return error(_that);case AnalyticsMeasurementSaving() when measurementSaving != null:
return measurementSaving(_that);case AnalyticsMeasurementSaved() when measurementSaved != null:
return measurementSaved(_that);case AnalyticsMeasurementSaveError() when measurementSaveError != null:
return measurementSaveError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( AnalyticsResponseDto analytics,  ProgressResponseDto progress,  WidgetConfigDto widgets,  int currentStreak,  int longestStreak,  double volumeTrend,  double consistencyTrend,  double frequencyTrend,  double averageVolumeTrend)?  loaded,TResult Function( String message)?  error,TResult Function()?  measurementSaving,TResult Function()?  measurementSaved,TResult Function( String message)?  measurementSaveError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial();case AnalyticsLoading() when loading != null:
return loading();case AnalyticsLoaded() when loaded != null:
return loaded(_that.analytics,_that.progress,_that.widgets,_that.currentStreak,_that.longestStreak,_that.volumeTrend,_that.consistencyTrend,_that.frequencyTrend,_that.averageVolumeTrend);case AnalyticsError() when error != null:
return error(_that.message);case AnalyticsMeasurementSaving() when measurementSaving != null:
return measurementSaving();case AnalyticsMeasurementSaved() when measurementSaved != null:
return measurementSaved();case AnalyticsMeasurementSaveError() when measurementSaveError != null:
return measurementSaveError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( AnalyticsResponseDto analytics,  ProgressResponseDto progress,  WidgetConfigDto widgets,  int currentStreak,  int longestStreak,  double volumeTrend,  double consistencyTrend,  double frequencyTrend,  double averageVolumeTrend)  loaded,required TResult Function( String message)  error,required TResult Function()  measurementSaving,required TResult Function()  measurementSaved,required TResult Function( String message)  measurementSaveError,}) {final _that = this;
switch (_that) {
case AnalyticsInitial():
return initial();case AnalyticsLoading():
return loading();case AnalyticsLoaded():
return loaded(_that.analytics,_that.progress,_that.widgets,_that.currentStreak,_that.longestStreak,_that.volumeTrend,_that.consistencyTrend,_that.frequencyTrend,_that.averageVolumeTrend);case AnalyticsError():
return error(_that.message);case AnalyticsMeasurementSaving():
return measurementSaving();case AnalyticsMeasurementSaved():
return measurementSaved();case AnalyticsMeasurementSaveError():
return measurementSaveError(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( AnalyticsResponseDto analytics,  ProgressResponseDto progress,  WidgetConfigDto widgets,  int currentStreak,  int longestStreak,  double volumeTrend,  double consistencyTrend,  double frequencyTrend,  double averageVolumeTrend)?  loaded,TResult? Function( String message)?  error,TResult? Function()?  measurementSaving,TResult? Function()?  measurementSaved,TResult? Function( String message)?  measurementSaveError,}) {final _that = this;
switch (_that) {
case AnalyticsInitial() when initial != null:
return initial();case AnalyticsLoading() when loading != null:
return loading();case AnalyticsLoaded() when loaded != null:
return loaded(_that.analytics,_that.progress,_that.widgets,_that.currentStreak,_that.longestStreak,_that.volumeTrend,_that.consistencyTrend,_that.frequencyTrend,_that.averageVolumeTrend);case AnalyticsError() when error != null:
return error(_that.message);case AnalyticsMeasurementSaving() when measurementSaving != null:
return measurementSaving();case AnalyticsMeasurementSaved() when measurementSaved != null:
return measurementSaved();case AnalyticsMeasurementSaveError() when measurementSaveError != null:
return measurementSaveError(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AnalyticsInitial implements AnalyticsState {
  const AnalyticsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState.initial()';
}


}




/// @nodoc


class AnalyticsLoading implements AnalyticsState {
  const AnalyticsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState.loading()';
}


}




/// @nodoc


class AnalyticsLoaded implements AnalyticsState {
  const AnalyticsLoaded({required this.analytics, required this.progress, required this.widgets, this.currentStreak = 0, this.longestStreak = 0, this.volumeTrend = 0.0, this.consistencyTrend = 0.0, this.frequencyTrend = 0.0, this.averageVolumeTrend = 0.0});
  

 final  AnalyticsResponseDto analytics;
 final  ProgressResponseDto progress;
 final  WidgetConfigDto widgets;
@JsonKey() final  int currentStreak;
@JsonKey() final  int longestStreak;
@JsonKey() final  double volumeTrend;
@JsonKey() final  double consistencyTrend;
@JsonKey() final  double frequencyTrend;
@JsonKey() final  double averageVolumeTrend;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsLoadedCopyWith<AnalyticsLoaded> get copyWith => _$AnalyticsLoadedCopyWithImpl<AnalyticsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsLoaded&&(identical(other.analytics, analytics) || other.analytics == analytics)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.widgets, widgets) || other.widgets == widgets)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.longestStreak, longestStreak) || other.longestStreak == longestStreak)&&(identical(other.volumeTrend, volumeTrend) || other.volumeTrend == volumeTrend)&&(identical(other.consistencyTrend, consistencyTrend) || other.consistencyTrend == consistencyTrend)&&(identical(other.frequencyTrend, frequencyTrend) || other.frequencyTrend == frequencyTrend)&&(identical(other.averageVolumeTrend, averageVolumeTrend) || other.averageVolumeTrend == averageVolumeTrend));
}


@override
int get hashCode => Object.hash(runtimeType,analytics,progress,widgets,currentStreak,longestStreak,volumeTrend,consistencyTrend,frequencyTrend,averageVolumeTrend);

@override
String toString() {
  return 'AnalyticsState.loaded(analytics: $analytics, progress: $progress, widgets: $widgets, currentStreak: $currentStreak, longestStreak: $longestStreak, volumeTrend: $volumeTrend, consistencyTrend: $consistencyTrend, frequencyTrend: $frequencyTrend, averageVolumeTrend: $averageVolumeTrend)';
}


}

/// @nodoc
abstract mixin class $AnalyticsLoadedCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsLoadedCopyWith(AnalyticsLoaded value, $Res Function(AnalyticsLoaded) _then) = _$AnalyticsLoadedCopyWithImpl;
@useResult
$Res call({
 AnalyticsResponseDto analytics, ProgressResponseDto progress, WidgetConfigDto widgets, int currentStreak, int longestStreak, double volumeTrend, double consistencyTrend, double frequencyTrend, double averageVolumeTrend
});


$AnalyticsResponseDtoCopyWith<$Res> get analytics;$ProgressResponseDtoCopyWith<$Res> get progress;$WidgetConfigDtoCopyWith<$Res> get widgets;

}
/// @nodoc
class _$AnalyticsLoadedCopyWithImpl<$Res>
    implements $AnalyticsLoadedCopyWith<$Res> {
  _$AnalyticsLoadedCopyWithImpl(this._self, this._then);

  final AnalyticsLoaded _self;
  final $Res Function(AnalyticsLoaded) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? analytics = null,Object? progress = null,Object? widgets = null,Object? currentStreak = null,Object? longestStreak = null,Object? volumeTrend = null,Object? consistencyTrend = null,Object? frequencyTrend = null,Object? averageVolumeTrend = null,}) {
  return _then(AnalyticsLoaded(
analytics: null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as AnalyticsResponseDto,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as ProgressResponseDto,widgets: null == widgets ? _self.widgets : widgets // ignore: cast_nullable_to_non_nullable
as WidgetConfigDto,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,longestStreak: null == longestStreak ? _self.longestStreak : longestStreak // ignore: cast_nullable_to_non_nullable
as int,volumeTrend: null == volumeTrend ? _self.volumeTrend : volumeTrend // ignore: cast_nullable_to_non_nullable
as double,consistencyTrend: null == consistencyTrend ? _self.consistencyTrend : consistencyTrend // ignore: cast_nullable_to_non_nullable
as double,frequencyTrend: null == frequencyTrend ? _self.frequencyTrend : frequencyTrend // ignore: cast_nullable_to_non_nullable
as double,averageVolumeTrend: null == averageVolumeTrend ? _self.averageVolumeTrend : averageVolumeTrend // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AnalyticsResponseDtoCopyWith<$Res> get analytics {
  
  return $AnalyticsResponseDtoCopyWith<$Res>(_self.analytics, (value) {
    return _then(_self.copyWith(analytics: value));
  });
}/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProgressResponseDtoCopyWith<$Res> get progress {
  
  return $ProgressResponseDtoCopyWith<$Res>(_self.progress, (value) {
    return _then(_self.copyWith(progress: value));
  });
}/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WidgetConfigDtoCopyWith<$Res> get widgets {
  
  return $WidgetConfigDtoCopyWith<$Res>(_self.widgets, (value) {
    return _then(_self.copyWith(widgets: value));
  });
}
}

/// @nodoc


class AnalyticsError implements AnalyticsState {
  const AnalyticsError(this.message);
  

 final  String message;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsErrorCopyWith<AnalyticsError> get copyWith => _$AnalyticsErrorCopyWithImpl<AnalyticsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnalyticsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AnalyticsErrorCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsErrorCopyWith(AnalyticsError value, $Res Function(AnalyticsError) _then) = _$AnalyticsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AnalyticsErrorCopyWithImpl<$Res>
    implements $AnalyticsErrorCopyWith<$Res> {
  _$AnalyticsErrorCopyWithImpl(this._self, this._then);

  final AnalyticsError _self;
  final $Res Function(AnalyticsError) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AnalyticsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AnalyticsMeasurementSaving implements AnalyticsState {
  const AnalyticsMeasurementSaving();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsMeasurementSaving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState.measurementSaving()';
}


}




/// @nodoc


class AnalyticsMeasurementSaved implements AnalyticsState {
  const AnalyticsMeasurementSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsMeasurementSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AnalyticsState.measurementSaved()';
}


}




/// @nodoc


class AnalyticsMeasurementSaveError implements AnalyticsState {
  const AnalyticsMeasurementSaveError(this.message);
  

 final  String message;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsMeasurementSaveErrorCopyWith<AnalyticsMeasurementSaveError> get copyWith => _$AnalyticsMeasurementSaveErrorCopyWithImpl<AnalyticsMeasurementSaveError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsMeasurementSaveError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AnalyticsState.measurementSaveError(message: $message)';
}


}

/// @nodoc
abstract mixin class $AnalyticsMeasurementSaveErrorCopyWith<$Res> implements $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsMeasurementSaveErrorCopyWith(AnalyticsMeasurementSaveError value, $Res Function(AnalyticsMeasurementSaveError) _then) = _$AnalyticsMeasurementSaveErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$AnalyticsMeasurementSaveErrorCopyWithImpl<$Res>
    implements $AnalyticsMeasurementSaveErrorCopyWith<$Res> {
  _$AnalyticsMeasurementSaveErrorCopyWithImpl(this._self, this._then);

  final AnalyticsMeasurementSaveError _self;
  final $Res Function(AnalyticsMeasurementSaveError) _then;

/// Create a copy of AnalyticsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(AnalyticsMeasurementSaveError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
