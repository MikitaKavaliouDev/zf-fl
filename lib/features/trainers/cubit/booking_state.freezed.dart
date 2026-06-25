// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState()';
}


}

/// @nodoc
class $BookingStateCopyWith<$Res>  {
$BookingStateCopyWith(BookingState _, $Res Function(BookingState) __);
}


/// Adds pattern-matching-related methods to [BookingState].
extension BookingStatePatterns on BookingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BookingInitial value)?  initial,TResult Function( BookingSubmitting value)?  submitting,TResult Function( BookingSuccess value)?  success,TResult Function( BookingError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial(_that);case BookingSubmitting() when submitting != null:
return submitting(_that);case BookingSuccess() when success != null:
return success(_that);case BookingError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BookingInitial value)  initial,required TResult Function( BookingSubmitting value)  submitting,required TResult Function( BookingSuccess value)  success,required TResult Function( BookingError value)  error,}){
final _that = this;
switch (_that) {
case BookingInitial():
return initial(_that);case BookingSubmitting():
return submitting(_that);case BookingSuccess():
return success(_that);case BookingError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BookingInitial value)?  initial,TResult? Function( BookingSubmitting value)?  submitting,TResult? Function( BookingSuccess value)?  success,TResult? Function( BookingError value)?  error,}){
final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial(_that);case BookingSubmitting() when submitting != null:
return submitting(_that);case BookingSuccess() when success != null:
return success(_that);case BookingError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  submitting,TResult Function( BookingResponseDto booking)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial();case BookingSubmitting() when submitting != null:
return submitting();case BookingSuccess() when success != null:
return success(_that.booking);case BookingError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  submitting,required TResult Function( BookingResponseDto booking)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case BookingInitial():
return initial();case BookingSubmitting():
return submitting();case BookingSuccess():
return success(_that.booking);case BookingError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  submitting,TResult? Function( BookingResponseDto booking)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case BookingInitial() when initial != null:
return initial();case BookingSubmitting() when submitting != null:
return submitting();case BookingSuccess() when success != null:
return success(_that.booking);case BookingError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class BookingInitial implements BookingState {
  const BookingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState.initial()';
}


}




/// @nodoc


class BookingSubmitting implements BookingState {
  const BookingSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BookingState.submitting()';
}


}




/// @nodoc


class BookingSuccess implements BookingState {
  const BookingSuccess(this.booking);
  

 final  BookingResponseDto booking;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingSuccessCopyWith<BookingSuccess> get copyWith => _$BookingSuccessCopyWithImpl<BookingSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingSuccess&&(identical(other.booking, booking) || other.booking == booking));
}


@override
int get hashCode => Object.hash(runtimeType,booking);

@override
String toString() {
  return 'BookingState.success(booking: $booking)';
}


}

/// @nodoc
abstract mixin class $BookingSuccessCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $BookingSuccessCopyWith(BookingSuccess value, $Res Function(BookingSuccess) _then) = _$BookingSuccessCopyWithImpl;
@useResult
$Res call({
 BookingResponseDto booking
});


$BookingResponseDtoCopyWith<$Res> get booking;

}
/// @nodoc
class _$BookingSuccessCopyWithImpl<$Res>
    implements $BookingSuccessCopyWith<$Res> {
  _$BookingSuccessCopyWithImpl(this._self, this._then);

  final BookingSuccess _self;
  final $Res Function(BookingSuccess) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? booking = null,}) {
  return _then(BookingSuccess(
null == booking ? _self.booking : booking // ignore: cast_nullable_to_non_nullable
as BookingResponseDto,
  ));
}

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookingResponseDtoCopyWith<$Res> get booking {
  
  return $BookingResponseDtoCopyWith<$Res>(_self.booking, (value) {
    return _then(_self.copyWith(booking: value));
  });
}
}

/// @nodoc


class BookingError implements BookingState {
  const BookingError(this.message);
  

 final  String message;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingErrorCopyWith<BookingError> get copyWith => _$BookingErrorCopyWithImpl<BookingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'BookingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $BookingErrorCopyWith<$Res> implements $BookingStateCopyWith<$Res> {
  factory $BookingErrorCopyWith(BookingError value, $Res Function(BookingError) _then) = _$BookingErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$BookingErrorCopyWithImpl<$Res>
    implements $BookingErrorCopyWith<$Res> {
  _$BookingErrorCopyWithImpl(this._self, this._then);

  final BookingError _self;
  final $Res Function(BookingError) _then;

/// Create a copy of BookingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(BookingError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
