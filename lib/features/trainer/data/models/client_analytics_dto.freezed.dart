// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_analytics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientAnalyticsDto {

 List<String> get heatmapDates; List<VolumeHistoryItemDto> get volumeHistory; List<MuscleDistributionItemDto> get muscleDistribution; List<RecentPrItemDto> get recentPRs; double get consistency;
/// Create a copy of ClientAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientAnalyticsDtoCopyWith<ClientAnalyticsDto> get copyWith => _$ClientAnalyticsDtoCopyWithImpl<ClientAnalyticsDto>(this as ClientAnalyticsDto, _$identity);

  /// Serializes this ClientAnalyticsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientAnalyticsDto&&const DeepCollectionEquality().equals(other.heatmapDates, heatmapDates)&&const DeepCollectionEquality().equals(other.volumeHistory, volumeHistory)&&const DeepCollectionEquality().equals(other.muscleDistribution, muscleDistribution)&&const DeepCollectionEquality().equals(other.recentPRs, recentPRs)&&(identical(other.consistency, consistency) || other.consistency == consistency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(heatmapDates),const DeepCollectionEquality().hash(volumeHistory),const DeepCollectionEquality().hash(muscleDistribution),const DeepCollectionEquality().hash(recentPRs),consistency);

@override
String toString() {
  return 'ClientAnalyticsDto(heatmapDates: $heatmapDates, volumeHistory: $volumeHistory, muscleDistribution: $muscleDistribution, recentPRs: $recentPRs, consistency: $consistency)';
}


}

/// @nodoc
abstract mixin class $ClientAnalyticsDtoCopyWith<$Res>  {
  factory $ClientAnalyticsDtoCopyWith(ClientAnalyticsDto value, $Res Function(ClientAnalyticsDto) _then) = _$ClientAnalyticsDtoCopyWithImpl;
@useResult
$Res call({
 List<String> heatmapDates, List<VolumeHistoryItemDto> volumeHistory, List<MuscleDistributionItemDto> muscleDistribution, List<RecentPrItemDto> recentPRs, double consistency
});




}
/// @nodoc
class _$ClientAnalyticsDtoCopyWithImpl<$Res>
    implements $ClientAnalyticsDtoCopyWith<$Res> {
  _$ClientAnalyticsDtoCopyWithImpl(this._self, this._then);

  final ClientAnalyticsDto _self;
  final $Res Function(ClientAnalyticsDto) _then;

/// Create a copy of ClientAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? heatmapDates = null,Object? volumeHistory = null,Object? muscleDistribution = null,Object? recentPRs = null,Object? consistency = null,}) {
  return _then(_self.copyWith(
heatmapDates: null == heatmapDates ? _self.heatmapDates : heatmapDates // ignore: cast_nullable_to_non_nullable
as List<String>,volumeHistory: null == volumeHistory ? _self.volumeHistory : volumeHistory // ignore: cast_nullable_to_non_nullable
as List<VolumeHistoryItemDto>,muscleDistribution: null == muscleDistribution ? _self.muscleDistribution : muscleDistribution // ignore: cast_nullable_to_non_nullable
as List<MuscleDistributionItemDto>,recentPRs: null == recentPRs ? _self.recentPRs : recentPRs // ignore: cast_nullable_to_non_nullable
as List<RecentPrItemDto>,consistency: null == consistency ? _self.consistency : consistency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientAnalyticsDto].
extension ClientAnalyticsDtoPatterns on ClientAnalyticsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientAnalyticsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientAnalyticsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientAnalyticsDto value)  $default,){
final _that = this;
switch (_that) {
case _ClientAnalyticsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientAnalyticsDto value)?  $default,){
final _that = this;
switch (_that) {
case _ClientAnalyticsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> heatmapDates,  List<VolumeHistoryItemDto> volumeHistory,  List<MuscleDistributionItemDto> muscleDistribution,  List<RecentPrItemDto> recentPRs,  double consistency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientAnalyticsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> heatmapDates,  List<VolumeHistoryItemDto> volumeHistory,  List<MuscleDistributionItemDto> muscleDistribution,  List<RecentPrItemDto> recentPRs,  double consistency)  $default,) {final _that = this;
switch (_that) {
case _ClientAnalyticsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> heatmapDates,  List<VolumeHistoryItemDto> volumeHistory,  List<MuscleDistributionItemDto> muscleDistribution,  List<RecentPrItemDto> recentPRs,  double consistency)?  $default,) {final _that = this;
switch (_that) {
case _ClientAnalyticsDto() when $default != null:
return $default(_that.heatmapDates,_that.volumeHistory,_that.muscleDistribution,_that.recentPRs,_that.consistency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientAnalyticsDto implements ClientAnalyticsDto {
  const _ClientAnalyticsDto({final  List<String> heatmapDates = const <String>[], final  List<VolumeHistoryItemDto> volumeHistory = const <VolumeHistoryItemDto>[], final  List<MuscleDistributionItemDto> muscleDistribution = const <MuscleDistributionItemDto>[], final  List<RecentPrItemDto> recentPRs = const <RecentPrItemDto>[], this.consistency = 0.0}): _heatmapDates = heatmapDates,_volumeHistory = volumeHistory,_muscleDistribution = muscleDistribution,_recentPRs = recentPRs;
  factory _ClientAnalyticsDto.fromJson(Map<String, dynamic> json) => _$ClientAnalyticsDtoFromJson(json);

 final  List<String> _heatmapDates;
@override@JsonKey() List<String> get heatmapDates {
  if (_heatmapDates is EqualUnmodifiableListView) return _heatmapDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_heatmapDates);
}

 final  List<VolumeHistoryItemDto> _volumeHistory;
@override@JsonKey() List<VolumeHistoryItemDto> get volumeHistory {
  if (_volumeHistory is EqualUnmodifiableListView) return _volumeHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volumeHistory);
}

 final  List<MuscleDistributionItemDto> _muscleDistribution;
@override@JsonKey() List<MuscleDistributionItemDto> get muscleDistribution {
  if (_muscleDistribution is EqualUnmodifiableListView) return _muscleDistribution;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_muscleDistribution);
}

 final  List<RecentPrItemDto> _recentPRs;
@override@JsonKey() List<RecentPrItemDto> get recentPRs {
  if (_recentPRs is EqualUnmodifiableListView) return _recentPRs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recentPRs);
}

@override@JsonKey() final  double consistency;

/// Create a copy of ClientAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientAnalyticsDtoCopyWith<_ClientAnalyticsDto> get copyWith => __$ClientAnalyticsDtoCopyWithImpl<_ClientAnalyticsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientAnalyticsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientAnalyticsDto&&const DeepCollectionEquality().equals(other._heatmapDates, _heatmapDates)&&const DeepCollectionEquality().equals(other._volumeHistory, _volumeHistory)&&const DeepCollectionEquality().equals(other._muscleDistribution, _muscleDistribution)&&const DeepCollectionEquality().equals(other._recentPRs, _recentPRs)&&(identical(other.consistency, consistency) || other.consistency == consistency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_heatmapDates),const DeepCollectionEquality().hash(_volumeHistory),const DeepCollectionEquality().hash(_muscleDistribution),const DeepCollectionEquality().hash(_recentPRs),consistency);

@override
String toString() {
  return 'ClientAnalyticsDto(heatmapDates: $heatmapDates, volumeHistory: $volumeHistory, muscleDistribution: $muscleDistribution, recentPRs: $recentPRs, consistency: $consistency)';
}


}

/// @nodoc
abstract mixin class _$ClientAnalyticsDtoCopyWith<$Res> implements $ClientAnalyticsDtoCopyWith<$Res> {
  factory _$ClientAnalyticsDtoCopyWith(_ClientAnalyticsDto value, $Res Function(_ClientAnalyticsDto) _then) = __$ClientAnalyticsDtoCopyWithImpl;
@override @useResult
$Res call({
 List<String> heatmapDates, List<VolumeHistoryItemDto> volumeHistory, List<MuscleDistributionItemDto> muscleDistribution, List<RecentPrItemDto> recentPRs, double consistency
});




}
/// @nodoc
class __$ClientAnalyticsDtoCopyWithImpl<$Res>
    implements _$ClientAnalyticsDtoCopyWith<$Res> {
  __$ClientAnalyticsDtoCopyWithImpl(this._self, this._then);

  final _ClientAnalyticsDto _self;
  final $Res Function(_ClientAnalyticsDto) _then;

/// Create a copy of ClientAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? heatmapDates = null,Object? volumeHistory = null,Object? muscleDistribution = null,Object? recentPRs = null,Object? consistency = null,}) {
  return _then(_ClientAnalyticsDto(
heatmapDates: null == heatmapDates ? _self._heatmapDates : heatmapDates // ignore: cast_nullable_to_non_nullable
as List<String>,volumeHistory: null == volumeHistory ? _self._volumeHistory : volumeHistory // ignore: cast_nullable_to_non_nullable
as List<VolumeHistoryItemDto>,muscleDistribution: null == muscleDistribution ? _self._muscleDistribution : muscleDistribution // ignore: cast_nullable_to_non_nullable
as List<MuscleDistributionItemDto>,recentPRs: null == recentPRs ? _self._recentPRs : recentPRs // ignore: cast_nullable_to_non_nullable
as List<RecentPrItemDto>,consistency: null == consistency ? _self.consistency : consistency // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
