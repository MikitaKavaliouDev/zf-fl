// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_template_summary_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerTemplateSummaryDto {

 String get id; String get name; String? get description; int get order; String? get programId;@JsonKey(name: '_count', fromJson: countToExerciseCount) int get exerciseCount;
/// Create a copy of TrainerTemplateSummaryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerTemplateSummaryDtoCopyWith<TrainerTemplateSummaryDto> get copyWith => _$TrainerTemplateSummaryDtoCopyWithImpl<TrainerTemplateSummaryDto>(this as TrainerTemplateSummaryDto, _$identity);

  /// Serializes this TrainerTemplateSummaryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerTemplateSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,order,programId,exerciseCount);

@override
String toString() {
  return 'TrainerTemplateSummaryDto(id: $id, name: $name, description: $description, order: $order, programId: $programId, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class $TrainerTemplateSummaryDtoCopyWith<$Res>  {
  factory $TrainerTemplateSummaryDtoCopyWith(TrainerTemplateSummaryDto value, $Res Function(TrainerTemplateSummaryDto) _then) = _$TrainerTemplateSummaryDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, int order, String? programId,@JsonKey(name: '_count', fromJson: countToExerciseCount) int exerciseCount
});




}
/// @nodoc
class _$TrainerTemplateSummaryDtoCopyWithImpl<$Res>
    implements $TrainerTemplateSummaryDtoCopyWith<$Res> {
  _$TrainerTemplateSummaryDtoCopyWithImpl(this._self, this._then);

  final TrainerTemplateSummaryDto _self;
  final $Res Function(TrainerTemplateSummaryDto) _then;

/// Create a copy of TrainerTemplateSummaryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? order = null,Object? programId = freezed,Object? exerciseCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerTemplateSummaryDto].
extension TrainerTemplateSummaryDtoPatterns on TrainerTemplateSummaryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerTemplateSummaryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerTemplateSummaryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerTemplateSummaryDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerTemplateSummaryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerTemplateSummaryDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerTemplateSummaryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int order,  String? programId, @JsonKey(name: '_count', fromJson: countToExerciseCount)  int exerciseCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerTemplateSummaryDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.order,_that.programId,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int order,  String? programId, @JsonKey(name: '_count', fromJson: countToExerciseCount)  int exerciseCount)  $default,) {final _that = this;
switch (_that) {
case _TrainerTemplateSummaryDto():
return $default(_that.id,_that.name,_that.description,_that.order,_that.programId,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  int order,  String? programId, @JsonKey(name: '_count', fromJson: countToExerciseCount)  int exerciseCount)?  $default,) {final _that = this;
switch (_that) {
case _TrainerTemplateSummaryDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.order,_that.programId,_that.exerciseCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerTemplateSummaryDto implements TrainerTemplateSummaryDto {
  const _TrainerTemplateSummaryDto({required this.id, required this.name, this.description, required this.order, this.programId, @JsonKey(name: '_count', fromJson: countToExerciseCount) this.exerciseCount = 0});
  factory _TrainerTemplateSummaryDto.fromJson(Map<String, dynamic> json) => _$TrainerTemplateSummaryDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  int order;
@override final  String? programId;
@override@JsonKey(name: '_count', fromJson: countToExerciseCount) final  int exerciseCount;

/// Create a copy of TrainerTemplateSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerTemplateSummaryDtoCopyWith<_TrainerTemplateSummaryDto> get copyWith => __$TrainerTemplateSummaryDtoCopyWithImpl<_TrainerTemplateSummaryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerTemplateSummaryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerTemplateSummaryDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,order,programId,exerciseCount);

@override
String toString() {
  return 'TrainerTemplateSummaryDto(id: $id, name: $name, description: $description, order: $order, programId: $programId, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class _$TrainerTemplateSummaryDtoCopyWith<$Res> implements $TrainerTemplateSummaryDtoCopyWith<$Res> {
  factory _$TrainerTemplateSummaryDtoCopyWith(_TrainerTemplateSummaryDto value, $Res Function(_TrainerTemplateSummaryDto) _then) = __$TrainerTemplateSummaryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, int order, String? programId,@JsonKey(name: '_count', fromJson: countToExerciseCount) int exerciseCount
});




}
/// @nodoc
class __$TrainerTemplateSummaryDtoCopyWithImpl<$Res>
    implements _$TrainerTemplateSummaryDtoCopyWith<$Res> {
  __$TrainerTemplateSummaryDtoCopyWithImpl(this._self, this._then);

  final _TrainerTemplateSummaryDto _self;
  final $Res Function(_TrainerTemplateSummaryDto) _then;

/// Create a copy of TrainerTemplateSummaryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? order = null,Object? programId = freezed,Object? exerciseCount = null,}) {
  return _then(_TrainerTemplateSummaryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,programId: freezed == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String?,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
