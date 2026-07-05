// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_program_template_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerClientProgramTemplateDto {

 String get id; String get name; String? get description; int get order; String get status; int get exerciseCount;
/// Create a copy of TrainerClientProgramTemplateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientProgramTemplateDtoCopyWith<TrainerClientProgramTemplateDto> get copyWith => _$TrainerClientProgramTemplateDtoCopyWithImpl<TrainerClientProgramTemplateDto>(this as TrainerClientProgramTemplateDto, _$identity);

  /// Serializes this TrainerClientProgramTemplateDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientProgramTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.status, status) || other.status == status)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,order,status,exerciseCount);

@override
String toString() {
  return 'TrainerClientProgramTemplateDto(id: $id, name: $name, description: $description, order: $order, status: $status, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class $TrainerClientProgramTemplateDtoCopyWith<$Res>  {
  factory $TrainerClientProgramTemplateDtoCopyWith(TrainerClientProgramTemplateDto value, $Res Function(TrainerClientProgramTemplateDto) _then) = _$TrainerClientProgramTemplateDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, int order, String status, int exerciseCount
});




}
/// @nodoc
class _$TrainerClientProgramTemplateDtoCopyWithImpl<$Res>
    implements $TrainerClientProgramTemplateDtoCopyWith<$Res> {
  _$TrainerClientProgramTemplateDtoCopyWithImpl(this._self, this._then);

  final TrainerClientProgramTemplateDto _self;
  final $Res Function(TrainerClientProgramTemplateDto) _then;

/// Create a copy of TrainerClientProgramTemplateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? order = null,Object? status = null,Object? exerciseCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerClientProgramTemplateDto].
extension TrainerClientProgramTemplateDtoPatterns on TrainerClientProgramTemplateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerClientProgramTemplateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerClientProgramTemplateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerClientProgramTemplateDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerClientProgramTemplateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerClientProgramTemplateDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerClientProgramTemplateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int order,  String status,  int exerciseCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerClientProgramTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.order,_that.status,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  int order,  String status,  int exerciseCount)  $default,) {final _that = this;
switch (_that) {
case _TrainerClientProgramTemplateDto():
return $default(_that.id,_that.name,_that.description,_that.order,_that.status,_that.exerciseCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  int order,  String status,  int exerciseCount)?  $default,) {final _that = this;
switch (_that) {
case _TrainerClientProgramTemplateDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.order,_that.status,_that.exerciseCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerClientProgramTemplateDto implements TrainerClientProgramTemplateDto {
  const _TrainerClientProgramTemplateDto({required this.id, required this.name, this.description, this.order = 0, this.status = 'PENDING', this.exerciseCount = 0});
  factory _TrainerClientProgramTemplateDto.fromJson(Map<String, dynamic> json) => _$TrainerClientProgramTemplateDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override@JsonKey() final  int order;
@override@JsonKey() final  String status;
@override@JsonKey() final  int exerciseCount;

/// Create a copy of TrainerClientProgramTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerClientProgramTemplateDtoCopyWith<_TrainerClientProgramTemplateDto> get copyWith => __$TrainerClientProgramTemplateDtoCopyWithImpl<_TrainerClientProgramTemplateDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerClientProgramTemplateDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerClientProgramTemplateDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.order, order) || other.order == order)&&(identical(other.status, status) || other.status == status)&&(identical(other.exerciseCount, exerciseCount) || other.exerciseCount == exerciseCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,order,status,exerciseCount);

@override
String toString() {
  return 'TrainerClientProgramTemplateDto(id: $id, name: $name, description: $description, order: $order, status: $status, exerciseCount: $exerciseCount)';
}


}

/// @nodoc
abstract mixin class _$TrainerClientProgramTemplateDtoCopyWith<$Res> implements $TrainerClientProgramTemplateDtoCopyWith<$Res> {
  factory _$TrainerClientProgramTemplateDtoCopyWith(_TrainerClientProgramTemplateDto value, $Res Function(_TrainerClientProgramTemplateDto) _then) = __$TrainerClientProgramTemplateDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, int order, String status, int exerciseCount
});




}
/// @nodoc
class __$TrainerClientProgramTemplateDtoCopyWithImpl<$Res>
    implements _$TrainerClientProgramTemplateDtoCopyWith<$Res> {
  __$TrainerClientProgramTemplateDtoCopyWithImpl(this._self, this._then);

  final _TrainerClientProgramTemplateDto _self;
  final $Res Function(_TrainerClientProgramTemplateDto) _then;

/// Create a copy of TrainerClientProgramTemplateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? order = null,Object? status = null,Object? exerciseCount = null,}) {
  return _then(_TrainerClientProgramTemplateDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,exerciseCount: null == exerciseCount ? _self.exerciseCount : exerciseCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
