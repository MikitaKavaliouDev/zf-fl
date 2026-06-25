// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sharing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SharingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharingState()';
}


}

/// @nodoc
class $SharingStateCopyWith<$Res>  {
$SharingStateCopyWith(SharingState _, $Res Function(SharingState) __);
}


/// Adds pattern-matching-related methods to [SharingState].
extension SharingStatePatterns on SharingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SharingInitial value)?  initial,TResult Function( SharingLoading value)?  loading,TResult Function( SharingLoaded value)?  loaded,TResult Function( SharingSaving value)?  saving,TResult Function( SharingError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SharingInitial() when initial != null:
return initial(_that);case SharingLoading() when loading != null:
return loading(_that);case SharingLoaded() when loaded != null:
return loaded(_that);case SharingSaving() when saving != null:
return saving(_that);case SharingError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SharingInitial value)  initial,required TResult Function( SharingLoading value)  loading,required TResult Function( SharingLoaded value)  loaded,required TResult Function( SharingSaving value)  saving,required TResult Function( SharingError value)  error,}){
final _that = this;
switch (_that) {
case SharingInitial():
return initial(_that);case SharingLoading():
return loading(_that);case SharingLoaded():
return loaded(_that);case SharingSaving():
return saving(_that);case SharingError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SharingInitial value)?  initial,TResult? Function( SharingLoading value)?  loading,TResult? Function( SharingLoaded value)?  loaded,TResult? Function( SharingSaving value)?  saving,TResult? Function( SharingError value)?  error,}){
final _that = this;
switch (_that) {
case SharingInitial() when initial != null:
return initial(_that);case SharingLoading() when loading != null:
return loading(_that);case SharingLoaded() when loaded != null:
return loaded(_that);case SharingSaving() when saving != null:
return saving(_that);case SharingError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( SharingConfigDto config)?  loaded,TResult Function()?  saving,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SharingInitial() when initial != null:
return initial();case SharingLoading() when loading != null:
return loading();case SharingLoaded() when loaded != null:
return loaded(_that.config);case SharingSaving() when saving != null:
return saving();case SharingError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( SharingConfigDto config)  loaded,required TResult Function()  saving,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case SharingInitial():
return initial();case SharingLoading():
return loading();case SharingLoaded():
return loaded(_that.config);case SharingSaving():
return saving();case SharingError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( SharingConfigDto config)?  loaded,TResult? Function()?  saving,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case SharingInitial() when initial != null:
return initial();case SharingLoading() when loading != null:
return loading();case SharingLoaded() when loaded != null:
return loaded(_that.config);case SharingSaving() when saving != null:
return saving();case SharingError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SharingInitial implements SharingState {
  const SharingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharingState.initial()';
}


}




/// @nodoc


class SharingLoading implements SharingState {
  const SharingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharingState.loading()';
}


}




/// @nodoc


class SharingLoaded implements SharingState {
  const SharingLoaded({required this.config});
  

 final  SharingConfigDto config;

/// Create a copy of SharingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharingLoadedCopyWith<SharingLoaded> get copyWith => _$SharingLoadedCopyWithImpl<SharingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingLoaded&&(identical(other.config, config) || other.config == config));
}


@override
int get hashCode => Object.hash(runtimeType,config);

@override
String toString() {
  return 'SharingState.loaded(config: $config)';
}


}

/// @nodoc
abstract mixin class $SharingLoadedCopyWith<$Res> implements $SharingStateCopyWith<$Res> {
  factory $SharingLoadedCopyWith(SharingLoaded value, $Res Function(SharingLoaded) _then) = _$SharingLoadedCopyWithImpl;
@useResult
$Res call({
 SharingConfigDto config
});


$SharingConfigDtoCopyWith<$Res> get config;

}
/// @nodoc
class _$SharingLoadedCopyWithImpl<$Res>
    implements $SharingLoadedCopyWith<$Res> {
  _$SharingLoadedCopyWithImpl(this._self, this._then);

  final SharingLoaded _self;
  final $Res Function(SharingLoaded) _then;

/// Create a copy of SharingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? config = null,}) {
  return _then(SharingLoaded(
config: null == config ? _self.config : config // ignore: cast_nullable_to_non_nullable
as SharingConfigDto,
  ));
}

/// Create a copy of SharingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SharingConfigDtoCopyWith<$Res> get config {
  
  return $SharingConfigDtoCopyWith<$Res>(_self.config, (value) {
    return _then(_self.copyWith(config: value));
  });
}
}

/// @nodoc


class SharingSaving implements SharingState {
  const SharingSaving();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingSaving);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SharingState.saving()';
}


}




/// @nodoc


class SharingError implements SharingState {
  const SharingError(this.message);
  

 final  String message;

/// Create a copy of SharingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SharingErrorCopyWith<SharingError> get copyWith => _$SharingErrorCopyWithImpl<SharingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SharingError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SharingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SharingErrorCopyWith<$Res> implements $SharingStateCopyWith<$Res> {
  factory $SharingErrorCopyWith(SharingError value, $Res Function(SharingError) _then) = _$SharingErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SharingErrorCopyWithImpl<$Res>
    implements $SharingErrorCopyWith<$Res> {
  _$SharingErrorCopyWithImpl(this._self, this._then);

  final SharingError _self;
  final $Res Function(SharingError) _then;

/// Create a copy of SharingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SharingError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
