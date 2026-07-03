// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upsert_nutrition_plan_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpsertNutritionPlanRequestDto {

 String get title; int? get calories; int? get protein; int? get carbs; int? get fats; String? get mealNotes; String? get habitNotes; String? get foodsToEat; String? get foodsToAvoid; String? get mealTiming; String? get hydration; String? get supplements; bool? get isActive; String? get programId;
/// Create a copy of UpsertNutritionPlanRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpsertNutritionPlanRequestDtoCopyWith<UpsertNutritionPlanRequestDto> get copyWith => _$UpsertNutritionPlanRequestDtoCopyWithImpl<UpsertNutritionPlanRequestDto>(this as UpsertNutritionPlanRequestDto, _$identity);

  /// Serializes this UpsertNutritionPlanRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpsertNutritionPlanRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.fats, fats) || other.fats == fats)&&(identical(other.mealNotes, mealNotes) || other.mealNotes == mealNotes)&&(identical(other.habitNotes, habitNotes) || other.habitNotes == habitNotes)&&(identical(other.foodsToEat, foodsToEat) || other.foodsToEat == foodsToEat)&&(identical(other.foodsToAvoid, foodsToAvoid) || other.foodsToAvoid == foodsToAvoid)&&(identical(other.mealTiming, mealTiming) || other.mealTiming == mealTiming)&&(identical(other.hydration, hydration) || other.hydration == hydration)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.programId, programId) || other.programId == programId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,calories,protein,carbs,fats,mealNotes,habitNotes,foodsToEat,foodsToAvoid,mealTiming,hydration,supplements,isActive,programId);

@override
String toString() {
  return 'UpsertNutritionPlanRequestDto(title: $title, calories: $calories, protein: $protein, carbs: $carbs, fats: $fats, mealNotes: $mealNotes, habitNotes: $habitNotes, foodsToEat: $foodsToEat, foodsToAvoid: $foodsToAvoid, mealTiming: $mealTiming, hydration: $hydration, supplements: $supplements, isActive: $isActive, programId: $programId)';
}


}

/// @nodoc
abstract mixin class $UpsertNutritionPlanRequestDtoCopyWith<$Res>  {
  factory $UpsertNutritionPlanRequestDtoCopyWith(UpsertNutritionPlanRequestDto value, $Res Function(UpsertNutritionPlanRequestDto) _then) = _$UpsertNutritionPlanRequestDtoCopyWithImpl;
@useResult
$Res call({
 String title, int? calories, int? protein, int? carbs, int? fats, String? mealNotes, String? habitNotes, String? foodsToEat, String? foodsToAvoid, String? mealTiming, String? hydration, String? supplements, bool? isActive, String? programId
});




}
/// @nodoc
class _$UpsertNutritionPlanRequestDtoCopyWithImpl<$Res>
    implements $UpsertNutritionPlanRequestDtoCopyWith<$Res> {
  _$UpsertNutritionPlanRequestDtoCopyWithImpl(this._self, this._then);

  final UpsertNutritionPlanRequestDto _self;
  final $Res Function(UpsertNutritionPlanRequestDto) _then;

/// Create a copy of UpsertNutritionPlanRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? calories = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fats = freezed,Object? mealNotes = freezed,Object? habitNotes = freezed,Object? foodsToEat = freezed,Object? foodsToAvoid = freezed,Object? mealTiming = freezed,Object? hydration = freezed,Object? supplements = freezed,Object? isActive = freezed,Object? programId = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
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
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpsertNutritionPlanRequestDto].
extension UpsertNutritionPlanRequestDtoPatterns on UpsertNutritionPlanRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpsertNutritionPlanRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpsertNutritionPlanRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpsertNutritionPlanRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpsertNutritionPlanRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpsertNutritionPlanRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpsertNutritionPlanRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int? calories,  int? protein,  int? carbs,  int? fats,  String? mealNotes,  String? habitNotes,  String? foodsToEat,  String? foodsToAvoid,  String? mealTiming,  String? hydration,  String? supplements,  bool? isActive,  String? programId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpsertNutritionPlanRequestDto() when $default != null:
return $default(_that.title,_that.calories,_that.protein,_that.carbs,_that.fats,_that.mealNotes,_that.habitNotes,_that.foodsToEat,_that.foodsToAvoid,_that.mealTiming,_that.hydration,_that.supplements,_that.isActive,_that.programId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int? calories,  int? protein,  int? carbs,  int? fats,  String? mealNotes,  String? habitNotes,  String? foodsToEat,  String? foodsToAvoid,  String? mealTiming,  String? hydration,  String? supplements,  bool? isActive,  String? programId)  $default,) {final _that = this;
switch (_that) {
case _UpsertNutritionPlanRequestDto():
return $default(_that.title,_that.calories,_that.protein,_that.carbs,_that.fats,_that.mealNotes,_that.habitNotes,_that.foodsToEat,_that.foodsToAvoid,_that.mealTiming,_that.hydration,_that.supplements,_that.isActive,_that.programId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int? calories,  int? protein,  int? carbs,  int? fats,  String? mealNotes,  String? habitNotes,  String? foodsToEat,  String? foodsToAvoid,  String? mealTiming,  String? hydration,  String? supplements,  bool? isActive,  String? programId)?  $default,) {final _that = this;
switch (_that) {
case _UpsertNutritionPlanRequestDto() when $default != null:
return $default(_that.title,_that.calories,_that.protein,_that.carbs,_that.fats,_that.mealNotes,_that.habitNotes,_that.foodsToEat,_that.foodsToAvoid,_that.mealTiming,_that.hydration,_that.supplements,_that.isActive,_that.programId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpsertNutritionPlanRequestDto implements UpsertNutritionPlanRequestDto {
  const _UpsertNutritionPlanRequestDto({required this.title, this.calories, this.protein, this.carbs, this.fats, this.mealNotes, this.habitNotes, this.foodsToEat, this.foodsToAvoid, this.mealTiming, this.hydration, this.supplements, this.isActive, this.programId});
  factory _UpsertNutritionPlanRequestDto.fromJson(Map<String, dynamic> json) => _$UpsertNutritionPlanRequestDtoFromJson(json);

@override final  String title;
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
@override final  bool? isActive;
@override final  String? programId;

/// Create a copy of UpsertNutritionPlanRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpsertNutritionPlanRequestDtoCopyWith<_UpsertNutritionPlanRequestDto> get copyWith => __$UpsertNutritionPlanRequestDtoCopyWithImpl<_UpsertNutritionPlanRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpsertNutritionPlanRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpsertNutritionPlanRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.fats, fats) || other.fats == fats)&&(identical(other.mealNotes, mealNotes) || other.mealNotes == mealNotes)&&(identical(other.habitNotes, habitNotes) || other.habitNotes == habitNotes)&&(identical(other.foodsToEat, foodsToEat) || other.foodsToEat == foodsToEat)&&(identical(other.foodsToAvoid, foodsToAvoid) || other.foodsToAvoid == foodsToAvoid)&&(identical(other.mealTiming, mealTiming) || other.mealTiming == mealTiming)&&(identical(other.hydration, hydration) || other.hydration == hydration)&&(identical(other.supplements, supplements) || other.supplements == supplements)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.programId, programId) || other.programId == programId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,calories,protein,carbs,fats,mealNotes,habitNotes,foodsToEat,foodsToAvoid,mealTiming,hydration,supplements,isActive,programId);

@override
String toString() {
  return 'UpsertNutritionPlanRequestDto(title: $title, calories: $calories, protein: $protein, carbs: $carbs, fats: $fats, mealNotes: $mealNotes, habitNotes: $habitNotes, foodsToEat: $foodsToEat, foodsToAvoid: $foodsToAvoid, mealTiming: $mealTiming, hydration: $hydration, supplements: $supplements, isActive: $isActive, programId: $programId)';
}


}

/// @nodoc
abstract mixin class _$UpsertNutritionPlanRequestDtoCopyWith<$Res> implements $UpsertNutritionPlanRequestDtoCopyWith<$Res> {
  factory _$UpsertNutritionPlanRequestDtoCopyWith(_UpsertNutritionPlanRequestDto value, $Res Function(_UpsertNutritionPlanRequestDto) _then) = __$UpsertNutritionPlanRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, int? calories, int? protein, int? carbs, int? fats, String? mealNotes, String? habitNotes, String? foodsToEat, String? foodsToAvoid, String? mealTiming, String? hydration, String? supplements, bool? isActive, String? programId
});




}
/// @nodoc
class __$UpsertNutritionPlanRequestDtoCopyWithImpl<$Res>
    implements _$UpsertNutritionPlanRequestDtoCopyWith<$Res> {
  __$UpsertNutritionPlanRequestDtoCopyWithImpl(this._self, this._then);

  final _UpsertNutritionPlanRequestDto _self;
  final $Res Function(_UpsertNutritionPlanRequestDto) _then;

/// Create a copy of UpsertNutritionPlanRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? calories = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fats = freezed,Object? mealNotes = freezed,Object? habitNotes = freezed,Object? foodsToEat = freezed,Object? foodsToAvoid = freezed,Object? mealTiming = freezed,Object? hydration = freezed,Object? supplements = freezed,Object? isActive = freezed,Object? programId = freezed,}) {
  return _then(_UpsertNutritionPlanRequestDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,calories: freezed == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
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
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
