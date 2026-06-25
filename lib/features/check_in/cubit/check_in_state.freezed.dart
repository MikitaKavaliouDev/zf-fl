// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckInState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInState()';
}


}

/// @nodoc
class $CheckInStateCopyWith<$Res>  {
$CheckInStateCopyWith(CheckInState _, $Res Function(CheckInState) __);
}


/// Adds pattern-matching-related methods to [CheckInState].
extension CheckInStatePatterns on CheckInState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckInInitial value)?  initial,TResult Function( CheckInStep value)?  step,TResult Function( CheckInSubmitting value)?  submitting,TResult Function( CheckInSuccess value)?  success,TResult Function( CheckInError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckInInitial() when initial != null:
return initial(_that);case CheckInStep() when step != null:
return step(_that);case CheckInSubmitting() when submitting != null:
return submitting(_that);case CheckInSuccess() when success != null:
return success(_that);case CheckInError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckInInitial value)  initial,required TResult Function( CheckInStep value)  step,required TResult Function( CheckInSubmitting value)  submitting,required TResult Function( CheckInSuccess value)  success,required TResult Function( CheckInError value)  error,}){
final _that = this;
switch (_that) {
case CheckInInitial():
return initial(_that);case CheckInStep():
return step(_that);case CheckInSubmitting():
return submitting(_that);case CheckInSuccess():
return success(_that);case CheckInError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckInInitial value)?  initial,TResult? Function( CheckInStep value)?  step,TResult? Function( CheckInSubmitting value)?  submitting,TResult? Function( CheckInSuccess value)?  success,TResult? Function( CheckInError value)?  error,}){
final _that = this;
switch (_that) {
case CheckInInitial() when initial != null:
return initial(_that);case CheckInStep() when step != null:
return step(_that);case CheckInSubmitting() when submitting != null:
return submitting(_that);case CheckInSuccess() when success != null:
return success(_that);case CheckInError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int step,  CheckInSubmissionDto submission,  CheckInConfigDto? config)?  step,TResult Function()?  submitting,TResult Function( CheckInResponseDto response)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckInInitial() when initial != null:
return initial();case CheckInStep() when step != null:
return step(_that.step,_that.submission,_that.config);case CheckInSubmitting() when submitting != null:
return submitting();case CheckInSuccess() when success != null:
return success(_that.response);case CheckInError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int step,  CheckInSubmissionDto submission,  CheckInConfigDto? config)  step,required TResult Function()  submitting,required TResult Function( CheckInResponseDto response)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CheckInInitial():
return initial();case CheckInStep():
return step(_that.step,_that.submission,_that.config);case CheckInSubmitting():
return submitting();case CheckInSuccess():
return success(_that.response);case CheckInError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int step,  CheckInSubmissionDto submission,  CheckInConfigDto? config)?  step,TResult? Function()?  submitting,TResult? Function( CheckInResponseDto response)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CheckInInitial() when initial != null:
return initial();case CheckInStep() when step != null:
return step(_that.step,_that.submission,_that.config);case CheckInSubmitting() when submitting != null:
return submitting();case CheckInSuccess() when success != null:
return success(_that.response);case CheckInError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CheckInInitial implements CheckInState {
  const CheckInInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInState.initial()';
}


}




/// @nodoc


class CheckInStep implements CheckInState {
  const CheckInStep({this.step = 0, required this.submission, this.config});
  

@JsonKey() final  int step;
 final  CheckInSubmissionDto submission;
 final  CheckInConfigDto? config;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInStepCopyWith<CheckInStep> get copyWith => _$CheckInStepCopyWithImpl<CheckInStep>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInStep&&(identical(other.step, step) || other.step == step)&&(identical(other.submission, submission) || other.submission == submission)&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,step,submission,config);

@override
String toString() {
  return 'CheckInState.step(step: $step, submission: $submission, config: $config)';
}


}

/// @nodoc
abstract mixin class $CheckInStepCopyWith<$Res> implements $CheckInStateCopyWith<$Res> {
  factory $CheckInStepCopyWith(CheckInStep value, $Res Function(CheckInStep) _then) = _$CheckInStepCopyWithImpl;
@useResult
$Res call({
 int step, CheckInSubmissionDto submission, CheckInConfigDto? config
});


$CheckInSubmissionDtoCopyWith<$Res> get submission;$CheckInConfigDtoCopyWith<$Res>? get config;

}
/// @nodoc
class _$CheckInStepCopyWithImpl<$Res>
    implements $CheckInStepCopyWith<$Res> {
  _$CheckInStepCopyWithImpl(this._self, this._then);

  final CheckInStep _self;
  final $Res Function(CheckInStep) _then;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? step = null,Object? submission = null,Object? config = freezed,}) {
  return _then(CheckInStep(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,submission: null == submission ? _self.submission : submission // ignore: cast_nullable_to_non_nullable
as CheckInSubmissionDto,config: freezed == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as CheckInConfigDto?,
  ));
}

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInSubmissionDtoCopyWith<$Res> get submission {
  
  return $CheckInSubmissionDtoCopyWith<$Res>(_self.submission, (value) {
    return _then(_self.copyWith(submission: value));
  });
}/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInConfigDtoCopyWith<$Res>? get config {
    if (_self.config == null) {
    return null;
  }

  return $CheckInConfigDtoCopyWith<$Res>(_self.config!, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class CheckInSubmitting implements CheckInState {
  const CheckInSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckInState.submitting()';
}


}




/// @nodoc


class CheckInSuccess implements CheckInState {
  const CheckInSuccess(this.response);
  

 final  CheckInResponseDto response;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInSuccessCopyWith<CheckInSuccess> get copyWith => _$CheckInSuccessCopyWithImpl<CheckInSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInSuccess&&(identical(other.response, response) || other.response == response));
}


@override
int get hashCode => Object.hash(runtimeType,response);

@override
String toString() {
  return 'CheckInState.success(response: $response)';
}


}

/// @nodoc
abstract mixin class $CheckInSuccessCopyWith<$Res> implements $CheckInStateCopyWith<$Res> {
  factory $CheckInSuccessCopyWith(CheckInSuccess value, $Res Function(CheckInSuccess) _then) = _$CheckInSuccessCopyWithImpl;
@useResult
$Res call({
 CheckInResponseDto response
});


$CheckInResponseDtoCopyWith<$Res> get response;

}
/// @nodoc
class _$CheckInSuccessCopyWithImpl<$Res>
    implements $CheckInSuccessCopyWith<$Res> {
  _$CheckInSuccessCopyWithImpl(this._self, this._then);

  final CheckInSuccess _self;
  final $Res Function(CheckInSuccess) _then;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? response = null,}) {
  return _then(CheckInSuccess(
null == response ? _self.response : response // ignore: cast_nullable_to_non_nullable
as CheckInResponseDto,
  ));
}

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckInResponseDtoCopyWith<$Res> get response {
  
  return $CheckInResponseDtoCopyWith<$Res>(_self.response, (value) {
    return _then(_self.copyWith(response: value));
  });
}
}

/// @nodoc


class CheckInError implements CheckInState {
  const CheckInError(this.message);
  

 final  String message;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInErrorCopyWith<CheckInError> get copyWith => _$CheckInErrorCopyWithImpl<CheckInError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'CheckInState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CheckInErrorCopyWith<$Res> implements $CheckInStateCopyWith<$Res> {
  factory $CheckInErrorCopyWith(CheckInError value, $Res Function(CheckInError) _then) = _$CheckInErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CheckInErrorCopyWithImpl<$Res>
    implements $CheckInErrorCopyWith<$Res> {
  _$CheckInErrorCopyWithImpl(this._self, this._then);

  final CheckInError _self;
  final $Res Function(CheckInError) _then;

/// Create a copy of CheckInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CheckInError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
