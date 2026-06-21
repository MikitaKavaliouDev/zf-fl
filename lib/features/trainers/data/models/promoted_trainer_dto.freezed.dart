// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'promoted_trainer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromotedTrainerDto {

 String get id; String get name; String get username; String? get avatarUrl; double? get rating; bool get isVerified; List<String> get specialties; String? get promotionCategory; String? get promotedAt;
/// Create a copy of PromotedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromotedTrainerDtoCopyWith<PromotedTrainerDto> get copyWith => _$PromotedTrainerDtoCopyWithImpl<PromotedTrainerDto>(this as PromotedTrainerDto, _$identity);

  /// Serializes this PromotedTrainerDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromotedTrainerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&(identical(other.promotionCategory, promotionCategory) || other.promotionCategory == promotionCategory)&&(identical(other.promotedAt, promotedAt) || other.promotedAt == promotedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,avatarUrl,rating,isVerified,const DeepCollectionEquality().hash(specialties),promotionCategory,promotedAt);

@override
String toString() {
  return 'PromotedTrainerDto(id: $id, name: $name, username: $username, avatarUrl: $avatarUrl, rating: $rating, isVerified: $isVerified, specialties: $specialties, promotionCategory: $promotionCategory, promotedAt: $promotedAt)';
}


}

/// @nodoc
abstract mixin class $PromotedTrainerDtoCopyWith<$Res>  {
  factory $PromotedTrainerDtoCopyWith(PromotedTrainerDto value, $Res Function(PromotedTrainerDto) _then) = _$PromotedTrainerDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String username, String? avatarUrl, double? rating, bool isVerified, List<String> specialties, String? promotionCategory, String? promotedAt
});




}
/// @nodoc
class _$PromotedTrainerDtoCopyWithImpl<$Res>
    implements $PromotedTrainerDtoCopyWith<$Res> {
  _$PromotedTrainerDtoCopyWithImpl(this._self, this._then);

  final PromotedTrainerDto _self;
  final $Res Function(PromotedTrainerDto) _then;

/// Create a copy of PromotedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? username = null,Object? avatarUrl = freezed,Object? rating = freezed,Object? isVerified = null,Object? specialties = null,Object? promotionCategory = freezed,Object? promotedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,promotionCategory: freezed == promotionCategory ? _self.promotionCategory : promotionCategory // ignore: cast_nullable_to_non_nullable
as String?,promotedAt: freezed == promotedAt ? _self.promotedAt : promotedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PromotedTrainerDto].
extension PromotedTrainerDtoPatterns on PromotedTrainerDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromotedTrainerDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromotedTrainerDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromotedTrainerDto value)  $default,){
final _that = this;
switch (_that) {
case _PromotedTrainerDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromotedTrainerDto value)?  $default,){
final _that = this;
switch (_that) {
case _PromotedTrainerDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String username,  String? avatarUrl,  double? rating,  bool isVerified,  List<String> specialties,  String? promotionCategory,  String? promotedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromotedTrainerDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.avatarUrl,_that.rating,_that.isVerified,_that.specialties,_that.promotionCategory,_that.promotedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String username,  String? avatarUrl,  double? rating,  bool isVerified,  List<String> specialties,  String? promotionCategory,  String? promotedAt)  $default,) {final _that = this;
switch (_that) {
case _PromotedTrainerDto():
return $default(_that.id,_that.name,_that.username,_that.avatarUrl,_that.rating,_that.isVerified,_that.specialties,_that.promotionCategory,_that.promotedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String username,  String? avatarUrl,  double? rating,  bool isVerified,  List<String> specialties,  String? promotionCategory,  String? promotedAt)?  $default,) {final _that = this;
switch (_that) {
case _PromotedTrainerDto() when $default != null:
return $default(_that.id,_that.name,_that.username,_that.avatarUrl,_that.rating,_that.isVerified,_that.specialties,_that.promotionCategory,_that.promotedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromotedTrainerDto implements PromotedTrainerDto {
  const _PromotedTrainerDto({required this.id, required this.name, required this.username, this.avatarUrl, this.rating, this.isVerified = false, final  List<String> specialties = const <String>[], this.promotionCategory, this.promotedAt}): _specialties = specialties;
  factory _PromotedTrainerDto.fromJson(Map<String, dynamic> json) => _$PromotedTrainerDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String username;
@override final  String? avatarUrl;
@override final  double? rating;
@override@JsonKey() final  bool isVerified;
 final  List<String> _specialties;
@override@JsonKey() List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

@override final  String? promotionCategory;
@override final  String? promotedAt;

/// Create a copy of PromotedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromotedTrainerDtoCopyWith<_PromotedTrainerDto> get copyWith => __$PromotedTrainerDtoCopyWithImpl<_PromotedTrainerDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromotedTrainerDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromotedTrainerDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&(identical(other.promotionCategory, promotionCategory) || other.promotionCategory == promotionCategory)&&(identical(other.promotedAt, promotedAt) || other.promotedAt == promotedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,username,avatarUrl,rating,isVerified,const DeepCollectionEquality().hash(_specialties),promotionCategory,promotedAt);

@override
String toString() {
  return 'PromotedTrainerDto(id: $id, name: $name, username: $username, avatarUrl: $avatarUrl, rating: $rating, isVerified: $isVerified, specialties: $specialties, promotionCategory: $promotionCategory, promotedAt: $promotedAt)';
}


}

/// @nodoc
abstract mixin class _$PromotedTrainerDtoCopyWith<$Res> implements $PromotedTrainerDtoCopyWith<$Res> {
  factory _$PromotedTrainerDtoCopyWith(_PromotedTrainerDto value, $Res Function(_PromotedTrainerDto) _then) = __$PromotedTrainerDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String username, String? avatarUrl, double? rating, bool isVerified, List<String> specialties, String? promotionCategory, String? promotedAt
});




}
/// @nodoc
class __$PromotedTrainerDtoCopyWithImpl<$Res>
    implements _$PromotedTrainerDtoCopyWith<$Res> {
  __$PromotedTrainerDtoCopyWithImpl(this._self, this._then);

  final _PromotedTrainerDto _self;
  final $Res Function(_PromotedTrainerDto) _then;

/// Create a copy of PromotedTrainerDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? username = null,Object? avatarUrl = freezed,Object? rating = freezed,Object? isVerified = null,Object? specialties = null,Object? promotionCategory = freezed,Object? promotedAt = freezed,}) {
  return _then(_PromotedTrainerDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double?,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,promotionCategory: freezed == promotionCategory ? _self.promotionCategory : promotionCategory // ignore: cast_nullable_to_non_nullable
as String?,promotedAt: freezed == promotedAt ? _self.promotedAt : promotedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
