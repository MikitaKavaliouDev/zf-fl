// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_analytics_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramAnalyticsDto {

 double get completionRate; int get totalSessions; int get completedSessions; int get activeClients; String get targetFrequency; double get averageProgress;
/// Create a copy of ProgramAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramAnalyticsDtoCopyWith<ProgramAnalyticsDto> get copyWith => _$ProgramAnalyticsDtoCopyWithImpl<ProgramAnalyticsDto>(this as ProgramAnalyticsDto, _$identity);

  /// Serializes this ProgramAnalyticsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramAnalyticsDto&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.completedSessions, completedSessions) || other.completedSessions == completedSessions)&&(identical(other.activeClients, activeClients) || other.activeClients == activeClients)&&(identical(other.targetFrequency, targetFrequency) || other.targetFrequency == targetFrequency)&&(identical(other.averageProgress, averageProgress) || other.averageProgress == averageProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completionRate,totalSessions,completedSessions,activeClients,targetFrequency,averageProgress);

@override
String toString() {
  return 'ProgramAnalyticsDto(completionRate: $completionRate, totalSessions: $totalSessions, completedSessions: $completedSessions, activeClients: $activeClients, targetFrequency: $targetFrequency, averageProgress: $averageProgress)';
}


}

/// @nodoc
abstract mixin class $ProgramAnalyticsDtoCopyWith<$Res>  {
  factory $ProgramAnalyticsDtoCopyWith(ProgramAnalyticsDto value, $Res Function(ProgramAnalyticsDto) _then) = _$ProgramAnalyticsDtoCopyWithImpl;
@useResult
$Res call({
 double completionRate, int totalSessions, int completedSessions, int activeClients, String targetFrequency, double averageProgress
});




}
/// @nodoc
class _$ProgramAnalyticsDtoCopyWithImpl<$Res>
    implements $ProgramAnalyticsDtoCopyWith<$Res> {
  _$ProgramAnalyticsDtoCopyWithImpl(this._self, this._then);

  final ProgramAnalyticsDto _self;
  final $Res Function(ProgramAnalyticsDto) _then;

/// Create a copy of ProgramAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completionRate = null,Object? totalSessions = null,Object? completedSessions = null,Object? activeClients = null,Object? targetFrequency = null,Object? averageProgress = null,}) {
  return _then(_self.copyWith(
completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,completedSessions: null == completedSessions ? _self.completedSessions : completedSessions // ignore: cast_nullable_to_non_nullable
as int,activeClients: null == activeClients ? _self.activeClients : activeClients // ignore: cast_nullable_to_non_nullable
as int,targetFrequency: null == targetFrequency ? _self.targetFrequency : targetFrequency // ignore: cast_nullable_to_non_nullable
as String,averageProgress: null == averageProgress ? _self.averageProgress : averageProgress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgramAnalyticsDto].
extension ProgramAnalyticsDtoPatterns on ProgramAnalyticsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgramAnalyticsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgramAnalyticsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgramAnalyticsDto value)  $default,){
final _that = this;
switch (_that) {
case _ProgramAnalyticsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgramAnalyticsDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProgramAnalyticsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double completionRate,  int totalSessions,  int completedSessions,  int activeClients,  String targetFrequency,  double averageProgress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgramAnalyticsDto() when $default != null:
return $default(_that.completionRate,_that.totalSessions,_that.completedSessions,_that.activeClients,_that.targetFrequency,_that.averageProgress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double completionRate,  int totalSessions,  int completedSessions,  int activeClients,  String targetFrequency,  double averageProgress)  $default,) {final _that = this;
switch (_that) {
case _ProgramAnalyticsDto():
return $default(_that.completionRate,_that.totalSessions,_that.completedSessions,_that.activeClients,_that.targetFrequency,_that.averageProgress);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double completionRate,  int totalSessions,  int completedSessions,  int activeClients,  String targetFrequency,  double averageProgress)?  $default,) {final _that = this;
switch (_that) {
case _ProgramAnalyticsDto() when $default != null:
return $default(_that.completionRate,_that.totalSessions,_that.completedSessions,_that.activeClients,_that.targetFrequency,_that.averageProgress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgramAnalyticsDto implements ProgramAnalyticsDto {
  const _ProgramAnalyticsDto({required this.completionRate, required this.totalSessions, required this.completedSessions, required this.activeClients, required this.targetFrequency, required this.averageProgress});
  factory _ProgramAnalyticsDto.fromJson(Map<String, dynamic> json) => _$ProgramAnalyticsDtoFromJson(json);

@override final  double completionRate;
@override final  int totalSessions;
@override final  int completedSessions;
@override final  int activeClients;
@override final  String targetFrequency;
@override final  double averageProgress;

/// Create a copy of ProgramAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramAnalyticsDtoCopyWith<_ProgramAnalyticsDto> get copyWith => __$ProgramAnalyticsDtoCopyWithImpl<_ProgramAnalyticsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramAnalyticsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramAnalyticsDto&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.completedSessions, completedSessions) || other.completedSessions == completedSessions)&&(identical(other.activeClients, activeClients) || other.activeClients == activeClients)&&(identical(other.targetFrequency, targetFrequency) || other.targetFrequency == targetFrequency)&&(identical(other.averageProgress, averageProgress) || other.averageProgress == averageProgress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completionRate,totalSessions,completedSessions,activeClients,targetFrequency,averageProgress);

@override
String toString() {
  return 'ProgramAnalyticsDto(completionRate: $completionRate, totalSessions: $totalSessions, completedSessions: $completedSessions, activeClients: $activeClients, targetFrequency: $targetFrequency, averageProgress: $averageProgress)';
}


}

/// @nodoc
abstract mixin class _$ProgramAnalyticsDtoCopyWith<$Res> implements $ProgramAnalyticsDtoCopyWith<$Res> {
  factory _$ProgramAnalyticsDtoCopyWith(_ProgramAnalyticsDto value, $Res Function(_ProgramAnalyticsDto) _then) = __$ProgramAnalyticsDtoCopyWithImpl;
@override @useResult
$Res call({
 double completionRate, int totalSessions, int completedSessions, int activeClients, String targetFrequency, double averageProgress
});




}
/// @nodoc
class __$ProgramAnalyticsDtoCopyWithImpl<$Res>
    implements _$ProgramAnalyticsDtoCopyWith<$Res> {
  __$ProgramAnalyticsDtoCopyWithImpl(this._self, this._then);

  final _ProgramAnalyticsDto _self;
  final $Res Function(_ProgramAnalyticsDto) _then;

/// Create a copy of ProgramAnalyticsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completionRate = null,Object? totalSessions = null,Object? completedSessions = null,Object? activeClients = null,Object? targetFrequency = null,Object? averageProgress = null,}) {
  return _then(_ProgramAnalyticsDto(
completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,completedSessions: null == completedSessions ? _self.completedSessions : completedSessions // ignore: cast_nullable_to_non_nullable
as int,activeClients: null == activeClients ? _self.activeClients : activeClients // ignore: cast_nullable_to_non_nullable
as int,targetFrequency: null == targetFrequency ? _self.targetFrequency : targetFrequency // ignore: cast_nullable_to_non_nullable
as String,averageProgress: null == averageProgress ? _self.averageProgress : averageProgress // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
