// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_client_ref_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInClientRefDto {

 String get id; String get name; String? get avatarPath;
/// Create a copy of CheckInClientRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInClientRefDtoCopyWith<CheckInClientRefDto> get copyWith => _$CheckInClientRefDtoCopyWithImpl<CheckInClientRefDto>(this as CheckInClientRefDto, _$identity);

  /// Serializes this CheckInClientRefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInClientRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarPath);

@override
String toString() {
  return 'CheckInClientRefDto(id: $id, name: $name, avatarPath: $avatarPath)';
}


}

/// @nodoc
abstract mixin class $CheckInClientRefDtoCopyWith<$Res>  {
  factory $CheckInClientRefDtoCopyWith(CheckInClientRefDto value, $Res Function(CheckInClientRefDto) _then) = _$CheckInClientRefDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? avatarPath
});




}
/// @nodoc
class _$CheckInClientRefDtoCopyWithImpl<$Res>
    implements $CheckInClientRefDtoCopyWith<$Res> {
  _$CheckInClientRefDtoCopyWithImpl(this._self, this._then);

  final CheckInClientRefDto _self;
  final $Res Function(CheckInClientRefDto) _then;

/// Create a copy of CheckInClientRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatarPath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInClientRefDto].
extension CheckInClientRefDtoPatterns on CheckInClientRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInClientRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInClientRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInClientRefDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInClientRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInClientRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInClientRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarPath)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInClientRefDto() when $default != null:
return $default(_that.id,_that.name,_that.avatarPath);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? avatarPath)  $default,) {final _that = this;
switch (_that) {
case _CheckInClientRefDto():
return $default(_that.id,_that.name,_that.avatarPath);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? avatarPath)?  $default,) {final _that = this;
switch (_that) {
case _CheckInClientRefDto() when $default != null:
return $default(_that.id,_that.name,_that.avatarPath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInClientRefDto implements CheckInClientRefDto {
  const _CheckInClientRefDto({required this.id, required this.name, this.avatarPath});
  factory _CheckInClientRefDto.fromJson(Map<String, dynamic> json) => _$CheckInClientRefDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? avatarPath;

/// Create a copy of CheckInClientRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInClientRefDtoCopyWith<_CheckInClientRefDto> get copyWith => __$CheckInClientRefDtoCopyWithImpl<_CheckInClientRefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInClientRefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInClientRefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatarPath);

@override
String toString() {
  return 'CheckInClientRefDto(id: $id, name: $name, avatarPath: $avatarPath)';
}


}

/// @nodoc
abstract mixin class _$CheckInClientRefDtoCopyWith<$Res> implements $CheckInClientRefDtoCopyWith<$Res> {
  factory _$CheckInClientRefDtoCopyWith(_CheckInClientRefDto value, $Res Function(_CheckInClientRefDto) _then) = __$CheckInClientRefDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? avatarPath
});




}
/// @nodoc
class __$CheckInClientRefDtoCopyWithImpl<$Res>
    implements _$CheckInClientRefDtoCopyWith<$Res> {
  __$CheckInClientRefDtoCopyWithImpl(this._self, this._then);

  final _CheckInClientRefDto _self;
  final $Res Function(_CheckInClientRefDto) _then;

/// Create a copy of CheckInClientRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatarPath = freezed,}) {
  return _then(_CheckInClientRefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
