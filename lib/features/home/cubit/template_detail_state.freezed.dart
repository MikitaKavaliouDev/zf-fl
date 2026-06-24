// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'template_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TemplateDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TemplateDetailState()';
}


}

/// @nodoc
class $TemplateDetailStateCopyWith<$Res>  {
$TemplateDetailStateCopyWith(TemplateDetailState _, $Res Function(TemplateDetailState) __);
}


/// Adds pattern-matching-related methods to [TemplateDetailState].
extension TemplateDetailStatePatterns on TemplateDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TemplateDetailInitial value)?  initial,TResult Function( TemplateDetailLoading value)?  loading,TResult Function( TemplateDetailLoaded value)?  loaded,TResult Function( TemplateDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TemplateDetailInitial() when initial != null:
return initial(_that);case TemplateDetailLoading() when loading != null:
return loading(_that);case TemplateDetailLoaded() when loaded != null:
return loaded(_that);case TemplateDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TemplateDetailInitial value)  initial,required TResult Function( TemplateDetailLoading value)  loading,required TResult Function( TemplateDetailLoaded value)  loaded,required TResult Function( TemplateDetailError value)  error,}){
final _that = this;
switch (_that) {
case TemplateDetailInitial():
return initial(_that);case TemplateDetailLoading():
return loading(_that);case TemplateDetailLoaded():
return loaded(_that);case TemplateDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TemplateDetailInitial value)?  initial,TResult? Function( TemplateDetailLoading value)?  loading,TResult? Function( TemplateDetailLoaded value)?  loaded,TResult? Function( TemplateDetailError value)?  error,}){
final _that = this;
switch (_that) {
case TemplateDetailInitial() when initial != null:
return initial(_that);case TemplateDetailLoading() when loading != null:
return loading(_that);case TemplateDetailLoaded() when loaded != null:
return loaded(_that);case TemplateDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( TemplateDto template,  List<TemplateExerciseDto> exercises)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TemplateDetailInitial() when initial != null:
return initial();case TemplateDetailLoading() when loading != null:
return loading();case TemplateDetailLoaded() when loaded != null:
return loaded(_that.template,_that.exercises);case TemplateDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( TemplateDto template,  List<TemplateExerciseDto> exercises)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TemplateDetailInitial():
return initial();case TemplateDetailLoading():
return loading();case TemplateDetailLoaded():
return loaded(_that.template,_that.exercises);case TemplateDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( TemplateDto template,  List<TemplateExerciseDto> exercises)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TemplateDetailInitial() when initial != null:
return initial();case TemplateDetailLoading() when loading != null:
return loading();case TemplateDetailLoaded() when loaded != null:
return loaded(_that.template,_that.exercises);case TemplateDetailError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TemplateDetailInitial implements TemplateDetailState {
  const TemplateDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TemplateDetailState.initial()';
}


}




/// @nodoc


class TemplateDetailLoading implements TemplateDetailState {
  const TemplateDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TemplateDetailState.loading()';
}


}




/// @nodoc


class TemplateDetailLoaded implements TemplateDetailState {
  const TemplateDetailLoaded({required this.template, required final  List<TemplateExerciseDto> exercises}): _exercises = exercises;
  

 final  TemplateDto template;
 final  List<TemplateExerciseDto> _exercises;
 List<TemplateExerciseDto> get exercises {
  if (_exercises is EqualUnmodifiableListView) return _exercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercises);
}


/// Create a copy of TemplateDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateDetailLoadedCopyWith<TemplateDetailLoaded> get copyWith => _$TemplateDetailLoadedCopyWithImpl<TemplateDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateDetailLoaded&&(identical(other.template, template) || other.template == template)&&const DeepCollectionEquality().equals(other._exercises, _exercises));
}


@override
int get hashCode => Object.hash(runtimeType,template,const DeepCollectionEquality().hash(_exercises));

@override
String toString() {
  return 'TemplateDetailState.loaded(template: $template, exercises: $exercises)';
}


}

/// @nodoc
abstract mixin class $TemplateDetailLoadedCopyWith<$Res> implements $TemplateDetailStateCopyWith<$Res> {
  factory $TemplateDetailLoadedCopyWith(TemplateDetailLoaded value, $Res Function(TemplateDetailLoaded) _then) = _$TemplateDetailLoadedCopyWithImpl;
@useResult
$Res call({
 TemplateDto template, List<TemplateExerciseDto> exercises
});


$TemplateDtoCopyWith<$Res> get template;

}
/// @nodoc
class _$TemplateDetailLoadedCopyWithImpl<$Res>
    implements $TemplateDetailLoadedCopyWith<$Res> {
  _$TemplateDetailLoadedCopyWithImpl(this._self, this._then);

  final TemplateDetailLoaded _self;
  final $Res Function(TemplateDetailLoaded) _then;

/// Create a copy of TemplateDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? template = null,Object? exercises = null,}) {
  return _then(TemplateDetailLoaded(
template: null == template ? _self.template : template // ignore: cast_nullable_to_non_nullable
as TemplateDto,exercises: null == exercises ? _self._exercises : exercises // ignore: cast_nullable_to_non_nullable
as List<TemplateExerciseDto>,
  ));
}

/// Create a copy of TemplateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TemplateDtoCopyWith<$Res> get template {
  
  return $TemplateDtoCopyWith<$Res>(_self.template, (value) {
    return _then(_self.copyWith(template: value));
  });
}
}

/// @nodoc


class TemplateDetailError implements TemplateDetailState {
  const TemplateDetailError(this.message);
  

 final  String message;

/// Create a copy of TemplateDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TemplateDetailErrorCopyWith<TemplateDetailError> get copyWith => _$TemplateDetailErrorCopyWithImpl<TemplateDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TemplateDetailError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TemplateDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TemplateDetailErrorCopyWith<$Res> implements $TemplateDetailStateCopyWith<$Res> {
  factory $TemplateDetailErrorCopyWith(TemplateDetailError value, $Res Function(TemplateDetailError) _then) = _$TemplateDetailErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TemplateDetailErrorCopyWithImpl<$Res>
    implements $TemplateDetailErrorCopyWith<$Res> {
  _$TemplateDetailErrorCopyWithImpl(this._self, this._then);

  final TemplateDetailError _self;
  final $Res Function(TemplateDetailError) _then;

/// Create a copy of TemplateDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TemplateDetailError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
