// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_creation_data_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionCreationDataDto {

 List<SessionCreationClientDto> get clients; List<SessionCreationTemplateDto> get templates;
/// Create a copy of SessionCreationDataDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCreationDataDtoCopyWith<SessionCreationDataDto> get copyWith => _$SessionCreationDataDtoCopyWithImpl<SessionCreationDataDto>(this as SessionCreationDataDto, _$identity);

  /// Serializes this SessionCreationDataDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCreationDataDto&&const DeepCollectionEquality().equals(other.clients, clients)&&const DeepCollectionEquality().equals(other.templates, templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(clients),const DeepCollectionEquality().hash(templates));

@override
String toString() {
  return 'SessionCreationDataDto(clients: $clients, templates: $templates)';
}


}

/// @nodoc
abstract mixin class $SessionCreationDataDtoCopyWith<$Res>  {
  factory $SessionCreationDataDtoCopyWith(SessionCreationDataDto value, $Res Function(SessionCreationDataDto) _then) = _$SessionCreationDataDtoCopyWithImpl;
@useResult
$Res call({
 List<SessionCreationClientDto> clients, List<SessionCreationTemplateDto> templates
});




}
/// @nodoc
class _$SessionCreationDataDtoCopyWithImpl<$Res>
    implements $SessionCreationDataDtoCopyWith<$Res> {
  _$SessionCreationDataDtoCopyWithImpl(this._self, this._then);

  final SessionCreationDataDto _self;
  final $Res Function(SessionCreationDataDto) _then;

/// Create a copy of SessionCreationDataDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clients = null,Object? templates = null,}) {
  return _then(_self.copyWith(
clients: null == clients ? _self.clients : clients // ignore: cast_nullable_to_non_nullable
as List<SessionCreationClientDto>,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<SessionCreationTemplateDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionCreationDataDto].
extension SessionCreationDataDtoPatterns on SessionCreationDataDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionCreationDataDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionCreationDataDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionCreationDataDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionCreationDataDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionCreationDataDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionCreationDataDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SessionCreationClientDto> clients,  List<SessionCreationTemplateDto> templates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionCreationDataDto() when $default != null:
return $default(_that.clients,_that.templates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SessionCreationClientDto> clients,  List<SessionCreationTemplateDto> templates)  $default,) {final _that = this;
switch (_that) {
case _SessionCreationDataDto():
return $default(_that.clients,_that.templates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SessionCreationClientDto> clients,  List<SessionCreationTemplateDto> templates)?  $default,) {final _that = this;
switch (_that) {
case _SessionCreationDataDto() when $default != null:
return $default(_that.clients,_that.templates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionCreationDataDto implements SessionCreationDataDto {
  const _SessionCreationDataDto({required final  List<SessionCreationClientDto> clients, required final  List<SessionCreationTemplateDto> templates}): _clients = clients,_templates = templates;
  factory _SessionCreationDataDto.fromJson(Map<String, dynamic> json) => _$SessionCreationDataDtoFromJson(json);

 final  List<SessionCreationClientDto> _clients;
@override List<SessionCreationClientDto> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}

 final  List<SessionCreationTemplateDto> _templates;
@override List<SessionCreationTemplateDto> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}


/// Create a copy of SessionCreationDataDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCreationDataDtoCopyWith<_SessionCreationDataDto> get copyWith => __$SessionCreationDataDtoCopyWithImpl<_SessionCreationDataDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionCreationDataDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionCreationDataDto&&const DeepCollectionEquality().equals(other._clients, _clients)&&const DeepCollectionEquality().equals(other._templates, _templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clients),const DeepCollectionEquality().hash(_templates));

@override
String toString() {
  return 'SessionCreationDataDto(clients: $clients, templates: $templates)';
}


}

/// @nodoc
abstract mixin class _$SessionCreationDataDtoCopyWith<$Res> implements $SessionCreationDataDtoCopyWith<$Res> {
  factory _$SessionCreationDataDtoCopyWith(_SessionCreationDataDto value, $Res Function(_SessionCreationDataDto) _then) = __$SessionCreationDataDtoCopyWithImpl;
@override @useResult
$Res call({
 List<SessionCreationClientDto> clients, List<SessionCreationTemplateDto> templates
});




}
/// @nodoc
class __$SessionCreationDataDtoCopyWithImpl<$Res>
    implements _$SessionCreationDataDtoCopyWith<$Res> {
  __$SessionCreationDataDtoCopyWithImpl(this._self, this._then);

  final _SessionCreationDataDto _self;
  final $Res Function(_SessionCreationDataDto) _then;

/// Create a copy of SessionCreationDataDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clients = null,Object? templates = null,}) {
  return _then(_SessionCreationDataDto(
clients: null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<SessionCreationClientDto>,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<SessionCreationTemplateDto>,
  ));
}


}

// dart format on
