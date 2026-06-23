// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState()';
}


}

/// @nodoc
class $ExploreStateCopyWith<$Res>  {
$ExploreStateCopyWith(ExploreState _, $Res Function(ExploreState) __);
}


/// Adds pattern-matching-related methods to [ExploreState].
extension ExploreStatePatterns on ExploreState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExploreStateInitial value)?  initial,TResult Function( ExploreStateLoading value)?  loading,TResult Function( ExploreStateLoaded value)?  loaded,TResult Function( ExploreStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExploreStateInitial() when initial != null:
return initial(_that);case ExploreStateLoading() when loading != null:
return loading(_that);case ExploreStateLoaded() when loaded != null:
return loaded(_that);case ExploreStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExploreStateInitial value)  initial,required TResult Function( ExploreStateLoading value)  loading,required TResult Function( ExploreStateLoaded value)  loaded,required TResult Function( ExploreStateError value)  error,}){
final _that = this;
switch (_that) {
case ExploreStateInitial():
return initial(_that);case ExploreStateLoading():
return loading(_that);case ExploreStateLoaded():
return loaded(_that);case ExploreStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExploreStateInitial value)?  initial,TResult? Function( ExploreStateLoading value)?  loading,TResult? Function( ExploreStateLoaded value)?  loaded,TResult? Function( ExploreStateError value)?  error,}){
final _that = this;
switch (_that) {
case ExploreStateInitial() when initial != null:
return initial(_that);case ExploreStateLoading() when loading != null:
return loading(_that);case ExploreStateLoaded() when loaded != null:
return loaded(_that);case ExploreStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExploreSection selectedSection,  ExploreContent content,  ExploreCity? selectedCity,  ExploreCategory? selectedCategory)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExploreStateInitial() when initial != null:
return initial();case ExploreStateLoading() when loading != null:
return loading();case ExploreStateLoaded() when loaded != null:
return loaded(_that.selectedSection,_that.content,_that.selectedCity,_that.selectedCategory);case ExploreStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExploreSection selectedSection,  ExploreContent content,  ExploreCity? selectedCity,  ExploreCategory? selectedCategory)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ExploreStateInitial():
return initial();case ExploreStateLoading():
return loading();case ExploreStateLoaded():
return loaded(_that.selectedSection,_that.content,_that.selectedCity,_that.selectedCategory);case ExploreStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExploreSection selectedSection,  ExploreContent content,  ExploreCity? selectedCity,  ExploreCategory? selectedCategory)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ExploreStateInitial() when initial != null:
return initial();case ExploreStateLoading() when loading != null:
return loading();case ExploreStateLoaded() when loaded != null:
return loaded(_that.selectedSection,_that.content,_that.selectedCity,_that.selectedCategory);case ExploreStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ExploreStateInitial implements ExploreState {
  const ExploreStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.initial()';
}


}




/// @nodoc


class ExploreStateLoading implements ExploreState {
  const ExploreStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreState.loading()';
}


}




/// @nodoc


class ExploreStateLoaded implements ExploreState {
  const ExploreStateLoaded({required this.selectedSection, required this.content, this.selectedCity, this.selectedCategory});
  

 final  ExploreSection selectedSection;
 final  ExploreContent content;
 final  ExploreCity? selectedCity;
 final  ExploreCategory? selectedCategory;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStateLoadedCopyWith<ExploreStateLoaded> get copyWith => _$ExploreStateLoadedCopyWithImpl<ExploreStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStateLoaded&&(identical(other.selectedSection, selectedSection) || other.selectedSection == selectedSection)&&(identical(other.content, content) || other.content == content)&&(identical(other.selectedCity, selectedCity) || other.selectedCity == selectedCity)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory));
}


@override
int get hashCode => Object.hash(runtimeType,selectedSection,content,selectedCity,selectedCategory);

@override
String toString() {
  return 'ExploreState.loaded(selectedSection: $selectedSection, content: $content, selectedCity: $selectedCity, selectedCategory: $selectedCategory)';
}


}

/// @nodoc
abstract mixin class $ExploreStateLoadedCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $ExploreStateLoadedCopyWith(ExploreStateLoaded value, $Res Function(ExploreStateLoaded) _then) = _$ExploreStateLoadedCopyWithImpl;
@useResult
$Res call({
 ExploreSection selectedSection, ExploreContent content, ExploreCity? selectedCity, ExploreCategory? selectedCategory
});


$ExploreContentCopyWith<$Res> get content;$ExploreCityCopyWith<$Res>? get selectedCity;$ExploreCategoryCopyWith<$Res>? get selectedCategory;

}
/// @nodoc
class _$ExploreStateLoadedCopyWithImpl<$Res>
    implements $ExploreStateLoadedCopyWith<$Res> {
  _$ExploreStateLoadedCopyWithImpl(this._self, this._then);

  final ExploreStateLoaded _self;
  final $Res Function(ExploreStateLoaded) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedSection = null,Object? content = null,Object? selectedCity = freezed,Object? selectedCategory = freezed,}) {
  return _then(ExploreStateLoaded(
selectedSection: null == selectedSection ? _self.selectedSection : selectedSection // ignore: cast_nullable_to_non_nullable
as ExploreSection,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ExploreContent,selectedCity: freezed == selectedCity ? _self.selectedCity : selectedCity // ignore: cast_nullable_to_non_nullable
as ExploreCity?,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as ExploreCategory?,
  ));
}

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExploreContentCopyWith<$Res> get content {
  
  return $ExploreContentCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExploreCityCopyWith<$Res>? get selectedCity {
    if (_self.selectedCity == null) {
    return null;
  }

  return $ExploreCityCopyWith<$Res>(_self.selectedCity!, (value) {
    return _then(_self.copyWith(selectedCity: value));
  });
}/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExploreCategoryCopyWith<$Res>? get selectedCategory {
    if (_self.selectedCategory == null) {
    return null;
  }

  return $ExploreCategoryCopyWith<$Res>(_self.selectedCategory!, (value) {
    return _then(_self.copyWith(selectedCategory: value));
  });
}
}

/// @nodoc


class ExploreStateError implements ExploreState {
  const ExploreStateError(this.message);
  

 final  String message;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreStateErrorCopyWith<ExploreStateError> get copyWith => _$ExploreStateErrorCopyWithImpl<ExploreStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExploreState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ExploreStateErrorCopyWith<$Res> implements $ExploreStateCopyWith<$Res> {
  factory $ExploreStateErrorCopyWith(ExploreStateError value, $Res Function(ExploreStateError) _then) = _$ExploreStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ExploreStateErrorCopyWithImpl<$Res>
    implements $ExploreStateErrorCopyWith<$Res> {
  _$ExploreStateErrorCopyWithImpl(this._self, this._then);

  final ExploreStateError _self;
  final $Res Function(ExploreStateError) _then;

/// Create a copy of ExploreState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ExploreStateError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ExploreContent {

 List<ExploreCity> get cities; List<ExploreCategory> get categories; List<FeaturedTrainerDto> get featuredTrainers; List<FeaturedTrainerDto> get nearbyTrainers; List<FeaturedTrainerDto> get recommendedTrainers; FeaturedTrainerDto? get spotlightTrainer; List<ExploreEventDto> get featuredEvents; List<ExploreEventDto> get upcomingEvents; List<DateTime> get sortedEventDates; Map<String, List<ExploreEventDto>> get groupedEvents; int get totalTrainersCount;
/// Create a copy of ExploreContent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreContentCopyWith<ExploreContent> get copyWith => _$ExploreContentCopyWithImpl<ExploreContent>(this as ExploreContent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreContent&&const DeepCollectionEquality().equals(other.cities, cities)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.featuredTrainers, featuredTrainers)&&const DeepCollectionEquality().equals(other.nearbyTrainers, nearbyTrainers)&&const DeepCollectionEquality().equals(other.recommendedTrainers, recommendedTrainers)&&(identical(other.spotlightTrainer, spotlightTrainer) || other.spotlightTrainer == spotlightTrainer)&&const DeepCollectionEquality().equals(other.featuredEvents, featuredEvents)&&const DeepCollectionEquality().equals(other.upcomingEvents, upcomingEvents)&&const DeepCollectionEquality().equals(other.sortedEventDates, sortedEventDates)&&const DeepCollectionEquality().equals(other.groupedEvents, groupedEvents)&&(identical(other.totalTrainersCount, totalTrainersCount) || other.totalTrainersCount == totalTrainersCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(cities),const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(featuredTrainers),const DeepCollectionEquality().hash(nearbyTrainers),const DeepCollectionEquality().hash(recommendedTrainers),spotlightTrainer,const DeepCollectionEquality().hash(featuredEvents),const DeepCollectionEquality().hash(upcomingEvents),const DeepCollectionEquality().hash(sortedEventDates),const DeepCollectionEquality().hash(groupedEvents),totalTrainersCount);

@override
String toString() {
  return 'ExploreContent(cities: $cities, categories: $categories, featuredTrainers: $featuredTrainers, nearbyTrainers: $nearbyTrainers, recommendedTrainers: $recommendedTrainers, spotlightTrainer: $spotlightTrainer, featuredEvents: $featuredEvents, upcomingEvents: $upcomingEvents, sortedEventDates: $sortedEventDates, groupedEvents: $groupedEvents, totalTrainersCount: $totalTrainersCount)';
}


}

/// @nodoc
abstract mixin class $ExploreContentCopyWith<$Res>  {
  factory $ExploreContentCopyWith(ExploreContent value, $Res Function(ExploreContent) _then) = _$ExploreContentCopyWithImpl;
@useResult
$Res call({
 List<ExploreCity> cities, List<ExploreCategory> categories, List<FeaturedTrainerDto> featuredTrainers, List<FeaturedTrainerDto> nearbyTrainers, List<FeaturedTrainerDto> recommendedTrainers, FeaturedTrainerDto? spotlightTrainer, List<ExploreEventDto> featuredEvents, List<ExploreEventDto> upcomingEvents, List<DateTime> sortedEventDates, Map<String, List<ExploreEventDto>> groupedEvents, int totalTrainersCount
});


$FeaturedTrainerDtoCopyWith<$Res>? get spotlightTrainer;

}
/// @nodoc
class _$ExploreContentCopyWithImpl<$Res>
    implements $ExploreContentCopyWith<$Res> {
  _$ExploreContentCopyWithImpl(this._self, this._then);

  final ExploreContent _self;
  final $Res Function(ExploreContent) _then;

/// Create a copy of ExploreContent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cities = null,Object? categories = null,Object? featuredTrainers = null,Object? nearbyTrainers = null,Object? recommendedTrainers = null,Object? spotlightTrainer = freezed,Object? featuredEvents = null,Object? upcomingEvents = null,Object? sortedEventDates = null,Object? groupedEvents = null,Object? totalTrainersCount = null,}) {
  return _then(_self.copyWith(
cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<ExploreCity>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExploreCategory>,featuredTrainers: null == featuredTrainers ? _self.featuredTrainers : featuredTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,nearbyTrainers: null == nearbyTrainers ? _self.nearbyTrainers : nearbyTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,recommendedTrainers: null == recommendedTrainers ? _self.recommendedTrainers : recommendedTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,spotlightTrainer: freezed == spotlightTrainer ? _self.spotlightTrainer : spotlightTrainer // ignore: cast_nullable_to_non_nullable
as FeaturedTrainerDto?,featuredEvents: null == featuredEvents ? _self.featuredEvents : featuredEvents // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,upcomingEvents: null == upcomingEvents ? _self.upcomingEvents : upcomingEvents // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,sortedEventDates: null == sortedEventDates ? _self.sortedEventDates : sortedEventDates // ignore: cast_nullable_to_non_nullable
as List<DateTime>,groupedEvents: null == groupedEvents ? _self.groupedEvents : groupedEvents // ignore: cast_nullable_to_non_nullable
as Map<String, List<ExploreEventDto>>,totalTrainersCount: null == totalTrainersCount ? _self.totalTrainersCount : totalTrainersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ExploreContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeaturedTrainerDtoCopyWith<$Res>? get spotlightTrainer {
    if (_self.spotlightTrainer == null) {
    return null;
  }

  return $FeaturedTrainerDtoCopyWith<$Res>(_self.spotlightTrainer!, (value) {
    return _then(_self.copyWith(spotlightTrainer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ExploreContent].
extension ExploreContentPatterns on ExploreContent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreContent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreContent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreContent value)  $default,){
final _that = this;
switch (_that) {
case _ExploreContent():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreContent value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreContent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExploreCity> cities,  List<ExploreCategory> categories,  List<FeaturedTrainerDto> featuredTrainers,  List<FeaturedTrainerDto> nearbyTrainers,  List<FeaturedTrainerDto> recommendedTrainers,  FeaturedTrainerDto? spotlightTrainer,  List<ExploreEventDto> featuredEvents,  List<ExploreEventDto> upcomingEvents,  List<DateTime> sortedEventDates,  Map<String, List<ExploreEventDto>> groupedEvents,  int totalTrainersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreContent() when $default != null:
return $default(_that.cities,_that.categories,_that.featuredTrainers,_that.nearbyTrainers,_that.recommendedTrainers,_that.spotlightTrainer,_that.featuredEvents,_that.upcomingEvents,_that.sortedEventDates,_that.groupedEvents,_that.totalTrainersCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExploreCity> cities,  List<ExploreCategory> categories,  List<FeaturedTrainerDto> featuredTrainers,  List<FeaturedTrainerDto> nearbyTrainers,  List<FeaturedTrainerDto> recommendedTrainers,  FeaturedTrainerDto? spotlightTrainer,  List<ExploreEventDto> featuredEvents,  List<ExploreEventDto> upcomingEvents,  List<DateTime> sortedEventDates,  Map<String, List<ExploreEventDto>> groupedEvents,  int totalTrainersCount)  $default,) {final _that = this;
switch (_that) {
case _ExploreContent():
return $default(_that.cities,_that.categories,_that.featuredTrainers,_that.nearbyTrainers,_that.recommendedTrainers,_that.spotlightTrainer,_that.featuredEvents,_that.upcomingEvents,_that.sortedEventDates,_that.groupedEvents,_that.totalTrainersCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExploreCity> cities,  List<ExploreCategory> categories,  List<FeaturedTrainerDto> featuredTrainers,  List<FeaturedTrainerDto> nearbyTrainers,  List<FeaturedTrainerDto> recommendedTrainers,  FeaturedTrainerDto? spotlightTrainer,  List<ExploreEventDto> featuredEvents,  List<ExploreEventDto> upcomingEvents,  List<DateTime> sortedEventDates,  Map<String, List<ExploreEventDto>> groupedEvents,  int totalTrainersCount)?  $default,) {final _that = this;
switch (_that) {
case _ExploreContent() when $default != null:
return $default(_that.cities,_that.categories,_that.featuredTrainers,_that.nearbyTrainers,_that.recommendedTrainers,_that.spotlightTrainer,_that.featuredEvents,_that.upcomingEvents,_that.sortedEventDates,_that.groupedEvents,_that.totalTrainersCount);case _:
  return null;

}
}

}

/// @nodoc


class _ExploreContent implements ExploreContent {
  const _ExploreContent({final  List<ExploreCity> cities = const <ExploreCity>[], final  List<ExploreCategory> categories = const <ExploreCategory>[], final  List<FeaturedTrainerDto> featuredTrainers = const <FeaturedTrainerDto>[], final  List<FeaturedTrainerDto> nearbyTrainers = const <FeaturedTrainerDto>[], final  List<FeaturedTrainerDto> recommendedTrainers = const <FeaturedTrainerDto>[], this.spotlightTrainer, final  List<ExploreEventDto> featuredEvents = const <ExploreEventDto>[], final  List<ExploreEventDto> upcomingEvents = const <ExploreEventDto>[], final  List<DateTime> sortedEventDates = const <DateTime>[], final  Map<String, List<ExploreEventDto>> groupedEvents = const <String, List<ExploreEventDto>>{}, this.totalTrainersCount = 0}): _cities = cities,_categories = categories,_featuredTrainers = featuredTrainers,_nearbyTrainers = nearbyTrainers,_recommendedTrainers = recommendedTrainers,_featuredEvents = featuredEvents,_upcomingEvents = upcomingEvents,_sortedEventDates = sortedEventDates,_groupedEvents = groupedEvents;
  

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

 final  List<FeaturedTrainerDto> _featuredTrainers;
@override@JsonKey() List<FeaturedTrainerDto> get featuredTrainers {
  if (_featuredTrainers is EqualUnmodifiableListView) return _featuredTrainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredTrainers);
}

 final  List<FeaturedTrainerDto> _nearbyTrainers;
@override@JsonKey() List<FeaturedTrainerDto> get nearbyTrainers {
  if (_nearbyTrainers is EqualUnmodifiableListView) return _nearbyTrainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nearbyTrainers);
}

 final  List<FeaturedTrainerDto> _recommendedTrainers;
@override@JsonKey() List<FeaturedTrainerDto> get recommendedTrainers {
  if (_recommendedTrainers is EqualUnmodifiableListView) return _recommendedTrainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedTrainers);
}

@override final  FeaturedTrainerDto? spotlightTrainer;
 final  List<ExploreEventDto> _featuredEvents;
@override@JsonKey() List<ExploreEventDto> get featuredEvents {
  if (_featuredEvents is EqualUnmodifiableListView) return _featuredEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredEvents);
}

 final  List<ExploreEventDto> _upcomingEvents;
@override@JsonKey() List<ExploreEventDto> get upcomingEvents {
  if (_upcomingEvents is EqualUnmodifiableListView) return _upcomingEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_upcomingEvents);
}

 final  List<DateTime> _sortedEventDates;
@override@JsonKey() List<DateTime> get sortedEventDates {
  if (_sortedEventDates is EqualUnmodifiableListView) return _sortedEventDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sortedEventDates);
}

 final  Map<String, List<ExploreEventDto>> _groupedEvents;
@override@JsonKey() Map<String, List<ExploreEventDto>> get groupedEvents {
  if (_groupedEvents is EqualUnmodifiableMapView) return _groupedEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_groupedEvents);
}

@override@JsonKey() final  int totalTrainersCount;

/// Create a copy of ExploreContent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreContentCopyWith<_ExploreContent> get copyWith => __$ExploreContentCopyWithImpl<_ExploreContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreContent&&const DeepCollectionEquality().equals(other._cities, _cities)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._featuredTrainers, _featuredTrainers)&&const DeepCollectionEquality().equals(other._nearbyTrainers, _nearbyTrainers)&&const DeepCollectionEquality().equals(other._recommendedTrainers, _recommendedTrainers)&&(identical(other.spotlightTrainer, spotlightTrainer) || other.spotlightTrainer == spotlightTrainer)&&const DeepCollectionEquality().equals(other._featuredEvents, _featuredEvents)&&const DeepCollectionEquality().equals(other._upcomingEvents, _upcomingEvents)&&const DeepCollectionEquality().equals(other._sortedEventDates, _sortedEventDates)&&const DeepCollectionEquality().equals(other._groupedEvents, _groupedEvents)&&(identical(other.totalTrainersCount, totalTrainersCount) || other.totalTrainersCount == totalTrainersCount));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_cities),const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_featuredTrainers),const DeepCollectionEquality().hash(_nearbyTrainers),const DeepCollectionEquality().hash(_recommendedTrainers),spotlightTrainer,const DeepCollectionEquality().hash(_featuredEvents),const DeepCollectionEquality().hash(_upcomingEvents),const DeepCollectionEquality().hash(_sortedEventDates),const DeepCollectionEquality().hash(_groupedEvents),totalTrainersCount);

@override
String toString() {
  return 'ExploreContent(cities: $cities, categories: $categories, featuredTrainers: $featuredTrainers, nearbyTrainers: $nearbyTrainers, recommendedTrainers: $recommendedTrainers, spotlightTrainer: $spotlightTrainer, featuredEvents: $featuredEvents, upcomingEvents: $upcomingEvents, sortedEventDates: $sortedEventDates, groupedEvents: $groupedEvents, totalTrainersCount: $totalTrainersCount)';
}


}

/// @nodoc
abstract mixin class _$ExploreContentCopyWith<$Res> implements $ExploreContentCopyWith<$Res> {
  factory _$ExploreContentCopyWith(_ExploreContent value, $Res Function(_ExploreContent) _then) = __$ExploreContentCopyWithImpl;
@override @useResult
$Res call({
 List<ExploreCity> cities, List<ExploreCategory> categories, List<FeaturedTrainerDto> featuredTrainers, List<FeaturedTrainerDto> nearbyTrainers, List<FeaturedTrainerDto> recommendedTrainers, FeaturedTrainerDto? spotlightTrainer, List<ExploreEventDto> featuredEvents, List<ExploreEventDto> upcomingEvents, List<DateTime> sortedEventDates, Map<String, List<ExploreEventDto>> groupedEvents, int totalTrainersCount
});


@override $FeaturedTrainerDtoCopyWith<$Res>? get spotlightTrainer;

}
/// @nodoc
class __$ExploreContentCopyWithImpl<$Res>
    implements _$ExploreContentCopyWith<$Res> {
  __$ExploreContentCopyWithImpl(this._self, this._then);

  final _ExploreContent _self;
  final $Res Function(_ExploreContent) _then;

/// Create a copy of ExploreContent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cities = null,Object? categories = null,Object? featuredTrainers = null,Object? nearbyTrainers = null,Object? recommendedTrainers = null,Object? spotlightTrainer = freezed,Object? featuredEvents = null,Object? upcomingEvents = null,Object? sortedEventDates = null,Object? groupedEvents = null,Object? totalTrainersCount = null,}) {
  return _then(_ExploreContent(
cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<ExploreCity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ExploreCategory>,featuredTrainers: null == featuredTrainers ? _self._featuredTrainers : featuredTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,nearbyTrainers: null == nearbyTrainers ? _self._nearbyTrainers : nearbyTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,recommendedTrainers: null == recommendedTrainers ? _self._recommendedTrainers : recommendedTrainers // ignore: cast_nullable_to_non_nullable
as List<FeaturedTrainerDto>,spotlightTrainer: freezed == spotlightTrainer ? _self.spotlightTrainer : spotlightTrainer // ignore: cast_nullable_to_non_nullable
as FeaturedTrainerDto?,featuredEvents: null == featuredEvents ? _self._featuredEvents : featuredEvents // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,upcomingEvents: null == upcomingEvents ? _self._upcomingEvents : upcomingEvents // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,sortedEventDates: null == sortedEventDates ? _self._sortedEventDates : sortedEventDates // ignore: cast_nullable_to_non_nullable
as List<DateTime>,groupedEvents: null == groupedEvents ? _self._groupedEvents : groupedEvents // ignore: cast_nullable_to_non_nullable
as Map<String, List<ExploreEventDto>>,totalTrainersCount: null == totalTrainersCount ? _self.totalTrainersCount : totalTrainersCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ExploreContent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FeaturedTrainerDtoCopyWith<$Res>? get spotlightTrainer {
    if (_self.spotlightTrainer == null) {
    return null;
  }

  return $FeaturedTrainerDtoCopyWith<$Res>(_self.spotlightTrainer!, (value) {
    return _then(_self.copyWith(spotlightTrainer: value));
  });
}
}

// dart format on
