// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductDto {

 String get id; String get recipeId; String get name; String? get brand; String? get amount; bool get isRecommended;
/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDtoCopyWith<ProductDto> get copyWith => _$ProductDtoCopyWithImpl<ProductDto>(this as ProductDto, _$identity);

  /// Serializes this ProductDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeId,name,brand,amount,isRecommended);

@override
String toString() {
  return 'ProductDto(id: $id, recipeId: $recipeId, name: $name, brand: $brand, amount: $amount, isRecommended: $isRecommended)';
}


}

/// @nodoc
abstract mixin class $ProductDtoCopyWith<$Res>  {
  factory $ProductDtoCopyWith(ProductDto value, $Res Function(ProductDto) _then) = _$ProductDtoCopyWithImpl;
@useResult
$Res call({
 String id, String recipeId, String name, String? brand, String? amount, bool isRecommended
});




}
/// @nodoc
class _$ProductDtoCopyWithImpl<$Res>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._self, this._then);

  final ProductDto _self;
  final $Res Function(ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeId = null,Object? name = null,Object? brand = freezed,Object? amount = freezed,Object? isRecommended = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String?,isRecommended: null == isRecommended ? _self.isRecommended : isRecommended // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDto].
extension ProductDtoPatterns on ProductDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDto value)  $default,){
final _that = this;
switch (_that) {
case _ProductDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipeId,  String name,  String? brand,  String? amount,  bool isRecommended)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.recipeId,_that.name,_that.brand,_that.amount,_that.isRecommended);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipeId,  String name,  String? brand,  String? amount,  bool isRecommended)  $default,) {final _that = this;
switch (_that) {
case _ProductDto():
return $default(_that.id,_that.recipeId,_that.name,_that.brand,_that.amount,_that.isRecommended);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipeId,  String name,  String? brand,  String? amount,  bool isRecommended)?  $default,) {final _that = this;
switch (_that) {
case _ProductDto() when $default != null:
return $default(_that.id,_that.recipeId,_that.name,_that.brand,_that.amount,_that.isRecommended);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDto implements ProductDto {
  const _ProductDto({required this.id, required this.recipeId, required this.name, this.brand, this.amount, required this.isRecommended});
  factory _ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

@override final  String id;
@override final  String recipeId;
@override final  String name;
@override final  String? brand;
@override final  String? amount;
@override final  bool isRecommended;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDtoCopyWith<_ProductDto> get copyWith => __$ProductDtoCopyWithImpl<_ProductDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDto&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.isRecommended, isRecommended) || other.isRecommended == isRecommended));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeId,name,brand,amount,isRecommended);

@override
String toString() {
  return 'ProductDto(id: $id, recipeId: $recipeId, name: $name, brand: $brand, amount: $amount, isRecommended: $isRecommended)';
}


}

/// @nodoc
abstract mixin class _$ProductDtoCopyWith<$Res> implements $ProductDtoCopyWith<$Res> {
  factory _$ProductDtoCopyWith(_ProductDto value, $Res Function(_ProductDto) _then) = __$ProductDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipeId, String name, String? brand, String? amount, bool isRecommended
});




}
/// @nodoc
class __$ProductDtoCopyWithImpl<$Res>
    implements _$ProductDtoCopyWith<$Res> {
  __$ProductDtoCopyWithImpl(this._self, this._then);

  final _ProductDto _self;
  final $Res Function(_ProductDto) _then;

/// Create a copy of ProductDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeId = null,Object? name = null,Object? brand = freezed,Object? amount = freezed,Object? isRecommended = null,}) {
  return _then(_ProductDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String?,isRecommended: null == isRecommended ? _self.isRecommended : isRecommended // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
