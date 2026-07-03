// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_habits_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientHabitsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientHabitsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientHabitsState()';
}


}

/// @nodoc
class $TrainerClientHabitsStateCopyWith<$Res>  {
$TrainerClientHabitsStateCopyWith(TrainerClientHabitsState _, $Res Function(TrainerClientHabitsState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientHabitsState].
extension TrainerClientHabitsStatePatterns on TrainerClientHabitsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientHabitsInitial value)?  initial,TResult Function( TrainerClientHabitsLoading value)?  loading,TResult Function( TrainerClientHabitsLoaded value)?  loaded,TResult Function( TrainerClientHabitsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientHabitsInitial() when initial != null:
return initial(_that);case TrainerClientHabitsLoading() when loading != null:
return loading(_that);case TrainerClientHabitsLoaded() when loaded != null:
return loaded(_that);case TrainerClientHabitsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientHabitsInitial value)  initial,required TResult Function( TrainerClientHabitsLoading value)  loading,required TResult Function( TrainerClientHabitsLoaded value)  loaded,required TResult Function( TrainerClientHabitsError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientHabitsInitial():
return initial(_that);case TrainerClientHabitsLoading():
return loading(_that);case TrainerClientHabitsLoaded():
return loaded(_that);case TrainerClientHabitsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientHabitsInitial value)?  initial,TResult? Function( TrainerClientHabitsLoading value)?  loading,TResult? Function( TrainerClientHabitsLoaded value)?  loaded,TResult? Function( TrainerClientHabitsError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientHabitsInitial() when initial != null:
return initial(_that);case TrainerClientHabitsLoading() when loading != null:
return loading(_that);case TrainerClientHabitsLoaded() when loaded != null:
return loaded(_that);case TrainerClientHabitsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerHabitDto> habits)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientHabitsInitial() when initial != null:
return initial();case TrainerClientHabitsLoading() when loading != null:
return loading();case TrainerClientHabitsLoaded() when loaded != null:
return loaded(_that.habits);case TrainerClientHabitsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerHabitDto> habits)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientHabitsInitial():
return initial();case TrainerClientHabitsLoading():
return loading();case TrainerClientHabitsLoaded():
return loaded(_that.habits);case TrainerClientHabitsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerHabitDto> habits)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientHabitsInitial() when initial != null:
return initial();case TrainerClientHabitsLoading() when loading != null:
return loading();case TrainerClientHabitsLoaded() when loaded != null:
return loaded(_that.habits);case TrainerClientHabitsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientHabitsInitial implements TrainerClientHabitsState {
  const TrainerClientHabitsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientHabitsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientHabitsState.initial()';
}


}




/// @nodoc


class TrainerClientHabitsLoading implements TrainerClientHabitsState {
  const TrainerClientHabitsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientHabitsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientHabitsState.loading()';
}


}




/// @nodoc


class TrainerClientHabitsLoaded implements TrainerClientHabitsState {
  const TrainerClientHabitsLoaded(final  List<TrainerHabitDto> habits): _habits = habits;
  

 final  List<TrainerHabitDto> _habits;
 List<TrainerHabitDto> get habits {
  if (_habits is EqualUnmodifiableListView) return _habits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_habits);
}


/// Create a copy of TrainerClientHabitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientHabitsLoadedCopyWith<TrainerClientHabitsLoaded> get copyWith => _$TrainerClientHabitsLoadedCopyWithImpl<TrainerClientHabitsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientHabitsLoaded&&const DeepCollectionEquality().equals(other._habits, _habits));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_habits));

@override
String toString() {
  return 'TrainerClientHabitsState.loaded(habits: $habits)';
}


}

/// @nodoc
abstract mixin class $TrainerClientHabitsLoadedCopyWith<$Res> implements $TrainerClientHabitsStateCopyWith<$Res> {
  factory $TrainerClientHabitsLoadedCopyWith(TrainerClientHabitsLoaded value, $Res Function(TrainerClientHabitsLoaded) _then) = _$TrainerClientHabitsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerHabitDto> habits
});




}
/// @nodoc
class _$TrainerClientHabitsLoadedCopyWithImpl<$Res>
    implements $TrainerClientHabitsLoadedCopyWith<$Res> {
  _$TrainerClientHabitsLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientHabitsLoaded _self;
  final $Res Function(TrainerClientHabitsLoaded) _then;

/// Create a copy of TrainerClientHabitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? habits = null,}) {
  return _then(TrainerClientHabitsLoaded(
null == habits ? _self._habits : habits // ignore: cast_nullable_to_non_nullable
as List<TrainerHabitDto>,
  ));
}


}

/// @nodoc


class TrainerClientHabitsError implements TrainerClientHabitsState {
  const TrainerClientHabitsError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientHabitsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientHabitsErrorCopyWith<TrainerClientHabitsError> get copyWith => _$TrainerClientHabitsErrorCopyWithImpl<TrainerClientHabitsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientHabitsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientHabitsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientHabitsErrorCopyWith<$Res> implements $TrainerClientHabitsStateCopyWith<$Res> {
  factory $TrainerClientHabitsErrorCopyWith(TrainerClientHabitsError value, $Res Function(TrainerClientHabitsError) _then) = _$TrainerClientHabitsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientHabitsErrorCopyWithImpl<$Res>
    implements $TrainerClientHabitsErrorCopyWith<$Res> {
  _$TrainerClientHabitsErrorCopyWithImpl(this._self, this._then);

  final TrainerClientHabitsError _self;
  final $Res Function(TrainerClientHabitsError) _then;

/// Create a copy of TrainerClientHabitsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientHabitsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
