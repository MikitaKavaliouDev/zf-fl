// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_library_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramLibraryResponse {

 List<TrainerProgramBriefDto> get userPrograms; List<TrainerTemplateSummaryDto> get systemTemplates; List<TrainerTemplateSummaryDto> get userTemplates;
/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramLibraryResponseCopyWith<ProgramLibraryResponse> get copyWith => _$ProgramLibraryResponseCopyWithImpl<ProgramLibraryResponse>(this as ProgramLibraryResponse, _$identity);

  /// Serializes this ProgramLibraryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramLibraryResponse&&const DeepCollectionEquality().equals(other.userPrograms, userPrograms)&&const DeepCollectionEquality().equals(other.systemTemplates, systemTemplates)&&const DeepCollectionEquality().equals(other.userTemplates, userTemplates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(userPrograms),const DeepCollectionEquality().hash(systemTemplates),const DeepCollectionEquality().hash(userTemplates));

@override
String toString() {
  return 'ProgramLibraryResponse(userPrograms: $userPrograms, systemTemplates: $systemTemplates, userTemplates: $userTemplates)';
}


}

/// @nodoc
abstract mixin class $ProgramLibraryResponseCopyWith<$Res>  {
  factory $ProgramLibraryResponseCopyWith(ProgramLibraryResponse value, $Res Function(ProgramLibraryResponse) _then) = _$ProgramLibraryResponseCopyWithImpl;
@useResult
$Res call({
 List<TrainerProgramBriefDto> userPrograms, List<TrainerTemplateSummaryDto> systemTemplates, List<TrainerTemplateSummaryDto> userTemplates
});




}
/// @nodoc
class _$ProgramLibraryResponseCopyWithImpl<$Res>
    implements $ProgramLibraryResponseCopyWith<$Res> {
  _$ProgramLibraryResponseCopyWithImpl(this._self, this._then);

  final ProgramLibraryResponse _self;
  final $Res Function(ProgramLibraryResponse) _then;

/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userPrograms = null,Object? systemTemplates = null,Object? userTemplates = null,}) {
  return _then(_self.copyWith(
userPrograms: null == userPrograms ? _self.userPrograms : userPrograms // ignore: cast_nullable_to_non_nullable
as List<TrainerProgramBriefDto>,systemTemplates: null == systemTemplates ? _self.systemTemplates : systemTemplates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,userTemplates: null == userTemplates ? _self.userTemplates : userTemplates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramLibraryResponse].
extension ProgramLibraryResponsePatterns on ProgramLibraryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramLibraryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramLibraryResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProgramLibraryResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramLibraryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TrainerProgramBriefDto> userPrograms,  List<TrainerTemplateSummaryDto> systemTemplates,  List<TrainerTemplateSummaryDto> userTemplates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
return $default(_that.userPrograms,_that.systemTemplates,_that.userTemplates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TrainerProgramBriefDto> userPrograms,  List<TrainerTemplateSummaryDto> systemTemplates,  List<TrainerTemplateSummaryDto> userTemplates)  $default,) {final _that = this;
switch (_that) {
case _ProgramLibraryResponse():
return $default(_that.userPrograms,_that.systemTemplates,_that.userTemplates);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TrainerProgramBriefDto> userPrograms,  List<TrainerTemplateSummaryDto> systemTemplates,  List<TrainerTemplateSummaryDto> userTemplates)?  $default,) {final _that = this;
switch (_that) {
case _ProgramLibraryResponse() when $default != null:
return $default(_that.userPrograms,_that.systemTemplates,_that.userTemplates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramLibraryResponse implements ProgramLibraryResponse {
  const _ProgramLibraryResponse({final  List<TrainerProgramBriefDto> userPrograms = const [], final  List<TrainerTemplateSummaryDto> systemTemplates = const [], final  List<TrainerTemplateSummaryDto> userTemplates = const []}): _userPrograms = userPrograms,_systemTemplates = systemTemplates,_userTemplates = userTemplates;
  factory _ProgramLibraryResponse.fromJson(Map<String, dynamic> json) => _$ProgramLibraryResponseFromJson(json);

 final  List<TrainerProgramBriefDto> _userPrograms;
@override@JsonKey() List<TrainerProgramBriefDto> get userPrograms {
  if (_userPrograms is EqualUnmodifiableListView) return _userPrograms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userPrograms);
}

 final  List<TrainerTemplateSummaryDto> _systemTemplates;
@override@JsonKey() List<TrainerTemplateSummaryDto> get systemTemplates {
  if (_systemTemplates is EqualUnmodifiableListView) return _systemTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_systemTemplates);
}

 final  List<TrainerTemplateSummaryDto> _userTemplates;
@override@JsonKey() List<TrainerTemplateSummaryDto> get userTemplates {
  if (_userTemplates is EqualUnmodifiableListView) return _userTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_userTemplates);
}


/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramLibraryResponseCopyWith<_ProgramLibraryResponse> get copyWith => __$ProgramLibraryResponseCopyWithImpl<_ProgramLibraryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramLibraryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramLibraryResponse&&const DeepCollectionEquality().equals(other._userPrograms, _userPrograms)&&const DeepCollectionEquality().equals(other._systemTemplates, _systemTemplates)&&const DeepCollectionEquality().equals(other._userTemplates, _userTemplates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_userPrograms),const DeepCollectionEquality().hash(_systemTemplates),const DeepCollectionEquality().hash(_userTemplates));

@override
String toString() {
  return 'ProgramLibraryResponse(userPrograms: $userPrograms, systemTemplates: $systemTemplates, userTemplates: $userTemplates)';
}


}

/// @nodoc
abstract mixin class _$ProgramLibraryResponseCopyWith<$Res> implements $ProgramLibraryResponseCopyWith<$Res> {
  factory _$ProgramLibraryResponseCopyWith(_ProgramLibraryResponse value, $Res Function(_ProgramLibraryResponse) _then) = __$ProgramLibraryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<TrainerProgramBriefDto> userPrograms, List<TrainerTemplateSummaryDto> systemTemplates, List<TrainerTemplateSummaryDto> userTemplates
});




}
/// @nodoc
class __$ProgramLibraryResponseCopyWithImpl<$Res>
    implements _$ProgramLibraryResponseCopyWith<$Res> {
  __$ProgramLibraryResponseCopyWithImpl(this._self, this._then);

  final _ProgramLibraryResponse _self;
  final $Res Function(_ProgramLibraryResponse) _then;

/// Create a copy of ProgramLibraryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userPrograms = null,Object? systemTemplates = null,Object? userTemplates = null,}) {
  return _then(_ProgramLibraryResponse(
userPrograms: null == userPrograms ? _self._userPrograms : userPrograms // ignore: cast_nullable_to_non_nullable
as List<TrainerProgramBriefDto>,systemTemplates: null == systemTemplates ? _self._systemTemplates : systemTemplates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,userTemplates: null == userTemplates ? _self._userTemplates : userTemplates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,
  ));
}


}

// dart format on
