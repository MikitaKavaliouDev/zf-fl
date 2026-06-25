// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsResponseDto {

 List<String> get heatmapDates; List<VolumeDataPoint> get volumeHistory; List<MuscleDataPoint> get muscleDistribution; List<PRDataPoint> get recentPRs; double get consistency;
/// Create a copy of AnalyticsResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsResponseDtoCopyWith<AnalyticsResponseDto> get copyWith => _$AnalyticsResponseDtoCopyWithImpl<AnalyticsResponseDto>(this as AnalyticsResponseDto, _$identity);

  /// Serializes this AnalyticsResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsResponseDto&&const DeepCollectionEquality().equals(other.heatmapDates, heatmapDates)&&const DeepCollectionEquality().equals(other.volumeHistory, volumeHistory)&&const DeepCollectionEquality().equals(other.muscleDistribution, muscleDistribution)&&const DeepCollectionEquality().equals(other.recentPRs, recentPRs)&&(identical(other.consistency, consistency) || other.consistency == consistency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(heatmapDates),const DeepCollectionEquality().hash(volumeHistory),const DeepCollectionEquality().hash(muscleDistribution),const DeepCollectionEquality().hash(recentPRs),consistency);

@override
String toString() {
  return 'AnalyticsResponseDto(heatmapDates: $heatmapDates, volumeHistory: $volumeHistory, muscleDistribution: $muscleDistribution, recentPRs: $recentPRs, consistency: $consistency)';
}


}

/// @nodoc
abstract mixin class $AnalyticsResponseDtoCopyWith<$Res>  {
  factory $AnalyticsResponseDtoCopyWith(AnalyticsResponseDto value, $Res Function(AnalyticsResponseDto) _then) = _$AnalyticsResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<String> heatmapDates, List<VolumeDataPoint> volumeHistory, List<MuscleDataPoint> muscleDistribution, List<PRDataPoint> recentPRs, double consistency
});




}
/// @nodoc
class _$AnalyticsResponseDtoCopyWithImpl<$Res>
    implements $AnalyticsResponseDtoCopyWith<$Res> {
  _$AnalyticsResponseDtoCopyWithImpl(this._self, this._then);

  final AnalyticsResponseDto _self;
  final $Res Function(AnalyticsResponseDto) _then;

/// Create a copy of AnalyticsResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heatmapDates = null,Object? volumeHistory = null,Object? muscleDistribution = null,Object? recentPRs = null,Object? consistency = null,}) {
  return _then(_self.copyWith(
heatmapDates: null == heatmapDates ? _self.heatmapDates : heatmapDates // ignore: cast_nullable_to_non_nullable
as List<String>,volumeHistory: null == volumeHistory ? _self.volumeHistory : volumeHistory // ignore: cast_nullable_to_non_nullable
as List<VolumeDataPoint>,muscleDistribution: null == muscleDistribution ? _self.muscleDistribution : muscleDistribution // ignore: cast_nullable_to_non_nullable
as List<MuscleDataPoint>,recentPRs: null == recentPRs ? _self.recentPRs : recentPRs // ignore: cast_nullable_to_non_nullable
as List<PRDataPoint>,consistency: null == consistency ? _self.consistency : consistency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsResponseDto].
extension AnalyticsResponseDtoPatterns on AnalyticsResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> heatmapDates,  List<VolumeDataPoint> volumeHistory,  List<MuscleDataPoint> muscleDistribution,  List<PRDataPoint> recentPRs,  double consistency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsResponseDto() when $default != null:
return $default(_that.heatmapDates,_that.volumeHistory,_that.muscleDistribution,_that.recentPRs,_that.consistency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> heatmapDates,  List<VolumeDataPoint> volumeHistory,  List<MuscleDataPoint> muscleDistribution,  List<PRDataPoint> recentPRs,  double consistency)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsResponseDto():
return $default(_that.heatmapDates,_that.volumeHistory,_that.muscleDistribution,_that.recentPRs,_that.consistency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> heatmapDates,  List<VolumeDataPoint> volumeHistory,  List<MuscleDataPoint> muscleDistribution,  List<PRDataPoint> recentPRs,  double consistency)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsResponseDto() when $default != null:
return $default(_that.heatmapDates,_that.volumeHistory,_that.muscleDistribution,_that.recentPRs,_that.consistency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsResponseDto implements AnalyticsResponseDto {
  const _AnalyticsResponseDto({final  List<String> heatmapDates = const <String>[], final  List<VolumeDataPoint> volumeHistory = const <VolumeDataPoint>[], final  List<MuscleDataPoint> muscleDistribution = const <MuscleDataPoint>[], final  List<PRDataPoint> recentPRs = const <PRDataPoint>[], this.consistency = 0.0}): _heatmapDates = heatmapDates,_volumeHistory = volumeHistory,_muscleDistribution = muscleDistribution,_recentPRs = recentPRs;
  factory _AnalyticsResponseDto.fromJson(Map<String, dynamic> json) => _$AnalyticsResponseDtoFromJson(json);

 final  List<String> _heatmapDates;
@override@JsonKey() List<String> get heatmapDates {
  if (_heatmapDates is EqualUnmodifiableListView) return _heatmapDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heatmapDates);
}

 final  List<VolumeDataPoint> _volumeHistory;
@override@JsonKey() List<VolumeDataPoint> get volumeHistory {
  if (_volumeHistory is EqualUnmodifiableListView) return _volumeHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volumeHistory);
}

 final  List<MuscleDataPoint> _muscleDistribution;
@override@JsonKey() List<MuscleDataPoint> get muscleDistribution {
  if (_muscleDistribution is EqualUnmodifiableListView) return _muscleDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_muscleDistribution);
}

 final  List<PRDataPoint> _recentPRs;
@override@JsonKey() List<PRDataPoint> get recentPRs {
  if (_recentPRs is EqualUnmodifiableListView) return _recentPRs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentPRs);
}

@override@JsonKey() final  double consistency;

/// Create a copy of AnalyticsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsResponseDtoCopyWith<_AnalyticsResponseDto> get copyWith => __$AnalyticsResponseDtoCopyWithImpl<_AnalyticsResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsResponseDto&&const DeepCollectionEquality().equals(other._heatmapDates, _heatmapDates)&&const DeepCollectionEquality().equals(other._volumeHistory, _volumeHistory)&&const DeepCollectionEquality().equals(other._muscleDistribution, _muscleDistribution)&&const DeepCollectionEquality().equals(other._recentPRs, _recentPRs)&&(identical(other.consistency, consistency) || other.consistency == consistency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_heatmapDates),const DeepCollectionEquality().hash(_volumeHistory),const DeepCollectionEquality().hash(_muscleDistribution),const DeepCollectionEquality().hash(_recentPRs),consistency);

@override
String toString() {
  return 'AnalyticsResponseDto(heatmapDates: $heatmapDates, volumeHistory: $volumeHistory, muscleDistribution: $muscleDistribution, recentPRs: $recentPRs, consistency: $consistency)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsResponseDtoCopyWith<$Res> implements $AnalyticsResponseDtoCopyWith<$Res> {
  factory _$AnalyticsResponseDtoCopyWith(_AnalyticsResponseDto value, $Res Function(_AnalyticsResponseDto) _then) = __$AnalyticsResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> heatmapDates, List<VolumeDataPoint> volumeHistory, List<MuscleDataPoint> muscleDistribution, List<PRDataPoint> recentPRs, double consistency
});




}
/// @nodoc
class __$AnalyticsResponseDtoCopyWithImpl<$Res>
    implements _$AnalyticsResponseDtoCopyWith<$Res> {
  __$AnalyticsResponseDtoCopyWithImpl(this._self, this._then);

  final _AnalyticsResponseDto _self;
  final $Res Function(_AnalyticsResponseDto) _then;

/// Create a copy of AnalyticsResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heatmapDates = null,Object? volumeHistory = null,Object? muscleDistribution = null,Object? recentPRs = null,Object? consistency = null,}) {
  return _then(_AnalyticsResponseDto(
heatmapDates: null == heatmapDates ? _self._heatmapDates : heatmapDates // ignore: cast_nullable_to_non_nullable
as List<String>,volumeHistory: null == volumeHistory ? _self._volumeHistory : volumeHistory // ignore: cast_nullable_to_non_nullable
as List<VolumeDataPoint>,muscleDistribution: null == muscleDistribution ? _self._muscleDistribution : muscleDistribution // ignore: cast_nullable_to_non_nullable
as List<MuscleDataPoint>,recentPRs: null == recentPRs ? _self._recentPRs : recentPRs // ignore: cast_nullable_to_non_nullable
as List<PRDataPoint>,consistency: null == consistency ? _self.consistency : consistency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$VolumeDataPoint {

 String get date; double get volume;
/// Create a copy of VolumeDataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VolumeDataPointCopyWith<VolumeDataPoint> get copyWith => _$VolumeDataPointCopyWithImpl<VolumeDataPoint>(this as VolumeDataPoint, _$identity);

  /// Serializes this VolumeDataPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VolumeDataPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,volume);

@override
String toString() {
  return 'VolumeDataPoint(date: $date, volume: $volume)';
}


}

/// @nodoc
abstract mixin class $VolumeDataPointCopyWith<$Res>  {
  factory $VolumeDataPointCopyWith(VolumeDataPoint value, $Res Function(VolumeDataPoint) _then) = _$VolumeDataPointCopyWithImpl;
@useResult
$Res call({
 String date, double volume
});




}
/// @nodoc
class _$VolumeDataPointCopyWithImpl<$Res>
    implements $VolumeDataPointCopyWith<$Res> {
  _$VolumeDataPointCopyWithImpl(this._self, this._then);

  final VolumeDataPoint _self;
  final $Res Function(VolumeDataPoint) _then;

/// Create a copy of VolumeDataPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? volume = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [VolumeDataPoint].
extension VolumeDataPointPatterns on VolumeDataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VolumeDataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VolumeDataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VolumeDataPoint value)  $default,){
final _that = this;
switch (_that) {
case _VolumeDataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VolumeDataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _VolumeDataPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double volume)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VolumeDataPoint() when $default != null:
return $default(_that.date,_that.volume);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double volume)  $default,) {final _that = this;
switch (_that) {
case _VolumeDataPoint():
return $default(_that.date,_that.volume);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double volume)?  $default,) {final _that = this;
switch (_that) {
case _VolumeDataPoint() when $default != null:
return $default(_that.date,_that.volume);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VolumeDataPoint implements VolumeDataPoint {
  const _VolumeDataPoint({required this.date, this.volume = 0.0});
  factory _VolumeDataPoint.fromJson(Map<String, dynamic> json) => _$VolumeDataPointFromJson(json);

@override final  String date;
@override@JsonKey() final  double volume;

/// Create a copy of VolumeDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VolumeDataPointCopyWith<_VolumeDataPoint> get copyWith => __$VolumeDataPointCopyWithImpl<_VolumeDataPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VolumeDataPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VolumeDataPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.volume, volume) || other.volume == volume));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,volume);

@override
String toString() {
  return 'VolumeDataPoint(date: $date, volume: $volume)';
}


}

/// @nodoc
abstract mixin class _$VolumeDataPointCopyWith<$Res> implements $VolumeDataPointCopyWith<$Res> {
  factory _$VolumeDataPointCopyWith(_VolumeDataPoint value, $Res Function(_VolumeDataPoint) _then) = __$VolumeDataPointCopyWithImpl;
@override @useResult
$Res call({
 String date, double volume
});




}
/// @nodoc
class __$VolumeDataPointCopyWithImpl<$Res>
    implements _$VolumeDataPointCopyWith<$Res> {
  __$VolumeDataPointCopyWithImpl(this._self, this._then);

  final _VolumeDataPoint _self;
  final $Res Function(_VolumeDataPoint) _then;

/// Create a copy of VolumeDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? volume = null,}) {
  return _then(_VolumeDataPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$MuscleDataPoint {

 String get muscle; int get count;
/// Create a copy of MuscleDataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MuscleDataPointCopyWith<MuscleDataPoint> get copyWith => _$MuscleDataPointCopyWithImpl<MuscleDataPoint>(this as MuscleDataPoint, _$identity);

  /// Serializes this MuscleDataPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MuscleDataPoint&&(identical(other.muscle, muscle) || other.muscle == muscle)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,muscle,count);

@override
String toString() {
  return 'MuscleDataPoint(muscle: $muscle, count: $count)';
}


}

/// @nodoc
abstract mixin class $MuscleDataPointCopyWith<$Res>  {
  factory $MuscleDataPointCopyWith(MuscleDataPoint value, $Res Function(MuscleDataPoint) _then) = _$MuscleDataPointCopyWithImpl;
@useResult
$Res call({
 String muscle, int count
});




}
/// @nodoc
class _$MuscleDataPointCopyWithImpl<$Res>
    implements $MuscleDataPointCopyWith<$Res> {
  _$MuscleDataPointCopyWithImpl(this._self, this._then);

  final MuscleDataPoint _self;
  final $Res Function(MuscleDataPoint) _then;

/// Create a copy of MuscleDataPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? muscle = null,Object? count = null,}) {
  return _then(_self.copyWith(
muscle: null == muscle ? _self.muscle : muscle // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MuscleDataPoint].
extension MuscleDataPointPatterns on MuscleDataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MuscleDataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MuscleDataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MuscleDataPoint value)  $default,){
final _that = this;
switch (_that) {
case _MuscleDataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MuscleDataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _MuscleDataPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String muscle,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MuscleDataPoint() when $default != null:
return $default(_that.muscle,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String muscle,  int count)  $default,) {final _that = this;
switch (_that) {
case _MuscleDataPoint():
return $default(_that.muscle,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String muscle,  int count)?  $default,) {final _that = this;
switch (_that) {
case _MuscleDataPoint() when $default != null:
return $default(_that.muscle,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MuscleDataPoint implements MuscleDataPoint {
  const _MuscleDataPoint({required this.muscle, this.count = 0});
  factory _MuscleDataPoint.fromJson(Map<String, dynamic> json) => _$MuscleDataPointFromJson(json);

@override final  String muscle;
@override@JsonKey() final  int count;

/// Create a copy of MuscleDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MuscleDataPointCopyWith<_MuscleDataPoint> get copyWith => __$MuscleDataPointCopyWithImpl<_MuscleDataPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MuscleDataPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MuscleDataPoint&&(identical(other.muscle, muscle) || other.muscle == muscle)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,muscle,count);

@override
String toString() {
  return 'MuscleDataPoint(muscle: $muscle, count: $count)';
}


}

/// @nodoc
abstract mixin class _$MuscleDataPointCopyWith<$Res> implements $MuscleDataPointCopyWith<$Res> {
  factory _$MuscleDataPointCopyWith(_MuscleDataPoint value, $Res Function(_MuscleDataPoint) _then) = __$MuscleDataPointCopyWithImpl;
@override @useResult
$Res call({
 String muscle, int count
});




}
/// @nodoc
class __$MuscleDataPointCopyWithImpl<$Res>
    implements _$MuscleDataPointCopyWith<$Res> {
  __$MuscleDataPointCopyWithImpl(this._self, this._then);

  final _MuscleDataPoint _self;
  final $Res Function(_MuscleDataPoint) _then;

/// Create a copy of MuscleDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? muscle = null,Object? count = null,}) {
  return _then(_MuscleDataPoint(
muscle: null == muscle ? _self.muscle : muscle // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PRDataPoint {

 String get exercise; double get value; String get type; String get date;
/// Create a copy of PRDataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PRDataPointCopyWith<PRDataPoint> get copyWith => _$PRDataPointCopyWithImpl<PRDataPoint>(this as PRDataPoint, _$identity);

  /// Serializes this PRDataPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PRDataPoint&&(identical(other.exercise, exercise) || other.exercise == exercise)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exercise,value,type,date);

@override
String toString() {
  return 'PRDataPoint(exercise: $exercise, value: $value, type: $type, date: $date)';
}


}

/// @nodoc
abstract mixin class $PRDataPointCopyWith<$Res>  {
  factory $PRDataPointCopyWith(PRDataPoint value, $Res Function(PRDataPoint) _then) = _$PRDataPointCopyWithImpl;
@useResult
$Res call({
 String exercise, double value, String type, String date
});




}
/// @nodoc
class _$PRDataPointCopyWithImpl<$Res>
    implements $PRDataPointCopyWith<$Res> {
  _$PRDataPointCopyWithImpl(this._self, this._then);

  final PRDataPoint _self;
  final $Res Function(PRDataPoint) _then;

/// Create a copy of PRDataPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exercise = null,Object? value = null,Object? type = null,Object? date = null,}) {
  return _then(_self.copyWith(
exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PRDataPoint].
extension PRDataPointPatterns on PRDataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PRDataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PRDataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PRDataPoint value)  $default,){
final _that = this;
switch (_that) {
case _PRDataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PRDataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _PRDataPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exercise,  double value,  String type,  String date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PRDataPoint() when $default != null:
return $default(_that.exercise,_that.value,_that.type,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exercise,  double value,  String type,  String date)  $default,) {final _that = this;
switch (_that) {
case _PRDataPoint():
return $default(_that.exercise,_that.value,_that.type,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exercise,  double value,  String type,  String date)?  $default,) {final _that = this;
switch (_that) {
case _PRDataPoint() when $default != null:
return $default(_that.exercise,_that.value,_that.type,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PRDataPoint implements PRDataPoint {
  const _PRDataPoint({required this.exercise, this.value = 0.0, required this.type, required this.date});
  factory _PRDataPoint.fromJson(Map<String, dynamic> json) => _$PRDataPointFromJson(json);

@override final  String exercise;
@override@JsonKey() final  double value;
@override final  String type;
@override final  String date;

/// Create a copy of PRDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PRDataPointCopyWith<_PRDataPoint> get copyWith => __$PRDataPointCopyWithImpl<_PRDataPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PRDataPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PRDataPoint&&(identical(other.exercise, exercise) || other.exercise == exercise)&&(identical(other.value, value) || other.value == value)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exercise,value,type,date);

@override
String toString() {
  return 'PRDataPoint(exercise: $exercise, value: $value, type: $type, date: $date)';
}


}

/// @nodoc
abstract mixin class _$PRDataPointCopyWith<$Res> implements $PRDataPointCopyWith<$Res> {
  factory _$PRDataPointCopyWith(_PRDataPoint value, $Res Function(_PRDataPoint) _then) = __$PRDataPointCopyWithImpl;
@override @useResult
$Res call({
 String exercise, double value, String type, String date
});




}
/// @nodoc
class __$PRDataPointCopyWithImpl<$Res>
    implements _$PRDataPointCopyWith<$Res> {
  __$PRDataPointCopyWithImpl(this._self, this._then);

  final _PRDataPoint _self;
  final $Res Function(_PRDataPoint) _then;

/// Create a copy of PRDataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exercise = null,Object? value = null,Object? type = null,Object? date = null,}) {
  return _then(_PRDataPoint(
exercise: null == exercise ? _self.exercise : exercise // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
