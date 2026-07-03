// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeTagDto {

 String get id; String get recipeId; String get name;
/// Create a copy of RecipeTagDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeTagDtoCopyWith<RecipeTagDto> get copyWith => _$RecipeTagDtoCopyWithImpl<RecipeTagDto>(this as RecipeTagDto, _$identity);

  /// Serializes this RecipeTagDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeTagDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeId,name);

@override
String toString() {
  return 'RecipeTagDto(id: $id, recipeId: $recipeId, name: $name)';
}


}

/// @nodoc
abstract mixin class $RecipeTagDtoCopyWith<$Res>  {
  factory $RecipeTagDtoCopyWith(RecipeTagDto value, $Res Function(RecipeTagDto) _then) = _$RecipeTagDtoCopyWithImpl;
@useResult
$Res call({
 String id, String recipeId, String name
});




}
/// @nodoc
class _$RecipeTagDtoCopyWithImpl<$Res>
    implements $RecipeTagDtoCopyWith<$Res> {
  _$RecipeTagDtoCopyWithImpl(this._self, this._then);

  final RecipeTagDto _self;
  final $Res Function(RecipeTagDto) _then;

/// Create a copy of RecipeTagDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeId = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeTagDto].
extension RecipeTagDtoPatterns on RecipeTagDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeTagDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeTagDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeTagDto value)  $default,){
final _that = this;
switch (_that) {
case _RecipeTagDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeTagDto value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeTagDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipeId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeTagDto() when $default != null:
return $default(_that.id,_that.recipeId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipeId,  String name)  $default,) {final _that = this;
switch (_that) {
case _RecipeTagDto():
return $default(_that.id,_that.recipeId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipeId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _RecipeTagDto() when $default != null:
return $default(_that.id,_that.recipeId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeTagDto implements RecipeTagDto {
  const _RecipeTagDto({required this.id, required this.recipeId, required this.name});
  factory _RecipeTagDto.fromJson(Map<String, dynamic> json) => _$RecipeTagDtoFromJson(json);

@override final  String id;
@override final  String recipeId;
@override final  String name;

/// Create a copy of RecipeTagDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeTagDtoCopyWith<_RecipeTagDto> get copyWith => __$RecipeTagDtoCopyWithImpl<_RecipeTagDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeTagDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeTagDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeId,name);

@override
String toString() {
  return 'RecipeTagDto(id: $id, recipeId: $recipeId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$RecipeTagDtoCopyWith<$Res> implements $RecipeTagDtoCopyWith<$Res> {
  factory _$RecipeTagDtoCopyWith(_RecipeTagDto value, $Res Function(_RecipeTagDto) _then) = __$RecipeTagDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipeId, String name
});




}
/// @nodoc
class __$RecipeTagDtoCopyWithImpl<$Res>
    implements _$RecipeTagDtoCopyWith<$Res> {
  __$RecipeTagDtoCopyWithImpl(this._self, this._then);

  final _RecipeTagDto _self;
  final $Res Function(_RecipeTagDto) _then;

/// Create a copy of RecipeTagDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeId = null,Object? name = null,}) {
  return _then(_RecipeTagDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
