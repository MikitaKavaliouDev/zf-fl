// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_check_in_review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerCheckInReviewState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInReviewState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCheckInReviewState()';
}


}

/// @nodoc
class $TrainerCheckInReviewStateCopyWith<$Res>  {
$TrainerCheckInReviewStateCopyWith(TrainerCheckInReviewState _, $Res Function(TrainerCheckInReviewState) __);
}


/// Adds pattern-matching-related methods to [TrainerCheckInReviewState].
extension TrainerCheckInReviewStatePatterns on TrainerCheckInReviewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerCheckInReviewInitial value)?  initial,TResult Function( TrainerCheckInReviewLoading value)?  loading,TResult Function( TrainerCheckInReviewLoaded value)?  loaded,TResult Function( TrainerCheckInReviewError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerCheckInReviewInitial() when initial != null:
return initial(_that);case TrainerCheckInReviewLoading() when loading != null:
return loading(_that);case TrainerCheckInReviewLoaded() when loaded != null:
return loaded(_that);case TrainerCheckInReviewError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerCheckInReviewInitial value)  initial,required TResult Function( TrainerCheckInReviewLoading value)  loading,required TResult Function( TrainerCheckInReviewLoaded value)  loaded,required TResult Function( TrainerCheckInReviewError value)  error,}){
final _that = this;
switch (_that) {
case TrainerCheckInReviewInitial():
return initial(_that);case TrainerCheckInReviewLoading():
return loading(_that);case TrainerCheckInReviewLoaded():
return loaded(_that);case TrainerCheckInReviewError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerCheckInReviewInitial value)?  initial,TResult? Function( TrainerCheckInReviewLoading value)?  loading,TResult? Function( TrainerCheckInReviewLoaded value)?  loaded,TResult? Function( TrainerCheckInReviewError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerCheckInReviewInitial() when initial != null:
return initial(_that);case TrainerCheckInReviewLoading() when loading != null:
return loading(_that);case TrainerCheckInReviewLoaded() when loaded != null:
return loaded(_that);case TrainerCheckInReviewError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerCheckInListItemDto> pendingCheckIns,  List<TrainerCheckInListItemDto> reviewedCheckIns,  String selectedStatus)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerCheckInReviewInitial() when initial != null:
return initial();case TrainerCheckInReviewLoading() when loading != null:
return loading();case TrainerCheckInReviewLoaded() when loaded != null:
return loaded(_that.pendingCheckIns,_that.reviewedCheckIns,_that.selectedStatus);case TrainerCheckInReviewError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerCheckInListItemDto> pendingCheckIns,  List<TrainerCheckInListItemDto> reviewedCheckIns,  String selectedStatus)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerCheckInReviewInitial():
return initial();case TrainerCheckInReviewLoading():
return loading();case TrainerCheckInReviewLoaded():
return loaded(_that.pendingCheckIns,_that.reviewedCheckIns,_that.selectedStatus);case TrainerCheckInReviewError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerCheckInListItemDto> pendingCheckIns,  List<TrainerCheckInListItemDto> reviewedCheckIns,  String selectedStatus)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerCheckInReviewInitial() when initial != null:
return initial();case TrainerCheckInReviewLoading() when loading != null:
return loading();case TrainerCheckInReviewLoaded() when loaded != null:
return loaded(_that.pendingCheckIns,_that.reviewedCheckIns,_that.selectedStatus);case TrainerCheckInReviewError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerCheckInReviewInitial implements TrainerCheckInReviewState {
  const TrainerCheckInReviewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInReviewInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCheckInReviewState.initial()';
}


}




/// @nodoc


class TrainerCheckInReviewLoading implements TrainerCheckInReviewState {
  const TrainerCheckInReviewLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInReviewLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerCheckInReviewState.loading()';
}


}




/// @nodoc


class TrainerCheckInReviewLoaded implements TrainerCheckInReviewState {
  const TrainerCheckInReviewLoaded({final  List<TrainerCheckInListItemDto> pendingCheckIns = const <TrainerCheckInListItemDto>[], final  List<TrainerCheckInListItemDto> reviewedCheckIns = const <TrainerCheckInListItemDto>[], this.selectedStatus = 'SUBMITTED'}): _pendingCheckIns = pendingCheckIns,_reviewedCheckIns = reviewedCheckIns;
  

 final  List<TrainerCheckInListItemDto> _pendingCheckIns;
@JsonKey() List<TrainerCheckInListItemDto> get pendingCheckIns {
  if (_pendingCheckIns is EqualUnmodifiableListView) return _pendingCheckIns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingCheckIns);
}

 final  List<TrainerCheckInListItemDto> _reviewedCheckIns;
@JsonKey() List<TrainerCheckInListItemDto> get reviewedCheckIns {
  if (_reviewedCheckIns is EqualUnmodifiableListView) return _reviewedCheckIns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reviewedCheckIns);
}

@JsonKey() final  String selectedStatus;

/// Create a copy of TrainerCheckInReviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCheckInReviewLoadedCopyWith<TrainerCheckInReviewLoaded> get copyWith => _$TrainerCheckInReviewLoadedCopyWithImpl<TrainerCheckInReviewLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInReviewLoaded&&const DeepCollectionEquality().equals(other._pendingCheckIns, _pendingCheckIns)&&const DeepCollectionEquality().equals(other._reviewedCheckIns, _reviewedCheckIns)&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pendingCheckIns),const DeepCollectionEquality().hash(_reviewedCheckIns),selectedStatus);

@override
String toString() {
  return 'TrainerCheckInReviewState.loaded(pendingCheckIns: $pendingCheckIns, reviewedCheckIns: $reviewedCheckIns, selectedStatus: $selectedStatus)';
}


}

/// @nodoc
abstract mixin class $TrainerCheckInReviewLoadedCopyWith<$Res> implements $TrainerCheckInReviewStateCopyWith<$Res> {
  factory $TrainerCheckInReviewLoadedCopyWith(TrainerCheckInReviewLoaded value, $Res Function(TrainerCheckInReviewLoaded) _then) = _$TrainerCheckInReviewLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerCheckInListItemDto> pendingCheckIns, List<TrainerCheckInListItemDto> reviewedCheckIns, String selectedStatus
});




}
/// @nodoc
class _$TrainerCheckInReviewLoadedCopyWithImpl<$Res>
    implements $TrainerCheckInReviewLoadedCopyWith<$Res> {
  _$TrainerCheckInReviewLoadedCopyWithImpl(this._self, this._then);

  final TrainerCheckInReviewLoaded _self;
  final $Res Function(TrainerCheckInReviewLoaded) _then;

/// Create a copy of TrainerCheckInReviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pendingCheckIns = null,Object? reviewedCheckIns = null,Object? selectedStatus = null,}) {
  return _then(TrainerCheckInReviewLoaded(
pendingCheckIns: null == pendingCheckIns ? _self._pendingCheckIns : pendingCheckIns // ignore: cast_nullable_to_non_nullable
as List<TrainerCheckInListItemDto>,reviewedCheckIns: null == reviewedCheckIns ? _self._reviewedCheckIns : reviewedCheckIns // ignore: cast_nullable_to_non_nullable
as List<TrainerCheckInListItemDto>,selectedStatus: null == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TrainerCheckInReviewError implements TrainerCheckInReviewState {
  const TrainerCheckInReviewError(this.message);
  

 final  String message;

/// Create a copy of TrainerCheckInReviewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCheckInReviewErrorCopyWith<TrainerCheckInReviewError> get copyWith => _$TrainerCheckInReviewErrorCopyWithImpl<TrainerCheckInReviewError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCheckInReviewError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerCheckInReviewState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerCheckInReviewErrorCopyWith<$Res> implements $TrainerCheckInReviewStateCopyWith<$Res> {
  factory $TrainerCheckInReviewErrorCopyWith(TrainerCheckInReviewError value, $Res Function(TrainerCheckInReviewError) _then) = _$TrainerCheckInReviewErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerCheckInReviewErrorCopyWithImpl<$Res>
    implements $TrainerCheckInReviewErrorCopyWith<$Res> {
  _$TrainerCheckInReviewErrorCopyWithImpl(this._self, this._then);

  final TrainerCheckInReviewError _self;
  final $Res Function(TrainerCheckInReviewError) _then;

/// Create a copy of TrainerCheckInReviewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerCheckInReviewError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
