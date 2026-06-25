// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fitness_goal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FitnessGoalDto {

 String get id; String get clientId; String get type; double get targetValue; double? get currentValue; DateTime get startDate; DateTime? get endDate; String? get exerciseName; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt;
/// Create a copy of FitnessGoalDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FitnessGoalDtoCopyWith<FitnessGoalDto> get copyWith => _$FitnessGoalDtoCopyWithImpl<FitnessGoalDto>(this as FitnessGoalDto, _$identity);

  /// Serializes this FitnessGoalDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FitnessGoalDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,type,targetValue,currentValue,startDate,endDate,exerciseName,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'FitnessGoalDto(id: $id, clientId: $clientId, type: $type, targetValue: $targetValue, currentValue: $currentValue, startDate: $startDate, endDate: $endDate, exerciseName: $exerciseName, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $FitnessGoalDtoCopyWith<$Res>  {
  factory $FitnessGoalDtoCopyWith(FitnessGoalDto value, $Res Function(FitnessGoalDto) _then) = _$FitnessGoalDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String type, double targetValue, double? currentValue, DateTime startDate, DateTime? endDate, String? exerciseName, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class _$FitnessGoalDtoCopyWithImpl<$Res>
    implements $FitnessGoalDtoCopyWith<$Res> {
  _$FitnessGoalDtoCopyWithImpl(this._self, this._then);

  final FitnessGoalDto _self;
  final $Res Function(FitnessGoalDto) _then;

/// Create a copy of FitnessGoalDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? type = null,Object? targetValue = null,Object? currentValue = freezed,Object? startDate = null,Object? endDate = freezed,Object? exerciseName = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,exerciseName: freezed == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FitnessGoalDto].
extension FitnessGoalDtoPatterns on FitnessGoalDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FitnessGoalDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FitnessGoalDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FitnessGoalDto value)  $default,){
final _that = this;
switch (_that) {
case _FitnessGoalDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FitnessGoalDto value)?  $default,){
final _that = this;
switch (_that) {
case _FitnessGoalDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String type,  double targetValue,  double? currentValue,  DateTime startDate,  DateTime? endDate,  String? exerciseName,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FitnessGoalDto() when $default != null:
return $default(_that.id,_that.clientId,_that.type,_that.targetValue,_that.currentValue,_that.startDate,_that.endDate,_that.exerciseName,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String type,  double targetValue,  double? currentValue,  DateTime startDate,  DateTime? endDate,  String? exerciseName,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _FitnessGoalDto():
return $default(_that.id,_that.clientId,_that.type,_that.targetValue,_that.currentValue,_that.startDate,_that.endDate,_that.exerciseName,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String type,  double targetValue,  double? currentValue,  DateTime startDate,  DateTime? endDate,  String? exerciseName,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _FitnessGoalDto() when $default != null:
return $default(_that.id,_that.clientId,_that.type,_that.targetValue,_that.currentValue,_that.startDate,_that.endDate,_that.exerciseName,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FitnessGoalDto extends FitnessGoalDto {
  const _FitnessGoalDto({required this.id, required this.clientId, required this.type, required this.targetValue, this.currentValue, required this.startDate, this.endDate, this.exerciseName, required this.createdAt, required this.updatedAt, this.deletedAt}): super._();
  factory _FitnessGoalDto.fromJson(Map<String, dynamic> json) => _$FitnessGoalDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String type;
@override final  double targetValue;
@override final  double? currentValue;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  String? exerciseName;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;

/// Create a copy of FitnessGoalDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FitnessGoalDtoCopyWith<_FitnessGoalDto> get copyWith => __$FitnessGoalDtoCopyWithImpl<_FitnessGoalDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FitnessGoalDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FitnessGoalDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.exerciseName, exerciseName) || other.exerciseName == exerciseName)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,type,targetValue,currentValue,startDate,endDate,exerciseName,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'FitnessGoalDto(id: $id, clientId: $clientId, type: $type, targetValue: $targetValue, currentValue: $currentValue, startDate: $startDate, endDate: $endDate, exerciseName: $exerciseName, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$FitnessGoalDtoCopyWith<$Res> implements $FitnessGoalDtoCopyWith<$Res> {
  factory _$FitnessGoalDtoCopyWith(_FitnessGoalDto value, $Res Function(_FitnessGoalDto) _then) = __$FitnessGoalDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String type, double targetValue, double? currentValue, DateTime startDate, DateTime? endDate, String? exerciseName, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class __$FitnessGoalDtoCopyWithImpl<$Res>
    implements _$FitnessGoalDtoCopyWith<$Res> {
  __$FitnessGoalDtoCopyWithImpl(this._self, this._then);

  final _FitnessGoalDto _self;
  final $Res Function(_FitnessGoalDto) _then;

/// Create a copy of FitnessGoalDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? type = null,Object? targetValue = null,Object? currentValue = freezed,Object? startDate = null,Object? endDate = freezed,Object? exerciseName = freezed,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_FitnessGoalDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,exerciseName: freezed == exerciseName ? _self.exerciseName : exerciseName // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
