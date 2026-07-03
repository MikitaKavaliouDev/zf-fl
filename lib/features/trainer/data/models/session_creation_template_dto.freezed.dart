// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_creation_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionCreationTemplateDto {

 String get id; String get name; SessionCreationProgramRefDto get program;
/// Create a copy of SessionCreationTemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCreationTemplateDtoCopyWith<SessionCreationTemplateDto> get copyWith => _$SessionCreationTemplateDtoCopyWithImpl<SessionCreationTemplateDto>(this as SessionCreationTemplateDto, _$identity);

  /// Serializes this SessionCreationTemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCreationTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.program, program) || other.program == program));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,program);

@override
String toString() {
  return 'SessionCreationTemplateDto(id: $id, name: $name, program: $program)';
}


}

/// @nodoc
abstract mixin class $SessionCreationTemplateDtoCopyWith<$Res>  {
  factory $SessionCreationTemplateDtoCopyWith(SessionCreationTemplateDto value, $Res Function(SessionCreationTemplateDto) _then) = _$SessionCreationTemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, SessionCreationProgramRefDto program
});


$SessionCreationProgramRefDtoCopyWith<$Res> get program;

}
/// @nodoc
class _$SessionCreationTemplateDtoCopyWithImpl<$Res>
    implements $SessionCreationTemplateDtoCopyWith<$Res> {
  _$SessionCreationTemplateDtoCopyWithImpl(this._self, this._then);

  final SessionCreationTemplateDto _self;
  final $Res Function(SessionCreationTemplateDto) _then;

/// Create a copy of SessionCreationTemplateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? program = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as SessionCreationProgramRefDto,
  ));
}
/// Create a copy of SessionCreationTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCreationProgramRefDtoCopyWith<$Res> get program {
  
  return $SessionCreationProgramRefDtoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}


/// Adds pattern-matching-related methods to [SessionCreationTemplateDto].
extension SessionCreationTemplateDtoPatterns on SessionCreationTemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionCreationTemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionCreationTemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionCreationTemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionCreationTemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionCreationTemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionCreationTemplateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  SessionCreationProgramRefDto program)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionCreationTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.program);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  SessionCreationProgramRefDto program)  $default,) {final _that = this;
switch (_that) {
case _SessionCreationTemplateDto():
return $default(_that.id,_that.name,_that.program);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  SessionCreationProgramRefDto program)?  $default,) {final _that = this;
switch (_that) {
case _SessionCreationTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.program);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionCreationTemplateDto implements SessionCreationTemplateDto {
  const _SessionCreationTemplateDto({required this.id, required this.name, required this.program});
  factory _SessionCreationTemplateDto.fromJson(Map<String, dynamic> json) => _$SessionCreationTemplateDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  SessionCreationProgramRefDto program;

/// Create a copy of SessionCreationTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCreationTemplateDtoCopyWith<_SessionCreationTemplateDto> get copyWith => __$SessionCreationTemplateDtoCopyWithImpl<_SessionCreationTemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionCreationTemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionCreationTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.program, program) || other.program == program));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,program);

@override
String toString() {
  return 'SessionCreationTemplateDto(id: $id, name: $name, program: $program)';
}


}

/// @nodoc
abstract mixin class _$SessionCreationTemplateDtoCopyWith<$Res> implements $SessionCreationTemplateDtoCopyWith<$Res> {
  factory _$SessionCreationTemplateDtoCopyWith(_SessionCreationTemplateDto value, $Res Function(_SessionCreationTemplateDto) _then) = __$SessionCreationTemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, SessionCreationProgramRefDto program
});


@override $SessionCreationProgramRefDtoCopyWith<$Res> get program;

}
/// @nodoc
class __$SessionCreationTemplateDtoCopyWithImpl<$Res>
    implements _$SessionCreationTemplateDtoCopyWith<$Res> {
  __$SessionCreationTemplateDtoCopyWithImpl(this._self, this._then);

  final _SessionCreationTemplateDto _self;
  final $Res Function(_SessionCreationTemplateDto) _then;

/// Create a copy of SessionCreationTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? program = null,}) {
  return _then(_SessionCreationTemplateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,program: null == program ? _self.program : program // ignore: cast_nullable_to_non_nullable
as SessionCreationProgramRefDto,
  ));
}

/// Create a copy of SessionCreationTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCreationProgramRefDtoCopyWith<$Res> get program {
  
  return $SessionCreationProgramRefDtoCopyWith<$Res>(_self.program, (value) {
    return _then(_self.copyWith(program: value));
  });
}
}

// dart format on
