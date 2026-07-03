// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'muscle_distribution_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MuscleDistributionItemDto {

 String get muscle; int get count;
/// Create a copy of MuscleDistributionItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuscleDistributionItemDtoCopyWith<MuscleDistributionItemDto> get copyWith => _$MuscleDistributionItemDtoCopyWithImpl<MuscleDistributionItemDto>(this as MuscleDistributionItemDto, _$identity);

  /// Serializes this MuscleDistributionItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuscleDistributionItemDto&&(identical(other.muscle, muscle) || other.muscle == muscle)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,muscle,count);

@override
String toString() {
  return 'MuscleDistributionItemDto(muscle: $muscle, count: $count)';
}


}

/// @nodoc
abstract mixin class $MuscleDistributionItemDtoCopyWith<$Res>  {
  factory $MuscleDistributionItemDtoCopyWith(MuscleDistributionItemDto value, $Res Function(MuscleDistributionItemDto) _then) = _$MuscleDistributionItemDtoCopyWithImpl;
@useResult
$Res call({
 String muscle, int count
});




}
/// @nodoc
class _$MuscleDistributionItemDtoCopyWithImpl<$Res>
    implements $MuscleDistributionItemDtoCopyWith<$Res> {
  _$MuscleDistributionItemDtoCopyWithImpl(this._self, this._then);

  final MuscleDistributionItemDto _self;
  final $Res Function(MuscleDistributionItemDto) _then;

/// Create a copy of MuscleDistributionItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? muscle = null,Object? count = null,}) {
  return _then(_self.copyWith(
muscle: null == muscle ? _self.muscle : muscle // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MuscleDistributionItemDto].
extension MuscleDistributionItemDtoPatterns on MuscleDistributionItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MuscleDistributionItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MuscleDistributionItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MuscleDistributionItemDto value)  $default,){
final _that = this;
switch (_that) {
case _MuscleDistributionItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MuscleDistributionItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _MuscleDistributionItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String muscle,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MuscleDistributionItemDto() when $default != null:
return $default(_that.muscle,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String muscle,  int count)  $default,) {final _that = this;
switch (_that) {
case _MuscleDistributionItemDto():
return $default(_that.muscle,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String muscle,  int count)?  $default,) {final _that = this;
switch (_that) {
case _MuscleDistributionItemDto() when $default != null:
return $default(_that.muscle,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MuscleDistributionItemDto implements MuscleDistributionItemDto {
  const _MuscleDistributionItemDto({required this.muscle, required this.count});
  factory _MuscleDistributionItemDto.fromJson(Map<String, dynamic> json) => _$MuscleDistributionItemDtoFromJson(json);

@override final  String muscle;
@override final  int count;

/// Create a copy of MuscleDistributionItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuscleDistributionItemDtoCopyWith<_MuscleDistributionItemDto> get copyWith => __$MuscleDistributionItemDtoCopyWithImpl<_MuscleDistributionItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuscleDistributionItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuscleDistributionItemDto&&(identical(other.muscle, muscle) || other.muscle == muscle)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,muscle,count);

@override
String toString() {
  return 'MuscleDistributionItemDto(muscle: $muscle, count: $count)';
}


}

/// @nodoc
abstract mixin class _$MuscleDistributionItemDtoCopyWith<$Res> implements $MuscleDistributionItemDtoCopyWith<$Res> {
  factory _$MuscleDistributionItemDtoCopyWith(_MuscleDistributionItemDto value, $Res Function(_MuscleDistributionItemDto) _then) = __$MuscleDistributionItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String muscle, int count
});




}
/// @nodoc
class __$MuscleDistributionItemDtoCopyWithImpl<$Res>
    implements _$MuscleDistributionItemDtoCopyWith<$Res> {
  __$MuscleDistributionItemDtoCopyWithImpl(this._self, this._then);

  final _MuscleDistributionItemDto _self;
  final $Res Function(_MuscleDistributionItemDto) _then;

/// Create a copy of MuscleDistributionItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? muscle = null,Object? count = null,}) {
  return _then(_MuscleDistributionItemDto(
muscle: null == muscle ? _self.muscle : muscle // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
