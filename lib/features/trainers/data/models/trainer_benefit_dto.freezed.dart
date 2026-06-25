// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_benefit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerBenefitDto {

 String get id; String get title; String? get description; String? get iconName;
/// Create a copy of TrainerBenefitDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerBenefitDtoCopyWith<TrainerBenefitDto> get copyWith => _$TrainerBenefitDtoCopyWithImpl<TrainerBenefitDto>(this as TrainerBenefitDto, _$identity);

  /// Serializes this TrainerBenefitDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerBenefitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconName, iconName) || other.iconName == iconName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,iconName);

@override
String toString() {
  return 'TrainerBenefitDto(id: $id, title: $title, description: $description, iconName: $iconName)';
}


}

/// @nodoc
abstract mixin class $TrainerBenefitDtoCopyWith<$Res>  {
  factory $TrainerBenefitDtoCopyWith(TrainerBenefitDto value, $Res Function(TrainerBenefitDto) _then) = _$TrainerBenefitDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, String? iconName
});




}
/// @nodoc
class _$TrainerBenefitDtoCopyWithImpl<$Res>
    implements $TrainerBenefitDtoCopyWith<$Res> {
  _$TrainerBenefitDtoCopyWithImpl(this._self, this._then);

  final TrainerBenefitDto _self;
  final $Res Function(TrainerBenefitDto) _then;

/// Create a copy of TrainerBenefitDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? iconName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconName: freezed == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerBenefitDto].
extension TrainerBenefitDtoPatterns on TrainerBenefitDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerBenefitDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerBenefitDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerBenefitDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerBenefitDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerBenefitDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerBenefitDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String? iconName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerBenefitDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.iconName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  String? iconName)  $default,) {final _that = this;
switch (_that) {
case _TrainerBenefitDto():
return $default(_that.id,_that.title,_that.description,_that.iconName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  String? iconName)?  $default,) {final _that = this;
switch (_that) {
case _TrainerBenefitDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.iconName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerBenefitDto implements TrainerBenefitDto {
  const _TrainerBenefitDto({required this.id, required this.title, this.description, this.iconName});
  factory _TrainerBenefitDto.fromJson(Map<String, dynamic> json) => _$TrainerBenefitDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override final  String? iconName;

/// Create a copy of TrainerBenefitDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerBenefitDtoCopyWith<_TrainerBenefitDto> get copyWith => __$TrainerBenefitDtoCopyWithImpl<_TrainerBenefitDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerBenefitDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerBenefitDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconName, iconName) || other.iconName == iconName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,iconName);

@override
String toString() {
  return 'TrainerBenefitDto(id: $id, title: $title, description: $description, iconName: $iconName)';
}


}

/// @nodoc
abstract mixin class _$TrainerBenefitDtoCopyWith<$Res> implements $TrainerBenefitDtoCopyWith<$Res> {
  factory _$TrainerBenefitDtoCopyWith(_TrainerBenefitDto value, $Res Function(_TrainerBenefitDto) _then) = __$TrainerBenefitDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, String? iconName
});




}
/// @nodoc
class __$TrainerBenefitDtoCopyWithImpl<$Res>
    implements _$TrainerBenefitDtoCopyWith<$Res> {
  __$TrainerBenefitDtoCopyWithImpl(this._self, this._then);

  final _TrainerBenefitDto _self;
  final $Res Function(_TrainerBenefitDto) _then;

/// Create a copy of TrainerBenefitDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? iconName = freezed,}) {
  return _then(_TrainerBenefitDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconName: freezed == iconName ? _self.iconName : iconName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
