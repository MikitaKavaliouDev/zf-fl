// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_recipe_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerRecipeDto {

 String get id; String get name; String? get description; String? get instructions; double? get proteinG; double? get carbsG; double? get fatG; int? get calories; String? get difficulty; int? get prepTime; int? get cookTime; bool get isPublished; List<RecipeTagDto> get tags; List<ProductDto> get products; String get createdAt;
/// Create a copy of TrainerRecipeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerRecipeDtoCopyWith<TrainerRecipeDto> get copyWith => _$TrainerRecipeDtoCopyWithImpl<TrainerRecipeDto>(this as TrainerRecipeDto, _$identity);

  /// Serializes this TrainerRecipeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerRecipeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.carbsG, carbsG) || other.carbsG == carbsG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.prepTime, prepTime) || other.prepTime == prepTime)&&(identical(other.cookTime, cookTime) || other.cookTime == cookTime)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,instructions,proteinG,carbsG,fatG,calories,difficulty,prepTime,cookTime,isPublished,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(products),createdAt);

@override
String toString() {
  return 'TrainerRecipeDto(id: $id, name: $name, description: $description, instructions: $instructions, proteinG: $proteinG, carbsG: $carbsG, fatG: $fatG, calories: $calories, difficulty: $difficulty, prepTime: $prepTime, cookTime: $cookTime, isPublished: $isPublished, tags: $tags, products: $products, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainerRecipeDtoCopyWith<$Res>  {
  factory $TrainerRecipeDtoCopyWith(TrainerRecipeDto value, $Res Function(TrainerRecipeDto) _then) = _$TrainerRecipeDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? instructions, double? proteinG, double? carbsG, double? fatG, int? calories, String? difficulty, int? prepTime, int? cookTime, bool isPublished, List<RecipeTagDto> tags, List<ProductDto> products, String createdAt
});




}
/// @nodoc
class _$TrainerRecipeDtoCopyWithImpl<$Res>
    implements $TrainerRecipeDtoCopyWith<$Res> {
  _$TrainerRecipeDtoCopyWithImpl(this._self, this._then);

  final TrainerRecipeDto _self;
  final $Res Function(TrainerRecipeDto) _then;

/// Create a copy of TrainerRecipeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? instructions = freezed,Object? proteinG = freezed,Object? carbsG = freezed,Object? fatG = freezed,Object? calories = freezed,Object? difficulty = freezed,Object? prepTime = freezed,Object? cookTime = freezed,Object? isPublished = null,Object? tags = null,Object? products = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,proteinG: freezed == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double?,carbsG: freezed == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double?,fatG: freezed == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,prepTime: freezed == prepTime ? _self.prepTime : prepTime // ignore: cast_nullable_to_non_nullable
as int?,cookTime: freezed == cookTime ? _self.cookTime : cookTime // ignore: cast_nullable_to_non_nullable
as int?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<RecipeTagDto>,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerRecipeDto].
extension TrainerRecipeDtoPatterns on TrainerRecipeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerRecipeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerRecipeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerRecipeDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerRecipeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerRecipeDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerRecipeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? instructions,  double? proteinG,  double? carbsG,  double? fatG,  int? calories,  String? difficulty,  int? prepTime,  int? cookTime,  bool isPublished,  List<RecipeTagDto> tags,  List<ProductDto> products,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerRecipeDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.instructions,_that.proteinG,_that.carbsG,_that.fatG,_that.calories,_that.difficulty,_that.prepTime,_that.cookTime,_that.isPublished,_that.tags,_that.products,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? instructions,  double? proteinG,  double? carbsG,  double? fatG,  int? calories,  String? difficulty,  int? prepTime,  int? cookTime,  bool isPublished,  List<RecipeTagDto> tags,  List<ProductDto> products,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerRecipeDto():
return $default(_that.id,_that.name,_that.description,_that.instructions,_that.proteinG,_that.carbsG,_that.fatG,_that.calories,_that.difficulty,_that.prepTime,_that.cookTime,_that.isPublished,_that.tags,_that.products,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? instructions,  double? proteinG,  double? carbsG,  double? fatG,  int? calories,  String? difficulty,  int? prepTime,  int? cookTime,  bool isPublished,  List<RecipeTagDto> tags,  List<ProductDto> products,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerRecipeDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.instructions,_that.proteinG,_that.carbsG,_that.fatG,_that.calories,_that.difficulty,_that.prepTime,_that.cookTime,_that.isPublished,_that.tags,_that.products,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerRecipeDto implements TrainerRecipeDto {
  const _TrainerRecipeDto({required this.id, required this.name, this.description, this.instructions, this.proteinG, this.carbsG, this.fatG, this.calories, this.difficulty, this.prepTime, this.cookTime, required this.isPublished, final  List<RecipeTagDto> tags = const [], final  List<ProductDto> products = const [], required this.createdAt}): _tags = tags,_products = products;
  factory _TrainerRecipeDto.fromJson(Map<String, dynamic> json) => _$TrainerRecipeDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? instructions;
@override final  double? proteinG;
@override final  double? carbsG;
@override final  double? fatG;
@override final  int? calories;
@override final  String? difficulty;
@override final  int? prepTime;
@override final  int? cookTime;
@override final  bool isPublished;
 final  List<RecipeTagDto> _tags;
@override@JsonKey() List<RecipeTagDto> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<ProductDto> _products;
@override@JsonKey() List<ProductDto> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  String createdAt;

/// Create a copy of TrainerRecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerRecipeDtoCopyWith<_TrainerRecipeDto> get copyWith => __$TrainerRecipeDtoCopyWithImpl<_TrainerRecipeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerRecipeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerRecipeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.proteinG, proteinG) || other.proteinG == proteinG)&&(identical(other.carbsG, carbsG) || other.carbsG == carbsG)&&(identical(other.fatG, fatG) || other.fatG == fatG)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.prepTime, prepTime) || other.prepTime == prepTime)&&(identical(other.cookTime, cookTime) || other.cookTime == cookTime)&&(identical(other.isPublished, isPublished) || other.isPublished == isPublished)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,instructions,proteinG,carbsG,fatG,calories,difficulty,prepTime,cookTime,isPublished,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_products),createdAt);

@override
String toString() {
  return 'TrainerRecipeDto(id: $id, name: $name, description: $description, instructions: $instructions, proteinG: $proteinG, carbsG: $carbsG, fatG: $fatG, calories: $calories, difficulty: $difficulty, prepTime: $prepTime, cookTime: $cookTime, isPublished: $isPublished, tags: $tags, products: $products, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerRecipeDtoCopyWith<$Res> implements $TrainerRecipeDtoCopyWith<$Res> {
  factory _$TrainerRecipeDtoCopyWith(_TrainerRecipeDto value, $Res Function(_TrainerRecipeDto) _then) = __$TrainerRecipeDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? instructions, double? proteinG, double? carbsG, double? fatG, int? calories, String? difficulty, int? prepTime, int? cookTime, bool isPublished, List<RecipeTagDto> tags, List<ProductDto> products, String createdAt
});




}
/// @nodoc
class __$TrainerRecipeDtoCopyWithImpl<$Res>
    implements _$TrainerRecipeDtoCopyWith<$Res> {
  __$TrainerRecipeDtoCopyWithImpl(this._self, this._then);

  final _TrainerRecipeDto _self;
  final $Res Function(_TrainerRecipeDto) _then;

/// Create a copy of TrainerRecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? instructions = freezed,Object? proteinG = freezed,Object? carbsG = freezed,Object? fatG = freezed,Object? calories = freezed,Object? difficulty = freezed,Object? prepTime = freezed,Object? cookTime = freezed,Object? isPublished = null,Object? tags = null,Object? products = null,Object? createdAt = null,}) {
  return _then(_TrainerRecipeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,proteinG: freezed == proteinG ? _self.proteinG : proteinG // ignore: cast_nullable_to_non_nullable
as double?,carbsG: freezed == carbsG ? _self.carbsG : carbsG // ignore: cast_nullable_to_non_nullable
as double?,fatG: freezed == fatG ? _self.fatG : fatG // ignore: cast_nullable_to_non_nullable
as double?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String?,prepTime: freezed == prepTime ? _self.prepTime : prepTime // ignore: cast_nullable_to_non_nullable
as int?,cookTime: freezed == cookTime ? _self.cookTime : cookTime // ignore: cast_nullable_to_non_nullable
as int?,isPublished: null == isPublished ? _self.isPublished : isPublished // ignore: cast_nullable_to_non_nullable
as bool,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<RecipeTagDto>,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<ProductDto>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
