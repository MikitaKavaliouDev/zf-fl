// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientDetailState()';
}


}

/// @nodoc
class $TrainerClientDetailStateCopyWith<$Res>  {
$TrainerClientDetailStateCopyWith(TrainerClientDetailState _, $Res Function(TrainerClientDetailState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientDetailState].
extension TrainerClientDetailStatePatterns on TrainerClientDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientDetailInitial value)?  initial,TResult Function( TrainerClientDetailLoading value)?  loading,TResult Function( TrainerClientDetailLoaded value)?  loaded,TResult Function( TrainerClientDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientDetailInitial() when initial != null:
return initial(_that);case TrainerClientDetailLoading() when loading != null:
return loading(_that);case TrainerClientDetailLoaded() when loaded != null:
return loaded(_that);case TrainerClientDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientDetailInitial value)  initial,required TResult Function( TrainerClientDetailLoading value)  loading,required TResult Function( TrainerClientDetailLoaded value)  loaded,required TResult Function( TrainerClientDetailError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientDetailInitial():
return initial(_that);case TrainerClientDetailLoading():
return loading(_that);case TrainerClientDetailLoaded():
return loaded(_that);case TrainerClientDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientDetailInitial value)?  initial,TResult? Function( TrainerClientDetailLoading value)?  loading,TResult? Function( TrainerClientDetailLoaded value)?  loaded,TResult? Function( TrainerClientDetailError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientDetailInitial() when initial != null:
return initial(_that);case TrainerClientDetailLoading() when loading != null:
return loading(_that);case TrainerClientDetailLoaded() when loaded != null:
return loaded(_that);case TrainerClientDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TrainerClientDetailDto client)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientDetailInitial() when initial != null:
return initial();case TrainerClientDetailLoading() when loading != null:
return loading();case TrainerClientDetailLoaded() when loaded != null:
return loaded(_that.client);case TrainerClientDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TrainerClientDetailDto client)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientDetailInitial():
return initial();case TrainerClientDetailLoading():
return loading();case TrainerClientDetailLoaded():
return loaded(_that.client);case TrainerClientDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TrainerClientDetailDto client)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientDetailInitial() when initial != null:
return initial();case TrainerClientDetailLoading() when loading != null:
return loading();case TrainerClientDetailLoaded() when loaded != null:
return loaded(_that.client);case TrainerClientDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientDetailInitial implements TrainerClientDetailState {
  const TrainerClientDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientDetailState.initial()';
}


}




/// @nodoc


class TrainerClientDetailLoading implements TrainerClientDetailState {
  const TrainerClientDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientDetailState.loading()';
}


}




/// @nodoc


class TrainerClientDetailLoaded implements TrainerClientDetailState {
  const TrainerClientDetailLoaded({required this.client});
  

 final  TrainerClientDetailDto client;

/// Create a copy of TrainerClientDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientDetailLoadedCopyWith<TrainerClientDetailLoaded> get copyWith => _$TrainerClientDetailLoadedCopyWithImpl<TrainerClientDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientDetailLoaded&&(identical(other.client, client) || other.client == client));
}


@override
int get hashCode => Object.hash(runtimeType,client);

@override
String toString() {
  return 'TrainerClientDetailState.loaded(client: $client)';
}


}

/// @nodoc
abstract mixin class $TrainerClientDetailLoadedCopyWith<$Res> implements $TrainerClientDetailStateCopyWith<$Res> {
  factory $TrainerClientDetailLoadedCopyWith(TrainerClientDetailLoaded value, $Res Function(TrainerClientDetailLoaded) _then) = _$TrainerClientDetailLoadedCopyWithImpl;
@useResult
$Res call({
 TrainerClientDetailDto client
});


$TrainerClientDetailDtoCopyWith<$Res> get client;

}
/// @nodoc
class _$TrainerClientDetailLoadedCopyWithImpl<$Res>
    implements $TrainerClientDetailLoadedCopyWith<$Res> {
  _$TrainerClientDetailLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientDetailLoaded _self;
  final $Res Function(TrainerClientDetailLoaded) _then;

/// Create a copy of TrainerClientDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? client = null,}) {
  return _then(TrainerClientDetailLoaded(
client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as TrainerClientDetailDto,
  ));
}

/// Create a copy of TrainerClientDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerClientDetailDtoCopyWith<$Res> get client {
  
  return $TrainerClientDetailDtoCopyWith<$Res>(_self.client, (value) {
    return _then(_self.copyWith(client: value));
  });
}
}

/// @nodoc


class TrainerClientDetailError implements TrainerClientDetailState {
  const TrainerClientDetailError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientDetailErrorCopyWith<TrainerClientDetailError> get copyWith => _$TrainerClientDetailErrorCopyWithImpl<TrainerClientDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientDetailErrorCopyWith<$Res> implements $TrainerClientDetailStateCopyWith<$Res> {
  factory $TrainerClientDetailErrorCopyWith(TrainerClientDetailError value, $Res Function(TrainerClientDetailError) _then) = _$TrainerClientDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientDetailErrorCopyWithImpl<$Res>
    implements $TrainerClientDetailErrorCopyWith<$Res> {
  _$TrainerClientDetailErrorCopyWithImpl(this._self, this._then);

  final TrainerClientDetailError _self;
  final $Res Function(TrainerClientDetailError) _then;

/// Create a copy of TrainerClientDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
