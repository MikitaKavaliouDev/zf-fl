// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressResponseDto {

 List<DataPoint> get weight; List<DataPoint> get bodyFat; List<DataPoint> get volume; List<ExercisePerformanceDto> get exercisePerformance; List<FavoriteExerciseDto> get favoriteExercises; List<WorstPerformingExerciseDto> get worstPerformingExercises;
/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressResponseDtoCopyWith<ProgressResponseDto> get copyWith => _$ProgressResponseDtoCopyWithImpl<ProgressResponseDto>(this as ProgressResponseDto, _$identity);

  /// Serializes this ProgressResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressResponseDto&&const DeepCollectionEquality().equals(other.weight, weight)&&const DeepCollectionEquality().equals(other.bodyFat, bodyFat)&&const DeepCollectionEquality().equals(other.volume, volume)&&const DeepCollectionEquality().equals(other.exercisePerformance, exercisePerformance)&&const DeepCollectionEquality().equals(other.favoriteExercises, favoriteExercises)&&const DeepCollectionEquality().equals(other.worstPerformingExercises, worstPerformingExercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(weight),const DeepCollectionEquality().hash(bodyFat),const DeepCollectionEquality().hash(volume),const DeepCollectionEquality().hash(exercisePerformance),const DeepCollectionEquality().hash(favoriteExercises),const DeepCollectionEquality().hash(worstPerformingExercises));

@override
String toString() {
  return 'ProgressResponseDto(weight: $weight, bodyFat: $bodyFat, volume: $volume, exercisePerformance: $exercisePerformance, favoriteExercises: $favoriteExercises, worstPerformingExercises: $worstPerformingExercises)';
}


}

/// @nodoc
abstract mixin class $ProgressResponseDtoCopyWith<$Res>  {
  factory $ProgressResponseDtoCopyWith(ProgressResponseDto value, $Res Function(ProgressResponseDto) _then) = _$ProgressResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<DataPoint> weight, List<DataPoint> bodyFat, List<DataPoint> volume, List<ExercisePerformanceDto> exercisePerformance, List<FavoriteExerciseDto> favoriteExercises, List<WorstPerformingExerciseDto> worstPerformingExercises
});




}
/// @nodoc
class _$ProgressResponseDtoCopyWithImpl<$Res>
    implements $ProgressResponseDtoCopyWith<$Res> {
  _$ProgressResponseDtoCopyWithImpl(this._self, this._then);

  final ProgressResponseDto _self;
  final $Res Function(ProgressResponseDto) _then;

/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weight = null,Object? bodyFat = null,Object? volume = null,Object? exercisePerformance = null,Object? favoriteExercises = null,Object? worstPerformingExercises = null,}) {
  return _then(_self.copyWith(
weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,bodyFat: null == bodyFat ? _self.bodyFat : bodyFat // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,exercisePerformance: null == exercisePerformance ? _self.exercisePerformance : exercisePerformance // ignore: cast_nullable_to_non_nullable
as List<ExercisePerformanceDto>,favoriteExercises: null == favoriteExercises ? _self.favoriteExercises : favoriteExercises // ignore: cast_nullable_to_non_nullable
as List<FavoriteExerciseDto>,worstPerformingExercises: null == worstPerformingExercises ? _self.worstPerformingExercises : worstPerformingExercises // ignore: cast_nullable_to_non_nullable
as List<WorstPerformingExerciseDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProgressResponseDto].
extension ProgressResponseDtoPatterns on ProgressResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _ProgressResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DataPoint> weight,  List<DataPoint> bodyFat,  List<DataPoint> volume,  List<ExercisePerformanceDto> exercisePerformance,  List<FavoriteExerciseDto> favoriteExercises,  List<WorstPerformingExerciseDto> worstPerformingExercises)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
return $default(_that.weight,_that.bodyFat,_that.volume,_that.exercisePerformance,_that.favoriteExercises,_that.worstPerformingExercises);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DataPoint> weight,  List<DataPoint> bodyFat,  List<DataPoint> volume,  List<ExercisePerformanceDto> exercisePerformance,  List<FavoriteExerciseDto> favoriteExercises,  List<WorstPerformingExerciseDto> worstPerformingExercises)  $default,) {final _that = this;
switch (_that) {
case _ProgressResponseDto():
return $default(_that.weight,_that.bodyFat,_that.volume,_that.exercisePerformance,_that.favoriteExercises,_that.worstPerformingExercises);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DataPoint> weight,  List<DataPoint> bodyFat,  List<DataPoint> volume,  List<ExercisePerformanceDto> exercisePerformance,  List<FavoriteExerciseDto> favoriteExercises,  List<WorstPerformingExerciseDto> worstPerformingExercises)?  $default,) {final _that = this;
switch (_that) {
case _ProgressResponseDto() when $default != null:
return $default(_that.weight,_that.bodyFat,_that.volume,_that.exercisePerformance,_that.favoriteExercises,_that.worstPerformingExercises);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProgressResponseDto implements ProgressResponseDto {
  const _ProgressResponseDto({final  List<DataPoint> weight = const <DataPoint>[], final  List<DataPoint> bodyFat = const <DataPoint>[], final  List<DataPoint> volume = const <DataPoint>[], final  List<ExercisePerformanceDto> exercisePerformance = const <ExercisePerformanceDto>[], final  List<FavoriteExerciseDto> favoriteExercises = const <FavoriteExerciseDto>[], final  List<WorstPerformingExerciseDto> worstPerformingExercises = const <WorstPerformingExerciseDto>[]}): _weight = weight,_bodyFat = bodyFat,_volume = volume,_exercisePerformance = exercisePerformance,_favoriteExercises = favoriteExercises,_worstPerformingExercises = worstPerformingExercises;
  factory _ProgressResponseDto.fromJson(Map<String, dynamic> json) => _$ProgressResponseDtoFromJson(json);

 final  List<DataPoint> _weight;
@override@JsonKey() List<DataPoint> get weight {
  if (_weight is EqualUnmodifiableListView) return _weight;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weight);
}

 final  List<DataPoint> _bodyFat;
@override@JsonKey() List<DataPoint> get bodyFat {
  if (_bodyFat is EqualUnmodifiableListView) return _bodyFat;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bodyFat);
}

 final  List<DataPoint> _volume;
@override@JsonKey() List<DataPoint> get volume {
  if (_volume is EqualUnmodifiableListView) return _volume;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_volume);
}

 final  List<ExercisePerformanceDto> _exercisePerformance;
@override@JsonKey() List<ExercisePerformanceDto> get exercisePerformance {
  if (_exercisePerformance is EqualUnmodifiableListView) return _exercisePerformance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exercisePerformance);
}

 final  List<FavoriteExerciseDto> _favoriteExercises;
@override@JsonKey() List<FavoriteExerciseDto> get favoriteExercises {
  if (_favoriteExercises is EqualUnmodifiableListView) return _favoriteExercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteExercises);
}

 final  List<WorstPerformingExerciseDto> _worstPerformingExercises;
@override@JsonKey() List<WorstPerformingExerciseDto> get worstPerformingExercises {
  if (_worstPerformingExercises is EqualUnmodifiableListView) return _worstPerformingExercises;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_worstPerformingExercises);
}


/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressResponseDtoCopyWith<_ProgressResponseDto> get copyWith => __$ProgressResponseDtoCopyWithImpl<_ProgressResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressResponseDto&&const DeepCollectionEquality().equals(other._weight, _weight)&&const DeepCollectionEquality().equals(other._bodyFat, _bodyFat)&&const DeepCollectionEquality().equals(other._volume, _volume)&&const DeepCollectionEquality().equals(other._exercisePerformance, _exercisePerformance)&&const DeepCollectionEquality().equals(other._favoriteExercises, _favoriteExercises)&&const DeepCollectionEquality().equals(other._worstPerformingExercises, _worstPerformingExercises));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_weight),const DeepCollectionEquality().hash(_bodyFat),const DeepCollectionEquality().hash(_volume),const DeepCollectionEquality().hash(_exercisePerformance),const DeepCollectionEquality().hash(_favoriteExercises),const DeepCollectionEquality().hash(_worstPerformingExercises));

@override
String toString() {
  return 'ProgressResponseDto(weight: $weight, bodyFat: $bodyFat, volume: $volume, exercisePerformance: $exercisePerformance, favoriteExercises: $favoriteExercises, worstPerformingExercises: $worstPerformingExercises)';
}


}

/// @nodoc
abstract mixin class _$ProgressResponseDtoCopyWith<$Res> implements $ProgressResponseDtoCopyWith<$Res> {
  factory _$ProgressResponseDtoCopyWith(_ProgressResponseDto value, $Res Function(_ProgressResponseDto) _then) = __$ProgressResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<DataPoint> weight, List<DataPoint> bodyFat, List<DataPoint> volume, List<ExercisePerformanceDto> exercisePerformance, List<FavoriteExerciseDto> favoriteExercises, List<WorstPerformingExerciseDto> worstPerformingExercises
});




}
/// @nodoc
class __$ProgressResponseDtoCopyWithImpl<$Res>
    implements _$ProgressResponseDtoCopyWith<$Res> {
  __$ProgressResponseDtoCopyWithImpl(this._self, this._then);

  final _ProgressResponseDto _self;
  final $Res Function(_ProgressResponseDto) _then;

/// Create a copy of ProgressResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weight = null,Object? bodyFat = null,Object? volume = null,Object? exercisePerformance = null,Object? favoriteExercises = null,Object? worstPerformingExercises = null,}) {
  return _then(_ProgressResponseDto(
weight: null == weight ? _self._weight : weight // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,bodyFat: null == bodyFat ? _self._bodyFat : bodyFat // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,volume: null == volume ? _self._volume : volume // ignore: cast_nullable_to_non_nullable
as List<DataPoint>,exercisePerformance: null == exercisePerformance ? _self._exercisePerformance : exercisePerformance // ignore: cast_nullable_to_non_nullable
as List<ExercisePerformanceDto>,favoriteExercises: null == favoriteExercises ? _self._favoriteExercises : favoriteExercises // ignore: cast_nullable_to_non_nullable
as List<FavoriteExerciseDto>,worstPerformingExercises: null == worstPerformingExercises ? _self._worstPerformingExercises : worstPerformingExercises // ignore: cast_nullable_to_non_nullable
as List<WorstPerformingExerciseDto>,
  ));
}


}


/// @nodoc
mixin _$WorstPerformingExerciseDto {

 String get exerciseId; String get exerciseName; String get issue;
/// Create a copy of WorstPerformingExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorstPerformingExerciseDtoCopyWith<WorstPerformingExerciseDto> get copyWith => _$WorstPerformingExerciseDtoCopyWithImpl<WorstPerformingExerciseDto>(this as WorstPerformingExerciseDto, _$identity);

  /// Serializes this WorstPerformingExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorstPerformingExerciseDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.issue, issue) || other.issue == issue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,exerciseName,issue);

@override
String toString() {
  return 'WorstPerformingExerciseDto(exerciseId: $exerciseId, exerciseName: $exerciseName, issue: $issue)';
}


}

/// @nodoc
abstract mixin class $WorstPerformingExerciseDtoCopyWith<$Res>  {
  factory $WorstPerformingExerciseDtoCopyWith(WorstPerformingExerciseDto value, $Res Function(WorstPerformingExerciseDto) _then) = _$WorstPerformingExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String exerciseId, String exerciseName, String issue
});




}
/// @nodoc
class _$WorstPerformingExerciseDtoCopyWithImpl<$Res>
    implements $WorstPerformingExerciseDtoCopyWith<$Res> {
  _$WorstPerformingExerciseDtoCopyWithImpl(this._self, this._then);

  final WorstPerformingExerciseDto _self;
  final $Res Function(WorstPerformingExerciseDto) _then;

/// Create a copy of WorstPerformingExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? exerciseName = null,Object? issue = null,}) {
  return _then(_self.copyWith(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WorstPerformingExerciseDto].
extension WorstPerformingExerciseDtoPatterns on WorstPerformingExerciseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorstPerformingExerciseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorstPerformingExerciseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorstPerformingExerciseDto value)  $default,){
final _that = this;
switch (_that) {
case _WorstPerformingExerciseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorstPerformingExerciseDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorstPerformingExerciseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exerciseId,  String exerciseName,  String issue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorstPerformingExerciseDto() when $default != null:
return $default(_that.exerciseId,_that.exerciseName,_that.issue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exerciseId,  String exerciseName,  String issue)  $default,) {final _that = this;
switch (_that) {
case _WorstPerformingExerciseDto():
return $default(_that.exerciseId,_that.exerciseName,_that.issue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exerciseId,  String exerciseName,  String issue)?  $default,) {final _that = this;
switch (_that) {
case _WorstPerformingExerciseDto() when $default != null:
return $default(_that.exerciseId,_that.exerciseName,_that.issue);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorstPerformingExerciseDto implements WorstPerformingExerciseDto {
  const _WorstPerformingExerciseDto({required this.exerciseId, required this.exerciseName, this.issue = ''});
  factory _WorstPerformingExerciseDto.fromJson(Map<String, dynamic> json) => _$WorstPerformingExerciseDtoFromJson(json);

@override final  String exerciseId;
@override final  String exerciseName;
@override@JsonKey() final  String issue;

/// Create a copy of WorstPerformingExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorstPerformingExerciseDtoCopyWith<_WorstPerformingExerciseDto> get copyWith => __$WorstPerformingExerciseDtoCopyWithImpl<_WorstPerformingExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorstPerformingExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorstPerformingExerciseDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.issue, issue) || other.issue == issue));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,exerciseName,issue);

@override
String toString() {
  return 'WorstPerformingExerciseDto(exerciseId: $exerciseId, exerciseName: $exerciseName, issue: $issue)';
}


}

/// @nodoc
abstract mixin class _$WorstPerformingExerciseDtoCopyWith<$Res> implements $WorstPerformingExerciseDtoCopyWith<$Res> {
  factory _$WorstPerformingExerciseDtoCopyWith(_WorstPerformingExerciseDto value, $Res Function(_WorstPerformingExerciseDto) _then) = __$WorstPerformingExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String exerciseId, String exerciseName, String issue
});




}
/// @nodoc
class __$WorstPerformingExerciseDtoCopyWithImpl<$Res>
    implements _$WorstPerformingExerciseDtoCopyWith<$Res> {
  __$WorstPerformingExerciseDtoCopyWithImpl(this._self, this._then);

  final _WorstPerformingExerciseDto _self;
  final $Res Function(_WorstPerformingExerciseDto) _then;

/// Create a copy of WorstPerformingExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? exerciseName = null,Object? issue = null,}) {
  return _then(_WorstPerformingExerciseDto(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,issue: null == issue ? _self.issue : issue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DataPoint {

 String get date; double get value;
/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataPointCopyWith<DataPoint> get copyWith => _$DataPointCopyWithImpl<DataPoint>(this as DataPoint, _$identity);

  /// Serializes this DataPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DataPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'DataPoint(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class $DataPointCopyWith<$Res>  {
  factory $DataPointCopyWith(DataPoint value, $Res Function(DataPoint) _then) = _$DataPointCopyWithImpl;
@useResult
$Res call({
 String date, double value
});




}
/// @nodoc
class _$DataPointCopyWithImpl<$Res>
    implements $DataPointCopyWith<$Res> {
  _$DataPointCopyWithImpl(this._self, this._then);

  final DataPoint _self;
  final $Res Function(DataPoint) _then;

/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? value = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DataPoint].
extension DataPointPatterns on DataPoint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DataPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DataPoint() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DataPoint value)  $default,){
final _that = this;
switch (_that) {
case _DataPoint():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DataPoint value)?  $default,){
final _that = this;
switch (_that) {
case _DataPoint() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String date,  double value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DataPoint() when $default != null:
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String date,  double value)  $default,) {final _that = this;
switch (_that) {
case _DataPoint():
return $default(_that.date,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String date,  double value)?  $default,) {final _that = this;
switch (_that) {
case _DataPoint() when $default != null:
return $default(_that.date,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DataPoint implements DataPoint {
  const _DataPoint({required this.date, this.value = 0.0});
  factory _DataPoint.fromJson(Map<String, dynamic> json) => _$DataPointFromJson(json);

@override final  String date;
@override@JsonKey() final  double value;

/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataPointCopyWith<_DataPoint> get copyWith => __$DataPointCopyWithImpl<_DataPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DataPoint&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value);

@override
String toString() {
  return 'DataPoint(date: $date, value: $value)';
}


}

/// @nodoc
abstract mixin class _$DataPointCopyWith<$Res> implements $DataPointCopyWith<$Res> {
  factory _$DataPointCopyWith(_DataPoint value, $Res Function(_DataPoint) _then) = __$DataPointCopyWithImpl;
@override @useResult
$Res call({
 String date, double value
});




}
/// @nodoc
class __$DataPointCopyWithImpl<$Res>
    implements _$DataPointCopyWith<$Res> {
  __$DataPointCopyWithImpl(this._self, this._then);

  final _DataPoint _self;
  final $Res Function(_DataPoint) _then;

/// Create a copy of DataPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? value = null,}) {
  return _then(_DataPoint(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ExercisePerformanceDto {

 String get exerciseId; String get exerciseName; double? get maxWeight; double? get maxReps; double? get maxVolume; String? get lastPerformed;
/// Create a copy of ExercisePerformanceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExercisePerformanceDtoCopyWith<ExercisePerformanceDto> get copyWith => _$ExercisePerformanceDtoCopyWithImpl<ExercisePerformanceDto>(this as ExercisePerformanceDto, _$identity);

  /// Serializes this ExercisePerformanceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExercisePerformanceDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.maxReps, maxReps) || other.maxReps == maxReps)&&(identical(other.maxVolume, maxVolume) || other.maxVolume == maxVolume)&&(identical(other.lastPerformed, lastPerformed) || other.lastPerformed == lastPerformed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,exerciseName,maxWeight,maxReps,maxVolume,lastPerformed);

@override
String toString() {
  return 'ExercisePerformanceDto(exerciseId: $exerciseId, exerciseName: $exerciseName, maxWeight: $maxWeight, maxReps: $maxReps, maxVolume: $maxVolume, lastPerformed: $lastPerformed)';
}


}

/// @nodoc
abstract mixin class $ExercisePerformanceDtoCopyWith<$Res>  {
  factory $ExercisePerformanceDtoCopyWith(ExercisePerformanceDto value, $Res Function(ExercisePerformanceDto) _then) = _$ExercisePerformanceDtoCopyWithImpl;
@useResult
$Res call({
 String exerciseId, String exerciseName, double? maxWeight, double? maxReps, double? maxVolume, String? lastPerformed
});




}
/// @nodoc
class _$ExercisePerformanceDtoCopyWithImpl<$Res>
    implements $ExercisePerformanceDtoCopyWith<$Res> {
  _$ExercisePerformanceDtoCopyWithImpl(this._self, this._then);

  final ExercisePerformanceDto _self;
  final $Res Function(ExercisePerformanceDto) _then;

/// Create a copy of ExercisePerformanceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? exerciseName = null,Object? maxWeight = freezed,Object? maxReps = freezed,Object? maxVolume = freezed,Object? lastPerformed = freezed,}) {
  return _then(_self.copyWith(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,maxReps: freezed == maxReps ? _self.maxReps : maxReps // ignore: cast_nullable_to_non_nullable
as double?,maxVolume: freezed == maxVolume ? _self.maxVolume : maxVolume // ignore: cast_nullable_to_non_nullable
as double?,lastPerformed: freezed == lastPerformed ? _self.lastPerformed : lastPerformed // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ExercisePerformanceDto].
extension ExercisePerformanceDtoPatterns on ExercisePerformanceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExercisePerformanceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExercisePerformanceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExercisePerformanceDto value)  $default,){
final _that = this;
switch (_that) {
case _ExercisePerformanceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExercisePerformanceDto value)?  $default,){
final _that = this;
switch (_that) {
case _ExercisePerformanceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exerciseId,  String exerciseName,  double? maxWeight,  double? maxReps,  double? maxVolume,  String? lastPerformed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExercisePerformanceDto() when $default != null:
return $default(_that.exerciseId,_that.exerciseName,_that.maxWeight,_that.maxReps,_that.maxVolume,_that.lastPerformed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exerciseId,  String exerciseName,  double? maxWeight,  double? maxReps,  double? maxVolume,  String? lastPerformed)  $default,) {final _that = this;
switch (_that) {
case _ExercisePerformanceDto():
return $default(_that.exerciseId,_that.exerciseName,_that.maxWeight,_that.maxReps,_that.maxVolume,_that.lastPerformed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exerciseId,  String exerciseName,  double? maxWeight,  double? maxReps,  double? maxVolume,  String? lastPerformed)?  $default,) {final _that = this;
switch (_that) {
case _ExercisePerformanceDto() when $default != null:
return $default(_that.exerciseId,_that.exerciseName,_that.maxWeight,_that.maxReps,_that.maxVolume,_that.lastPerformed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExercisePerformanceDto implements ExercisePerformanceDto {
  const _ExercisePerformanceDto({required this.exerciseId, required this.exerciseName, this.maxWeight, this.maxReps, this.maxVolume, this.lastPerformed});
  factory _ExercisePerformanceDto.fromJson(Map<String, dynamic> json) => _$ExercisePerformanceDtoFromJson(json);

@override final  String exerciseId;
@override final  String exerciseName;
@override final  double? maxWeight;
@override final  double? maxReps;
@override final  double? maxVolume;
@override final  String? lastPerformed;

/// Create a copy of ExercisePerformanceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExercisePerformanceDtoCopyWith<_ExercisePerformanceDto> get copyWith => __$ExercisePerformanceDtoCopyWithImpl<_ExercisePerformanceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExercisePerformanceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExercisePerformanceDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.maxWeight, maxWeight) || other.maxWeight == maxWeight)&&(identical(other.maxReps, maxReps) || other.maxReps == maxReps)&&(identical(other.maxVolume, maxVolume) || other.maxVolume == maxVolume)&&(identical(other.lastPerformed, lastPerformed) || other.lastPerformed == lastPerformed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,exerciseName,maxWeight,maxReps,maxVolume,lastPerformed);

@override
String toString() {
  return 'ExercisePerformanceDto(exerciseId: $exerciseId, exerciseName: $exerciseName, maxWeight: $maxWeight, maxReps: $maxReps, maxVolume: $maxVolume, lastPerformed: $lastPerformed)';
}


}

/// @nodoc
abstract mixin class _$ExercisePerformanceDtoCopyWith<$Res> implements $ExercisePerformanceDtoCopyWith<$Res> {
  factory _$ExercisePerformanceDtoCopyWith(_ExercisePerformanceDto value, $Res Function(_ExercisePerformanceDto) _then) = __$ExercisePerformanceDtoCopyWithImpl;
@override @useResult
$Res call({
 String exerciseId, String exerciseName, double? maxWeight, double? maxReps, double? maxVolume, String? lastPerformed
});




}
/// @nodoc
class __$ExercisePerformanceDtoCopyWithImpl<$Res>
    implements _$ExercisePerformanceDtoCopyWith<$Res> {
  __$ExercisePerformanceDtoCopyWithImpl(this._self, this._then);

  final _ExercisePerformanceDto _self;
  final $Res Function(_ExercisePerformanceDto) _then;

/// Create a copy of ExercisePerformanceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? exerciseName = null,Object? maxWeight = freezed,Object? maxReps = freezed,Object? maxVolume = freezed,Object? lastPerformed = freezed,}) {
  return _then(_ExercisePerformanceDto(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,maxWeight: freezed == maxWeight ? _self.maxWeight : maxWeight // ignore: cast_nullable_to_non_nullable
as double?,maxReps: freezed == maxReps ? _self.maxReps : maxReps // ignore: cast_nullable_to_non_nullable
as double?,maxVolume: freezed == maxVolume ? _self.maxVolume : maxVolume // ignore: cast_nullable_to_non_nullable
as double?,lastPerformed: freezed == lastPerformed ? _self.lastPerformed : lastPerformed // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$FavoriteExerciseDto {

 String get exerciseId; String get exerciseName; int get frequency;
/// Create a copy of FavoriteExerciseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteExerciseDtoCopyWith<FavoriteExerciseDto> get copyWith => _$FavoriteExerciseDtoCopyWithImpl<FavoriteExerciseDto>(this as FavoriteExerciseDto, _$identity);

  /// Serializes this FavoriteExerciseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteExerciseDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,exerciseName,frequency);

@override
String toString() {
  return 'FavoriteExerciseDto(exerciseId: $exerciseId, exerciseName: $exerciseName, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class $FavoriteExerciseDtoCopyWith<$Res>  {
  factory $FavoriteExerciseDtoCopyWith(FavoriteExerciseDto value, $Res Function(FavoriteExerciseDto) _then) = _$FavoriteExerciseDtoCopyWithImpl;
@useResult
$Res call({
 String exerciseId, String exerciseName, int frequency
});




}
/// @nodoc
class _$FavoriteExerciseDtoCopyWithImpl<$Res>
    implements $FavoriteExerciseDtoCopyWith<$Res> {
  _$FavoriteExerciseDtoCopyWithImpl(this._self, this._then);

  final FavoriteExerciseDto _self;
  final $Res Function(FavoriteExerciseDto) _then;

/// Create a copy of FavoriteExerciseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? exerciseId = null,Object? exerciseName = null,Object? frequency = null,}) {
  return _then(_self.copyWith(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FavoriteExerciseDto].
extension FavoriteExerciseDtoPatterns on FavoriteExerciseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FavoriteExerciseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FavoriteExerciseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FavoriteExerciseDto value)  $default,){
final _that = this;
switch (_that) {
case _FavoriteExerciseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FavoriteExerciseDto value)?  $default,){
final _that = this;
switch (_that) {
case _FavoriteExerciseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String exerciseId,  String exerciseName,  int frequency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FavoriteExerciseDto() when $default != null:
return $default(_that.exerciseId,_that.exerciseName,_that.frequency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String exerciseId,  String exerciseName,  int frequency)  $default,) {final _that = this;
switch (_that) {
case _FavoriteExerciseDto():
return $default(_that.exerciseId,_that.exerciseName,_that.frequency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String exerciseId,  String exerciseName,  int frequency)?  $default,) {final _that = this;
switch (_that) {
case _FavoriteExerciseDto() when $default != null:
return $default(_that.exerciseId,_that.exerciseName,_that.frequency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FavoriteExerciseDto implements FavoriteExerciseDto {
  const _FavoriteExerciseDto({required this.exerciseId, required this.exerciseName, this.frequency = 0});
  factory _FavoriteExerciseDto.fromJson(Map<String, dynamic> json) => _$FavoriteExerciseDtoFromJson(json);

@override final  String exerciseId;
@override final  String exerciseName;
@override@JsonKey() final  int frequency;

/// Create a copy of FavoriteExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteExerciseDtoCopyWith<_FavoriteExerciseDto> get copyWith => __$FavoriteExerciseDtoCopyWithImpl<_FavoriteExerciseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FavoriteExerciseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteExerciseDto&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.frequency, frequency) || other.frequency == frequency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,exerciseId,exerciseName,frequency);

@override
String toString() {
  return 'FavoriteExerciseDto(exerciseId: $exerciseId, exerciseName: $exerciseName, frequency: $frequency)';
}


}

/// @nodoc
abstract mixin class _$FavoriteExerciseDtoCopyWith<$Res> implements $FavoriteExerciseDtoCopyWith<$Res> {
  factory _$FavoriteExerciseDtoCopyWith(_FavoriteExerciseDto value, $Res Function(_FavoriteExerciseDto) _then) = __$FavoriteExerciseDtoCopyWithImpl;
@override @useResult
$Res call({
 String exerciseId, String exerciseName, int frequency
});




}
/// @nodoc
class __$FavoriteExerciseDtoCopyWithImpl<$Res>
    implements _$FavoriteExerciseDtoCopyWith<$Res> {
  __$FavoriteExerciseDtoCopyWithImpl(this._self, this._then);

  final _FavoriteExerciseDto _self;
  final $Res Function(_FavoriteExerciseDto) _then;

/// Create a copy of FavoriteExerciseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? exerciseName = null,Object? frequency = null,}) {
  return _then(_FavoriteExerciseDto(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,exerciseName: null == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String,frequency: null == frequency ? _self.frequency : frequency // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
