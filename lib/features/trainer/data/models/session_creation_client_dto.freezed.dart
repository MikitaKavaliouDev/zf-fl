// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_creation_client_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionCreationClientDto {

 String get id; String get name; int get availableCredits;
/// Create a copy of SessionCreationClientDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCreationClientDtoCopyWith<SessionCreationClientDto> get copyWith => _$SessionCreationClientDtoCopyWithImpl<SessionCreationClientDto>(this as SessionCreationClientDto, _$identity);

  /// Serializes this SessionCreationClientDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCreationClientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.availableCredits, availableCredits) || other.availableCredits == availableCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,availableCredits);

@override
String toString() {
  return 'SessionCreationClientDto(id: $id, name: $name, availableCredits: $availableCredits)';
}


}

/// @nodoc
abstract mixin class $SessionCreationClientDtoCopyWith<$Res>  {
  factory $SessionCreationClientDtoCopyWith(SessionCreationClientDto value, $Res Function(SessionCreationClientDto) _then) = _$SessionCreationClientDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, int availableCredits
});




}
/// @nodoc
class _$SessionCreationClientDtoCopyWithImpl<$Res>
    implements $SessionCreationClientDtoCopyWith<$Res> {
  _$SessionCreationClientDtoCopyWithImpl(this._self, this._then);

  final SessionCreationClientDto _self;
  final $Res Function(SessionCreationClientDto) _then;

/// Create a copy of SessionCreationClientDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? availableCredits = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,availableCredits: null == availableCredits ? _self.availableCredits : availableCredits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionCreationClientDto].
extension SessionCreationClientDtoPatterns on SessionCreationClientDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionCreationClientDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionCreationClientDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionCreationClientDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionCreationClientDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionCreationClientDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionCreationClientDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int availableCredits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionCreationClientDto() when $default != null:
return $default(_that.id,_that.name,_that.availableCredits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int availableCredits)  $default,) {final _that = this;
switch (_that) {
case _SessionCreationClientDto():
return $default(_that.id,_that.name,_that.availableCredits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int availableCredits)?  $default,) {final _that = this;
switch (_that) {
case _SessionCreationClientDto() when $default != null:
return $default(_that.id,_that.name,_that.availableCredits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionCreationClientDto implements SessionCreationClientDto {
  const _SessionCreationClientDto({required this.id, required this.name, required this.availableCredits});
  factory _SessionCreationClientDto.fromJson(Map<String, dynamic> json) => _$SessionCreationClientDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  int availableCredits;

/// Create a copy of SessionCreationClientDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionCreationClientDtoCopyWith<_SessionCreationClientDto> get copyWith => __$SessionCreationClientDtoCopyWithImpl<_SessionCreationClientDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionCreationClientDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionCreationClientDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.availableCredits, availableCredits) || other.availableCredits == availableCredits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,availableCredits);

@override
String toString() {
  return 'SessionCreationClientDto(id: $id, name: $name, availableCredits: $availableCredits)';
}


}

/// @nodoc
abstract mixin class _$SessionCreationClientDtoCopyWith<$Res> implements $SessionCreationClientDtoCopyWith<$Res> {
  factory _$SessionCreationClientDtoCopyWith(_SessionCreationClientDto value, $Res Function(_SessionCreationClientDto) _then) = __$SessionCreationClientDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int availableCredits
});




}
/// @nodoc
class __$SessionCreationClientDtoCopyWithImpl<$Res>
    implements _$SessionCreationClientDtoCopyWith<$Res> {
  __$SessionCreationClientDtoCopyWithImpl(this._self, this._then);

  final _SessionCreationClientDto _self;
  final $Res Function(_SessionCreationClientDto) _then;

/// Create a copy of SessionCreationClientDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? availableCredits = null,}) {
  return _then(_SessionCreationClientDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,availableCredits: null == availableCredits ? _self.availableCredits : availableCredits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
