// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_text_content_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileTextContentDto {

 String? get aboutMe; String? get philosophy; String? get methodology; String? get branding;
/// Create a copy of ProfileTextContentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileTextContentDtoCopyWith<ProfileTextContentDto> get copyWith => _$ProfileTextContentDtoCopyWithImpl<ProfileTextContentDto>(this as ProfileTextContentDto, _$identity);

  /// Serializes this ProfileTextContentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileTextContentDto&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.philosophy, philosophy) || other.philosophy == philosophy)&&(identical(other.methodology, methodology) || other.methodology == methodology)&&(identical(other.branding, branding) || other.branding == branding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aboutMe,philosophy,methodology,branding);

@override
String toString() {
  return 'ProfileTextContentDto(aboutMe: $aboutMe, philosophy: $philosophy, methodology: $methodology, branding: $branding)';
}


}

/// @nodoc
abstract mixin class $ProfileTextContentDtoCopyWith<$Res>  {
  factory $ProfileTextContentDtoCopyWith(ProfileTextContentDto value, $Res Function(ProfileTextContentDto) _then) = _$ProfileTextContentDtoCopyWithImpl;
@useResult
$Res call({
 String? aboutMe, String? philosophy, String? methodology, String? branding
});




}
/// @nodoc
class _$ProfileTextContentDtoCopyWithImpl<$Res>
    implements $ProfileTextContentDtoCopyWith<$Res> {
  _$ProfileTextContentDtoCopyWithImpl(this._self, this._then);

  final ProfileTextContentDto _self;
  final $Res Function(ProfileTextContentDto) _then;

/// Create a copy of ProfileTextContentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? aboutMe = freezed,Object? philosophy = freezed,Object? methodology = freezed,Object? branding = freezed,}) {
  return _then(_self.copyWith(
aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,philosophy: freezed == philosophy ? _self.philosophy : philosophy // ignore: cast_nullable_to_non_nullable
as String?,methodology: freezed == methodology ? _self.methodology : methodology // ignore: cast_nullable_to_non_nullable
as String?,branding: freezed == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileTextContentDto].
extension ProfileTextContentDtoPatterns on ProfileTextContentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileTextContentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileTextContentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileTextContentDto value)  $default,){
final _that = this;
switch (_that) {
case _ProfileTextContentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileTextContentDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileTextContentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? aboutMe,  String? philosophy,  String? methodology,  String? branding)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileTextContentDto() when $default != null:
return $default(_that.aboutMe,_that.philosophy,_that.methodology,_that.branding);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? aboutMe,  String? philosophy,  String? methodology,  String? branding)  $default,) {final _that = this;
switch (_that) {
case _ProfileTextContentDto():
return $default(_that.aboutMe,_that.philosophy,_that.methodology,_that.branding);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? aboutMe,  String? philosophy,  String? methodology,  String? branding)?  $default,) {final _that = this;
switch (_that) {
case _ProfileTextContentDto() when $default != null:
return $default(_that.aboutMe,_that.philosophy,_that.methodology,_that.branding);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileTextContentDto implements ProfileTextContentDto {
  const _ProfileTextContentDto({this.aboutMe, this.philosophy, this.methodology, this.branding});
  factory _ProfileTextContentDto.fromJson(Map<String, dynamic> json) => _$ProfileTextContentDtoFromJson(json);

@override final  String? aboutMe;
@override final  String? philosophy;
@override final  String? methodology;
@override final  String? branding;

/// Create a copy of ProfileTextContentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileTextContentDtoCopyWith<_ProfileTextContentDto> get copyWith => __$ProfileTextContentDtoCopyWithImpl<_ProfileTextContentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileTextContentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileTextContentDto&&(identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe)&&(identical(other.philosophy, philosophy) || other.philosophy == philosophy)&&(identical(other.methodology, methodology) || other.methodology == methodology)&&(identical(other.branding, branding) || other.branding == branding));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,aboutMe,philosophy,methodology,branding);

@override
String toString() {
  return 'ProfileTextContentDto(aboutMe: $aboutMe, philosophy: $philosophy, methodology: $methodology, branding: $branding)';
}


}

/// @nodoc
abstract mixin class _$ProfileTextContentDtoCopyWith<$Res> implements $ProfileTextContentDtoCopyWith<$Res> {
  factory _$ProfileTextContentDtoCopyWith(_ProfileTextContentDto value, $Res Function(_ProfileTextContentDto) _then) = __$ProfileTextContentDtoCopyWithImpl;
@override @useResult
$Res call({
 String? aboutMe, String? philosophy, String? methodology, String? branding
});




}
/// @nodoc
class __$ProfileTextContentDtoCopyWithImpl<$Res>
    implements _$ProfileTextContentDtoCopyWith<$Res> {
  __$ProfileTextContentDtoCopyWithImpl(this._self, this._then);

  final _ProfileTextContentDto _self;
  final $Res Function(_ProfileTextContentDto) _then;

/// Create a copy of ProfileTextContentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? aboutMe = freezed,Object? philosophy = freezed,Object? methodology = freezed,Object? branding = freezed,}) {
  return _then(_ProfileTextContentDto(
aboutMe: freezed == aboutMe ? _self.aboutMe : aboutMe // ignore: cast_nullable_to_non_nullable
as String?,philosophy: freezed == philosophy ? _self.philosophy : philosophy // ignore: cast_nullable_to_non_nullable
as String?,methodology: freezed == methodology ? _self.methodology : methodology // ignore: cast_nullable_to_non_nullable
as String?,branding: freezed == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
