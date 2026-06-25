// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_service_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerServiceDto {

 String get id; String get title; String get description; String? get price; String? get currency; int? get duration;
/// Create a copy of TrainerServiceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerServiceDtoCopyWith<TrainerServiceDto> get copyWith => _$TrainerServiceDtoCopyWithImpl<TrainerServiceDto>(this as TrainerServiceDto, _$identity);

  /// Serializes this TrainerServiceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerServiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,price,currency,duration);

@override
String toString() {
  return 'TrainerServiceDto(id: $id, title: $title, description: $description, price: $price, currency: $currency, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $TrainerServiceDtoCopyWith<$Res>  {
  factory $TrainerServiceDtoCopyWith(TrainerServiceDto value, $Res Function(TrainerServiceDto) _then) = _$TrainerServiceDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String? price, String? currency, int? duration
});




}
/// @nodoc
class _$TrainerServiceDtoCopyWithImpl<$Res>
    implements $TrainerServiceDtoCopyWith<$Res> {
  _$TrainerServiceDtoCopyWithImpl(this._self, this._then);

  final TrainerServiceDto _self;
  final $Res Function(TrainerServiceDto) _then;

/// Create a copy of TrainerServiceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = freezed,Object? currency = freezed,Object? duration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerServiceDto].
extension TrainerServiceDtoPatterns on TrainerServiceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerServiceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerServiceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerServiceDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerServiceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerServiceDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerServiceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String? price,  String? currency,  int? duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerServiceDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.currency,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String? price,  String? currency,  int? duration)  $default,) {final _that = this;
switch (_that) {
case _TrainerServiceDto():
return $default(_that.id,_that.title,_that.description,_that.price,_that.currency,_that.duration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String? price,  String? currency,  int? duration)?  $default,) {final _that = this;
switch (_that) {
case _TrainerServiceDto() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.price,_that.currency,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerServiceDto implements TrainerServiceDto {
  const _TrainerServiceDto({required this.id, required this.title, required this.description, this.price, this.currency, this.duration});
  factory _TrainerServiceDto.fromJson(Map<String, dynamic> json) => _$TrainerServiceDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String? price;
@override final  String? currency;
@override final  int? duration;

/// Create a copy of TrainerServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerServiceDtoCopyWith<_TrainerServiceDto> get copyWith => __$TrainerServiceDtoCopyWithImpl<_TrainerServiceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerServiceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerServiceDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,price,currency,duration);

@override
String toString() {
  return 'TrainerServiceDto(id: $id, title: $title, description: $description, price: $price, currency: $currency, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$TrainerServiceDtoCopyWith<$Res> implements $TrainerServiceDtoCopyWith<$Res> {
  factory _$TrainerServiceDtoCopyWith(_TrainerServiceDto value, $Res Function(_TrainerServiceDto) _then) = __$TrainerServiceDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String? price, String? currency, int? duration
});




}
/// @nodoc
class __$TrainerServiceDtoCopyWithImpl<$Res>
    implements _$TrainerServiceDtoCopyWith<$Res> {
  __$TrainerServiceDtoCopyWithImpl(this._self, this._then);

  final _TrainerServiceDto _self;
  final $Res Function(_TrainerServiceDto) _then;

/// Create a copy of TrainerServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? price = freezed,Object? currency = freezed,Object? duration = freezed,}) {
  return _then(_TrainerServiceDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
