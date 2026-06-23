// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExploreMetadata {

 List<ExploreCity> get cities; List<ExploreCategory> get categories;
/// Create a copy of ExploreMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreMetadataCopyWith<ExploreMetadata> get copyWith => _$ExploreMetadataCopyWithImpl<ExploreMetadata>(this as ExploreMetadata, _$identity);

  /// Serializes this ExploreMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreMetadata&&const DeepCollectionEquality().equals(other.cities, cities)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cities),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'ExploreMetadata(cities: $cities, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $ExploreMetadataCopyWith<$Res>  {
  factory $ExploreMetadataCopyWith(ExploreMetadata value, $Res Function(ExploreMetadata) _then) = _$ExploreMetadataCopyWithImpl;
@useResult
$Res call({
 List<ExploreCity> cities, List<ExploreCategory> categories
});




}
/// @nodoc
class _$ExploreMetadataCopyWithImpl<$Res>
    implements $ExploreMetadataCopyWith<$Res> {
  _$ExploreMetadataCopyWithImpl(this._self, this._then);

  final ExploreMetadata _self;
  final $Res Function(ExploreMetadata) _then;

/// Create a copy of ExploreMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cities = null,Object? categories = null,}) {
  return _then(_self.copyWith(
cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<ExploreCity>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExploreCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExploreMetadata].
extension ExploreMetadataPatterns on ExploreMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ExploreMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExploreCity> cities,  List<ExploreCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreMetadata() when $default != null:
return $default(_that.cities,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExploreCity> cities,  List<ExploreCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _ExploreMetadata():
return $default(_that.cities,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExploreCity> cities,  List<ExploreCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _ExploreMetadata() when $default != null:
return $default(_that.cities,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExploreMetadata implements ExploreMetadata {
  const _ExploreMetadata({final  List<ExploreCity> cities = const <ExploreCity>[], final  List<ExploreCategory> categories = const <ExploreCategory>[]}): _cities = cities,_categories = categories;
  factory _ExploreMetadata.fromJson(Map<String, dynamic> json) => _$ExploreMetadataFromJson(json);

 final  List<ExploreCity> _cities;
@override@JsonKey() List<ExploreCity> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

 final  List<ExploreCategory> _categories;
@override@JsonKey() List<ExploreCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of ExploreMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreMetadataCopyWith<_ExploreMetadata> get copyWith => __$ExploreMetadataCopyWithImpl<_ExploreMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExploreMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreMetadata&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'ExploreMetadata(cities: $cities, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$ExploreMetadataCopyWith<$Res> implements $ExploreMetadataCopyWith<$Res> {
  factory _$ExploreMetadataCopyWith(_ExploreMetadata value, $Res Function(_ExploreMetadata) _then) = __$ExploreMetadataCopyWithImpl;
@override @useResult
$Res call({
 List<ExploreCity> cities, List<ExploreCategory> categories
});




}
/// @nodoc
class __$ExploreMetadataCopyWithImpl<$Res>
    implements _$ExploreMetadataCopyWith<$Res> {
  __$ExploreMetadataCopyWithImpl(this._self, this._then);

  final _ExploreMetadata _self;
  final $Res Function(_ExploreMetadata) _then;

/// Create a copy of ExploreMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cities = null,Object? categories = null,}) {
  return _then(_ExploreMetadata(
cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<ExploreCity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExploreCategory>,
  ));
}


}

// dart format on
