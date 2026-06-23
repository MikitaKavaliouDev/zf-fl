// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapItem {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapItem);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapItem()';
}


}

/// @nodoc
class $MapItemCopyWith<$Res>  {
$MapItemCopyWith(MapItem _, $Res Function(MapItem) __);
}


/// Adds pattern-matching-related methods to [MapItem].
extension MapItemPatterns on MapItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MapItemTrainer value)?  trainer,TResult Function( MapItemEvent value)?  event,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MapItemTrainer() when trainer != null:
return trainer(_that);case MapItemEvent() when event != null:
return event(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MapItemTrainer value)  trainer,required TResult Function( MapItemEvent value)  event,}){
final _that = this;
switch (_that) {
case MapItemTrainer():
return trainer(_that);case MapItemEvent():
return event(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MapItemTrainer value)?  trainer,TResult? Function( MapItemEvent value)?  event,}){
final _that = this;
switch (_that) {
case MapItemTrainer() when trainer != null:
return trainer(_that);case MapItemEvent() when event != null:
return event(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TrainerListItemDto trainer)?  trainer,TResult Function( ExploreEventDto event)?  event,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MapItemTrainer() when trainer != null:
return trainer(_that.trainer);case MapItemEvent() when event != null:
return event(_that.event);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TrainerListItemDto trainer)  trainer,required TResult Function( ExploreEventDto event)  event,}) {final _that = this;
switch (_that) {
case MapItemTrainer():
return trainer(_that.trainer);case MapItemEvent():
return event(_that.event);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TrainerListItemDto trainer)?  trainer,TResult? Function( ExploreEventDto event)?  event,}) {final _that = this;
switch (_that) {
case MapItemTrainer() when trainer != null:
return trainer(_that.trainer);case MapItemEvent() when event != null:
return event(_that.event);case _:
  return null;

}
}

}

/// @nodoc


class MapItemTrainer implements MapItem {
  const MapItemTrainer(this.trainer);
  

 final  TrainerListItemDto trainer;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapItemTrainerCopyWith<MapItemTrainer> get copyWith => _$MapItemTrainerCopyWithImpl<MapItemTrainer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapItemTrainer&&(identical(other.trainer, trainer) || other.trainer == trainer));
}


@override
int get hashCode => Object.hash(runtimeType,trainer);

@override
String toString() {
  return 'MapItem.trainer(trainer: $trainer)';
}


}

/// @nodoc
abstract mixin class $MapItemTrainerCopyWith<$Res> implements $MapItemCopyWith<$Res> {
  factory $MapItemTrainerCopyWith(MapItemTrainer value, $Res Function(MapItemTrainer) _then) = _$MapItemTrainerCopyWithImpl;
@useResult
$Res call({
 TrainerListItemDto trainer
});


$TrainerListItemDtoCopyWith<$Res> get trainer;

}
/// @nodoc
class _$MapItemTrainerCopyWithImpl<$Res>
    implements $MapItemTrainerCopyWith<$Res> {
  _$MapItemTrainerCopyWithImpl(this._self, this._then);

  final MapItemTrainer _self;
  final $Res Function(MapItemTrainer) _then;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trainer = null,}) {
  return _then(MapItemTrainer(
null == trainer ? _self.trainer : trainer // ignore: cast_nullable_to_non_nullable
as TrainerListItemDto,
  ));
}

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerListItemDtoCopyWith<$Res> get trainer {
  
  return $TrainerListItemDtoCopyWith<$Res>(_self.trainer, (value) {
    return _then(_self.copyWith(trainer: value));
  });
}
}

/// @nodoc


class MapItemEvent implements MapItem {
  const MapItemEvent(this.event);
  

 final  ExploreEventDto event;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapItemEventCopyWith<MapItemEvent> get copyWith => _$MapItemEventCopyWithImpl<MapItemEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapItemEvent&&(identical(other.event, event) || other.event == event));
}


@override
int get hashCode => Object.hash(runtimeType,event);

@override
String toString() {
  return 'MapItem.event(event: $event)';
}


}

/// @nodoc
abstract mixin class $MapItemEventCopyWith<$Res> implements $MapItemCopyWith<$Res> {
  factory $MapItemEventCopyWith(MapItemEvent value, $Res Function(MapItemEvent) _then) = _$MapItemEventCopyWithImpl;
@useResult
$Res call({
 ExploreEventDto event
});


$ExploreEventDtoCopyWith<$Res> get event;

}
/// @nodoc
class _$MapItemEventCopyWithImpl<$Res>
    implements $MapItemEventCopyWith<$Res> {
  _$MapItemEventCopyWithImpl(this._self, this._then);

  final MapItemEvent _self;
  final $Res Function(MapItemEvent) _then;

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? event = null,}) {
  return _then(MapItemEvent(
null == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as ExploreEventDto,
  ));
}

/// Create a copy of MapItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExploreEventDtoCopyWith<$Res> get event {
  
  return $ExploreEventDtoCopyWith<$Res>(_self.event, (value) {
    return _then(_self.copyWith(event: value));
  });
}
}

/// @nodoc
mixin _$MapCluster {

 String get id; double get latitude; double get longitude; List<MapItem> get items;
/// Create a copy of MapCluster
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapClusterCopyWith<MapCluster> get copyWith => _$MapClusterCopyWithImpl<MapCluster>(this as MapCluster, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapCluster&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.items, items));
}


@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'MapCluster(id: $id, latitude: $latitude, longitude: $longitude, items: $items)';
}


}

/// @nodoc
abstract mixin class $MapClusterCopyWith<$Res>  {
  factory $MapClusterCopyWith(MapCluster value, $Res Function(MapCluster) _then) = _$MapClusterCopyWithImpl;
@useResult
$Res call({
 String id, double latitude, double longitude, List<MapItem> items
});




}
/// @nodoc
class _$MapClusterCopyWithImpl<$Res>
    implements $MapClusterCopyWith<$Res> {
  _$MapClusterCopyWithImpl(this._self, this._then);

  final MapCluster _self;
  final $Res Function(MapCluster) _then;

/// Create a copy of MapCluster
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? latitude = null,Object? longitude = null,Object? items = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MapItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [MapCluster].
extension MapClusterPatterns on MapCluster {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapCluster value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapCluster() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapCluster value)  $default,){
final _that = this;
switch (_that) {
case _MapCluster():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapCluster value)?  $default,){
final _that = this;
switch (_that) {
case _MapCluster() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double latitude,  double longitude,  List<MapItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapCluster() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double latitude,  double longitude,  List<MapItem> items)  $default,) {final _that = this;
switch (_that) {
case _MapCluster():
return $default(_that.id,_that.latitude,_that.longitude,_that.items);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double latitude,  double longitude,  List<MapItem> items)?  $default,) {final _that = this;
switch (_that) {
case _MapCluster() when $default != null:
return $default(_that.id,_that.latitude,_that.longitude,_that.items);case _:
  return null;

}
}

}

/// @nodoc


class _MapCluster implements MapCluster {
  const _MapCluster({required this.id, required this.latitude, required this.longitude, required final  List<MapItem> items}): _items = items;
  

@override final  String id;
@override final  double latitude;
@override final  double longitude;
 final  List<MapItem> _items;
@override List<MapItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of MapCluster
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapClusterCopyWith<_MapCluster> get copyWith => __$MapClusterCopyWithImpl<_MapCluster>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapCluster&&(identical(other.id, id) || other.id == id)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,id,latitude,longitude,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'MapCluster(id: $id, latitude: $latitude, longitude: $longitude, items: $items)';
}


}

/// @nodoc
abstract mixin class _$MapClusterCopyWith<$Res> implements $MapClusterCopyWith<$Res> {
  factory _$MapClusterCopyWith(_MapCluster value, $Res Function(_MapCluster) _then) = __$MapClusterCopyWithImpl;
@override @useResult
$Res call({
 String id, double latitude, double longitude, List<MapItem> items
});




}
/// @nodoc
class __$MapClusterCopyWithImpl<$Res>
    implements _$MapClusterCopyWith<$Res> {
  __$MapClusterCopyWithImpl(this._self, this._then);

  final _MapCluster _self;
  final $Res Function(_MapCluster) _then;

/// Create a copy of MapCluster
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? latitude = null,Object? longitude = null,Object? items = null,}) {
  return _then(_MapCluster(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MapItem>,
  ));
}


}

/// @nodoc
mixin _$ExploreMapState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreMapState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreMapState()';
}


}

/// @nodoc
class $ExploreMapStateCopyWith<$Res>  {
$ExploreMapStateCopyWith(ExploreMapState _, $Res Function(ExploreMapState) __);
}


/// Adds pattern-matching-related methods to [ExploreMapState].
extension ExploreMapStatePatterns on ExploreMapState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExploreMapInitial value)?  initial,TResult Function( ExploreMapLoading value)?  loading,TResult Function( ExploreMapLoaded value)?  loaded,TResult Function( ExploreMapError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExploreMapInitial() when initial != null:
return initial(_that);case ExploreMapLoading() when loading != null:
return loading(_that);case ExploreMapLoaded() when loaded != null:
return loaded(_that);case ExploreMapError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExploreMapInitial value)  initial,required TResult Function( ExploreMapLoading value)  loading,required TResult Function( ExploreMapLoaded value)  loaded,required TResult Function( ExploreMapError value)  error,}){
final _that = this;
switch (_that) {
case ExploreMapInitial():
return initial(_that);case ExploreMapLoading():
return loading(_that);case ExploreMapLoaded():
return loaded(_that);case ExploreMapError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExploreMapInitial value)?  initial,TResult? Function( ExploreMapLoading value)?  loading,TResult? Function( ExploreMapLoaded value)?  loaded,TResult? Function( ExploreMapError value)?  error,}){
final _that = this;
switch (_that) {
case ExploreMapInitial() when initial != null:
return initial(_that);case ExploreMapLoading() when loading != null:
return loading(_that);case ExploreMapLoaded() when loaded != null:
return loaded(_that);case ExploreMapError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TrainerListItemDto> trainers,  List<ExploreEventDto> events,  List<MapCluster> clusters,  MapFilterMode filterMode,  String? searchQuery,  String? selectedClusterId,  TrainerListItemDto? selectedTrainer,  ExploreEventDto? selectedEvent,  bool hasMoreTrainers,  bool hasMoreEvents,  bool isLoadingMore,  double? userLat,  double? userLng,  double zoomLevel)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExploreMapInitial() when initial != null:
return initial();case ExploreMapLoading() when loading != null:
return loading();case ExploreMapLoaded() when loaded != null:
return loaded(_that.trainers,_that.events,_that.clusters,_that.filterMode,_that.searchQuery,_that.selectedClusterId,_that.selectedTrainer,_that.selectedEvent,_that.hasMoreTrainers,_that.hasMoreEvents,_that.isLoadingMore,_that.userLat,_that.userLng,_that.zoomLevel);case ExploreMapError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TrainerListItemDto> trainers,  List<ExploreEventDto> events,  List<MapCluster> clusters,  MapFilterMode filterMode,  String? searchQuery,  String? selectedClusterId,  TrainerListItemDto? selectedTrainer,  ExploreEventDto? selectedEvent,  bool hasMoreTrainers,  bool hasMoreEvents,  bool isLoadingMore,  double? userLat,  double? userLng,  double zoomLevel)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ExploreMapInitial():
return initial();case ExploreMapLoading():
return loading();case ExploreMapLoaded():
return loaded(_that.trainers,_that.events,_that.clusters,_that.filterMode,_that.searchQuery,_that.selectedClusterId,_that.selectedTrainer,_that.selectedEvent,_that.hasMoreTrainers,_that.hasMoreEvents,_that.isLoadingMore,_that.userLat,_that.userLng,_that.zoomLevel);case ExploreMapError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TrainerListItemDto> trainers,  List<ExploreEventDto> events,  List<MapCluster> clusters,  MapFilterMode filterMode,  String? searchQuery,  String? selectedClusterId,  TrainerListItemDto? selectedTrainer,  ExploreEventDto? selectedEvent,  bool hasMoreTrainers,  bool hasMoreEvents,  bool isLoadingMore,  double? userLat,  double? userLng,  double zoomLevel)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ExploreMapInitial() when initial != null:
return initial();case ExploreMapLoading() when loading != null:
return loading();case ExploreMapLoaded() when loaded != null:
return loaded(_that.trainers,_that.events,_that.clusters,_that.filterMode,_that.searchQuery,_that.selectedClusterId,_that.selectedTrainer,_that.selectedEvent,_that.hasMoreTrainers,_that.hasMoreEvents,_that.isLoadingMore,_that.userLat,_that.userLng,_that.zoomLevel);case ExploreMapError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ExploreMapInitial implements ExploreMapState {
  const ExploreMapInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreMapInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreMapState.initial()';
}


}




/// @nodoc


class ExploreMapLoading implements ExploreMapState {
  const ExploreMapLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreMapLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExploreMapState.loading()';
}


}




/// @nodoc


class ExploreMapLoaded implements ExploreMapState {
  const ExploreMapLoaded({final  List<TrainerListItemDto> trainers = const [], final  List<ExploreEventDto> events = const [], final  List<MapCluster> clusters = const [], this.filterMode = MapFilterMode.all, this.searchQuery, this.selectedClusterId, this.selectedTrainer, this.selectedEvent, this.hasMoreTrainers = true, this.hasMoreEvents = true, this.isLoadingMore = false, this.userLat, this.userLng, this.zoomLevel = 11.0}): _trainers = trainers,_events = events,_clusters = clusters;
  

 final  List<TrainerListItemDto> _trainers;
@JsonKey() List<TrainerListItemDto> get trainers {
  if (_trainers is EqualUnmodifiableListView) return _trainers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainers);
}

 final  List<ExploreEventDto> _events;
@JsonKey() List<ExploreEventDto> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

 final  List<MapCluster> _clusters;
@JsonKey() List<MapCluster> get clusters {
  if (_clusters is EqualUnmodifiableListView) return _clusters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clusters);
}

@JsonKey() final  MapFilterMode filterMode;
 final  String? searchQuery;
 final  String? selectedClusterId;
 final  TrainerListItemDto? selectedTrainer;
 final  ExploreEventDto? selectedEvent;
@JsonKey() final  bool hasMoreTrainers;
@JsonKey() final  bool hasMoreEvents;
@JsonKey() final  bool isLoadingMore;
 final  double? userLat;
 final  double? userLng;
@JsonKey() final  double zoomLevel;

/// Create a copy of ExploreMapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreMapLoadedCopyWith<ExploreMapLoaded> get copyWith => _$ExploreMapLoadedCopyWithImpl<ExploreMapLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreMapLoaded&&const DeepCollectionEquality().equals(other._trainers, _trainers)&&const DeepCollectionEquality().equals(other._events, _events)&&const DeepCollectionEquality().equals(other._clusters, _clusters)&&(identical(other.filterMode, filterMode) || other.filterMode == filterMode)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedClusterId, selectedClusterId) || other.selectedClusterId == selectedClusterId)&&(identical(other.selectedTrainer, selectedTrainer) || other.selectedTrainer == selectedTrainer)&&(identical(other.selectedEvent, selectedEvent) || other.selectedEvent == selectedEvent)&&(identical(other.hasMoreTrainers, hasMoreTrainers) || other.hasMoreTrainers == hasMoreTrainers)&&(identical(other.hasMoreEvents, hasMoreEvents) || other.hasMoreEvents == hasMoreEvents)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.userLat, userLat) || other.userLat == userLat)&&(identical(other.userLng, userLng) || other.userLng == userLng)&&(identical(other.zoomLevel, zoomLevel) || other.zoomLevel == zoomLevel));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_trainers),const DeepCollectionEquality().hash(_events),const DeepCollectionEquality().hash(_clusters),filterMode,searchQuery,selectedClusterId,selectedTrainer,selectedEvent,hasMoreTrainers,hasMoreEvents,isLoadingMore,userLat,userLng,zoomLevel);

@override
String toString() {
  return 'ExploreMapState.loaded(trainers: $trainers, events: $events, clusters: $clusters, filterMode: $filterMode, searchQuery: $searchQuery, selectedClusterId: $selectedClusterId, selectedTrainer: $selectedTrainer, selectedEvent: $selectedEvent, hasMoreTrainers: $hasMoreTrainers, hasMoreEvents: $hasMoreEvents, isLoadingMore: $isLoadingMore, userLat: $userLat, userLng: $userLng, zoomLevel: $zoomLevel)';
}


}

/// @nodoc
abstract mixin class $ExploreMapLoadedCopyWith<$Res> implements $ExploreMapStateCopyWith<$Res> {
  factory $ExploreMapLoadedCopyWith(ExploreMapLoaded value, $Res Function(ExploreMapLoaded) _then) = _$ExploreMapLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainerListItemDto> trainers, List<ExploreEventDto> events, List<MapCluster> clusters, MapFilterMode filterMode, String? searchQuery, String? selectedClusterId, TrainerListItemDto? selectedTrainer, ExploreEventDto? selectedEvent, bool hasMoreTrainers, bool hasMoreEvents, bool isLoadingMore, double? userLat, double? userLng, double zoomLevel
});


$TrainerListItemDtoCopyWith<$Res>? get selectedTrainer;$ExploreEventDtoCopyWith<$Res>? get selectedEvent;

}
/// @nodoc
class _$ExploreMapLoadedCopyWithImpl<$Res>
    implements $ExploreMapLoadedCopyWith<$Res> {
  _$ExploreMapLoadedCopyWithImpl(this._self, this._then);

  final ExploreMapLoaded _self;
  final $Res Function(ExploreMapLoaded) _then;

/// Create a copy of ExploreMapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trainers = null,Object? events = null,Object? clusters = null,Object? filterMode = null,Object? searchQuery = freezed,Object? selectedClusterId = freezed,Object? selectedTrainer = freezed,Object? selectedEvent = freezed,Object? hasMoreTrainers = null,Object? hasMoreEvents = null,Object? isLoadingMore = null,Object? userLat = freezed,Object? userLng = freezed,Object? zoomLevel = null,}) {
  return _then(ExploreMapLoaded(
trainers: null == trainers ? _self._trainers : trainers // ignore: cast_nullable_to_non_nullable
as List<TrainerListItemDto>,events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,clusters: null == clusters ? _self._clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<MapCluster>,filterMode: null == filterMode ? _self.filterMode : filterMode // ignore: cast_nullable_to_non_nullable
as MapFilterMode,searchQuery: freezed == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String?,selectedClusterId: freezed == selectedClusterId ? _self.selectedClusterId : selectedClusterId // ignore: cast_nullable_to_non_nullable
as String?,selectedTrainer: freezed == selectedTrainer ? _self.selectedTrainer : selectedTrainer // ignore: cast_nullable_to_non_nullable
as TrainerListItemDto?,selectedEvent: freezed == selectedEvent ? _self.selectedEvent : selectedEvent // ignore: cast_nullable_to_non_nullable
as ExploreEventDto?,hasMoreTrainers: null == hasMoreTrainers ? _self.hasMoreTrainers : hasMoreTrainers // ignore: cast_nullable_to_non_nullable
as bool,hasMoreEvents: null == hasMoreEvents ? _self.hasMoreEvents : hasMoreEvents // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,userLat: freezed == userLat ? _self.userLat : userLat // ignore: cast_nullable_to_non_nullable
as double?,userLng: freezed == userLng ? _self.userLng : userLng // ignore: cast_nullable_to_non_nullable
as double?,zoomLevel: null == zoomLevel ? _self.zoomLevel : zoomLevel // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of ExploreMapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TrainerListItemDtoCopyWith<$Res>? get selectedTrainer {
    if (_self.selectedTrainer == null) {
    return null;
  }

  return $TrainerListItemDtoCopyWith<$Res>(_self.selectedTrainer!, (value) {
    return _then(_self.copyWith(selectedTrainer: value));
  });
}/// Create a copy of ExploreMapState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExploreEventDtoCopyWith<$Res>? get selectedEvent {
    if (_self.selectedEvent == null) {
    return null;
  }

  return $ExploreEventDtoCopyWith<$Res>(_self.selectedEvent!, (value) {
    return _then(_self.copyWith(selectedEvent: value));
  });
}
}

/// @nodoc


class ExploreMapError implements ExploreMapState {
  const ExploreMapError(this.message);
  

 final  String message;

/// Create a copy of ExploreMapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreMapErrorCopyWith<ExploreMapError> get copyWith => _$ExploreMapErrorCopyWithImpl<ExploreMapError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreMapError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ExploreMapState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ExploreMapErrorCopyWith<$Res> implements $ExploreMapStateCopyWith<$Res> {
  factory $ExploreMapErrorCopyWith(ExploreMapError value, $Res Function(ExploreMapError) _then) = _$ExploreMapErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ExploreMapErrorCopyWithImpl<$Res>
    implements $ExploreMapErrorCopyWith<$Res> {
  _$ExploreMapErrorCopyWithImpl(this._self, this._then);

  final ExploreMapError _self;
  final $Res Function(ExploreMapError) _then;

/// Create a copy of ExploreMapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ExploreMapError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
