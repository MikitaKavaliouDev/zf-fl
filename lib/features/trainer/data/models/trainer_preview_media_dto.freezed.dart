// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_preview_media_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerPreviewMediaDto {

 String get id; int get order; String get type; String get url; String? get thumbnailUrl; String? get caption; String get createdAt;
/// Create a copy of TrainerPreviewMediaDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerPreviewMediaDtoCopyWith<TrainerPreviewMediaDto> get copyWith => _$TrainerPreviewMediaDtoCopyWithImpl<TrainerPreviewMediaDto>(this as TrainerPreviewMediaDto, _$identity);

  /// Serializes this TrainerPreviewMediaDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerPreviewMediaDto&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,type,url,thumbnailUrl,caption,createdAt);

@override
String toString() {
  return 'TrainerPreviewMediaDto(id: $id, order: $order, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, caption: $caption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainerPreviewMediaDtoCopyWith<$Res>  {
  factory $TrainerPreviewMediaDtoCopyWith(TrainerPreviewMediaDto value, $Res Function(TrainerPreviewMediaDto) _then) = _$TrainerPreviewMediaDtoCopyWithImpl;
@useResult
$Res call({
 String id, int order, String type, String url, String? thumbnailUrl, String? caption, String createdAt
});




}
/// @nodoc
class _$TrainerPreviewMediaDtoCopyWithImpl<$Res>
    implements $TrainerPreviewMediaDtoCopyWith<$Res> {
  _$TrainerPreviewMediaDtoCopyWithImpl(this._self, this._then);

  final TrainerPreviewMediaDto _self;
  final $Res Function(TrainerPreviewMediaDto) _then;

/// Create a copy of TrainerPreviewMediaDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? order = null,Object? type = null,Object? url = null,Object? thumbnailUrl = freezed,Object? caption = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerPreviewMediaDto].
extension TrainerPreviewMediaDtoPatterns on TrainerPreviewMediaDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerPreviewMediaDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerPreviewMediaDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerPreviewMediaDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerPreviewMediaDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerPreviewMediaDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerPreviewMediaDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int order,  String type,  String url,  String? thumbnailUrl,  String? caption,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerPreviewMediaDto() when $default != null:
return $default(_that.id,_that.order,_that.type,_that.url,_that.thumbnailUrl,_that.caption,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int order,  String type,  String url,  String? thumbnailUrl,  String? caption,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerPreviewMediaDto():
return $default(_that.id,_that.order,_that.type,_that.url,_that.thumbnailUrl,_that.caption,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int order,  String type,  String url,  String? thumbnailUrl,  String? caption,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerPreviewMediaDto() when $default != null:
return $default(_that.id,_that.order,_that.type,_that.url,_that.thumbnailUrl,_that.caption,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerPreviewMediaDto implements TrainerPreviewMediaDto {
  const _TrainerPreviewMediaDto({required this.id, required this.order, required this.type, required this.url, this.thumbnailUrl, this.caption, required this.createdAt});
  factory _TrainerPreviewMediaDto.fromJson(Map<String, dynamic> json) => _$TrainerPreviewMediaDtoFromJson(json);

@override final  String id;
@override final  int order;
@override final  String type;
@override final  String url;
@override final  String? thumbnailUrl;
@override final  String? caption;
@override final  String createdAt;

/// Create a copy of TrainerPreviewMediaDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerPreviewMediaDtoCopyWith<_TrainerPreviewMediaDto> get copyWith => __$TrainerPreviewMediaDtoCopyWithImpl<_TrainerPreviewMediaDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerPreviewMediaDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerPreviewMediaDto&&(identical(other.id, id) || other.id == id)&&(identical(other.order, order) || other.order == order)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.caption, caption) || other.caption == caption)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,order,type,url,thumbnailUrl,caption,createdAt);

@override
String toString() {
  return 'TrainerPreviewMediaDto(id: $id, order: $order, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, caption: $caption, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerPreviewMediaDtoCopyWith<$Res> implements $TrainerPreviewMediaDtoCopyWith<$Res> {
  factory _$TrainerPreviewMediaDtoCopyWith(_TrainerPreviewMediaDto value, $Res Function(_TrainerPreviewMediaDto) _then) = __$TrainerPreviewMediaDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int order, String type, String url, String? thumbnailUrl, String? caption, String createdAt
});




}
/// @nodoc
class __$TrainerPreviewMediaDtoCopyWithImpl<$Res>
    implements _$TrainerPreviewMediaDtoCopyWith<$Res> {
  __$TrainerPreviewMediaDtoCopyWithImpl(this._self, this._then);

  final _TrainerPreviewMediaDto _self;
  final $Res Function(_TrainerPreviewMediaDto) _then;

/// Create a copy of TrainerPreviewMediaDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? order = null,Object? type = null,Object? url = null,Object? thumbnailUrl = freezed,Object? caption = freezed,Object? createdAt = null,}) {
  return _then(_TrainerPreviewMediaDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,caption: freezed == caption ? _self.caption : caption // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
