// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedEvents {

 List<ExploreEventDto> get events; int get page; int get limit; bool get hasMore; int get total;
/// Create a copy of PaginatedEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedEventsCopyWith<PaginatedEvents> get copyWith => _$PaginatedEventsCopyWithImpl<PaginatedEvents>(this as PaginatedEvents, _$identity);

  /// Serializes this PaginatedEvents to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedEvents&&const DeepCollectionEquality().equals(other.events, events)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(events),page,limit,hasMore,total);

@override
String toString() {
  return 'PaginatedEvents(events: $events, page: $page, limit: $limit, hasMore: $hasMore, total: $total)';
}


}

/// @nodoc
abstract mixin class $PaginatedEventsCopyWith<$Res>  {
  factory $PaginatedEventsCopyWith(PaginatedEvents value, $Res Function(PaginatedEvents) _then) = _$PaginatedEventsCopyWithImpl;
@useResult
$Res call({
 List<ExploreEventDto> events, int page, int limit, bool hasMore, int total
});




}
/// @nodoc
class _$PaginatedEventsCopyWithImpl<$Res>
    implements $PaginatedEventsCopyWith<$Res> {
  _$PaginatedEventsCopyWithImpl(this._self, this._then);

  final PaginatedEvents _self;
  final $Res Function(PaginatedEvents) _then;

/// Create a copy of PaginatedEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? events = null,Object? page = null,Object? limit = null,Object? hasMore = null,Object? total = null,}) {
  return _then(_self.copyWith(
events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaginatedEvents].
extension PaginatedEventsPatterns on PaginatedEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedEvents value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedEvents() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedEvents value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedEvents():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedEvents value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedEvents() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExploreEventDto> events,  int page,  int limit,  bool hasMore,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedEvents() when $default != null:
return $default(_that.events,_that.page,_that.limit,_that.hasMore,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExploreEventDto> events,  int page,  int limit,  bool hasMore,  int total)  $default,) {final _that = this;
switch (_that) {
case _PaginatedEvents():
return $default(_that.events,_that.page,_that.limit,_that.hasMore,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExploreEventDto> events,  int page,  int limit,  bool hasMore,  int total)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedEvents() when $default != null:
return $default(_that.events,_that.page,_that.limit,_that.hasMore,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaginatedEvents implements PaginatedEvents {
  const _PaginatedEvents({final  List<ExploreEventDto> events = const <ExploreEventDto>[], required this.page, required this.limit, required this.hasMore, this.total = 0}): _events = events;
  factory _PaginatedEvents.fromJson(Map<String, dynamic> json) => _$PaginatedEventsFromJson(json);

 final  List<ExploreEventDto> _events;
@override@JsonKey() List<ExploreEventDto> get events {
  if (_events is EqualUnmodifiableListView) return _events;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_events);
}

@override final  int page;
@override final  int limit;
@override final  bool hasMore;
@override@JsonKey() final  int total;

/// Create a copy of PaginatedEvents
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedEventsCopyWith<_PaginatedEvents> get copyWith => __$PaginatedEventsCopyWithImpl<_PaginatedEvents>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaginatedEventsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedEvents&&const DeepCollectionEquality().equals(other._events, _events)&&(identical(other.page, page) || other.page == page)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_events),page,limit,hasMore,total);

@override
String toString() {
  return 'PaginatedEvents(events: $events, page: $page, limit: $limit, hasMore: $hasMore, total: $total)';
}


}

/// @nodoc
abstract mixin class _$PaginatedEventsCopyWith<$Res> implements $PaginatedEventsCopyWith<$Res> {
  factory _$PaginatedEventsCopyWith(_PaginatedEvents value, $Res Function(_PaginatedEvents) _then) = __$PaginatedEventsCopyWithImpl;
@override @useResult
$Res call({
 List<ExploreEventDto> events, int page, int limit, bool hasMore, int total
});




}
/// @nodoc
class __$PaginatedEventsCopyWithImpl<$Res>
    implements _$PaginatedEventsCopyWith<$Res> {
  __$PaginatedEventsCopyWithImpl(this._self, this._then);

  final _PaginatedEvents _self;
  final $Res Function(_PaginatedEvents) _then;

/// Create a copy of PaginatedEvents
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? events = null,Object? page = null,Object? limit = null,Object? hasMore = null,Object? total = null,}) {
  return _then(_PaginatedEvents(
events: null == events ? _self._events : events // ignore: cast_nullable_to_non_nullable
as List<ExploreEventDto>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
