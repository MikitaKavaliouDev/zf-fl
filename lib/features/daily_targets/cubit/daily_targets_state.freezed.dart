// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_targets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyTargetsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTargetsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyTargetsState()';
}


}

/// @nodoc
class $DailyTargetsStateCopyWith<$Res>  {
$DailyTargetsStateCopyWith(DailyTargetsState _, $Res Function(DailyTargetsState) __);
}


/// Adds pattern-matching-related methods to [DailyTargetsState].
extension DailyTargetsStatePatterns on DailyTargetsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DailyTargetsInitial value)?  initial,TResult Function( DailyTargetsLoading value)?  loading,TResult Function( DailyTargetsLoaded value)?  loaded,TResult Function( DailyTargetsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DailyTargetsInitial() when initial != null:
return initial(_that);case DailyTargetsLoading() when loading != null:
return loading(_that);case DailyTargetsLoaded() when loaded != null:
return loaded(_that);case DailyTargetsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DailyTargetsInitial value)  initial,required TResult Function( DailyTargetsLoading value)  loading,required TResult Function( DailyTargetsLoaded value)  loaded,required TResult Function( DailyTargetsError value)  error,}){
final _that = this;
switch (_that) {
case DailyTargetsInitial():
return initial(_that);case DailyTargetsLoading():
return loading(_that);case DailyTargetsLoaded():
return loaded(_that);case DailyTargetsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DailyTargetsInitial value)?  initial,TResult? Function( DailyTargetsLoading value)?  loading,TResult? Function( DailyTargetsLoaded value)?  loaded,TResult? Function( DailyTargetsError value)?  error,}){
final _that = this;
switch (_that) {
case DailyTargetsInitial() when initial != null:
return initial(_that);case DailyTargetsLoading() when loading != null:
return loading(_that);case DailyTargetsLoaded() when loaded != null:
return loaded(_that);case DailyTargetsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<DailyTargetDto> targets)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DailyTargetsInitial() when initial != null:
return initial();case DailyTargetsLoading() when loading != null:
return loading();case DailyTargetsLoaded() when loaded != null:
return loaded(_that.targets);case DailyTargetsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<DailyTargetDto> targets)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DailyTargetsInitial():
return initial();case DailyTargetsLoading():
return loading();case DailyTargetsLoaded():
return loaded(_that.targets);case DailyTargetsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<DailyTargetDto> targets)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DailyTargetsInitial() when initial != null:
return initial();case DailyTargetsLoading() when loading != null:
return loading();case DailyTargetsLoaded() when loaded != null:
return loaded(_that.targets);case DailyTargetsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DailyTargetsInitial implements DailyTargetsState {
  const DailyTargetsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTargetsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyTargetsState.initial()';
}


}




/// @nodoc


class DailyTargetsLoading implements DailyTargetsState {
  const DailyTargetsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTargetsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyTargetsState.loading()';
}


}




/// @nodoc


class DailyTargetsLoaded implements DailyTargetsState {
  const DailyTargetsLoaded({required final  List<DailyTargetDto> targets}): _targets = targets;
  

 final  List<DailyTargetDto> _targets;
 List<DailyTargetDto> get targets {
  if (_targets is EqualUnmodifiableListView) return _targets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targets);
}


/// Create a copy of DailyTargetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTargetsLoadedCopyWith<DailyTargetsLoaded> get copyWith => _$DailyTargetsLoadedCopyWithImpl<DailyTargetsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTargetsLoaded&&const DeepCollectionEquality().equals(other._targets, _targets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_targets));

@override
String toString() {
  return 'DailyTargetsState.loaded(targets: $targets)';
}


}

/// @nodoc
abstract mixin class $DailyTargetsLoadedCopyWith<$Res> implements $DailyTargetsStateCopyWith<$Res> {
  factory $DailyTargetsLoadedCopyWith(DailyTargetsLoaded value, $Res Function(DailyTargetsLoaded) _then) = _$DailyTargetsLoadedCopyWithImpl;
@useResult
$Res call({
 List<DailyTargetDto> targets
});




}
/// @nodoc
class _$DailyTargetsLoadedCopyWithImpl<$Res>
    implements $DailyTargetsLoadedCopyWith<$Res> {
  _$DailyTargetsLoadedCopyWithImpl(this._self, this._then);

  final DailyTargetsLoaded _self;
  final $Res Function(DailyTargetsLoaded) _then;

/// Create a copy of DailyTargetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? targets = null,}) {
  return _then(DailyTargetsLoaded(
targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<DailyTargetDto>,
  ));
}


}

/// @nodoc


class DailyTargetsError implements DailyTargetsState {
  const DailyTargetsError(this.message);
  

 final  String message;

/// Create a copy of DailyTargetsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTargetsErrorCopyWith<DailyTargetsError> get copyWith => _$DailyTargetsErrorCopyWithImpl<DailyTargetsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTargetsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyTargetsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DailyTargetsErrorCopyWith<$Res> implements $DailyTargetsStateCopyWith<$Res> {
  factory $DailyTargetsErrorCopyWith(DailyTargetsError value, $Res Function(DailyTargetsError) _then) = _$DailyTargetsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DailyTargetsErrorCopyWithImpl<$Res>
    implements $DailyTargetsErrorCopyWith<$Res> {
  _$DailyTargetsErrorCopyWithImpl(this._self, this._then);

  final DailyTargetsError _self;
  final $Res Function(DailyTargetsError) _then;

/// Create a copy of DailyTargetsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DailyTargetsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
