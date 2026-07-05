// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_active_program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerActiveProgramState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerActiveProgramState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerActiveProgramState()';
}


}

/// @nodoc
class $TrainerActiveProgramStateCopyWith<$Res>  {
$TrainerActiveProgramStateCopyWith(TrainerActiveProgramState _, $Res Function(TrainerActiveProgramState) __);
}


/// Adds pattern-matching-related methods to [TrainerActiveProgramState].
extension TrainerActiveProgramStatePatterns on TrainerActiveProgramState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerActiveProgramInitial value)?  initial,TResult Function( TrainerActiveProgramLoading value)?  loading,TResult Function( TrainerActiveProgramLoaded value)?  loaded,TResult Function( TrainerActiveProgramError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerActiveProgramInitial() when initial != null:
return initial(_that);case TrainerActiveProgramLoading() when loading != null:
return loading(_that);case TrainerActiveProgramLoaded() when loaded != null:
return loaded(_that);case TrainerActiveProgramError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerActiveProgramInitial value)  initial,required TResult Function( TrainerActiveProgramLoading value)  loading,required TResult Function( TrainerActiveProgramLoaded value)  loaded,required TResult Function( TrainerActiveProgramError value)  error,}){
final _that = this;
switch (_that) {
case TrainerActiveProgramInitial():
return initial(_that);case TrainerActiveProgramLoading():
return loading(_that);case TrainerActiveProgramLoaded():
return loaded(_that);case TrainerActiveProgramError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerActiveProgramInitial value)?  initial,TResult? Function( TrainerActiveProgramLoading value)?  loading,TResult? Function( TrainerActiveProgramLoaded value)?  loaded,TResult? Function( TrainerActiveProgramError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerActiveProgramInitial() when initial != null:
return initial(_that);case TrainerActiveProgramLoading() when loading != null:
return loading(_that);case TrainerActiveProgramLoaded() when loaded != null:
return loaded(_that);case TrainerActiveProgramError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TrainerClientActiveProgramDto? program)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerActiveProgramInitial() when initial != null:
return initial();case TrainerActiveProgramLoading() when loading != null:
return loading();case TrainerActiveProgramLoaded() when loaded != null:
return loaded(_that.program);case TrainerActiveProgramError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TrainerClientActiveProgramDto? program)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerActiveProgramInitial():
return initial();case TrainerActiveProgramLoading():
return loading();case TrainerActiveProgramLoaded():
return loaded(_that.program);case TrainerActiveProgramError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TrainerClientActiveProgramDto? program)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerActiveProgramInitial() when initial != null:
return initial();case TrainerActiveProgramLoading() when loading != null:
return loading();case TrainerActiveProgramLoaded() when loaded != null:
return loaded(_that.program);case TrainerActiveProgramError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerActiveProgramInitial implements TrainerActiveProgramState {
  const TrainerActiveProgramInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerActiveProgramInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerActiveProgramState.initial()';
}


}




/// @nodoc


class TrainerActiveProgramLoading implements TrainerActiveProgramState {
  const TrainerActiveProgramLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerActiveProgramLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerActiveProgramState.loading()';
}


}




/// @nodoc


class TrainerActiveProgramLoaded implements TrainerActiveProgramState {
  const TrainerActiveProgramLoaded(this.program);
  

 final  TrainerClientActiveProgramDto? program;

/// Create a copy of TrainerActiveProgramState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerActiveProgramLoadedCopyWith<TrainerActiveProgramLoaded> get copyWith => _$TrainerActiveProgramLoadedCopyWithImpl<TrainerActiveProgramLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerActiveProgramLoaded&&(identical(other.program, program) || other.program == program));
}


@override
int get hashCode => Object.hash(runtimeType,program);

@override
String toString() {
  return 'TrainerActiveProgramState.loaded(program: $program)';
}


}

/// @nodoc
abstract mixin class $TrainerActiveProgramLoadedCopyWith<$Res> implements $TrainerActiveProgramStateCopyWith<$Res> {
  factory $TrainerActiveProgramLoadedCopyWith(TrainerActiveProgramLoaded value, $Res Function(TrainerActiveProgramLoaded) _then) = _$TrainerActiveProgramLoadedCopyWithImpl;
@useResult
$Res call({
 TrainerClientActiveProgramDto? program
});


$TrainerClientActiveProgramDtoCopyWith<$Res>? get program;

}
/// @nodoc
class _$TrainerActiveProgramLoadedCopyWithImpl<$Res>
    implements $TrainerActiveProgramLoadedCopyWith<$Res> {
  _$TrainerActiveProgramLoadedCopyWithImpl(this._self, this._then);

  final TrainerActiveProgramLoaded _self;
  final $Res Function(TrainerActiveProgramLoaded) _then;

/// Create a copy of TrainerActiveProgramState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? program = freezed,}) {
  return _then(TrainerActiveProgramLoaded(
freezed == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as TrainerClientActiveProgramDto?,
  ));
}

/// Create a copy of TrainerActiveProgramState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerClientActiveProgramDtoCopyWith<$Res>? get program {
    if (_self.program == null) {
    return null;
  }

  return $TrainerClientActiveProgramDtoCopyWith<$Res>(_self.program!, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}

/// @nodoc


class TrainerActiveProgramError implements TrainerActiveProgramState {
  const TrainerActiveProgramError(this.message);
  

 final  String message;

/// Create a copy of TrainerActiveProgramState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerActiveProgramErrorCopyWith<TrainerActiveProgramError> get copyWith => _$TrainerActiveProgramErrorCopyWithImpl<TrainerActiveProgramError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerActiveProgramError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerActiveProgramState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerActiveProgramErrorCopyWith<$Res> implements $TrainerActiveProgramStateCopyWith<$Res> {
  factory $TrainerActiveProgramErrorCopyWith(TrainerActiveProgramError value, $Res Function(TrainerActiveProgramError) _then) = _$TrainerActiveProgramErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerActiveProgramErrorCopyWithImpl<$Res>
    implements $TrainerActiveProgramErrorCopyWith<$Res> {
  _$TrainerActiveProgramErrorCopyWithImpl(this._self, this._then);

  final TrainerActiveProgramError _self;
  final $Res Function(TrainerActiveProgramError) _then;

/// Create a copy of TrainerActiveProgramState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerActiveProgramError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
