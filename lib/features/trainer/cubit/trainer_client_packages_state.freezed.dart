// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_packages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerClientPackagesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientPackagesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientPackagesState()';
}


}

/// @nodoc
class $TrainerClientPackagesStateCopyWith<$Res>  {
$TrainerClientPackagesStateCopyWith(TrainerClientPackagesState _, $Res Function(TrainerClientPackagesState) __);
}


/// Adds pattern-matching-related methods to [TrainerClientPackagesState].
extension TrainerClientPackagesStatePatterns on TrainerClientPackagesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerClientPackagesInitial value)?  initial,TResult Function( TrainerClientPackagesLoading value)?  loading,TResult Function( TrainerClientPackagesLoaded value)?  loaded,TResult Function( TrainerClientPackagesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerClientPackagesInitial() when initial != null:
return initial(_that);case TrainerClientPackagesLoading() when loading != null:
return loading(_that);case TrainerClientPackagesLoaded() when loaded != null:
return loaded(_that);case TrainerClientPackagesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerClientPackagesInitial value)  initial,required TResult Function( TrainerClientPackagesLoading value)  loading,required TResult Function( TrainerClientPackagesLoaded value)  loaded,required TResult Function( TrainerClientPackagesError value)  error,}){
final _that = this;
switch (_that) {
case TrainerClientPackagesInitial():
return initial(_that);case TrainerClientPackagesLoading():
return loading(_that);case TrainerClientPackagesLoaded():
return loaded(_that);case TrainerClientPackagesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerClientPackagesInitial value)?  initial,TResult? Function( TrainerClientPackagesLoading value)?  loading,TResult? Function( TrainerClientPackagesLoaded value)?  loaded,TResult? Function( TrainerClientPackagesError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerClientPackagesInitial() when initial != null:
return initial(_that);case TrainerClientPackagesLoading() when loading != null:
return loading(_that);case TrainerClientPackagesLoaded() when loaded != null:
return loaded(_that);case TrainerClientPackagesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerClientPackageDto> packages)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerClientPackagesInitial() when initial != null:
return initial();case TrainerClientPackagesLoading() when loading != null:
return loading();case TrainerClientPackagesLoaded() when loaded != null:
return loaded(_that.packages);case TrainerClientPackagesError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerClientPackageDto> packages)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerClientPackagesInitial():
return initial();case TrainerClientPackagesLoading():
return loading();case TrainerClientPackagesLoaded():
return loaded(_that.packages);case TrainerClientPackagesError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerClientPackageDto> packages)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerClientPackagesInitial() when initial != null:
return initial();case TrainerClientPackagesLoading() when loading != null:
return loading();case TrainerClientPackagesLoaded() when loaded != null:
return loaded(_that.packages);case TrainerClientPackagesError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerClientPackagesInitial implements TrainerClientPackagesState {
  const TrainerClientPackagesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientPackagesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientPackagesState.initial()';
}


}




/// @nodoc


class TrainerClientPackagesLoading implements TrainerClientPackagesState {
  const TrainerClientPackagesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientPackagesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerClientPackagesState.loading()';
}


}




/// @nodoc


class TrainerClientPackagesLoaded implements TrainerClientPackagesState {
  const TrainerClientPackagesLoaded(final  List<TrainerClientPackageDto> packages): _packages = packages;
  

 final  List<TrainerClientPackageDto> _packages;
 List<TrainerClientPackageDto> get packages {
  if (_packages is EqualUnmodifiableListView) return _packages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_packages);
}


/// Create a copy of TrainerClientPackagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientPackagesLoadedCopyWith<TrainerClientPackagesLoaded> get copyWith => _$TrainerClientPackagesLoadedCopyWithImpl<TrainerClientPackagesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientPackagesLoaded&&const DeepCollectionEquality().equals(other._packages, _packages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_packages));

@override
String toString() {
  return 'TrainerClientPackagesState.loaded(packages: $packages)';
}


}

/// @nodoc
abstract mixin class $TrainerClientPackagesLoadedCopyWith<$Res> implements $TrainerClientPackagesStateCopyWith<$Res> {
  factory $TrainerClientPackagesLoadedCopyWith(TrainerClientPackagesLoaded value, $Res Function(TrainerClientPackagesLoaded) _then) = _$TrainerClientPackagesLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerClientPackageDto> packages
});




}
/// @nodoc
class _$TrainerClientPackagesLoadedCopyWithImpl<$Res>
    implements $TrainerClientPackagesLoadedCopyWith<$Res> {
  _$TrainerClientPackagesLoadedCopyWithImpl(this._self, this._then);

  final TrainerClientPackagesLoaded _self;
  final $Res Function(TrainerClientPackagesLoaded) _then;

/// Create a copy of TrainerClientPackagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? packages = null,}) {
  return _then(TrainerClientPackagesLoaded(
null == packages ? _self._packages : packages // ignore: cast_nullable_to_non_nullable
as List<TrainerClientPackageDto>,
  ));
}


}

/// @nodoc


class TrainerClientPackagesError implements TrainerClientPackagesState {
  const TrainerClientPackagesError(this.message);
  

 final  String message;

/// Create a copy of TrainerClientPackagesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientPackagesErrorCopyWith<TrainerClientPackagesError> get copyWith => _$TrainerClientPackagesErrorCopyWithImpl<TrainerClientPackagesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientPackagesError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerClientPackagesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerClientPackagesErrorCopyWith<$Res> implements $TrainerClientPackagesStateCopyWith<$Res> {
  factory $TrainerClientPackagesErrorCopyWith(TrainerClientPackagesError value, $Res Function(TrainerClientPackagesError) _then) = _$TrainerClientPackagesErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerClientPackagesErrorCopyWithImpl<$Res>
    implements $TrainerClientPackagesErrorCopyWith<$Res> {
  _$TrainerClientPackagesErrorCopyWithImpl(this._self, this._then);

  final TrainerClientPackagesError _self;
  final $Res Function(TrainerClientPackagesError) _then;

/// Create a copy of TrainerClientPackagesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerClientPackagesError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
