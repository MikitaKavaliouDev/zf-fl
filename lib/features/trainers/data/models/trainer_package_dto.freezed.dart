// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_package_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerPackageDto {

 String get id; String get name; String? get description; String get price; String? get currency; int get numberOfSessions; bool get isActive;
/// Create a copy of TrainerPackageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerPackageDtoCopyWith<TrainerPackageDto> get copyWith => _$TrainerPackageDtoCopyWithImpl<TrainerPackageDto>(this as TrainerPackageDto, _$identity);

  /// Serializes this TrainerPackageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerPackageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.numberOfSessions, numberOfSessions) || other.numberOfSessions == numberOfSessions)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,currency,numberOfSessions,isActive);

@override
String toString() {
  return 'TrainerPackageDto(id: $id, name: $name, description: $description, price: $price, currency: $currency, numberOfSessions: $numberOfSessions, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $TrainerPackageDtoCopyWith<$Res>  {
  factory $TrainerPackageDtoCopyWith(TrainerPackageDto value, $Res Function(TrainerPackageDto) _then) = _$TrainerPackageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String price, String? currency, int numberOfSessions, bool isActive
});




}
/// @nodoc
class _$TrainerPackageDtoCopyWithImpl<$Res>
    implements $TrainerPackageDtoCopyWith<$Res> {
  _$TrainerPackageDtoCopyWithImpl(this._self, this._then);

  final TrainerPackageDto _self;
  final $Res Function(TrainerPackageDto) _then;

/// Create a copy of TrainerPackageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? currency = freezed,Object? numberOfSessions = null,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,numberOfSessions: null == numberOfSessions ? _self.numberOfSessions : numberOfSessions // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerPackageDto].
extension TrainerPackageDtoPatterns on TrainerPackageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerPackageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerPackageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerPackageDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerPackageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerPackageDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerPackageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String price,  String? currency,  int numberOfSessions,  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerPackageDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.numberOfSessions,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String price,  String? currency,  int numberOfSessions,  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _TrainerPackageDto():
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.numberOfSessions,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String price,  String? currency,  int numberOfSessions,  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _TrainerPackageDto() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.price,_that.currency,_that.numberOfSessions,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerPackageDto implements TrainerPackageDto {
  const _TrainerPackageDto({required this.id, required this.name, this.description, required this.price, this.currency, required this.numberOfSessions, this.isActive = false});
  factory _TrainerPackageDto.fromJson(Map<String, dynamic> json) => _$TrainerPackageDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String price;
@override final  String? currency;
@override final  int numberOfSessions;
@override@JsonKey() final  bool isActive;

/// Create a copy of TrainerPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerPackageDtoCopyWith<_TrainerPackageDto> get copyWith => __$TrainerPackageDtoCopyWithImpl<_TrainerPackageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerPackageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerPackageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.numberOfSessions, numberOfSessions) || other.numberOfSessions == numberOfSessions)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,price,currency,numberOfSessions,isActive);

@override
String toString() {
  return 'TrainerPackageDto(id: $id, name: $name, description: $description, price: $price, currency: $currency, numberOfSessions: $numberOfSessions, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$TrainerPackageDtoCopyWith<$Res> implements $TrainerPackageDtoCopyWith<$Res> {
  factory _$TrainerPackageDtoCopyWith(_TrainerPackageDto value, $Res Function(_TrainerPackageDto) _then) = __$TrainerPackageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String price, String? currency, int numberOfSessions, bool isActive
});




}
/// @nodoc
class __$TrainerPackageDtoCopyWithImpl<$Res>
    implements _$TrainerPackageDtoCopyWith<$Res> {
  __$TrainerPackageDtoCopyWithImpl(this._self, this._then);

  final _TrainerPackageDto _self;
  final $Res Function(_TrainerPackageDto) _then;

/// Create a copy of TrainerPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? price = null,Object? currency = freezed,Object? numberOfSessions = null,Object? isActive = null,}) {
  return _then(_TrainerPackageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,numberOfSessions: null == numberOfSessions ? _self.numberOfSessions : numberOfSessions // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
