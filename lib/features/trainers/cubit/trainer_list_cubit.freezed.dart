// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerListEvent()';
}


}

/// @nodoc
class $TrainerListEventCopyWith<$Res>  {
$TrainerListEventCopyWith(TrainerListEvent _, $Res Function(TrainerListEvent) __);
}


/// Adds pattern-matching-related methods to [TrainerListEvent].
extension TrainerListEventPatterns on TrainerListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerListLoad value)?  load,TResult Function( TrainerListLoadMore value)?  loadMore,TResult Function( TrainerListSearch value)?  search,TResult Function( TrainerListRefresh value)?  refresh,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerListLoad() when load != null:
return load(_that);case TrainerListLoadMore() when loadMore != null:
return loadMore(_that);case TrainerListSearch() when search != null:
return search(_that);case TrainerListRefresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerListLoad value)  load,required TResult Function( TrainerListLoadMore value)  loadMore,required TResult Function( TrainerListSearch value)  search,required TResult Function( TrainerListRefresh value)  refresh,}){
final _that = this;
switch (_that) {
case TrainerListLoad():
return load(_that);case TrainerListLoadMore():
return loadMore(_that);case TrainerListSearch():
return search(_that);case TrainerListRefresh():
return refresh(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerListLoad value)?  load,TResult? Function( TrainerListLoadMore value)?  loadMore,TResult? Function( TrainerListSearch value)?  search,TResult? Function( TrainerListRefresh value)?  refresh,}){
final _that = this;
switch (_that) {
case TrainerListLoad() when load != null:
return load(_that);case TrainerListLoadMore() when loadMore != null:
return loadMore(_that);case TrainerListSearch() when search != null:
return search(_that);case TrainerListRefresh() when refresh != null:
return refresh(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? query,  double? lat,  double? lng,  String? sortBy,  String? specialties,  double? minRating,  String? trainingTypes)?  load,TResult Function()?  loadMore,TResult Function( String query)?  search,TResult Function()?  refresh,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerListLoad() when load != null:
return load(_that.query,_that.lat,_that.lng,_that.sortBy,_that.specialties,_that.minRating,_that.trainingTypes);case TrainerListLoadMore() when loadMore != null:
return loadMore();case TrainerListSearch() when search != null:
return search(_that.query);case TrainerListRefresh() when refresh != null:
return refresh();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? query,  double? lat,  double? lng,  String? sortBy,  String? specialties,  double? minRating,  String? trainingTypes)  load,required TResult Function()  loadMore,required TResult Function( String query)  search,required TResult Function()  refresh,}) {final _that = this;
switch (_that) {
case TrainerListLoad():
return load(_that.query,_that.lat,_that.lng,_that.sortBy,_that.specialties,_that.minRating,_that.trainingTypes);case TrainerListLoadMore():
return loadMore();case TrainerListSearch():
return search(_that.query);case TrainerListRefresh():
return refresh();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? query,  double? lat,  double? lng,  String? sortBy,  String? specialties,  double? minRating,  String? trainingTypes)?  load,TResult? Function()?  loadMore,TResult? Function( String query)?  search,TResult? Function()?  refresh,}) {final _that = this;
switch (_that) {
case TrainerListLoad() when load != null:
return load(_that.query,_that.lat,_that.lng,_that.sortBy,_that.specialties,_that.minRating,_that.trainingTypes);case TrainerListLoadMore() when loadMore != null:
return loadMore();case TrainerListSearch() when search != null:
return search(_that.query);case TrainerListRefresh() when refresh != null:
return refresh();case _:
  return null;

}
}

}

/// @nodoc


class TrainerListLoad implements TrainerListEvent {
  const TrainerListLoad({this.query, this.lat, this.lng, this.sortBy, this.specialties, this.minRating, this.trainingTypes});
  

 final  String? query;
 final  double? lat;
 final  double? lng;
 final  String? sortBy;
 final  String? specialties;
 final  double? minRating;
 final  String? trainingTypes;

/// Create a copy of TrainerListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListLoadCopyWith<TrainerListLoad> get copyWith => _$TrainerListLoadCopyWithImpl<TrainerListLoad>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListLoad&&(identical(other.query, query) || other.query == query)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.specialties, specialties) || other.specialties == specialties)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.trainingTypes, trainingTypes) || other.trainingTypes == trainingTypes));
}


@override
int get hashCode => Object.hash(runtimeType,query,lat,lng,sortBy,specialties,minRating,trainingTypes);

@override
String toString() {
  return 'TrainerListEvent.load(query: $query, lat: $lat, lng: $lng, sortBy: $sortBy, specialties: $specialties, minRating: $minRating, trainingTypes: $trainingTypes)';
}


}

/// @nodoc
abstract mixin class $TrainerListLoadCopyWith<$Res> implements $TrainerListEventCopyWith<$Res> {
  factory $TrainerListLoadCopyWith(TrainerListLoad value, $Res Function(TrainerListLoad) _then) = _$TrainerListLoadCopyWithImpl;
@useResult
$Res call({
 String? query, double? lat, double? lng, String? sortBy, String? specialties, double? minRating, String? trainingTypes
});




}
/// @nodoc
class _$TrainerListLoadCopyWithImpl<$Res>
    implements $TrainerListLoadCopyWith<$Res> {
  _$TrainerListLoadCopyWithImpl(this._self, this._then);

  final TrainerListLoad _self;
  final $Res Function(TrainerListLoad) _then;

/// Create a copy of TrainerListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = freezed,Object? lat = freezed,Object? lng = freezed,Object? sortBy = freezed,Object? specialties = freezed,Object? minRating = freezed,Object? trainingTypes = freezed,}) {
  return _then(TrainerListLoad(
query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,specialties: freezed == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as String?,minRating: freezed == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double?,trainingTypes: freezed == trainingTypes ? _self.trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TrainerListLoadMore implements TrainerListEvent {
  const TrainerListLoadMore();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListLoadMore);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerListEvent.loadMore()';
}


}




/// @nodoc


class TrainerListSearch implements TrainerListEvent {
  const TrainerListSearch(this.query);
  

 final  String query;

/// Create a copy of TrainerListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListSearchCopyWith<TrainerListSearch> get copyWith => _$TrainerListSearchCopyWithImpl<TrainerListSearch>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListSearch&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'TrainerListEvent.search(query: $query)';
}


}

/// @nodoc
abstract mixin class $TrainerListSearchCopyWith<$Res> implements $TrainerListEventCopyWith<$Res> {
  factory $TrainerListSearchCopyWith(TrainerListSearch value, $Res Function(TrainerListSearch) _then) = _$TrainerListSearchCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$TrainerListSearchCopyWithImpl<$Res>
    implements $TrainerListSearchCopyWith<$Res> {
  _$TrainerListSearchCopyWithImpl(this._self, this._then);

  final TrainerListSearch _self;
  final $Res Function(TrainerListSearch) _then;

/// Create a copy of TrainerListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(TrainerListSearch(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TrainerListRefresh implements TrainerListEvent {
  const TrainerListRefresh();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListRefresh);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerListEvent.refresh()';
}


}




// dart format on
