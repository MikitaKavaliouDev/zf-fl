// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_pr_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentPrItemDto {

 String get exercise; double get value; String get type; String get date;
/// Create a copy of RecentPrItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentPrItemDtoCopyWith<RecentPrItemDto> get copyWith => _$RecentPrItemDtoCopyWithImpl<RecentPrItemDto>(this as RecentPrItemDto, _$identity);

  /// Serializes this RecentPrItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentPrItemDto&&(identical(other.exercise, exercise) || other.exercise == exercise)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exercise,value,type,date);

@override
String toString() {
  return 'RecentPrItemDto(exercise: $exercise, value: $value, type: $type, date: $date)';
}


}

/// @nodoc
abstract mixin class $RecentPrItemDtoCopyWith<$Res>  {
  factory $RecentPrItemDtoCopyWith(RecentPrItemDto value, $Res Function(RecentPrItemDto) _then) = _$RecentPrItemDtoCopyWithImpl;
@useResult
$Res call({
 String exercise, double value, String type, String date
});




}
/// @nodoc
class _$RecentPrItemDtoCopyWithImpl<$Res>
    implements $RecentPrItemDtoCopyWith<$Res> {
  _$RecentPrItemDtoCopyWithImpl(this._self, this._then);

  final RecentPrItemDto _self;
  final $Res Function(RecentPrItemDto) _then;

/// Create a copy of RecentPrItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exercise = null,Object? value = null,Object? type = null,Object? date = null,}) {
  return _then(_self.copyWith(
exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentPrItemDto].
extension RecentPrItemDtoPatterns on RecentPrItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentPrItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentPrItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentPrItemDto value)  $default,){
final _that = this;
switch (_that) {
case _RecentPrItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentPrItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _RecentPrItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exercise,  double value,  String type,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentPrItemDto() when $default != null:
return $default(_that.exercise,_that.value,_that.type,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exercise,  double value,  String type,  String date)  $default,) {final _that = this;
switch (_that) {
case _RecentPrItemDto():
return $default(_that.exercise,_that.value,_that.type,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exercise,  double value,  String type,  String date)?  $default,) {final _that = this;
switch (_that) {
case _RecentPrItemDto() when $default != null:
return $default(_that.exercise,_that.value,_that.type,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentPrItemDto implements RecentPrItemDto {
  const _RecentPrItemDto({required this.exercise, required this.value, required this.type, required this.date});
  factory _RecentPrItemDto.fromJson(Map<String, dynamic> json) => _$RecentPrItemDtoFromJson(json);

@override final  String exercise;
@override final  double value;
@override final  String type;
@override final  String date;

/// Create a copy of RecentPrItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentPrItemDtoCopyWith<_RecentPrItemDto> get copyWith => __$RecentPrItemDtoCopyWithImpl<_RecentPrItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentPrItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentPrItemDto&&(identical(other.exercise, exercise) || other.exercise == exercise)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exercise,value,type,date);

@override
String toString() {
  return 'RecentPrItemDto(exercise: $exercise, value: $value, type: $type, date: $date)';
}


}

/// @nodoc
abstract mixin class _$RecentPrItemDtoCopyWith<$Res> implements $RecentPrItemDtoCopyWith<$Res> {
  factory _$RecentPrItemDtoCopyWith(_RecentPrItemDto value, $Res Function(_RecentPrItemDto) _then) = __$RecentPrItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String exercise, double value, String type, String date
});




}
/// @nodoc
class __$RecentPrItemDtoCopyWithImpl<$Res>
    implements _$RecentPrItemDtoCopyWith<$Res> {
  __$RecentPrItemDtoCopyWithImpl(this._self, this._then);

  final _RecentPrItemDto _self;
  final $Res Function(_RecentPrItemDto) _then;

/// Create a copy of RecentPrItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exercise = null,Object? value = null,Object? type = null,Object? date = null,}) {
  return _then(_RecentPrItemDto(
exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
