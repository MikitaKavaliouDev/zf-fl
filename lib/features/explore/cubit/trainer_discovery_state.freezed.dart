// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_discovery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TrainerDiscoveryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDiscoveryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDiscoveryState()';
}


}

/// @nodoc
class $TrainerDiscoveryStateCopyWith<$Res>  {
$TrainerDiscoveryStateCopyWith(TrainerDiscoveryState _, $Res Function(TrainerDiscoveryState) __);
}


/// Adds pattern-matching-related methods to [TrainerDiscoveryState].
extension TrainerDiscoveryStatePatterns on TrainerDiscoveryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TrainerDiscoveryInitial value)?  initial,TResult Function( TrainerDiscoveryLoaded value)?  loaded,TResult Function( TrainerDiscoveryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TrainerDiscoveryInitial() when initial != null:
return initial(_that);case TrainerDiscoveryLoaded() when loaded != null:
return loaded(_that);case TrainerDiscoveryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TrainerDiscoveryInitial value)  initial,required TResult Function( TrainerDiscoveryLoaded value)  loaded,required TResult Function( TrainerDiscoveryError value)  error,}){
final _that = this;
switch (_that) {
case TrainerDiscoveryInitial():
return initial(_that);case TrainerDiscoveryLoaded():
return loaded(_that);case TrainerDiscoveryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TrainerDiscoveryInitial value)?  initial,TResult? Function( TrainerDiscoveryLoaded value)?  loaded,TResult? Function( TrainerDiscoveryError value)?  error,}){
final _that = this;
switch (_that) {
case TrainerDiscoveryInitial() when initial != null:
return initial(_that);case TrainerDiscoveryLoaded() when loaded != null:
return loaded(_that);case TrainerDiscoveryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( DiscoveryType discoveryType,  String searchQuery,  String? location,  SortOption sortBy,  String? specialty,  double minRating,  bool hasActiveFilters,  List<dynamic> trainers,  List<ExploreEventDto> events,  int trainerPage,  bool hasMoreTrainers,  int eventPage,  bool hasMoreEvents,  bool loadingTrainers,  bool loadingEvents,  String? errorMessage)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TrainerDiscoveryInitial() when initial != null:
return initial();case TrainerDiscoveryLoaded() when loaded != null:
return loaded(_that.discoveryType,_that.searchQuery,_that.location,_that.sortBy,_that.specialty,_that.minRating,_that.hasActiveFilters,_that.trainers,_that.events,_that.trainerPage,_that.hasMoreTrainers,_that.eventPage,_that.hasMoreEvents,_that.loadingTrainers,_that.loadingEvents,_that.errorMessage);case TrainerDiscoveryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( DiscoveryType discoveryType,  String searchQuery,  String? location,  SortOption sortBy,  String? specialty,  double minRating,  bool hasActiveFilters,  List<dynamic> trainers,  List<ExploreEventDto> events,  int trainerPage,  bool hasMoreTrainers,  int eventPage,  bool hasMoreEvents,  bool loadingTrainers,  bool loadingEvents,  String? errorMessage)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case TrainerDiscoveryInitial():
return initial();case TrainerDiscoveryLoaded():
return loaded(_that.discoveryType,_that.searchQuery,_that.location,_that.sortBy,_that.specialty,_that.minRating,_that.hasActiveFilters,_that.trainers,_that.events,_that.trainerPage,_that.hasMoreTrainers,_that.eventPage,_that.hasMoreEvents,_that.loadingTrainers,_that.loadingEvents,_that.errorMessage);case TrainerDiscoveryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( DiscoveryType discoveryType,  String searchQuery,  String? location,  SortOption sortBy,  String? specialty,  double minRating,  bool hasActiveFilters,  List<dynamic> trainers,  List<ExploreEventDto> events,  int trainerPage,  bool hasMoreTrainers,  int eventPage,  bool hasMoreEvents,  bool loadingTrainers,  bool loadingEvents,  String? errorMessage)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case TrainerDiscoveryInitial() when initial != null:
return initial();case TrainerDiscoveryLoaded() when loaded != null:
return loaded(_that.discoveryType,_that.searchQuery,_that.location,_that.sortBy,_that.specialty,_that.minRating,_that.hasActiveFilters,_that.trainers,_that.events,_that.trainerPage,_that.hasMoreTrainers,_that.eventPage,_that.hasMoreEvents,_that.loadingTrainers,_that.loadingEvents,_that.errorMessage);case TrainerDiscoveryError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class TrainerDiscoveryInitial implements TrainerDiscoveryState {
  const TrainerDiscoveryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDiscoveryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TrainerDiscoveryState.initial()';
}


}




/// @nodoc


class TrainerDiscoveryLoaded implements TrainerDiscoveryState {
  const TrainerDiscoveryLoaded({required this.discoveryType, required this.searchQuery, required this.location, required this.sortBy, required this.specialty, required this.minRating, required this.hasActiveFilters, required final  List<dynamic> trainers, required final  List<ExploreEventDto> events, required this.trainerPage, required this.hasMoreTrainers, required this.eventPage, required this.hasMoreEvents, required this.loadingTrainers, required this.loadingEvents, this.errorMessage}): _trainers = trainers,_events = events;
  

 final  DiscoveryType discoveryType;
 final  String searchQuery;
 final  String? location;
 final  SortOption sortBy;
 final  String? specialty;
 final  double minRating;
 final  bool hasActiveFilters;
 final  List<dynamic> _trainers;
 List<dynamic> get trainers {
  if (_trainers is EqualUnmodifiableListView) return _trainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainers);
}

 final  List<ExploreEventDto> _events;
 List<ExploreEventDto> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  int trainerPage;
 final  bool hasMoreTrainers;
 final  int eventPage;
 final  bool hasMoreEvents;
 final  bool loadingTrainers;
 final  bool loadingEvents;
 final  String? errorMessage;

/// Create a copy of TrainerDiscoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDiscoveryLoadedCopyWith<TrainerDiscoveryLoaded> get copyWith => _$TrainerDiscoveryLoadedCopyWithImpl<TrainerDiscoveryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDiscoveryLoaded&&(identical(other.discoveryType, discoveryType) || other.discoveryType == discoveryType)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.location, location) || other.location == location)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.specialty, specialty) || other.specialty == specialty)&&(identical(other.minRating, minRating) || other.minRating == minRating)&&(identical(other.hasActiveFilters, hasActiveFilters) || other.hasActiveFilters == hasActiveFilters)&&const DeepCollectionEquality().equals(other._trainers, _trainers)&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.trainerPage, trainerPage) || other.trainerPage == trainerPage)&&(identical(other.hasMoreTrainers, hasMoreTrainers) || other.hasMoreTrainers == hasMoreTrainers)&&(identical(other.eventPage, eventPage) || other.eventPage == eventPage)&&(identical(other.hasMoreEvents, hasMoreEvents) || other.hasMoreEvents == hasMoreEvents)&&(identical(other.loadingTrainers, loadingTrainers) || other.loadingTrainers == loadingTrainers)&&(identical(other.loadingEvents, loadingEvents) || other.loadingEvents == loadingEvents)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,discoveryType,searchQuery,location,sortBy,specialty,minRating,hasActiveFilters,const DeepCollectionEquality().hash(_trainers),const DeepCollectionEquality().hash(_events),trainerPage,hasMoreTrainers,eventPage,hasMoreEvents,loadingTrainers,loadingEvents,errorMessage);

@override
String toString() {
  return 'TrainerDiscoveryState.loaded(discoveryType: $discoveryType, searchQuery: $searchQuery, location: $location, sortBy: $sortBy, specialty: $specialty, minRating: $minRating, hasActiveFilters: $hasActiveFilters, trainers: $trainers, events: $events, trainerPage: $trainerPage, hasMoreTrainers: $hasMoreTrainers, eventPage: $eventPage, hasMoreEvents: $hasMoreEvents, loadingTrainers: $loadingTrainers, loadingEvents: $loadingEvents, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TrainerDiscoveryLoadedCopyWith<$Res> implements $TrainerDiscoveryStateCopyWith<$Res> {
  factory $TrainerDiscoveryLoadedCopyWith(TrainerDiscoveryLoaded value, $Res Function(TrainerDiscoveryLoaded) _then) = _$TrainerDiscoveryLoadedCopyWithImpl;
@useResult
$Res call({
 DiscoveryType discoveryType, String searchQuery, String? location, SortOption sortBy, String? specialty, double minRating, bool hasActiveFilters, List<dynamic> trainers, List<ExploreEventDto> events, int trainerPage, bool hasMoreTrainers, int eventPage, bool hasMoreEvents, bool loadingTrainers, bool loadingEvents, String? errorMessage
});




}
/// @nodoc
class _$TrainerDiscoveryLoadedCopyWithImpl<$Res>
    implements $TrainerDiscoveryLoadedCopyWith<$Res> {
  _$TrainerDiscoveryLoadedCopyWithImpl(this._self, this._then);

  final TrainerDiscoveryLoaded _self;
  final $Res Function(TrainerDiscoveryLoaded) _then;

/// Create a copy of TrainerDiscoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? discoveryType = null,Object? searchQuery = null,Object? location = freezed,Object? sortBy = null,Object? specialty = freezed,Object? minRating = null,Object? hasActiveFilters = null,Object? trainers = null,Object? events = null,Object? trainerPage = null,Object? hasMoreTrainers = null,Object? eventPage = null,Object? hasMoreEvents = null,Object? loadingTrainers = null,Object? loadingEvents = null,Object? errorMessage = freezed,}) {
  return _then(TrainerDiscoveryLoaded(
discoveryType: null == discoveryType ? _self.discoveryType : discoveryType // ignore: cast_nullable_to_non_nullable
as DiscoveryType,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortOption,specialty: freezed == specialty ? _self.specialty : specialty // ignore: cast_nullable_to_non_nullable
as String?,minRating: null == minRating ? _self.minRating : minRating // ignore: cast_nullable_to_non_nullable
as double,hasActiveFilters: null == hasActiveFilters ? _self.hasActiveFilters : hasActiveFilters // ignore: cast_nullable_to_non_nullable
as bool,trainers: null == trainers ? _self._trainers : trainers // ignore: cast_nullable_to_non_nullable
as List<dynamic>,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,trainerPage: null == trainerPage ? _self.trainerPage : trainerPage // ignore: cast_nullable_to_non_nullable
as int,hasMoreTrainers: null == hasMoreTrainers ? _self.hasMoreTrainers : hasMoreTrainers // ignore: cast_nullable_to_non_nullable
as bool,eventPage: null == eventPage ? _self.eventPage : eventPage // ignore: cast_nullable_to_non_nullable
as int,hasMoreEvents: null == hasMoreEvents ? _self.hasMoreEvents : hasMoreEvents // ignore: cast_nullable_to_non_nullable
as bool,loadingTrainers: null == loadingTrainers ? _self.loadingTrainers : loadingTrainers // ignore: cast_nullable_to_non_nullable
as bool,loadingEvents: null == loadingEvents ? _self.loadingEvents : loadingEvents // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TrainerDiscoveryError implements TrainerDiscoveryState {
  const TrainerDiscoveryError(this.message);
  

 final  String message;

/// Create a copy of TrainerDiscoveryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerDiscoveryErrorCopyWith<TrainerDiscoveryError> get copyWith => _$TrainerDiscoveryErrorCopyWithImpl<TrainerDiscoveryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerDiscoveryError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TrainerDiscoveryState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $TrainerDiscoveryErrorCopyWith<$Res> implements $TrainerDiscoveryStateCopyWith<$Res> {
  factory $TrainerDiscoveryErrorCopyWith(TrainerDiscoveryError value, $Res Function(TrainerDiscoveryError) _then) = _$TrainerDiscoveryErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$TrainerDiscoveryErrorCopyWithImpl<$Res>
    implements $TrainerDiscoveryErrorCopyWith<$Res> {
  _$TrainerDiscoveryErrorCopyWithImpl(this._self, this._then);

  final TrainerDiscoveryError _self;
  final $Res Function(TrainerDiscoveryError) _then;

/// Create a copy of TrainerDiscoveryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(TrainerDiscoveryError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
