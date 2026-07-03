// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volume_history_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolumeHistoryItemDto {

 String get date; double get volume;
/// Create a copy of VolumeHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeHistoryItemDtoCopyWith<VolumeHistoryItemDto> get copyWith => _$VolumeHistoryItemDtoCopyWithImpl<VolumeHistoryItemDto>(this as VolumeHistoryItemDto, _$identity);

  /// Serializes this VolumeHistoryItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeHistoryItemDto&&(identical(other.date, date) || other.date == date)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,volume);

@override
String toString() {
  return 'VolumeHistoryItemDto(date: $date, volume: $volume)';
}


}

/// @nodoc
abstract mixin class $VolumeHistoryItemDtoCopyWith<$Res>  {
  factory $VolumeHistoryItemDtoCopyWith(VolumeHistoryItemDto value, $Res Function(VolumeHistoryItemDto) _then) = _$VolumeHistoryItemDtoCopyWithImpl;
@useResult
$Res call({
 String date, double volume
});




}
/// @nodoc
class _$VolumeHistoryItemDtoCopyWithImpl<$Res>
    implements $VolumeHistoryItemDtoCopyWith<$Res> {
  _$VolumeHistoryItemDtoCopyWithImpl(this._self, this._then);

  final VolumeHistoryItemDto _self;
  final $Res Function(VolumeHistoryItemDto) _then;

/// Create a copy of VolumeHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? volume = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VolumeHistoryItemDto].
extension VolumeHistoryItemDtoPatterns on VolumeHistoryItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolumeHistoryItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolumeHistoryItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolumeHistoryItemDto value)  $default,){
final _that = this;
switch (_that) {
case _VolumeHistoryItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolumeHistoryItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _VolumeHistoryItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolumeHistoryItemDto() when $default != null:
return $default(_that.date,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double volume)  $default,) {final _that = this;
switch (_that) {
case _VolumeHistoryItemDto():
return $default(_that.date,_that.volume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double volume)?  $default,) {final _that = this;
switch (_that) {
case _VolumeHistoryItemDto() when $default != null:
return $default(_that.date,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolumeHistoryItemDto implements VolumeHistoryItemDto {
  const _VolumeHistoryItemDto({required this.date, required this.volume});
  factory _VolumeHistoryItemDto.fromJson(Map<String, dynamic> json) => _$VolumeHistoryItemDtoFromJson(json);

@override final  String date;
@override final  double volume;

/// Create a copy of VolumeHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeHistoryItemDtoCopyWith<_VolumeHistoryItemDto> get copyWith => __$VolumeHistoryItemDtoCopyWithImpl<_VolumeHistoryItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolumeHistoryItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeHistoryItemDto&&(identical(other.date, date) || other.date == date)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,volume);

@override
String toString() {
  return 'VolumeHistoryItemDto(date: $date, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$VolumeHistoryItemDtoCopyWith<$Res> implements $VolumeHistoryItemDtoCopyWith<$Res> {
  factory _$VolumeHistoryItemDtoCopyWith(_VolumeHistoryItemDto value, $Res Function(_VolumeHistoryItemDto) _then) = __$VolumeHistoryItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String date, double volume
});




}
/// @nodoc
class __$VolumeHistoryItemDtoCopyWithImpl<$Res>
    implements _$VolumeHistoryItemDtoCopyWith<$Res> {
  __$VolumeHistoryItemDtoCopyWithImpl(this._self, this._then);

  final _VolumeHistoryItemDto _self;
  final $Res Function(_VolumeHistoryItemDto) _then;

/// Create a copy of VolumeHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? volume = null,}) {
  return _then(_VolumeHistoryItemDto(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
