// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_habits_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionHabitsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionHabitsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionHabitsState()';
}


}

/// @nodoc
class $NutritionHabitsStateCopyWith<$Res>  {
$NutritionHabitsStateCopyWith(NutritionHabitsState _, $Res Function(NutritionHabitsState) __);
}


/// Adds pattern-matching-related methods to [NutritionHabitsState].
extension NutritionHabitsStatePatterns on NutritionHabitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NutritionHabitsInitial value)?  initial,TResult Function( NutritionHabitsLoading value)?  loading,TResult Function( NutritionHabitsLoaded value)?  loaded,TResult Function( NutritionHabitsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NutritionHabitsInitial() when initial != null:
return initial(_that);case NutritionHabitsLoading() when loading != null:
return loading(_that);case NutritionHabitsLoaded() when loaded != null:
return loaded(_that);case NutritionHabitsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NutritionHabitsInitial value)  initial,required TResult Function( NutritionHabitsLoading value)  loading,required TResult Function( NutritionHabitsLoaded value)  loaded,required TResult Function( NutritionHabitsError value)  error,}){
final _that = this;
switch (_that) {
case NutritionHabitsInitial():
return initial(_that);case NutritionHabitsLoading():
return loading(_that);case NutritionHabitsLoaded():
return loaded(_that);case NutritionHabitsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NutritionHabitsInitial value)?  initial,TResult? Function( NutritionHabitsLoading value)?  loading,TResult? Function( NutritionHabitsLoaded value)?  loaded,TResult? Function( NutritionHabitsError value)?  error,}){
final _that = this;
switch (_that) {
case NutritionHabitsInitial() when initial != null:
return initial(_that);case NutritionHabitsLoading() when loading != null:
return loading(_that);case NutritionHabitsLoaded() when loaded != null:
return loaded(_that);case NutritionHabitsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( NutritionPlanDto? plan,  List<DailyHabitDto> habits,  DateTime selectedDate)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NutritionHabitsInitial() when initial != null:
return initial();case NutritionHabitsLoading() when loading != null:
return loading();case NutritionHabitsLoaded() when loaded != null:
return loaded(_that.plan,_that.habits,_that.selectedDate);case NutritionHabitsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( NutritionPlanDto? plan,  List<DailyHabitDto> habits,  DateTime selectedDate)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case NutritionHabitsInitial():
return initial();case NutritionHabitsLoading():
return loading();case NutritionHabitsLoaded():
return loaded(_that.plan,_that.habits,_that.selectedDate);case NutritionHabitsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( NutritionPlanDto? plan,  List<DailyHabitDto> habits,  DateTime selectedDate)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case NutritionHabitsInitial() when initial != null:
return initial();case NutritionHabitsLoading() when loading != null:
return loading();case NutritionHabitsLoaded() when loaded != null:
return loaded(_that.plan,_that.habits,_that.selectedDate);case NutritionHabitsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NutritionHabitsInitial implements NutritionHabitsState {
  const NutritionHabitsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionHabitsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionHabitsState.initial()';
}


}




/// @nodoc


class NutritionHabitsLoading implements NutritionHabitsState {
  const NutritionHabitsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionHabitsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NutritionHabitsState.loading()';
}


}




/// @nodoc


class NutritionHabitsLoaded implements NutritionHabitsState {
  const NutritionHabitsLoaded({this.plan, required final  List<DailyHabitDto> habits, required this.selectedDate}): _habits = habits;
  

 final  NutritionPlanDto? plan;
 final  List<DailyHabitDto> _habits;
 List<DailyHabitDto> get habits {
  if (_habits is EqualUnmodifiableListView) return _habits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_habits);
}

 final  DateTime selectedDate;

/// Create a copy of NutritionHabitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionHabitsLoadedCopyWith<NutritionHabitsLoaded> get copyWith => _$NutritionHabitsLoadedCopyWithImpl<NutritionHabitsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionHabitsLoaded&&(identical(other.plan, plan) || other.plan == plan)&&const DeepCollectionEquality().equals(other._habits, _habits)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate));
}


@override
int get hashCode => Object.hash(runtimeType,plan,const DeepCollectionEquality().hash(_habits),selectedDate);

@override
String toString() {
  return 'NutritionHabitsState.loaded(plan: $plan, habits: $habits, selectedDate: $selectedDate)';
}


}

/// @nodoc
abstract mixin class $NutritionHabitsLoadedCopyWith<$Res> implements $NutritionHabitsStateCopyWith<$Res> {
  factory $NutritionHabitsLoadedCopyWith(NutritionHabitsLoaded value, $Res Function(NutritionHabitsLoaded) _then) = _$NutritionHabitsLoadedCopyWithImpl;
@useResult
$Res call({
 NutritionPlanDto? plan, List<DailyHabitDto> habits, DateTime selectedDate
});


$NutritionPlanDtoCopyWith<$Res>? get plan;

}
/// @nodoc
class _$NutritionHabitsLoadedCopyWithImpl<$Res>
    implements $NutritionHabitsLoadedCopyWith<$Res> {
  _$NutritionHabitsLoadedCopyWithImpl(this._self, this._then);

  final NutritionHabitsLoaded _self;
  final $Res Function(NutritionHabitsLoaded) _then;

/// Create a copy of NutritionHabitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? plan = freezed,Object? habits = null,Object? selectedDate = null,}) {
  return _then(NutritionHabitsLoaded(
plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as NutritionPlanDto?,habits: null == habits ? _self._habits : habits // ignore: cast_nullable_to_non_nullable
as List<DailyHabitDto>,selectedDate: null == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of NutritionHabitsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionPlanDtoCopyWith<$Res>? get plan {
    if (_self.plan == null) {
    return null;
  }

  return $NutritionPlanDtoCopyWith<$Res>(_self.plan!, (value) {
    return _then(_self.copyWith(plan: value));
  });
}
}

/// @nodoc


class NutritionHabitsError implements NutritionHabitsState {
  const NutritionHabitsError(this.message);
  

 final  String message;

/// Create a copy of NutritionHabitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionHabitsErrorCopyWith<NutritionHabitsError> get copyWith => _$NutritionHabitsErrorCopyWithImpl<NutritionHabitsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionHabitsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NutritionHabitsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NutritionHabitsErrorCopyWith<$Res> implements $NutritionHabitsStateCopyWith<$Res> {
  factory $NutritionHabitsErrorCopyWith(NutritionHabitsError value, $Res Function(NutritionHabitsError) _then) = _$NutritionHabitsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NutritionHabitsErrorCopyWithImpl<$Res>
    implements $NutritionHabitsErrorCopyWith<$Res> {
  _$NutritionHabitsErrorCopyWithImpl(this._self, this._then);

  final NutritionHabitsError _self;
  final $Res Function(NutritionHabitsError) _then;

/// Create a copy of NutritionHabitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NutritionHabitsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
