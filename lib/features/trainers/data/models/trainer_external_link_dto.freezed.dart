// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_external_link_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerExternalLinkDto {

 String get id; String get label; String get linkUrl;
/// Create a copy of TrainerExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerExternalLinkDtoCopyWith<TrainerExternalLinkDto> get copyWith => _$TrainerExternalLinkDtoCopyWithImpl<TrainerExternalLinkDto>(this as TrainerExternalLinkDto, _$identity);

  /// Serializes this TrainerExternalLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerExternalLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,linkUrl);

@override
String toString() {
  return 'TrainerExternalLinkDto(id: $id, label: $label, linkUrl: $linkUrl)';
}


}

/// @nodoc
abstract mixin class $TrainerExternalLinkDtoCopyWith<$Res>  {
  factory $TrainerExternalLinkDtoCopyWith(TrainerExternalLinkDto value, $Res Function(TrainerExternalLinkDto) _then) = _$TrainerExternalLinkDtoCopyWithImpl;
@useResult
$Res call({
 String id, String label, String linkUrl
});




}
/// @nodoc
class _$TrainerExternalLinkDtoCopyWithImpl<$Res>
    implements $TrainerExternalLinkDtoCopyWith<$Res> {
  _$TrainerExternalLinkDtoCopyWithImpl(this._self, this._then);

  final TrainerExternalLinkDto _self;
  final $Res Function(TrainerExternalLinkDto) _then;

/// Create a copy of TrainerExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? linkUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,linkUrl: null == linkUrl ? _self.linkUrl : linkUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerExternalLinkDto].
extension TrainerExternalLinkDtoPatterns on TrainerExternalLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerExternalLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerExternalLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerExternalLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerExternalLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerExternalLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerExternalLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  String linkUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerExternalLinkDto() when $default != null:
return $default(_that.id,_that.label,_that.linkUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  String linkUrl)  $default,) {final _that = this;
switch (_that) {
case _TrainerExternalLinkDto():
return $default(_that.id,_that.label,_that.linkUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  String linkUrl)?  $default,) {final _that = this;
switch (_that) {
case _TrainerExternalLinkDto() when $default != null:
return $default(_that.id,_that.label,_that.linkUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerExternalLinkDto implements TrainerExternalLinkDto {
  const _TrainerExternalLinkDto({required this.id, required this.label, required this.linkUrl});
  factory _TrainerExternalLinkDto.fromJson(Map<String, dynamic> json) => _$TrainerExternalLinkDtoFromJson(json);

@override final  String id;
@override final  String label;
@override final  String linkUrl;

/// Create a copy of TrainerExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerExternalLinkDtoCopyWith<_TrainerExternalLinkDto> get copyWith => __$TrainerExternalLinkDtoCopyWithImpl<_TrainerExternalLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerExternalLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerExternalLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,linkUrl);

@override
String toString() {
  return 'TrainerExternalLinkDto(id: $id, label: $label, linkUrl: $linkUrl)';
}


}

/// @nodoc
abstract mixin class _$TrainerExternalLinkDtoCopyWith<$Res> implements $TrainerExternalLinkDtoCopyWith<$Res> {
  factory _$TrainerExternalLinkDtoCopyWith(_TrainerExternalLinkDto value, $Res Function(_TrainerExternalLinkDto) _then) = __$TrainerExternalLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, String linkUrl
});




}
/// @nodoc
class __$TrainerExternalLinkDtoCopyWithImpl<$Res>
    implements _$TrainerExternalLinkDtoCopyWith<$Res> {
  __$TrainerExternalLinkDtoCopyWithImpl(this._self, this._then);

  final _TrainerExternalLinkDto _self;
  final $Res Function(_TrainerExternalLinkDto) _then;

/// Create a copy of TrainerExternalLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? linkUrl = null,}) {
  return _then(_TrainerExternalLinkDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,linkUrl: null == linkUrl ? _self.linkUrl : linkUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
