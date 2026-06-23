// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardMeasurement {

 String get id; DateTime get measurementDate; double? get weightKg; double? get bodyFatPercentage;
/// Create a copy of DashboardMeasurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardMeasurementCopyWith<DashboardMeasurement> get copyWith => _$DashboardMeasurementCopyWithImpl<DashboardMeasurement>(this as DashboardMeasurement, _$identity);

  /// Serializes this DashboardMeasurement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardMeasurement&&(identical(other.id, id) || other.id == id)&&(identical(other.measurementDate, measurementDate) || other.measurementDate == measurementDate)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bodyFatPercentage, bodyFatPercentage) || other.bodyFatPercentage == bodyFatPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,measurementDate,weightKg,bodyFatPercentage);

@override
String toString() {
  return 'DashboardMeasurement(id: $id, measurementDate: $measurementDate, weightKg: $weightKg, bodyFatPercentage: $bodyFatPercentage)';
}


}

/// @nodoc
abstract mixin class $DashboardMeasurementCopyWith<$Res>  {
  factory $DashboardMeasurementCopyWith(DashboardMeasurement value, $Res Function(DashboardMeasurement) _then) = _$DashboardMeasurementCopyWithImpl;
@useResult
$Res call({
 String id, DateTime measurementDate, double? weightKg, double? bodyFatPercentage
});




}
/// @nodoc
class _$DashboardMeasurementCopyWithImpl<$Res>
    implements $DashboardMeasurementCopyWith<$Res> {
  _$DashboardMeasurementCopyWithImpl(this._self, this._then);

  final DashboardMeasurement _self;
  final $Res Function(DashboardMeasurement) _then;

/// Create a copy of DashboardMeasurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? measurementDate = null,Object? weightKg = freezed,Object? bodyFatPercentage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,measurementDate: null == measurementDate ? _self.measurementDate : measurementDate // ignore: cast_nullable_to_non_nullable
as DateTime,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bodyFatPercentage: freezed == bodyFatPercentage ? _self.bodyFatPercentage : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardMeasurement].
extension DashboardMeasurementPatterns on DashboardMeasurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardMeasurement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardMeasurement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardMeasurement value)  $default,){
final _that = this;
switch (_that) {
case _DashboardMeasurement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardMeasurement value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardMeasurement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime measurementDate,  double? weightKg,  double? bodyFatPercentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardMeasurement() when $default != null:
return $default(_that.id,_that.measurementDate,_that.weightKg,_that.bodyFatPercentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime measurementDate,  double? weightKg,  double? bodyFatPercentage)  $default,) {final _that = this;
switch (_that) {
case _DashboardMeasurement():
return $default(_that.id,_that.measurementDate,_that.weightKg,_that.bodyFatPercentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime measurementDate,  double? weightKg,  double? bodyFatPercentage)?  $default,) {final _that = this;
switch (_that) {
case _DashboardMeasurement() when $default != null:
return $default(_that.id,_that.measurementDate,_that.weightKg,_that.bodyFatPercentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardMeasurement implements DashboardMeasurement {
  const _DashboardMeasurement({required this.id, required this.measurementDate, this.weightKg, this.bodyFatPercentage});
  factory _DashboardMeasurement.fromJson(Map<String, dynamic> json) => _$DashboardMeasurementFromJson(json);

@override final  String id;
@override final  DateTime measurementDate;
@override final  double? weightKg;
@override final  double? bodyFatPercentage;

/// Create a copy of DashboardMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardMeasurementCopyWith<_DashboardMeasurement> get copyWith => __$DashboardMeasurementCopyWithImpl<_DashboardMeasurement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardMeasurementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardMeasurement&&(identical(other.id, id) || other.id == id)&&(identical(other.measurementDate, measurementDate) || other.measurementDate == measurementDate)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bodyFatPercentage, bodyFatPercentage) || other.bodyFatPercentage == bodyFatPercentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,measurementDate,weightKg,bodyFatPercentage);

@override
String toString() {
  return 'DashboardMeasurement(id: $id, measurementDate: $measurementDate, weightKg: $weightKg, bodyFatPercentage: $bodyFatPercentage)';
}


}

/// @nodoc
abstract mixin class _$DashboardMeasurementCopyWith<$Res> implements $DashboardMeasurementCopyWith<$Res> {
  factory _$DashboardMeasurementCopyWith(_DashboardMeasurement value, $Res Function(_DashboardMeasurement) _then) = __$DashboardMeasurementCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime measurementDate, double? weightKg, double? bodyFatPercentage
});




}
/// @nodoc
class __$DashboardMeasurementCopyWithImpl<$Res>
    implements _$DashboardMeasurementCopyWith<$Res> {
  __$DashboardMeasurementCopyWithImpl(this._self, this._then);

  final _DashboardMeasurement _self;
  final $Res Function(_DashboardMeasurement) _then;

/// Create a copy of DashboardMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? measurementDate = null,Object? weightKg = freezed,Object? bodyFatPercentage = freezed,}) {
  return _then(_DashboardMeasurement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,measurementDate: null == measurementDate ? _self.measurementDate : measurementDate // ignore: cast_nullable_to_non_nullable
as DateTime,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bodyFatPercentage: freezed == bodyFatPercentage ? _self.bodyFatPercentage : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
