// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_clients_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientsState()';
}


}

/// @nodoc
class $TrainerClientsStateCopyWith<$Res>  {
$TrainerClientsStateCopyWith(TrainerClientsState _, $Res Function(TrainerClientsState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientsState].
extension TrainerClientsStatePatterns on TrainerClientsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientsInitial value)?  initial,TResult Function( TrainerClientsLoading value)?  loading,TResult Function( TrainerClientsLoaded value)?  loaded,TResult Function( TrainerClientsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientsInitial() when initial != null:
return initial(_that);case TrainerClientsLoading() when loading != null:
return loading(_that);case TrainerClientsLoaded() when loaded != null:
return loaded(_that);case TrainerClientsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientsInitial value)  initial,required TResult Function( TrainerClientsLoading value)  loading,required TResult Function( TrainerClientsLoaded value)  loaded,required TResult Function( TrainerClientsError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientsInitial():
return initial(_that);case TrainerClientsLoading():
return loading(_that);case TrainerClientsLoaded():
return loaded(_that);case TrainerClientsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientsInitial value)?  initial,TResult? Function( TrainerClientsLoading value)?  loading,TResult? Function( TrainerClientsLoaded value)?  loaded,TResult? Function( TrainerClientsError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientsInitial() when initial != null:
return initial(_that);case TrainerClientsLoading() when loading != null:
return loading(_that);case TrainerClientsLoaded() when loaded != null:
return loaded(_that);case TrainerClientsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerClientListItemDto> clients,  bool isSearching)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientsInitial() when initial != null:
return initial();case TrainerClientsLoading() when loading != null:
return loading();case TrainerClientsLoaded() when loaded != null:
return loaded(_that.clients,_that.isSearching);case TrainerClientsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerClientListItemDto> clients,  bool isSearching)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientsInitial():
return initial();case TrainerClientsLoading():
return loading();case TrainerClientsLoaded():
return loaded(_that.clients,_that.isSearching);case TrainerClientsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerClientListItemDto> clients,  bool isSearching)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientsInitial() when initial != null:
return initial();case TrainerClientsLoading() when loading != null:
return loading();case TrainerClientsLoaded() when loaded != null:
return loaded(_that.clients,_that.isSearching);case TrainerClientsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientsInitial implements TrainerClientsState {
  const TrainerClientsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientsState.initial()';
}


}




/// @nodoc


class TrainerClientsLoading implements TrainerClientsState {
  const TrainerClientsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientsState.loading()';
}


}




/// @nodoc


class TrainerClientsLoaded implements TrainerClientsState {
  const TrainerClientsLoaded({final  List<TrainerClientListItemDto> clients = const [], this.isSearching = false}): _clients = clients;
  

 final  List<TrainerClientListItemDto> _clients;
@JsonKey() List<TrainerClientListItemDto> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}

@JsonKey() final  bool isSearching;

/// Create a copy of TrainerClientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientsLoadedCopyWith<TrainerClientsLoaded> get copyWith => _$TrainerClientsLoadedCopyWithImpl<TrainerClientsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientsLoaded&&const DeepCollectionEquality().equals(other._clients, _clients)&&(identical(other.isSearching, isSearching) || other.isSearching == isSearching));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clients),isSearching);

@override
String toString() {
  return 'TrainerClientsState.loaded(clients: $clients, isSearching: $isSearching)';
}


}

/// @nodoc
abstract mixin class $TrainerClientsLoadedCopyWith<$Res> implements $TrainerClientsStateCopyWith<$Res> {
  factory $TrainerClientsLoadedCopyWith(TrainerClientsLoaded value, $Res Function(TrainerClientsLoaded) _then) = _$TrainerClientsLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerClientListItemDto> clients, bool isSearching
});




}
/// @nodoc
class _$TrainerClientsLoadedCopyWithImpl<$Res>
    implements $TrainerClientsLoadedCopyWith<$Res> {
  _$TrainerClientsLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientsLoaded _self;
  final $Res Function(TrainerClientsLoaded) _then;

/// Create a copy of TrainerClientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clients = null,Object? isSearching = null,}) {
  return _then(TrainerClientsLoaded(
clients: null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<TrainerClientListItemDto>,isSearching: null == isSearching ? _self.isSearching : isSearching // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TrainerClientsError implements TrainerClientsState {
  const TrainerClientsError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientsErrorCopyWith<TrainerClientsError> get copyWith => _$TrainerClientsErrorCopyWithImpl<TrainerClientsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientsErrorCopyWith<$Res> implements $TrainerClientsStateCopyWith<$Res> {
  factory $TrainerClientsErrorCopyWith(TrainerClientsError value, $Res Function(TrainerClientsError) _then) = _$TrainerClientsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientsErrorCopyWithImpl<$Res>
    implements $TrainerClientsErrorCopyWith<$Res> {
  _$TrainerClientsErrorCopyWithImpl(this._self, this._then);

  final TrainerClientsError _self;
  final $Res Function(TrainerClientsError) _then;

/// Create a copy of TrainerClientsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
