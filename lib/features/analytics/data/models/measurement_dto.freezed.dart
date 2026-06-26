// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'measurement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateMeasurementRequest {

 double? get weightKg; double? get bodyFatPercentage; String? get measurementDate; String? get notes;
/// Create a copy of CreateMeasurementRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateMeasurementRequestCopyWith<CreateMeasurementRequest> get copyWith => _$CreateMeasurementRequestCopyWithImpl<CreateMeasurementRequest>(this as CreateMeasurementRequest, _$identity);

  /// Serializes this CreateMeasurementRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateMeasurementRequest&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bodyFatPercentage, bodyFatPercentage) || other.bodyFatPercentage == bodyFatPercentage)&&(identical(other.measurementDate, measurementDate) || other.measurementDate == measurementDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weightKg,bodyFatPercentage,measurementDate,notes);

@override
String toString() {
  return 'CreateMeasurementRequest(weightKg: $weightKg, bodyFatPercentage: $bodyFatPercentage, measurementDate: $measurementDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $CreateMeasurementRequestCopyWith<$Res>  {
  factory $CreateMeasurementRequestCopyWith(CreateMeasurementRequest value, $Res Function(CreateMeasurementRequest) _then) = _$CreateMeasurementRequestCopyWithImpl;
@useResult
$Res call({
 double? weightKg, double? bodyFatPercentage, String? measurementDate, String? notes
});




}
/// @nodoc
class _$CreateMeasurementRequestCopyWithImpl<$Res>
    implements $CreateMeasurementRequestCopyWith<$Res> {
  _$CreateMeasurementRequestCopyWithImpl(this._self, this._then);

  final CreateMeasurementRequest _self;
  final $Res Function(CreateMeasurementRequest) _then;

/// Create a copy of CreateMeasurementRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weightKg = freezed,Object? bodyFatPercentage = freezed,Object? measurementDate = freezed,Object? notes = freezed,}) {
  return _then(_self.copyWith(
weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bodyFatPercentage: freezed == bodyFatPercentage ? _self.bodyFatPercentage : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
as double?,measurementDate: freezed == measurementDate ? _self.measurementDate : measurementDate // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateMeasurementRequest].
extension CreateMeasurementRequestPatterns on CreateMeasurementRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateMeasurementRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateMeasurementRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateMeasurementRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateMeasurementRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateMeasurementRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateMeasurementRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? weightKg,  double? bodyFatPercentage,  String? measurementDate,  String? notes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateMeasurementRequest() when $default != null:
return $default(_that.weightKg,_that.bodyFatPercentage,_that.measurementDate,_that.notes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? weightKg,  double? bodyFatPercentage,  String? measurementDate,  String? notes)  $default,) {final _that = this;
switch (_that) {
case _CreateMeasurementRequest():
return $default(_that.weightKg,_that.bodyFatPercentage,_that.measurementDate,_that.notes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? weightKg,  double? bodyFatPercentage,  String? measurementDate,  String? notes)?  $default,) {final _that = this;
switch (_that) {
case _CreateMeasurementRequest() when $default != null:
return $default(_that.weightKg,_that.bodyFatPercentage,_that.measurementDate,_that.notes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateMeasurementRequest implements CreateMeasurementRequest {
  const _CreateMeasurementRequest({this.weightKg, this.bodyFatPercentage, this.measurementDate, this.notes});
  factory _CreateMeasurementRequest.fromJson(Map<String, dynamic> json) => _$CreateMeasurementRequestFromJson(json);

@override final  double? weightKg;
@override final  double? bodyFatPercentage;
@override final  String? measurementDate;
@override final  String? notes;

/// Create a copy of CreateMeasurementRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateMeasurementRequestCopyWith<_CreateMeasurementRequest> get copyWith => __$CreateMeasurementRequestCopyWithImpl<_CreateMeasurementRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateMeasurementRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateMeasurementRequest&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bodyFatPercentage, bodyFatPercentage) || other.bodyFatPercentage == bodyFatPercentage)&&(identical(other.measurementDate, measurementDate) || other.measurementDate == measurementDate)&&(identical(other.notes, notes) || other.notes == notes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weightKg,bodyFatPercentage,measurementDate,notes);

@override
String toString() {
  return 'CreateMeasurementRequest(weightKg: $weightKg, bodyFatPercentage: $bodyFatPercentage, measurementDate: $measurementDate, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$CreateMeasurementRequestCopyWith<$Res> implements $CreateMeasurementRequestCopyWith<$Res> {
  factory _$CreateMeasurementRequestCopyWith(_CreateMeasurementRequest value, $Res Function(_CreateMeasurementRequest) _then) = __$CreateMeasurementRequestCopyWithImpl;
@override @useResult
$Res call({
 double? weightKg, double? bodyFatPercentage, String? measurementDate, String? notes
});




}
/// @nodoc
class __$CreateMeasurementRequestCopyWithImpl<$Res>
    implements _$CreateMeasurementRequestCopyWith<$Res> {
  __$CreateMeasurementRequestCopyWithImpl(this._self, this._then);

  final _CreateMeasurementRequest _self;
  final $Res Function(_CreateMeasurementRequest) _then;

/// Create a copy of CreateMeasurementRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weightKg = freezed,Object? bodyFatPercentage = freezed,Object? measurementDate = freezed,Object? notes = freezed,}) {
  return _then(_CreateMeasurementRequest(
weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bodyFatPercentage: freezed == bodyFatPercentage ? _self.bodyFatPercentage : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
as double?,measurementDate: freezed == measurementDate ? _self.measurementDate : measurementDate // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$MeasurementDto {

 String get id; String get clientId; String get measurementDate; double? get weightKg; double? get bodyFatPercentage; String? get notes; String? get createdAt; String? get updatedAt;
/// Create a copy of MeasurementDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasurementDtoCopyWith<MeasurementDto> get copyWith => _$MeasurementDtoCopyWithImpl<MeasurementDto>(this as MeasurementDto, _$identity);

  /// Serializes this MeasurementDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.measurementDate, measurementDate) || other.measurementDate == measurementDate)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bodyFatPercentage, bodyFatPercentage) || other.bodyFatPercentage == bodyFatPercentage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,measurementDate,weightKg,bodyFatPercentage,notes,createdAt,updatedAt);

@override
String toString() {
  return 'MeasurementDto(id: $id, clientId: $clientId, measurementDate: $measurementDate, weightKg: $weightKg, bodyFatPercentage: $bodyFatPercentage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MeasurementDtoCopyWith<$Res>  {
  factory $MeasurementDtoCopyWith(MeasurementDto value, $Res Function(MeasurementDto) _then) = _$MeasurementDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String measurementDate, double? weightKg, double? bodyFatPercentage, String? notes, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$MeasurementDtoCopyWithImpl<$Res>
    implements $MeasurementDtoCopyWith<$Res> {
  _$MeasurementDtoCopyWithImpl(this._self, this._then);

  final MeasurementDto _self;
  final $Res Function(MeasurementDto) _then;

/// Create a copy of MeasurementDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? measurementDate = null,Object? weightKg = freezed,Object? bodyFatPercentage = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,measurementDate: null == measurementDate ? _self.measurementDate : measurementDate // ignore: cast_nullable_to_non_nullable
as String,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bodyFatPercentage: freezed == bodyFatPercentage ? _self.bodyFatPercentage : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MeasurementDto].
extension MeasurementDtoPatterns on MeasurementDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeasurementDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeasurementDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeasurementDto value)  $default,){
final _that = this;
switch (_that) {
case _MeasurementDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeasurementDto value)?  $default,){
final _that = this;
switch (_that) {
case _MeasurementDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String measurementDate,  double? weightKg,  double? bodyFatPercentage,  String? notes,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeasurementDto() when $default != null:
return $default(_that.id,_that.clientId,_that.measurementDate,_that.weightKg,_that.bodyFatPercentage,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String measurementDate,  double? weightKg,  double? bodyFatPercentage,  String? notes,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MeasurementDto():
return $default(_that.id,_that.clientId,_that.measurementDate,_that.weightKg,_that.bodyFatPercentage,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String measurementDate,  double? weightKg,  double? bodyFatPercentage,  String? notes,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MeasurementDto() when $default != null:
return $default(_that.id,_that.clientId,_that.measurementDate,_that.weightKg,_that.bodyFatPercentage,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MeasurementDto implements MeasurementDto {
  const _MeasurementDto({required this.id, required this.clientId, required this.measurementDate, this.weightKg, this.bodyFatPercentage, this.notes, this.createdAt, this.updatedAt});
  factory _MeasurementDto.fromJson(Map<String, dynamic> json) => _$MeasurementDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String measurementDate;
@override final  double? weightKg;
@override final  double? bodyFatPercentage;
@override final  String? notes;
@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of MeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeasurementDtoCopyWith<_MeasurementDto> get copyWith => __$MeasurementDtoCopyWithImpl<_MeasurementDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeasurementDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeasurementDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.measurementDate, measurementDate) || other.measurementDate == measurementDate)&&(identical(other.weightKg, weightKg) || other.weightKg == weightKg)&&(identical(other.bodyFatPercentage, bodyFatPercentage) || other.bodyFatPercentage == bodyFatPercentage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,measurementDate,weightKg,bodyFatPercentage,notes,createdAt,updatedAt);

@override
String toString() {
  return 'MeasurementDto(id: $id, clientId: $clientId, measurementDate: $measurementDate, weightKg: $weightKg, bodyFatPercentage: $bodyFatPercentage, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MeasurementDtoCopyWith<$Res> implements $MeasurementDtoCopyWith<$Res> {
  factory _$MeasurementDtoCopyWith(_MeasurementDto value, $Res Function(_MeasurementDto) _then) = __$MeasurementDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String measurementDate, double? weightKg, double? bodyFatPercentage, String? notes, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$MeasurementDtoCopyWithImpl<$Res>
    implements _$MeasurementDtoCopyWith<$Res> {
  __$MeasurementDtoCopyWithImpl(this._self, this._then);

  final _MeasurementDto _self;
  final $Res Function(_MeasurementDto) _then;

/// Create a copy of MeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? measurementDate = null,Object? weightKg = freezed,Object? bodyFatPercentage = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_MeasurementDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,measurementDate: null == measurementDate ? _self.measurementDate : measurementDate // ignore: cast_nullable_to_non_nullable
as String,weightKg: freezed == weightKg ? _self.weightKg : weightKg // ignore: cast_nullable_to_non_nullable
as double?,bodyFatPercentage: freezed == bodyFatPercentage ? _self.bodyFatPercentage : bodyFatPercentage // ignore: cast_nullable_to_non_nullable
as double?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
