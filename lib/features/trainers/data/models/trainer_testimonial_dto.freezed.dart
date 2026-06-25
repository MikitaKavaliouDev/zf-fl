// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_testimonial_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerTestimonialDto {

 String get id; String get clientName; String get testimonialText; double? get rating; String? get createdAt;
/// Create a copy of TrainerTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerTestimonialDtoCopyWith<TrainerTestimonialDto> get copyWith => _$TrainerTestimonialDtoCopyWithImpl<TrainerTestimonialDto>(this as TrainerTestimonialDto, _$identity);

  /// Serializes this TrainerTestimonialDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerTestimonialDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.testimonialText, testimonialText) || other.testimonialText == testimonialText)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientName,testimonialText,rating,createdAt);

@override
String toString() {
  return 'TrainerTestimonialDto(id: $id, clientName: $clientName, testimonialText: $testimonialText, rating: $rating, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $TrainerTestimonialDtoCopyWith<$Res>  {
  factory $TrainerTestimonialDtoCopyWith(TrainerTestimonialDto value, $Res Function(TrainerTestimonialDto) _then) = _$TrainerTestimonialDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientName, String testimonialText, double? rating, String? createdAt
});




}
/// @nodoc
class _$TrainerTestimonialDtoCopyWithImpl<$Res>
    implements $TrainerTestimonialDtoCopyWith<$Res> {
  _$TrainerTestimonialDtoCopyWithImpl(this._self, this._then);

  final TrainerTestimonialDto _self;
  final $Res Function(TrainerTestimonialDto) _then;

/// Create a copy of TrainerTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientName = null,Object? testimonialText = null,Object? rating = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,testimonialText: null == testimonialText ? _self.testimonialText : testimonialText // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerTestimonialDto].
extension TrainerTestimonialDtoPatterns on TrainerTestimonialDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerTestimonialDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerTestimonialDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerTestimonialDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerTestimonialDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerTestimonialDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerTestimonialDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientName,  String testimonialText,  double? rating,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerTestimonialDto() when $default != null:
return $default(_that.id,_that.clientName,_that.testimonialText,_that.rating,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientName,  String testimonialText,  double? rating,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _TrainerTestimonialDto():
return $default(_that.id,_that.clientName,_that.testimonialText,_that.rating,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientName,  String testimonialText,  double? rating,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainerTestimonialDto() when $default != null:
return $default(_that.id,_that.clientName,_that.testimonialText,_that.rating,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerTestimonialDto implements TrainerTestimonialDto {
  const _TrainerTestimonialDto({required this.id, required this.clientName, required this.testimonialText, this.rating, this.createdAt});
  factory _TrainerTestimonialDto.fromJson(Map<String, dynamic> json) => _$TrainerTestimonialDtoFromJson(json);

@override final  String id;
@override final  String clientName;
@override final  String testimonialText;
@override final  double? rating;
@override final  String? createdAt;

/// Create a copy of TrainerTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerTestimonialDtoCopyWith<_TrainerTestimonialDto> get copyWith => __$TrainerTestimonialDtoCopyWithImpl<_TrainerTestimonialDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerTestimonialDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerTestimonialDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.testimonialText, testimonialText) || other.testimonialText == testimonialText)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientName,testimonialText,rating,createdAt);

@override
String toString() {
  return 'TrainerTestimonialDto(id: $id, clientName: $clientName, testimonialText: $testimonialText, rating: $rating, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TrainerTestimonialDtoCopyWith<$Res> implements $TrainerTestimonialDtoCopyWith<$Res> {
  factory _$TrainerTestimonialDtoCopyWith(_TrainerTestimonialDto value, $Res Function(_TrainerTestimonialDto) _then) = __$TrainerTestimonialDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientName, String testimonialText, double? rating, String? createdAt
});




}
/// @nodoc
class __$TrainerTestimonialDtoCopyWithImpl<$Res>
    implements _$TrainerTestimonialDtoCopyWith<$Res> {
  __$TrainerTestimonialDtoCopyWithImpl(this._self, this._then);

  final _TrainerTestimonialDto _self;
  final $Res Function(_TrainerTestimonialDto) _then;

/// Create a copy of TrainerTestimonialDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientName = null,Object? testimonialText = null,Object? rating = freezed,Object? createdAt = freezed,}) {
  return _then(_TrainerTestimonialDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,testimonialText: null == testimonialText ? _self.testimonialText : testimonialText // ignore: cast_nullable_to_non_nullable
as String,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
