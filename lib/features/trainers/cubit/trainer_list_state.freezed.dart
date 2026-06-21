// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerListState()';
}


}

/// @nodoc
class $TrainerListStateCopyWith<$Res>  {
$TrainerListStateCopyWith(TrainerListState _, $Res Function(TrainerListState) __);
}


/// Adds pattern-matching-related methods to [TrainerListState].
extension TrainerListStatePatterns on TrainerListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerListInitial value)?  initial,TResult Function( TrainerListLoading value)?  loading,TResult Function( TrainerListLoaded value)?  loaded,TResult Function( TrainerListLoadingMore value)?  loadingMore,TResult Function( TrainerListError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerListInitial() when initial != null:
return initial(_that);case TrainerListLoading() when loading != null:
return loading(_that);case TrainerListLoaded() when loaded != null:
return loaded(_that);case TrainerListLoadingMore() when loadingMore != null:
return loadingMore(_that);case TrainerListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerListInitial value)  initial,required TResult Function( TrainerListLoading value)  loading,required TResult Function( TrainerListLoaded value)  loaded,required TResult Function( TrainerListLoadingMore value)  loadingMore,required TResult Function( TrainerListError value)  error,}){
final _that = this;
switch (_that) {
case TrainerListInitial():
return initial(_that);case TrainerListLoading():
return loading(_that);case TrainerListLoaded():
return loaded(_that);case TrainerListLoadingMore():
return loadingMore(_that);case TrainerListError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerListInitial value)?  initial,TResult? Function( TrainerListLoading value)?  loading,TResult? Function( TrainerListLoaded value)?  loaded,TResult? Function( TrainerListLoadingMore value)?  loadingMore,TResult? Function( TrainerListError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerListInitial() when initial != null:
return initial(_that);case TrainerListLoading() when loading != null:
return loading(_that);case TrainerListLoaded() when loaded != null:
return loaded(_that);case TrainerListLoadingMore() when loadingMore != null:
return loadingMore(_that);case TrainerListError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerListItemDto> trainers,  int page,  bool hasMore,  String? query,  double? lat,  double? lng,  String? sortBy,  String? specialties,  double? minRating,  String? trainingTypes)?  loaded,TResult Function( TrainerListLoaded previous)?  loadingMore,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerListInitial() when initial != null:
return initial();case TrainerListLoading() when loading != null:
return loading();case TrainerListLoaded() when loaded != null:
return loaded(_that.trainers,_that.page,_that.hasMore,_that.query,_that.lat,_that.lng,_that.sortBy,_that.specialties,_that.minRating,_that.trainingTypes);case TrainerListLoadingMore() when loadingMore != null:
return loadingMore(_that.previous);case TrainerListError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerListItemDto> trainers,  int page,  bool hasMore,  String? query,  double? lat,  double? lng,  String? sortBy,  String? specialties,  double? minRating,  String? trainingTypes)  loaded,required TResult Function( TrainerListLoaded previous)  loadingMore,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerListInitial():
return initial();case TrainerListLoading():
return loading();case TrainerListLoaded():
return loaded(_that.trainers,_that.page,_that.hasMore,_that.query,_that.lat,_that.lng,_that.sortBy,_that.specialties,_that.minRating,_that.trainingTypes);case TrainerListLoadingMore():
return loadingMore(_that.previous);case TrainerListError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerListItemDto> trainers,  int page,  bool hasMore,  String? query,  double? lat,  double? lng,  String? sortBy,  String? specialties,  double? minRating,  String? trainingTypes)?  loaded,TResult? Function( TrainerListLoaded previous)?  loadingMore,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerListInitial() when initial != null:
return initial();case TrainerListLoading() when loading != null:
return loading();case TrainerListLoaded() when loaded != null:
return loaded(_that.trainers,_that.page,_that.hasMore,_that.query,_that.lat,_that.lng,_that.sortBy,_that.specialties,_that.minRating,_that.trainingTypes);case TrainerListLoadingMore() when loadingMore != null:
return loadingMore(_that.previous);case TrainerListError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerListInitial implements TrainerListState {
  const TrainerListInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerListState.initial()';
}


}




/// @nodoc


class TrainerListLoading implements TrainerListState {
  const TrainerListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerListState.loading()';
}


}




/// @nodoc


class TrainerListLoaded implements TrainerListState {
  const TrainerListLoaded({required final  List<TrainerListItemDto> trainers, required this.page, required this.hasMore, this.query, this.lat, this.lng, this.sortBy, this.specialties, this.minRating, this.trainingTypes}): _trainers = trainers;
  

 final  List<TrainerListItemDto> _trainers;
 List<TrainerListItemDto> get trainers {
  if (_trainers is EqualUnmodifiableListView) return _trainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainers);
}

 final  int page;
 final  bool hasMore;
 final  String? query;
 final  double? lat;
 final  double? lng;
 final  String? sortBy;
 final  String? specialties;
 final  double? minRating;
 final  String? trainingTypes;

/// Create a copy of TrainerListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListLoadedCopyWith<TrainerListLoaded> get copyWith => _$TrainerListLoadedCopyWithImpl<TrainerListLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListLoaded&&const DeepCollectionEquality().equals(other._trainers, _trainers)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.query, query) || other.query == query)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.specialties, specialties) || other.specialties == specialties)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.trainingTypes, trainingTypes) || other.trainingTypes == trainingTypes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trainers),page,hasMore,query,lat,lng,sortBy,specialties,minRating,trainingTypes);

@override
String toString() {
  return 'TrainerListState.loaded(trainers: $trainers, page: $page, hasMore: $hasMore, query: $query, lat: $lat, lng: $lng, sortBy: $sortBy, specialties: $specialties, minRating: $minRating, trainingTypes: $trainingTypes)';
}


}

/// @nodoc
abstract mixin class $TrainerListLoadedCopyWith<$Res> implements $TrainerListStateCopyWith<$Res> {
  factory $TrainerListLoadedCopyWith(TrainerListLoaded value, $Res Function(TrainerListLoaded) _then) = _$TrainerListLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerListItemDto> trainers, int page, bool hasMore, String? query, double? lat, double? lng, String? sortBy, String? specialties, double? minRating, String? trainingTypes
});




}
/// @nodoc
class _$TrainerListLoadedCopyWithImpl<$Res>
    implements $TrainerListLoadedCopyWith<$Res> {
  _$TrainerListLoadedCopyWithImpl(this._self, this._then);

  final TrainerListLoaded _self;
  final $Res Function(TrainerListLoaded) _then;

/// Create a copy of TrainerListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trainers = null,Object? page = null,Object? hasMore = null,Object? query = freezed,Object? lat = freezed,Object? lng = freezed,Object? sortBy = freezed,Object? specialties = freezed,Object? minRating = freezed,Object? trainingTypes = freezed,}) {
  return _then(TrainerListLoaded(
trainers: null == trainers ? _self._trainers : trainers // ignore: cast_nullable_to_non_nullable
as List<TrainerListItemDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
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


class TrainerListLoadingMore implements TrainerListState {
  const TrainerListLoadingMore(this.previous);
  

 final  TrainerListLoaded previous;

/// Create a copy of TrainerListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListLoadingMoreCopyWith<TrainerListLoadingMore> get copyWith => _$TrainerListLoadingMoreCopyWithImpl<TrainerListLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListLoadingMore&&const DeepCollectionEquality().equals(other.previous, previous));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(previous));

@override
String toString() {
  return 'TrainerListState.loadingMore(previous: $previous)';
}


}

/// @nodoc
abstract mixin class $TrainerListLoadingMoreCopyWith<$Res> implements $TrainerListStateCopyWith<$Res> {
  factory $TrainerListLoadingMoreCopyWith(TrainerListLoadingMore value, $Res Function(TrainerListLoadingMore) _then) = _$TrainerListLoadingMoreCopyWithImpl;
@useResult
$Res call({
 TrainerListLoaded previous
});




}
/// @nodoc
class _$TrainerListLoadingMoreCopyWithImpl<$Res>
    implements $TrainerListLoadingMoreCopyWith<$Res> {
  _$TrainerListLoadingMoreCopyWithImpl(this._self, this._then);

  final TrainerListLoadingMore _self;
  final $Res Function(TrainerListLoadingMore) _then;

/// Create a copy of TrainerListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? previous = freezed,}) {
  return _then(TrainerListLoadingMore(
freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as TrainerListLoaded,
  ));
}


}

/// @nodoc


class TrainerListError implements TrainerListState {
  const TrainerListError(this.message);
  

 final  String message;

/// Create a copy of TrainerListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerListErrorCopyWith<TrainerListError> get copyWith => _$TrainerListErrorCopyWithImpl<TrainerListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerListError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerListState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerListErrorCopyWith<$Res> implements $TrainerListStateCopyWith<$Res> {
  factory $TrainerListErrorCopyWith(TrainerListError value, $Res Function(TrainerListError) _then) = _$TrainerListErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerListErrorCopyWithImpl<$Res>
    implements $TrainerListErrorCopyWith<$Res> {
  _$TrainerListErrorCopyWithImpl(this._self, this._then);

  final TrainerListError _self;
  final $Res Function(TrainerListError) _then;

/// Create a copy of TrainerListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerListError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
