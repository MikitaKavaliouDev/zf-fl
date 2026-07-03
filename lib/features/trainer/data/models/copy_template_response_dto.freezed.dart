// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'copy_template_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CopyTemplateResponseDto {

 Map<String, dynamic>? get newTemplate; Map<String, dynamic>? get newProgram;
/// Create a copy of CopyTemplateResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CopyTemplateResponseDtoCopyWith<CopyTemplateResponseDto> get copyWith => _$CopyTemplateResponseDtoCopyWithImpl<CopyTemplateResponseDto>(this as CopyTemplateResponseDto, _$identity);

  /// Serializes this CopyTemplateResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CopyTemplateResponseDto&&const DeepCollectionEquality().equals(other.newTemplate, newTemplate)&&const DeepCollectionEquality().equals(other.newProgram, newProgram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(newTemplate),const DeepCollectionEquality().hash(newProgram));

@override
String toString() {
  return 'CopyTemplateResponseDto(newTemplate: $newTemplate, newProgram: $newProgram)';
}


}

/// @nodoc
abstract mixin class $CopyTemplateResponseDtoCopyWith<$Res>  {
  factory $CopyTemplateResponseDtoCopyWith(CopyTemplateResponseDto value, $Res Function(CopyTemplateResponseDto) _then) = _$CopyTemplateResponseDtoCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? newTemplate, Map<String, dynamic>? newProgram
});




}
/// @nodoc
class _$CopyTemplateResponseDtoCopyWithImpl<$Res>
    implements $CopyTemplateResponseDtoCopyWith<$Res> {
  _$CopyTemplateResponseDtoCopyWithImpl(this._self, this._then);

  final CopyTemplateResponseDto _self;
  final $Res Function(CopyTemplateResponseDto) _then;

/// Create a copy of CopyTemplateResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newTemplate = freezed,Object? newProgram = freezed,}) {
  return _then(_self.copyWith(
newTemplate: freezed == newTemplate ? _self.newTemplate : newTemplate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,newProgram: freezed == newProgram ? _self.newProgram : newProgram // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CopyTemplateResponseDto].
extension CopyTemplateResponseDtoPatterns on CopyTemplateResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CopyTemplateResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CopyTemplateResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CopyTemplateResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CopyTemplateResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CopyTemplateResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CopyTemplateResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic>? newTemplate,  Map<String, dynamic>? newProgram)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CopyTemplateResponseDto() when $default != null:
return $default(_that.newTemplate,_that.newProgram);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic>? newTemplate,  Map<String, dynamic>? newProgram)  $default,) {final _that = this;
switch (_that) {
case _CopyTemplateResponseDto():
return $default(_that.newTemplate,_that.newProgram);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic>? newTemplate,  Map<String, dynamic>? newProgram)?  $default,) {final _that = this;
switch (_that) {
case _CopyTemplateResponseDto() when $default != null:
return $default(_that.newTemplate,_that.newProgram);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CopyTemplateResponseDto implements CopyTemplateResponseDto {
  const _CopyTemplateResponseDto({final  Map<String, dynamic>? newTemplate, final  Map<String, dynamic>? newProgram}): _newTemplate = newTemplate,_newProgram = newProgram;
  factory _CopyTemplateResponseDto.fromJson(Map<String, dynamic> json) => _$CopyTemplateResponseDtoFromJson(json);

 final  Map<String, dynamic>? _newTemplate;
@override Map<String, dynamic>? get newTemplate {
  final value = _newTemplate;
  if (value == null) return null;
  if (_newTemplate is EqualUnmodifiableMapView) return _newTemplate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _newProgram;
@override Map<String, dynamic>? get newProgram {
  final value = _newProgram;
  if (value == null) return null;
  if (_newProgram is EqualUnmodifiableMapView) return _newProgram;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CopyTemplateResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CopyTemplateResponseDtoCopyWith<_CopyTemplateResponseDto> get copyWith => __$CopyTemplateResponseDtoCopyWithImpl<_CopyTemplateResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CopyTemplateResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CopyTemplateResponseDto&&const DeepCollectionEquality().equals(other._newTemplate, _newTemplate)&&const DeepCollectionEquality().equals(other._newProgram, _newProgram));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_newTemplate),const DeepCollectionEquality().hash(_newProgram));

@override
String toString() {
  return 'CopyTemplateResponseDto(newTemplate: $newTemplate, newProgram: $newProgram)';
}


}

/// @nodoc
abstract mixin class _$CopyTemplateResponseDtoCopyWith<$Res> implements $CopyTemplateResponseDtoCopyWith<$Res> {
  factory _$CopyTemplateResponseDtoCopyWith(_CopyTemplateResponseDto value, $Res Function(_CopyTemplateResponseDto) _then) = __$CopyTemplateResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic>? newTemplate, Map<String, dynamic>? newProgram
});




}
/// @nodoc
class __$CopyTemplateResponseDtoCopyWithImpl<$Res>
    implements _$CopyTemplateResponseDtoCopyWith<$Res> {
  __$CopyTemplateResponseDtoCopyWithImpl(this._self, this._then);

  final _CopyTemplateResponseDto _self;
  final $Res Function(_CopyTemplateResponseDto) _then;

/// Create a copy of CopyTemplateResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newTemplate = freezed,Object? newProgram = freezed,}) {
  return _then(_CopyTemplateResponseDto(
newTemplate: freezed == newTemplate ? _self._newTemplate : newTemplate // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,newProgram: freezed == newProgram ? _self._newProgram : newProgram // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
