// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_check_in_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerCheckInDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCheckInDetailState()';
}


}

/// @nodoc
class $TrainerCheckInDetailStateCopyWith<$Res>  {
$TrainerCheckInDetailStateCopyWith(TrainerCheckInDetailState _, $Res Function(TrainerCheckInDetailState) __);
}


/// Adds pattern-matching-related methods to [TrainerCheckInDetailState].
extension TrainerCheckInDetailStatePatterns on TrainerCheckInDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerCheckInDetailInitial value)?  initial,TResult Function( TrainerCheckInDetailLoading value)?  loading,TResult Function( TrainerCheckInDetailLoaded value)?  loaded,TResult Function( TrainerCheckInDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerCheckInDetailInitial() when initial != null:
return initial(_that);case TrainerCheckInDetailLoading() when loading != null:
return loading(_that);case TrainerCheckInDetailLoaded() when loaded != null:
return loaded(_that);case TrainerCheckInDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerCheckInDetailInitial value)  initial,required TResult Function( TrainerCheckInDetailLoading value)  loading,required TResult Function( TrainerCheckInDetailLoaded value)  loaded,required TResult Function( TrainerCheckInDetailError value)  error,}){
final _that = this;
switch (_that) {
case TrainerCheckInDetailInitial():
return initial(_that);case TrainerCheckInDetailLoading():
return loading(_that);case TrainerCheckInDetailLoaded():
return loaded(_that);case TrainerCheckInDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerCheckInDetailInitial value)?  initial,TResult? Function( TrainerCheckInDetailLoading value)?  loading,TResult? Function( TrainerCheckInDetailLoaded value)?  loaded,TResult? Function( TrainerCheckInDetailError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerCheckInDetailInitial() when initial != null:
return initial(_that);case TrainerCheckInDetailLoading() when loading != null:
return loading(_that);case TrainerCheckInDetailLoaded() when loaded != null:
return loaded(_that);case TrainerCheckInDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TrainerCheckInDetailDto checkIn,  bool isSubmitting)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerCheckInDetailInitial() when initial != null:
return initial();case TrainerCheckInDetailLoading() when loading != null:
return loading();case TrainerCheckInDetailLoaded() when loaded != null:
return loaded(_that.checkIn,_that.isSubmitting);case TrainerCheckInDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TrainerCheckInDetailDto checkIn,  bool isSubmitting)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerCheckInDetailInitial():
return initial();case TrainerCheckInDetailLoading():
return loading();case TrainerCheckInDetailLoaded():
return loaded(_that.checkIn,_that.isSubmitting);case TrainerCheckInDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TrainerCheckInDetailDto checkIn,  bool isSubmitting)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerCheckInDetailInitial() when initial != null:
return initial();case TrainerCheckInDetailLoading() when loading != null:
return loading();case TrainerCheckInDetailLoaded() when loaded != null:
return loaded(_that.checkIn,_that.isSubmitting);case TrainerCheckInDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerCheckInDetailInitial implements TrainerCheckInDetailState {
  const TrainerCheckInDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCheckInDetailState.initial()';
}


}




/// @nodoc


class TrainerCheckInDetailLoading implements TrainerCheckInDetailState {
  const TrainerCheckInDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCheckInDetailState.loading()';
}


}




/// @nodoc


class TrainerCheckInDetailLoaded implements TrainerCheckInDetailState {
  const TrainerCheckInDetailLoaded({required this.checkIn, this.isSubmitting = false});
  

 final  TrainerCheckInDetailDto checkIn;
@JsonKey() final  bool isSubmitting;

/// Create a copy of TrainerCheckInDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCheckInDetailLoadedCopyWith<TrainerCheckInDetailLoaded> get copyWith => _$TrainerCheckInDetailLoadedCopyWithImpl<TrainerCheckInDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInDetailLoaded&&(identical(other.checkIn, checkIn) || other.checkIn == checkIn)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting));
}


@override
int get hashCode => Object.hash(runtimeType,checkIn,isSubmitting);

@override
String toString() {
  return 'TrainerCheckInDetailState.loaded(checkIn: $checkIn, isSubmitting: $isSubmitting)';
}


}

/// @nodoc
abstract mixin class $TrainerCheckInDetailLoadedCopyWith<$Res> implements $TrainerCheckInDetailStateCopyWith<$Res> {
  factory $TrainerCheckInDetailLoadedCopyWith(TrainerCheckInDetailLoaded value, $Res Function(TrainerCheckInDetailLoaded) _then) = _$TrainerCheckInDetailLoadedCopyWithImpl;
@useResult
$Res call({
 TrainerCheckInDetailDto checkIn, bool isSubmitting
});


$TrainerCheckInDetailDtoCopyWith<$Res> get checkIn;

}
/// @nodoc
class _$TrainerCheckInDetailLoadedCopyWithImpl<$Res>
    implements $TrainerCheckInDetailLoadedCopyWith<$Res> {
  _$TrainerCheckInDetailLoadedCopyWithImpl(this._self, this._then);

  final TrainerCheckInDetailLoaded _self;
  final $Res Function(TrainerCheckInDetailLoaded) _then;

/// Create a copy of TrainerCheckInDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkIn = null,Object? isSubmitting = null,}) {
  return _then(TrainerCheckInDetailLoaded(
checkIn: null == checkIn ? _self.checkIn : checkIn // ignore: cast_nullable_to_non_nullable
as TrainerCheckInDetailDto,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TrainerCheckInDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerCheckInDetailDtoCopyWith<$Res> get checkIn {
  
  return $TrainerCheckInDetailDtoCopyWith<$Res>(_self.checkIn, (value) {
    return _then(_self.copyWith(checkIn: value));
  });
}
}

/// @nodoc


class TrainerCheckInDetailError implements TrainerCheckInDetailState {
  const TrainerCheckInDetailError(this.message);
  

 final  String message;

/// Create a copy of TrainerCheckInDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCheckInDetailErrorCopyWith<TrainerCheckInDetailError> get copyWith => _$TrainerCheckInDetailErrorCopyWithImpl<TrainerCheckInDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerCheckInDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerCheckInDetailErrorCopyWith<$Res> implements $TrainerCheckInDetailStateCopyWith<$Res> {
  factory $TrainerCheckInDetailErrorCopyWith(TrainerCheckInDetailError value, $Res Function(TrainerCheckInDetailError) _then) = _$TrainerCheckInDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerCheckInDetailErrorCopyWithImpl<$Res>
    implements $TrainerCheckInDetailErrorCopyWith<$Res> {
  _$TrainerCheckInDetailErrorCopyWithImpl(this._self, this._then);

  final TrainerCheckInDetailError _self;
  final $Res Function(TrainerCheckInDetailError) _then;

/// Create a copy of TrainerCheckInDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerCheckInDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
