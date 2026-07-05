// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_habit_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateHabitRequestDto {

 String? get title; String? get description; String? get frequency; bool? get isActive;
/// Create a copy of UpdateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateHabitRequestDtoCopyWith<UpdateHabitRequestDto> get copyWith => _$UpdateHabitRequestDtoCopyWithImpl<UpdateHabitRequestDto>(this as UpdateHabitRequestDto, _$identity);

  /// Serializes this UpdateHabitRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateHabitRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,frequency,isActive);

@override
String toString() {
  return 'UpdateHabitRequestDto(title: $title, description: $description, frequency: $frequency, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $UpdateHabitRequestDtoCopyWith<$Res>  {
  factory $UpdateHabitRequestDtoCopyWith(UpdateHabitRequestDto value, $Res Function(UpdateHabitRequestDto) _then) = _$UpdateHabitRequestDtoCopyWithImpl;
@useResult
$Res call({
 String? title, String? description, String? frequency, bool? isActive
});




}
/// @nodoc
class _$UpdateHabitRequestDtoCopyWithImpl<$Res>
    implements $UpdateHabitRequestDtoCopyWith<$Res> {
  _$UpdateHabitRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateHabitRequestDto _self;
  final $Res Function(UpdateHabitRequestDto) _then;

/// Create a copy of UpdateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? frequency = freezed,Object? isActive = freezed,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateHabitRequestDto].
extension UpdateHabitRequestDtoPatterns on UpdateHabitRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateHabitRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateHabitRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateHabitRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateHabitRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateHabitRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateHabitRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? description,  String? frequency,  bool? isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateHabitRequestDto() when $default != null:
return $default(_that.title,_that.description,_that.frequency,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? description,  String? frequency,  bool? isActive)  $default,) {final _that = this;
switch (_that) {
case _UpdateHabitRequestDto():
return $default(_that.title,_that.description,_that.frequency,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? description,  String? frequency,  bool? isActive)?  $default,) {final _that = this;
switch (_that) {
case _UpdateHabitRequestDto() when $default != null:
return $default(_that.title,_that.description,_that.frequency,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateHabitRequestDto implements UpdateHabitRequestDto {
  const _UpdateHabitRequestDto({this.title, this.description, this.frequency, this.isActive});
  factory _UpdateHabitRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateHabitRequestDtoFromJson(json);

@override final  String? title;
@override final  String? description;
@override final  String? frequency;
@override final  bool? isActive;

/// Create a copy of UpdateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateHabitRequestDtoCopyWith<_UpdateHabitRequestDto> get copyWith => __$UpdateHabitRequestDtoCopyWithImpl<_UpdateHabitRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateHabitRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateHabitRequestDto&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.frequency, frequency) || other.frequency == frequency)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,frequency,isActive);

@override
String toString() {
  return 'UpdateHabitRequestDto(title: $title, description: $description, frequency: $frequency, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$UpdateHabitRequestDtoCopyWith<$Res> implements $UpdateHabitRequestDtoCopyWith<$Res> {
  factory _$UpdateHabitRequestDtoCopyWith(_UpdateHabitRequestDto value, $Res Function(_UpdateHabitRequestDto) _then) = __$UpdateHabitRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? description, String? frequency, bool? isActive
});




}
/// @nodoc
class __$UpdateHabitRequestDtoCopyWithImpl<$Res>
    implements _$UpdateHabitRequestDtoCopyWith<$Res> {
  __$UpdateHabitRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateHabitRequestDto _self;
  final $Res Function(_UpdateHabitRequestDto) _then;

/// Create a copy of UpdateHabitRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? frequency = freezed,Object? isActive = freezed,}) {
  return _then(_UpdateHabitRequestDto(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,frequency: freezed == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
