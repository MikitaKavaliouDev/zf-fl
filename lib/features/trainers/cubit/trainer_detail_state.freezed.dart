// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDetailState()';
}


}

/// @nodoc
class $TrainerDetailStateCopyWith<$Res>  {
$TrainerDetailStateCopyWith(TrainerDetailState _, $Res Function(TrainerDetailState) __);
}


/// Adds pattern-matching-related methods to [TrainerDetailState].
extension TrainerDetailStatePatterns on TrainerDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerDetailInitial value)?  initial,TResult Function( TrainerDetailLoading value)?  loading,TResult Function( TrainerDetailLoaded value)?  loaded,TResult Function( TrainerDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerDetailInitial() when initial != null:
return initial(_that);case TrainerDetailLoading() when loading != null:
return loading(_that);case TrainerDetailLoaded() when loaded != null:
return loaded(_that);case TrainerDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerDetailInitial value)  initial,required TResult Function( TrainerDetailLoading value)  loading,required TResult Function( TrainerDetailLoaded value)  loaded,required TResult Function( TrainerDetailError value)  error,}){
final _that = this;
switch (_that) {
case TrainerDetailInitial():
return initial(_that);case TrainerDetailLoading():
return loading(_that);case TrainerDetailLoaded():
return loaded(_that);case TrainerDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerDetailInitial value)?  initial,TResult? Function( TrainerDetailLoading value)?  loading,TResult? Function( TrainerDetailLoaded value)?  loaded,TResult? Function( TrainerDetailError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerDetailInitial() when initial != null:
return initial(_that);case TrainerDetailLoading() when loading != null:
return loading(_that);case TrainerDetailLoaded() when loaded != null:
return loaded(_that);case TrainerDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TrainerDetailDto trainer,  TrainerScheduleDto? schedule,  bool isLoadingSchedule,  List<TrainerPreviewMediaDto> previewMedia,  bool isLinking,  bool isUnlinking,  bool linkRequestPending,  String? linkError,  String? checkoutError)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerDetailInitial() when initial != null:
return initial();case TrainerDetailLoading() when loading != null:
return loading();case TrainerDetailLoaded() when loaded != null:
return loaded(_that.trainer,_that.schedule,_that.isLoadingSchedule,_that.previewMedia,_that.isLinking,_that.isUnlinking,_that.linkRequestPending,_that.linkError,_that.checkoutError);case TrainerDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TrainerDetailDto trainer,  TrainerScheduleDto? schedule,  bool isLoadingSchedule,  List<TrainerPreviewMediaDto> previewMedia,  bool isLinking,  bool isUnlinking,  bool linkRequestPending,  String? linkError,  String? checkoutError)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerDetailInitial():
return initial();case TrainerDetailLoading():
return loading();case TrainerDetailLoaded():
return loaded(_that.trainer,_that.schedule,_that.isLoadingSchedule,_that.previewMedia,_that.isLinking,_that.isUnlinking,_that.linkRequestPending,_that.linkError,_that.checkoutError);case TrainerDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TrainerDetailDto trainer,  TrainerScheduleDto? schedule,  bool isLoadingSchedule,  List<TrainerPreviewMediaDto> previewMedia,  bool isLinking,  bool isUnlinking,  bool linkRequestPending,  String? linkError,  String? checkoutError)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerDetailInitial() when initial != null:
return initial();case TrainerDetailLoading() when loading != null:
return loading();case TrainerDetailLoaded() when loaded != null:
return loaded(_that.trainer,_that.schedule,_that.isLoadingSchedule,_that.previewMedia,_that.isLinking,_that.isUnlinking,_that.linkRequestPending,_that.linkError,_that.checkoutError);case TrainerDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerDetailInitial implements TrainerDetailState {
  const TrainerDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDetailState.initial()';
}


}




/// @nodoc


class TrainerDetailLoading implements TrainerDetailState {
  const TrainerDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDetailState.loading()';
}


}




/// @nodoc


class TrainerDetailLoaded implements TrainerDetailState {
  const TrainerDetailLoaded({required this.trainer, this.schedule, this.isLoadingSchedule = false, final  List<TrainerPreviewMediaDto> previewMedia = const <TrainerPreviewMediaDto>[], this.isLinking = false, this.isUnlinking = false, this.linkRequestPending = false, this.linkError, this.checkoutError}): _previewMedia = previewMedia;
  

 final  TrainerDetailDto trainer;
 final  TrainerScheduleDto? schedule;
@JsonKey() final  bool isLoadingSchedule;
 final  List<TrainerPreviewMediaDto> _previewMedia;
@JsonKey() List<TrainerPreviewMediaDto> get previewMedia {
  if (_previewMedia is EqualUnmodifiableListView) return _previewMedia;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_previewMedia);
}

@JsonKey() final  bool isLinking;
@JsonKey() final  bool isUnlinking;
@JsonKey() final  bool linkRequestPending;
 final  String? linkError;
 final  String? checkoutError;

/// Create a copy of TrainerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDetailLoadedCopyWith<TrainerDetailLoaded> get copyWith => _$TrainerDetailLoadedCopyWithImpl<TrainerDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailLoaded&&(identical(other.trainer, trainer) || other.trainer == trainer)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.isLoadingSchedule, isLoadingSchedule) || other.isLoadingSchedule == isLoadingSchedule)&&const DeepCollectionEquality().equals(other._previewMedia, _previewMedia)&&(identical(other.isLinking, isLinking) || other.isLinking == isLinking)&&(identical(other.isUnlinking, isUnlinking) || other.isUnlinking == isUnlinking)&&(identical(other.linkRequestPending, linkRequestPending) || other.linkRequestPending == linkRequestPending)&&(identical(other.linkError, linkError) || other.linkError == linkError)&&(identical(other.checkoutError, checkoutError) || other.checkoutError == checkoutError));
}


@override
int get hashCode => Object.hash(runtimeType,trainer,schedule,isLoadingSchedule,const DeepCollectionEquality().hash(_previewMedia),isLinking,isUnlinking,linkRequestPending,linkError,checkoutError);

@override
String toString() {
  return 'TrainerDetailState.loaded(trainer: $trainer, schedule: $schedule, isLoadingSchedule: $isLoadingSchedule, previewMedia: $previewMedia, isLinking: $isLinking, isUnlinking: $isUnlinking, linkRequestPending: $linkRequestPending, linkError: $linkError, checkoutError: $checkoutError)';
}


}

/// @nodoc
abstract mixin class $TrainerDetailLoadedCopyWith<$Res> implements $TrainerDetailStateCopyWith<$Res> {
  factory $TrainerDetailLoadedCopyWith(TrainerDetailLoaded value, $Res Function(TrainerDetailLoaded) _then) = _$TrainerDetailLoadedCopyWithImpl;
@useResult
$Res call({
 TrainerDetailDto trainer, TrainerScheduleDto? schedule, bool isLoadingSchedule, List<TrainerPreviewMediaDto> previewMedia, bool isLinking, bool isUnlinking, bool linkRequestPending, String? linkError, String? checkoutError
});


$TrainerDetailDtoCopyWith<$Res> get trainer;$TrainerScheduleDtoCopyWith<$Res>? get schedule;

}
/// @nodoc
class _$TrainerDetailLoadedCopyWithImpl<$Res>
    implements $TrainerDetailLoadedCopyWith<$Res> {
  _$TrainerDetailLoadedCopyWithImpl(this._self, this._then);

  final TrainerDetailLoaded _self;
  final $Res Function(TrainerDetailLoaded) _then;

/// Create a copy of TrainerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trainer = null,Object? schedule = freezed,Object? isLoadingSchedule = null,Object? previewMedia = null,Object? isLinking = null,Object? isUnlinking = null,Object? linkRequestPending = null,Object? linkError = freezed,Object? checkoutError = freezed,}) {
  return _then(TrainerDetailLoaded(
trainer: null == trainer ? _self.trainer : trainer // ignore: cast_nullable_to_non_nullable
as TrainerDetailDto,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as TrainerScheduleDto?,isLoadingSchedule: null == isLoadingSchedule ? _self.isLoadingSchedule : isLoadingSchedule // ignore: cast_nullable_to_non_nullable
as bool,previewMedia: null == previewMedia ? _self._previewMedia : previewMedia // ignore: cast_nullable_to_non_nullable
as List<TrainerPreviewMediaDto>,isLinking: null == isLinking ? _self.isLinking : isLinking // ignore: cast_nullable_to_non_nullable
as bool,isUnlinking: null == isUnlinking ? _self.isUnlinking : isUnlinking // ignore: cast_nullable_to_non_nullable
as bool,linkRequestPending: null == linkRequestPending ? _self.linkRequestPending : linkRequestPending // ignore: cast_nullable_to_non_nullable
as bool,linkError: freezed == linkError ? _self.linkError : linkError // ignore: cast_nullable_to_non_nullable
as String?,checkoutError: freezed == checkoutError ? _self.checkoutError : checkoutError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TrainerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerDetailDtoCopyWith<$Res> get trainer {
  
  return $TrainerDetailDtoCopyWith<$Res>(_self.trainer, (value) {
    return _then(_self.copyWith(trainer: value));
  });
}/// Create a copy of TrainerDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerScheduleDtoCopyWith<$Res>? get schedule {
    if (_self.schedule == null) {
    return null;
  }

  return $TrainerScheduleDtoCopyWith<$Res>(_self.schedule!, (value) {
    return _then(_self.copyWith(schedule: value));
  });
}
}

/// @nodoc


class TrainerDetailError implements TrainerDetailState {
  const TrainerDetailError(this.message);
  

 final  String message;

/// Create a copy of TrainerDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDetailErrorCopyWith<TrainerDetailError> get copyWith => _$TrainerDetailErrorCopyWithImpl<TrainerDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerDetailErrorCopyWith<$Res> implements $TrainerDetailStateCopyWith<$Res> {
  factory $TrainerDetailErrorCopyWith(TrainerDetailError value, $Res Function(TrainerDetailError) _then) = _$TrainerDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerDetailErrorCopyWithImpl<$Res>
    implements $TrainerDetailErrorCopyWith<$Res> {
  _$TrainerDetailErrorCopyWithImpl(this._self, this._then);

  final TrainerDetailError _self;
  final $Res Function(TrainerDetailError) _then;

/// Create a copy of TrainerDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
