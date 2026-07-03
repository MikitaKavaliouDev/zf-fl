// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_vault_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResourceVaultItemDto {

 String get id; String get title; String? get description; String get fileUrl; String get fileType; String get createdAt;
/// Create a copy of ResourceVaultItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceVaultItemDtoCopyWith<ResourceVaultItemDto> get copyWith => _$ResourceVaultItemDtoCopyWithImpl<ResourceVaultItemDto>(this as ResourceVaultItemDto, _$identity);

  /// Serializes this ResourceVaultItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResourceVaultItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,fileUrl,fileType,createdAt);

@override
String toString() {
  return 'ResourceVaultItemDto(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ResourceVaultItemDtoCopyWith<$Res>  {
  factory $ResourceVaultItemDtoCopyWith(ResourceVaultItemDto value, $Res Function(ResourceVaultItemDto) _then) = _$ResourceVaultItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String fileUrl, String fileType, String createdAt
});




}
/// @nodoc
class _$ResourceVaultItemDtoCopyWithImpl<$Res>
    implements $ResourceVaultItemDtoCopyWith<$Res> {
  _$ResourceVaultItemDtoCopyWithImpl(this._self, this._then);

  final ResourceVaultItemDto _self;
  final $Res Function(ResourceVaultItemDto) _then;

/// Create a copy of ResourceVaultItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? fileUrl = null,Object? fileType = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResourceVaultItemDto].
extension ResourceVaultItemDtoPatterns on ResourceVaultItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResourceVaultItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResourceVaultItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResourceVaultItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ResourceVaultItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResourceVaultItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ResourceVaultItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String fileUrl,  String fileType,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResourceVaultItemDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.fileUrl,_that.fileType,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String fileUrl,  String fileType,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _ResourceVaultItemDto():
return $default(_that.id,_that.title,_that.description,_that.fileUrl,_that.fileType,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String fileUrl,  String fileType,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ResourceVaultItemDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.fileUrl,_that.fileType,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResourceVaultItemDto implements ResourceVaultItemDto {
  const _ResourceVaultItemDto({required this.id, required this.title, this.description, required this.fileUrl, required this.fileType, required this.createdAt});
  factory _ResourceVaultItemDto.fromJson(Map<String, dynamic> json) => _$ResourceVaultItemDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String fileUrl;
@override final  String fileType;
@override final  String createdAt;

/// Create a copy of ResourceVaultItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceVaultItemDtoCopyWith<_ResourceVaultItemDto> get copyWith => __$ResourceVaultItemDtoCopyWithImpl<_ResourceVaultItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceVaultItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResourceVaultItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,fileUrl,fileType,createdAt);

@override
String toString() {
  return 'ResourceVaultItemDto(id: $id, title: $title, description: $description, fileUrl: $fileUrl, fileType: $fileType, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ResourceVaultItemDtoCopyWith<$Res> implements $ResourceVaultItemDtoCopyWith<$Res> {
  factory _$ResourceVaultItemDtoCopyWith(_ResourceVaultItemDto value, $Res Function(_ResourceVaultItemDto) _then) = __$ResourceVaultItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String fileUrl, String fileType, String createdAt
});




}
/// @nodoc
class __$ResourceVaultItemDtoCopyWithImpl<$Res>
    implements _$ResourceVaultItemDtoCopyWith<$Res> {
  __$ResourceVaultItemDtoCopyWithImpl(this._self, this._then);

  final _ResourceVaultItemDto _self;
  final $Res Function(_ResourceVaultItemDto) _then;

/// Create a copy of ResourceVaultItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? fileUrl = null,Object? fileType = null,Object? createdAt = null,}) {
  return _then(_ResourceVaultItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fileUrl: null == fileUrl ? _self.fileUrl : fileUrl // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
