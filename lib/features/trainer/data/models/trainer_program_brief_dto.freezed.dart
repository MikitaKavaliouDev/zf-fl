// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_program_brief_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerProgramBriefDto {

 String get id; String get name; String? get description; String? get trainerId; String? get category; String get createdAt; String? get updatedAt; List<TrainerTemplateSummaryDto> get templates;
/// Create a copy of TrainerProgramBriefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerProgramBriefDtoCopyWith<TrainerProgramBriefDto> get copyWith => _$TrainerProgramBriefDtoCopyWithImpl<TrainerProgramBriefDto>(this as TrainerProgramBriefDto, _$identity);

  /// Serializes this TrainerProgramBriefDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerProgramBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.templates, templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,trainerId,category,createdAt,updatedAt,const DeepCollectionEquality().hash(templates));

@override
String toString() {
  return 'TrainerProgramBriefDto(id: $id, name: $name, description: $description, trainerId: $trainerId, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, templates: $templates)';
}


}

/// @nodoc
abstract mixin class $TrainerProgramBriefDtoCopyWith<$Res>  {
  factory $TrainerProgramBriefDtoCopyWith(TrainerProgramBriefDto value, $Res Function(TrainerProgramBriefDto) _then) = _$TrainerProgramBriefDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? trainerId, String? category, String createdAt, String? updatedAt, List<TrainerTemplateSummaryDto> templates
});




}
/// @nodoc
class _$TrainerProgramBriefDtoCopyWithImpl<$Res>
    implements $TrainerProgramBriefDtoCopyWith<$Res> {
  _$TrainerProgramBriefDtoCopyWithImpl(this._self, this._then);

  final TrainerProgramBriefDto _self;
  final $Res Function(TrainerProgramBriefDto) _then;

/// Create a copy of TrainerProgramBriefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? trainerId = freezed,Object? category = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? templates = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,templates: null == templates ? _self.templates : templates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerProgramBriefDto].
extension TrainerProgramBriefDtoPatterns on TrainerProgramBriefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerProgramBriefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerProgramBriefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerProgramBriefDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerProgramBriefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerProgramBriefDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerProgramBriefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? trainerId,  String? category,  String createdAt,  String? updatedAt,  List<TrainerTemplateSummaryDto> templates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerProgramBriefDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.trainerId,_that.category,_that.createdAt,_that.updatedAt,_that.templates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? trainerId,  String? category,  String createdAt,  String? updatedAt,  List<TrainerTemplateSummaryDto> templates)  $default,) {final _that = this;
switch (_that) {
case _TrainerProgramBriefDto():
return $default(_that.id,_that.name,_that.description,_that.trainerId,_that.category,_that.createdAt,_that.updatedAt,_that.templates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? trainerId,  String? category,  String createdAt,  String? updatedAt,  List<TrainerTemplateSummaryDto> templates)?  $default,) {final _that = this;
switch (_that) {
case _TrainerProgramBriefDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.trainerId,_that.category,_that.createdAt,_that.updatedAt,_that.templates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerProgramBriefDto implements TrainerProgramBriefDto {
  const _TrainerProgramBriefDto({required this.id, required this.name, this.description, this.trainerId, this.category, required this.createdAt, this.updatedAt, final  List<TrainerTemplateSummaryDto> templates = const []}): _templates = templates;
  factory _TrainerProgramBriefDto.fromJson(Map<String, dynamic> json) => _$TrainerProgramBriefDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? trainerId;
@override final  String? category;
@override final  String createdAt;
@override final  String? updatedAt;
 final  List<TrainerTemplateSummaryDto> _templates;
@override@JsonKey() List<TrainerTemplateSummaryDto> get templates {
  if (_templates is EqualUnmodifiableListView) return _templates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_templates);
}


/// Create a copy of TrainerProgramBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerProgramBriefDtoCopyWith<_TrainerProgramBriefDto> get copyWith => __$TrainerProgramBriefDtoCopyWithImpl<_TrainerProgramBriefDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerProgramBriefDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerProgramBriefDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._templates, _templates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,trainerId,category,createdAt,updatedAt,const DeepCollectionEquality().hash(_templates));

@override
String toString() {
  return 'TrainerProgramBriefDto(id: $id, name: $name, description: $description, trainerId: $trainerId, category: $category, createdAt: $createdAt, updatedAt: $updatedAt, templates: $templates)';
}


}

/// @nodoc
abstract mixin class _$TrainerProgramBriefDtoCopyWith<$Res> implements $TrainerProgramBriefDtoCopyWith<$Res> {
  factory _$TrainerProgramBriefDtoCopyWith(_TrainerProgramBriefDto value, $Res Function(_TrainerProgramBriefDto) _then) = __$TrainerProgramBriefDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? trainerId, String? category, String createdAt, String? updatedAt, List<TrainerTemplateSummaryDto> templates
});




}
/// @nodoc
class __$TrainerProgramBriefDtoCopyWithImpl<$Res>
    implements _$TrainerProgramBriefDtoCopyWith<$Res> {
  __$TrainerProgramBriefDtoCopyWithImpl(this._self, this._then);

  final _TrainerProgramBriefDto _self;
  final $Res Function(_TrainerProgramBriefDto) _then;

/// Create a copy of TrainerProgramBriefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? trainerId = freezed,Object? category = freezed,Object? createdAt = null,Object? updatedAt = freezed,Object? templates = null,}) {
  return _then(_TrainerProgramBriefDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,templates: null == templates ? _self._templates : templates // ignore: cast_nullable_to_non_nullable
as List<TrainerTemplateSummaryDto>,
  ));
}


}

// dart format on
