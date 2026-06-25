// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_social_link_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerSocialLinkDto {

 String get id; String get platform; String get username; String get profileUrl;
/// Create a copy of TrainerSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerSocialLinkDtoCopyWith<TrainerSocialLinkDto> get copyWith => _$TrainerSocialLinkDtoCopyWithImpl<TrainerSocialLinkDto>(this as TrainerSocialLinkDto, _$identity);

  /// Serializes this TrainerSocialLinkDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerSocialLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.username, username) || other.username == username)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,username,profileUrl);

@override
String toString() {
  return 'TrainerSocialLinkDto(id: $id, platform: $platform, username: $username, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class $TrainerSocialLinkDtoCopyWith<$Res>  {
  factory $TrainerSocialLinkDtoCopyWith(TrainerSocialLinkDto value, $Res Function(TrainerSocialLinkDto) _then) = _$TrainerSocialLinkDtoCopyWithImpl;
@useResult
$Res call({
 String id, String platform, String username, String profileUrl
});




}
/// @nodoc
class _$TrainerSocialLinkDtoCopyWithImpl<$Res>
    implements $TrainerSocialLinkDtoCopyWith<$Res> {
  _$TrainerSocialLinkDtoCopyWithImpl(this._self, this._then);

  final TrainerSocialLinkDto _self;
  final $Res Function(TrainerSocialLinkDto) _then;

/// Create a copy of TrainerSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? platform = null,Object? username = null,Object? profileUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerSocialLinkDto].
extension TrainerSocialLinkDtoPatterns on TrainerSocialLinkDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerSocialLinkDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerSocialLinkDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerSocialLinkDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerSocialLinkDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerSocialLinkDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerSocialLinkDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String platform,  String username,  String profileUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerSocialLinkDto() when $default != null:
return $default(_that.id,_that.platform,_that.username,_that.profileUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String platform,  String username,  String profileUrl)  $default,) {final _that = this;
switch (_that) {
case _TrainerSocialLinkDto():
return $default(_that.id,_that.platform,_that.username,_that.profileUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String platform,  String username,  String profileUrl)?  $default,) {final _that = this;
switch (_that) {
case _TrainerSocialLinkDto() when $default != null:
return $default(_that.id,_that.platform,_that.username,_that.profileUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerSocialLinkDto implements TrainerSocialLinkDto {
  const _TrainerSocialLinkDto({required this.id, required this.platform, required this.username, required this.profileUrl});
  factory _TrainerSocialLinkDto.fromJson(Map<String, dynamic> json) => _$TrainerSocialLinkDtoFromJson(json);

@override final  String id;
@override final  String platform;
@override final  String username;
@override final  String profileUrl;

/// Create a copy of TrainerSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerSocialLinkDtoCopyWith<_TrainerSocialLinkDto> get copyWith => __$TrainerSocialLinkDtoCopyWithImpl<_TrainerSocialLinkDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerSocialLinkDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerSocialLinkDto&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.username, username) || other.username == username)&&(identical(other.profileUrl, profileUrl) || other.profileUrl == profileUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,platform,username,profileUrl);

@override
String toString() {
  return 'TrainerSocialLinkDto(id: $id, platform: $platform, username: $username, profileUrl: $profileUrl)';
}


}

/// @nodoc
abstract mixin class _$TrainerSocialLinkDtoCopyWith<$Res> implements $TrainerSocialLinkDtoCopyWith<$Res> {
  factory _$TrainerSocialLinkDtoCopyWith(_TrainerSocialLinkDto value, $Res Function(_TrainerSocialLinkDto) _then) = __$TrainerSocialLinkDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String platform, String username, String profileUrl
});




}
/// @nodoc
class __$TrainerSocialLinkDtoCopyWithImpl<$Res>
    implements _$TrainerSocialLinkDtoCopyWith<$Res> {
  __$TrainerSocialLinkDtoCopyWithImpl(this._self, this._then);

  final _TrainerSocialLinkDto _self;
  final $Res Function(_TrainerSocialLinkDto) _then;

/// Create a copy of TrainerSocialLinkDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? platform = null,Object? username = null,Object? profileUrl = null,}) {
  return _then(_TrainerSocialLinkDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,profileUrl: null == profileUrl ? _self.profileUrl : profileUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
