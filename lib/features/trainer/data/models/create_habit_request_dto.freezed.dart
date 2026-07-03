// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_habit_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateHabitRequestDto {

 String get title; String? get description; String get frequency;
/// Create a copy of CreateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateHabitRequestDtoCopyWith<CreateHabitRequestDto> get copyWith => _$CreateHabitRequestDtoCopyWithImpl<CreateHabitRequestDto>(this as CreateHabitRequestDto, _$identity);

  /// Serializes this CreateHabitRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateHabitRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,frequency);

@override
String toString() {
  return 'CreateHabitRequestDto(title: $title, description: $description, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class $CreateHabitRequestDtoCopyWith<$Res>  {
  factory $CreateHabitRequestDtoCopyWith(CreateHabitRequestDto value, $Res Function(CreateHabitRequestDto) _then) = _$CreateHabitRequestDtoCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String frequency
});




}
/// @nodoc
class _$CreateHabitRequestDtoCopyWithImpl<$Res>
    implements $CreateHabitRequestDtoCopyWith<$Res> {
  _$CreateHabitRequestDtoCopyWithImpl(this._self, this._then);

  final CreateHabitRequestDto _self;
  final $Res Function(CreateHabitRequestDto) _then;

/// Create a copy of CreateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? frequency = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateHabitRequestDto].
extension CreateHabitRequestDtoPatterns on CreateHabitRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateHabitRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateHabitRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateHabitRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateHabitRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateHabitRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateHabitRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String frequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateHabitRequestDto() when $default != null:
return $default(_that.title,_that.description,_that.frequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String frequency)  $default,) {final _that = this;
switch (_that) {
case _CreateHabitRequestDto():
return $default(_that.title,_that.description,_that.frequency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String frequency)?  $default,) {final _that = this;
switch (_that) {
case _CreateHabitRequestDto() when $default != null:
return $default(_that.title,_that.description,_that.frequency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateHabitRequestDto implements CreateHabitRequestDto {
  const _CreateHabitRequestDto({required this.title, this.description, this.frequency = 'DAILY'});
  factory _CreateHabitRequestDto.fromJson(Map<String, dynamic> json) => _$CreateHabitRequestDtoFromJson(json);

@override final  String title;
@override final  String? description;
@override@JsonKey() final  String frequency;

/// Create a copy of CreateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateHabitRequestDtoCopyWith<_CreateHabitRequestDto> get copyWith => __$CreateHabitRequestDtoCopyWithImpl<_CreateHabitRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateHabitRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateHabitRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,frequency);

@override
String toString() {
  return 'CreateHabitRequestDto(title: $title, description: $description, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class _$CreateHabitRequestDtoCopyWith<$Res> implements $CreateHabitRequestDtoCopyWith<$Res> {
  factory _$CreateHabitRequestDtoCopyWith(_CreateHabitRequestDto value, $Res Function(_CreateHabitRequestDto) _then) = __$CreateHabitRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String frequency
});




}
/// @nodoc
class __$CreateHabitRequestDtoCopyWithImpl<$Res>
    implements _$CreateHabitRequestDtoCopyWith<$Res> {
  __$CreateHabitRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateHabitRequestDto _self;
  final $Res Function(_CreateHabitRequestDto) _then;

/// Create a copy of CreateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? frequency = null,}) {
  return _then(_CreateHabitRequestDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
