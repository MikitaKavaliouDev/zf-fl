// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_target_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyTargetDto {

 String get id; String get clientId; String get title; String? get description; String get type; double get targetValue; String get unit; DateTime get date; double? get currentValue; bool get isCompleted; int get order; DateTime get createdAt; DateTime get updatedAt; DateTime? get deletedAt;
/// Create a copy of DailyTargetDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyTargetDtoCopyWith<DailyTargetDto> get copyWith => _$DailyTargetDtoCopyWithImpl<DailyTargetDto>(this as DailyTargetDto, _$identity);

  /// Serializes this DailyTargetDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyTargetDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.date, date) || other.date == date)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,title,description,type,targetValue,unit,date,currentValue,isCompleted,order,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'DailyTargetDto(id: $id, clientId: $clientId, title: $title, description: $description, type: $type, targetValue: $targetValue, unit: $unit, date: $date, currentValue: $currentValue, isCompleted: $isCompleted, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $DailyTargetDtoCopyWith<$Res>  {
  factory $DailyTargetDtoCopyWith(DailyTargetDto value, $Res Function(DailyTargetDto) _then) = _$DailyTargetDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String title, String? description, String type, double targetValue, String unit, DateTime date, double? currentValue, bool isCompleted, int order, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class _$DailyTargetDtoCopyWithImpl<$Res>
    implements $DailyTargetDtoCopyWith<$Res> {
  _$DailyTargetDtoCopyWithImpl(this._self, this._then);

  final DailyTargetDto _self;
  final $Res Function(DailyTargetDto) _then;

/// Create a copy of DailyTargetDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? title = null,Object? description = freezed,Object? type = null,Object? targetValue = null,Object? unit = null,Object? date = null,Object? currentValue = freezed,Object? isCompleted = null,Object? order = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyTargetDto].
extension DailyTargetDtoPatterns on DailyTargetDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyTargetDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyTargetDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyTargetDto value)  $default,){
final _that = this;
switch (_that) {
case _DailyTargetDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyTargetDto value)?  $default,){
final _that = this;
switch (_that) {
case _DailyTargetDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String title,  String? description,  String type,  double targetValue,  String unit,  DateTime date,  double? currentValue,  bool isCompleted,  int order,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyTargetDto() when $default != null:
return $default(_that.id,_that.clientId,_that.title,_that.description,_that.type,_that.targetValue,_that.unit,_that.date,_that.currentValue,_that.isCompleted,_that.order,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String title,  String? description,  String type,  double targetValue,  String unit,  DateTime date,  double? currentValue,  bool isCompleted,  int order,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _DailyTargetDto():
return $default(_that.id,_that.clientId,_that.title,_that.description,_that.type,_that.targetValue,_that.unit,_that.date,_that.currentValue,_that.isCompleted,_that.order,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String title,  String? description,  String type,  double targetValue,  String unit,  DateTime date,  double? currentValue,  bool isCompleted,  int order,  DateTime createdAt,  DateTime updatedAt,  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _DailyTargetDto() when $default != null:
return $default(_that.id,_that.clientId,_that.title,_that.description,_that.type,_that.targetValue,_that.unit,_that.date,_that.currentValue,_that.isCompleted,_that.order,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyTargetDto extends DailyTargetDto {
  const _DailyTargetDto({required this.id, required this.clientId, required this.title, this.description, required this.type, required this.targetValue, required this.unit, required this.date, this.currentValue, this.isCompleted = false, this.order = 0, required this.createdAt, required this.updatedAt, this.deletedAt}): super._();
  factory _DailyTargetDto.fromJson(Map<String, dynamic> json) => _$DailyTargetDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String title;
@override final  String? description;
@override final  String type;
@override final  double targetValue;
@override final  String unit;
@override final  DateTime date;
@override final  double? currentValue;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  int order;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  DateTime? deletedAt;

/// Create a copy of DailyTargetDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyTargetDtoCopyWith<_DailyTargetDto> get copyWith => __$DailyTargetDtoCopyWithImpl<_DailyTargetDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyTargetDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyTargetDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.targetValue, targetValue) || other.targetValue == targetValue)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.date, date) || other.date == date)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,title,description,type,targetValue,unit,date,currentValue,isCompleted,order,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'DailyTargetDto(id: $id, clientId: $clientId, title: $title, description: $description, type: $type, targetValue: $targetValue, unit: $unit, date: $date, currentValue: $currentValue, isCompleted: $isCompleted, order: $order, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$DailyTargetDtoCopyWith<$Res> implements $DailyTargetDtoCopyWith<$Res> {
  factory _$DailyTargetDtoCopyWith(_DailyTargetDto value, $Res Function(_DailyTargetDto) _then) = __$DailyTargetDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String title, String? description, String type, double targetValue, String unit, DateTime date, double? currentValue, bool isCompleted, int order, DateTime createdAt, DateTime updatedAt, DateTime? deletedAt
});




}
/// @nodoc
class __$DailyTargetDtoCopyWithImpl<$Res>
    implements _$DailyTargetDtoCopyWith<$Res> {
  __$DailyTargetDtoCopyWithImpl(this._self, this._then);

  final _DailyTargetDto _self;
  final $Res Function(_DailyTargetDto) _then;

/// Create a copy of DailyTargetDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? title = null,Object? description = freezed,Object? type = null,Object? targetValue = null,Object? unit = null,Object? date = null,Object? currentValue = freezed,Object? isCompleted = null,Object? order = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_DailyTargetDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,targetValue: null == targetValue ? _self.targetValue : targetValue // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as double?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
