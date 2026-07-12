// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experimental_features_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExperimentalFeaturesState {

 bool get dailyExerciseTargets; bool get voiceFeedbackBeta; bool get personalRoutines; bool get customAppMode;
/// Create a copy of ExperimentalFeaturesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperimentalFeaturesStateCopyWith<ExperimentalFeaturesState> get copyWith => _$ExperimentalFeaturesStateCopyWithImpl<ExperimentalFeaturesState>(this as ExperimentalFeaturesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExperimentalFeaturesState&&(identical(other.dailyExerciseTargets, dailyExerciseTargets) || other.dailyExerciseTargets == dailyExerciseTargets)&&(identical(other.voiceFeedbackBeta, voiceFeedbackBeta) || other.voiceFeedbackBeta == voiceFeedbackBeta)&&(identical(other.personalRoutines, personalRoutines) || other.personalRoutines == personalRoutines)&&(identical(other.customAppMode, customAppMode) || other.customAppMode == customAppMode));
}


@override
int get hashCode => Object.hash(runtimeType,dailyExerciseTargets,voiceFeedbackBeta,personalRoutines,customAppMode);

@override
String toString() {
  return 'ExperimentalFeaturesState(dailyExerciseTargets: $dailyExerciseTargets, voiceFeedbackBeta: $voiceFeedbackBeta, personalRoutines: $personalRoutines, customAppMode: $customAppMode)';
}


}

/// @nodoc
abstract mixin class $ExperimentalFeaturesStateCopyWith<$Res>  {
  factory $ExperimentalFeaturesStateCopyWith(ExperimentalFeaturesState value, $Res Function(ExperimentalFeaturesState) _then) = _$ExperimentalFeaturesStateCopyWithImpl;
@useResult
$Res call({
 bool dailyExerciseTargets, bool voiceFeedbackBeta, bool personalRoutines, bool customAppMode
});




}
/// @nodoc
class _$ExperimentalFeaturesStateCopyWithImpl<$Res>
    implements $ExperimentalFeaturesStateCopyWith<$Res> {
  _$ExperimentalFeaturesStateCopyWithImpl(this._self, this._then);

  final ExperimentalFeaturesState _self;
  final $Res Function(ExperimentalFeaturesState) _then;

/// Create a copy of ExperimentalFeaturesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dailyExerciseTargets = null,Object? voiceFeedbackBeta = null,Object? personalRoutines = null,Object? customAppMode = null,}) {
  return _then(_self.copyWith(
dailyExerciseTargets: null == dailyExerciseTargets ? _self.dailyExerciseTargets : dailyExerciseTargets // ignore: cast_nullable_to_non_nullable
as bool,voiceFeedbackBeta: null == voiceFeedbackBeta ? _self.voiceFeedbackBeta : voiceFeedbackBeta // ignore: cast_nullable_to_non_nullable
as bool,personalRoutines: null == personalRoutines ? _self.personalRoutines : personalRoutines // ignore: cast_nullable_to_non_nullable
as bool,customAppMode: null == customAppMode ? _self.customAppMode : customAppMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ExperimentalFeaturesState].
extension ExperimentalFeaturesStatePatterns on ExperimentalFeaturesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExperimentalFeaturesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExperimentalFeaturesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExperimentalFeaturesState value)  $default,){
final _that = this;
switch (_that) {
case _ExperimentalFeaturesState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExperimentalFeaturesState value)?  $default,){
final _that = this;
switch (_that) {
case _ExperimentalFeaturesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool dailyExerciseTargets,  bool voiceFeedbackBeta,  bool personalRoutines,  bool customAppMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExperimentalFeaturesState() when $default != null:
return $default(_that.dailyExerciseTargets,_that.voiceFeedbackBeta,_that.personalRoutines,_that.customAppMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool dailyExerciseTargets,  bool voiceFeedbackBeta,  bool personalRoutines,  bool customAppMode)  $default,) {final _that = this;
switch (_that) {
case _ExperimentalFeaturesState():
return $default(_that.dailyExerciseTargets,_that.voiceFeedbackBeta,_that.personalRoutines,_that.customAppMode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool dailyExerciseTargets,  bool voiceFeedbackBeta,  bool personalRoutines,  bool customAppMode)?  $default,) {final _that = this;
switch (_that) {
case _ExperimentalFeaturesState() when $default != null:
return $default(_that.dailyExerciseTargets,_that.voiceFeedbackBeta,_that.personalRoutines,_that.customAppMode);case _:
  return null;

}
}

}

/// @nodoc


class _ExperimentalFeaturesState implements ExperimentalFeaturesState {
  const _ExperimentalFeaturesState({this.dailyExerciseTargets = false, this.voiceFeedbackBeta = false, this.personalRoutines = false, this.customAppMode = false});
  

@override@JsonKey() final  bool dailyExerciseTargets;
@override@JsonKey() final  bool voiceFeedbackBeta;
@override@JsonKey() final  bool personalRoutines;
@override@JsonKey() final  bool customAppMode;

/// Create a copy of ExperimentalFeaturesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperimentalFeaturesStateCopyWith<_ExperimentalFeaturesState> get copyWith => __$ExperimentalFeaturesStateCopyWithImpl<_ExperimentalFeaturesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExperimentalFeaturesState&&(identical(other.dailyExerciseTargets, dailyExerciseTargets) || other.dailyExerciseTargets == dailyExerciseTargets)&&(identical(other.voiceFeedbackBeta, voiceFeedbackBeta) || other.voiceFeedbackBeta == voiceFeedbackBeta)&&(identical(other.personalRoutines, personalRoutines) || other.personalRoutines == personalRoutines)&&(identical(other.customAppMode, customAppMode) || other.customAppMode == customAppMode));
}


@override
int get hashCode => Object.hash(runtimeType,dailyExerciseTargets,voiceFeedbackBeta,personalRoutines,customAppMode);

@override
String toString() {
  return 'ExperimentalFeaturesState(dailyExerciseTargets: $dailyExerciseTargets, voiceFeedbackBeta: $voiceFeedbackBeta, personalRoutines: $personalRoutines, customAppMode: $customAppMode)';
}


}

/// @nodoc
abstract mixin class _$ExperimentalFeaturesStateCopyWith<$Res> implements $ExperimentalFeaturesStateCopyWith<$Res> {
  factory _$ExperimentalFeaturesStateCopyWith(_ExperimentalFeaturesState value, $Res Function(_ExperimentalFeaturesState) _then) = __$ExperimentalFeaturesStateCopyWithImpl;
@override @useResult
$Res call({
 bool dailyExerciseTargets, bool voiceFeedbackBeta, bool personalRoutines, bool customAppMode
});




}
/// @nodoc
class __$ExperimentalFeaturesStateCopyWithImpl<$Res>
    implements _$ExperimentalFeaturesStateCopyWith<$Res> {
  __$ExperimentalFeaturesStateCopyWithImpl(this._self, this._then);

  final _ExperimentalFeaturesState _self;
  final $Res Function(_ExperimentalFeaturesState) _then;

/// Create a copy of ExperimentalFeaturesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dailyExerciseTargets = null,Object? voiceFeedbackBeta = null,Object? personalRoutines = null,Object? customAppMode = null,}) {
  return _then(_ExperimentalFeaturesState(
dailyExerciseTargets: null == dailyExerciseTargets ? _self.dailyExerciseTargets : dailyExerciseTargets // ignore: cast_nullable_to_non_nullable
as bool,voiceFeedbackBeta: null == voiceFeedbackBeta ? _self.voiceFeedbackBeta : voiceFeedbackBeta // ignore: cast_nullable_to_non_nullable
as bool,personalRoutines: null == personalRoutines ? _self.personalRoutines : personalRoutines // ignore: cast_nullable_to_non_nullable
as bool,customAppMode: null == customAppMode ? _self.customAppMode : customAppMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
