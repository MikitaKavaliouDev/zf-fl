// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_nutrition_plan_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerNutritionPlanDto {

 String get id; String get title; String? get programId; int? get calories; int? get protein; int? get carbs; int? get fats; String? get mealNotes; String? get habitNotes; String? get foodsToEat; String? get foodsToAvoid; String? get mealTiming; String? get hydration; String? get supplements; bool get isActive; String get createdAt;
/// Create a copy of TrainerNutritionPlanDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerNutritionPlanDtoCopyWith<TrainerNutritionPlanDto> get copyWith => _$TrainerNutritionPlanDtoCopyWithImpl<TrainerNutritionPlanDto>(this as TrainerNutritionPlanDto, _$identity);

  /// Serializes this TrainerNutritionPlanDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerNutritionPlanDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.fats, fats) || other.fats == fats)&&(identical(other.mealNotes, mealNotes) || other.mealNotes == mealNotes)&&(identical(other.habitNotes, habitNotes) || other.habitNotes == habitNotes)&&(identical(other.foodsToEat, foodsToEat) || other.foodsToEat == foodsToEat)&&(identical(other.foodsToAvoid, foodsToAvoid) || other.foodsToAvoid == foodsToAvoid)&&(identical(other.mealTiming, mealTiming) || other.mealTiming == mealTiming)&&(identical(other.hydration, hydration) || other.hydration == hydration)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,programId,calories,protein,carbs,fats,mealNotes,habitNotes,foodsToEat,foodsToAvoid,mealTiming,hydration,supplements,isActive,createdAt);

@override
String toString() {
  return 'TrainerNutritionPlanDto(id: $id, title: $title, programId: $programId, calories: $calories, protein: $protein, carbs: $carbs, fats: $fats, mealNotes: $mealNotes, habitNotes: $habitNotes, foodsToEat: $foodsToEat, foodsToAvoid: $foodsToAvoid, mealTiming: $mealTiming, hydration: $hydration, supplements: $supplements, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainerNutritionPlanDtoCopyWith<$Res>  {
  factory $TrainerNutritionPlanDtoCopyWith(TrainerNutritionPlanDto value, $Res Function(TrainerNutritionPlanDto) _then) = _$TrainerNutritionPlanDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? programId, int? calories, int? protein, int? carbs, int? fats, String? mealNotes, String? habitNotes, String? foodsToEat, String? foodsToAvoid, String? mealTiming, String? hydration, String? supplements, bool isActive, String createdAt
});




}
/// @nodoc
class _$TrainerNutritionPlanDtoCopyWithImpl<$Res>
    implements $TrainerNutritionPlanDtoCopyWith<$Res> {
  _$TrainerNutritionPlanDtoCopyWithImpl(this._self, this._then);

  final TrainerNutritionPlanDto _self;
  final $Res Function(TrainerNutritionPlanDto) _then;

/// Create a copy of TrainerNutritionPlanDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? programId = freezed,Object? calories = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fats = freezed,Object? mealNotes = freezed,Object? habitNotes = freezed,Object? foodsToEat = freezed,Object? foodsToAvoid = freezed,Object? mealTiming = freezed,Object? hydration = freezed,Object? supplements = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as int?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as int?,fats: freezed == fats ? _self.fats : fats // ignore: cast_nullable_to_non_nullable
as int?,mealNotes: freezed == mealNotes ? _self.mealNotes : mealNotes // ignore: cast_nullable_to_non_nullable
as String?,habitNotes: freezed == habitNotes ? _self.habitNotes : habitNotes // ignore: cast_nullable_to_non_nullable
as String?,foodsToEat: freezed == foodsToEat ? _self.foodsToEat : foodsToEat // ignore: cast_nullable_to_non_nullable
as String?,foodsToAvoid: freezed == foodsToAvoid ? _self.foodsToAvoid : foodsToAvoid // ignore: cast_nullable_to_non_nullable
as String?,mealTiming: freezed == mealTiming ? _self.mealTiming : mealTiming // ignore: cast_nullable_to_non_nullable
as String?,hydration: freezed == hydration ? _self.hydration : hydration // ignore: cast_nullable_to_non_nullable
as String?,supplements: freezed == supplements ? _self.supplements : supplements // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerNutritionPlanDto].
extension TrainerNutritionPlanDtoPatterns on TrainerNutritionPlanDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerNutritionPlanDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerNutritionPlanDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerNutritionPlanDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerNutritionPlanDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerNutritionPlanDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerNutritionPlanDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? programId,  int? calories,  int? protein,  int? carbs,  int? fats,  String? mealNotes,  String? habitNotes,  String? foodsToEat,  String? foodsToAvoid,  String? mealTiming,  String? hydration,  String? supplements,  bool isActive,  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerNutritionPlanDto() when $default != null:
return $default(_that.id,_that.title,_that.programId,_that.calories,_that.protein,_that.carbs,_that.fats,_that.mealNotes,_that.habitNotes,_that.foodsToEat,_that.foodsToAvoid,_that.mealTiming,_that.hydration,_that.supplements,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? programId,  int? calories,  int? protein,  int? carbs,  int? fats,  String? mealNotes,  String? habitNotes,  String? foodsToEat,  String? foodsToAvoid,  String? mealTiming,  String? hydration,  String? supplements,  bool isActive,  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerNutritionPlanDto():
return $default(_that.id,_that.title,_that.programId,_that.calories,_that.protein,_that.carbs,_that.fats,_that.mealNotes,_that.habitNotes,_that.foodsToEat,_that.foodsToAvoid,_that.mealTiming,_that.hydration,_that.supplements,_that.isActive,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? programId,  int? calories,  int? protein,  int? carbs,  int? fats,  String? mealNotes,  String? habitNotes,  String? foodsToEat,  String? foodsToAvoid,  String? mealTiming,  String? hydration,  String? supplements,  bool isActive,  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerNutritionPlanDto() when $default != null:
return $default(_that.id,_that.title,_that.programId,_that.calories,_that.protein,_that.carbs,_that.fats,_that.mealNotes,_that.habitNotes,_that.foodsToEat,_that.foodsToAvoid,_that.mealTiming,_that.hydration,_that.supplements,_that.isActive,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerNutritionPlanDto implements TrainerNutritionPlanDto {
  const _TrainerNutritionPlanDto({required this.id, required this.title, this.programId, this.calories, this.protein, this.carbs, this.fats, this.mealNotes, this.habitNotes, this.foodsToEat, this.foodsToAvoid, this.mealTiming, this.hydration, this.supplements, required this.isActive, required this.createdAt});
  factory _TrainerNutritionPlanDto.fromJson(Map<String, dynamic> json) => _$TrainerNutritionPlanDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? programId;
@override final  int? calories;
@override final  int? protein;
@override final  int? carbs;
@override final  int? fats;
@override final  String? mealNotes;
@override final  String? habitNotes;
@override final  String? foodsToEat;
@override final  String? foodsToAvoid;
@override final  String? mealTiming;
@override final  String? hydration;
@override final  String? supplements;
@override final  bool isActive;
@override final  String createdAt;

/// Create a copy of TrainerNutritionPlanDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerNutritionPlanDtoCopyWith<_TrainerNutritionPlanDto> get copyWith => __$TrainerNutritionPlanDtoCopyWithImpl<_TrainerNutritionPlanDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerNutritionPlanDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerNutritionPlanDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.fats, fats) || other.fats == fats)&&(identical(other.mealNotes, mealNotes) || other.mealNotes == mealNotes)&&(identical(other.habitNotes, habitNotes) || other.habitNotes == habitNotes)&&(identical(other.foodsToEat, foodsToEat) || other.foodsToEat == foodsToEat)&&(identical(other.foodsToAvoid, foodsToAvoid) || other.foodsToAvoid == foodsToAvoid)&&(identical(other.mealTiming, mealTiming) || other.mealTiming == mealTiming)&&(identical(other.hydration, hydration) || other.hydration == hydration)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,programId,calories,protein,carbs,fats,mealNotes,habitNotes,foodsToEat,foodsToAvoid,mealTiming,hydration,supplements,isActive,createdAt);

@override
String toString() {
  return 'TrainerNutritionPlanDto(id: $id, title: $title, programId: $programId, calories: $calories, protein: $protein, carbs: $carbs, fats: $fats, mealNotes: $mealNotes, habitNotes: $habitNotes, foodsToEat: $foodsToEat, foodsToAvoid: $foodsToAvoid, mealTiming: $mealTiming, hydration: $hydration, supplements: $supplements, isActive: $isActive, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerNutritionPlanDtoCopyWith<$Res> implements $TrainerNutritionPlanDtoCopyWith<$Res> {
  factory _$TrainerNutritionPlanDtoCopyWith(_TrainerNutritionPlanDto value, $Res Function(_TrainerNutritionPlanDto) _then) = __$TrainerNutritionPlanDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? programId, int? calories, int? protein, int? carbs, int? fats, String? mealNotes, String? habitNotes, String? foodsToEat, String? foodsToAvoid, String? mealTiming, String? hydration, String? supplements, bool isActive, String createdAt
});




}
/// @nodoc
class __$TrainerNutritionPlanDtoCopyWithImpl<$Res>
    implements _$TrainerNutritionPlanDtoCopyWith<$Res> {
  __$TrainerNutritionPlanDtoCopyWithImpl(this._self, this._then);

  final _TrainerNutritionPlanDto _self;
  final $Res Function(_TrainerNutritionPlanDto) _then;

/// Create a copy of TrainerNutritionPlanDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? programId = freezed,Object? calories = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fats = freezed,Object? mealNotes = freezed,Object? habitNotes = freezed,Object? foodsToEat = freezed,Object? foodsToAvoid = freezed,Object? mealTiming = freezed,Object? hydration = freezed,Object? supplements = freezed,Object? isActive = null,Object? createdAt = null,}) {
  return _then(_TrainerNutritionPlanDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as int?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as int?,fats: freezed == fats ? _self.fats : fats // ignore: cast_nullable_to_non_nullable
as int?,mealNotes: freezed == mealNotes ? _self.mealNotes : mealNotes // ignore: cast_nullable_to_non_nullable
as String?,habitNotes: freezed == habitNotes ? _self.habitNotes : habitNotes // ignore: cast_nullable_to_non_nullable
as String?,foodsToEat: freezed == foodsToEat ? _self.foodsToEat : foodsToEat // ignore: cast_nullable_to_non_nullable
as String?,foodsToAvoid: freezed == foodsToAvoid ? _self.foodsToAvoid : foodsToAvoid // ignore: cast_nullable_to_non_nullable
as String?,mealTiming: freezed == mealTiming ? _self.mealTiming : mealTiming // ignore: cast_nullable_to_non_nullable
as String?,hydration: freezed == hydration ? _self.hydration : hydration // ignore: cast_nullable_to_non_nullable
as String?,supplements: freezed == supplements ? _self.supplements : supplements // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
