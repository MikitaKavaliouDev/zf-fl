// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerClientDetailDto {

 String get id; String get name; String? get email; String? get phone; String get status; String get createdAt; int? get checkInDay; int? get checkInHour; String? get dateOfBirth; String? get goals; String? get healthNotes; String? get emergencyContactName; String? get emergencyContactPhone; String? get avatarUrl; String? get avatarPath; String? get trainerId;
/// Create a copy of TrainerClientDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientDetailDtoCopyWith<TrainerClientDetailDto> get copyWith => _$TrainerClientDetailDtoCopyWithImpl<TrainerClientDetailDto>(this as TrainerClientDetailDto, _$identity);

  /// Serializes this TrainerClientDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.checkInDay, checkInDay) || other.checkInDay == checkInDay)&&(identical(other.checkInHour, checkInHour) || other.checkInHour == checkInHour)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.healthNotes, healthNotes) || other.healthNotes == healthNotes)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,status,createdAt,checkInDay,checkInHour,dateOfBirth,goals,healthNotes,emergencyContactName,emergencyContactPhone,avatarUrl,avatarPath,trainerId);

@override
String toString() {
  return 'TrainerClientDetailDto(id: $id, name: $name, email: $email, phone: $phone, status: $status, createdAt: $createdAt, checkInDay: $checkInDay, checkInHour: $checkInHour, dateOfBirth: $dateOfBirth, goals: $goals, healthNotes: $healthNotes, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, avatarUrl: $avatarUrl, avatarPath: $avatarPath, trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class $TrainerClientDetailDtoCopyWith<$Res>  {
  factory $TrainerClientDetailDtoCopyWith(TrainerClientDetailDto value, $Res Function(TrainerClientDetailDto) _then) = _$TrainerClientDetailDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? email, String? phone, String status, String createdAt, int? checkInDay, int? checkInHour, String? dateOfBirth, String? goals, String? healthNotes, String? emergencyContactName, String? emergencyContactPhone, String? avatarUrl, String? avatarPath, String? trainerId
});




}
/// @nodoc
class _$TrainerClientDetailDtoCopyWithImpl<$Res>
    implements $TrainerClientDetailDtoCopyWith<$Res> {
  _$TrainerClientDetailDtoCopyWithImpl(this._self, this._then);

  final TrainerClientDetailDto _self;
  final $Res Function(TrainerClientDetailDto) _then;

/// Create a copy of TrainerClientDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = freezed,Object? phone = freezed,Object? status = null,Object? createdAt = null,Object? checkInDay = freezed,Object? checkInHour = freezed,Object? dateOfBirth = freezed,Object? goals = freezed,Object? healthNotes = freezed,Object? emergencyContactName = freezed,Object? emergencyContactPhone = freezed,Object? avatarUrl = freezed,Object? avatarPath = freezed,Object? trainerId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,checkInDay: freezed == checkInDay ? _self.checkInDay : checkInDay // ignore: cast_nullable_to_non_nullable
as int?,checkInHour: freezed == checkInHour ? _self.checkInHour : checkInHour // ignore: cast_nullable_to_non_nullable
as int?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String?,healthNotes: freezed == healthNotes ? _self.healthNotes : healthNotes // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactName: freezed == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerClientDetailDto].
extension TrainerClientDetailDtoPatterns on TrainerClientDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerClientDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerClientDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerClientDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerClientDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerClientDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerClientDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? email,  String? phone,  String status,  String createdAt,  int? checkInDay,  int? checkInHour,  String? dateOfBirth,  String? goals,  String? healthNotes,  String? emergencyContactName,  String? emergencyContactPhone,  String? avatarUrl,  String? avatarPath,  String? trainerId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerClientDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.createdAt,_that.checkInDay,_that.checkInHour,_that.dateOfBirth,_that.goals,_that.healthNotes,_that.emergencyContactName,_that.emergencyContactPhone,_that.avatarUrl,_that.avatarPath,_that.trainerId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? email,  String? phone,  String status,  String createdAt,  int? checkInDay,  int? checkInHour,  String? dateOfBirth,  String? goals,  String? healthNotes,  String? emergencyContactName,  String? emergencyContactPhone,  String? avatarUrl,  String? avatarPath,  String? trainerId)  $default,) {final _that = this;
switch (_that) {
case _TrainerClientDetailDto():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.createdAt,_that.checkInDay,_that.checkInHour,_that.dateOfBirth,_that.goals,_that.healthNotes,_that.emergencyContactName,_that.emergencyContactPhone,_that.avatarUrl,_that.avatarPath,_that.trainerId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? email,  String? phone,  String status,  String createdAt,  int? checkInDay,  int? checkInHour,  String? dateOfBirth,  String? goals,  String? healthNotes,  String? emergencyContactName,  String? emergencyContactPhone,  String? avatarUrl,  String? avatarPath,  String? trainerId)?  $default,) {final _that = this;
switch (_that) {
case _TrainerClientDetailDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.createdAt,_that.checkInDay,_that.checkInHour,_that.dateOfBirth,_that.goals,_that.healthNotes,_that.emergencyContactName,_that.emergencyContactPhone,_that.avatarUrl,_that.avatarPath,_that.trainerId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerClientDetailDto implements TrainerClientDetailDto {
  const _TrainerClientDetailDto({required this.id, required this.name, this.email, this.phone, required this.status, required this.createdAt, this.checkInDay, this.checkInHour, this.dateOfBirth, this.goals, this.healthNotes, this.emergencyContactName, this.emergencyContactPhone, this.avatarUrl, this.avatarPath, this.trainerId});
  factory _TrainerClientDetailDto.fromJson(Map<String, dynamic> json) => _$TrainerClientDetailDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? email;
@override final  String? phone;
@override final  String status;
@override final  String createdAt;
@override final  int? checkInDay;
@override final  int? checkInHour;
@override final  String? dateOfBirth;
@override final  String? goals;
@override final  String? healthNotes;
@override final  String? emergencyContactName;
@override final  String? emergencyContactPhone;
@override final  String? avatarUrl;
@override final  String? avatarPath;
@override final  String? trainerId;

/// Create a copy of TrainerClientDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerClientDetailDtoCopyWith<_TrainerClientDetailDto> get copyWith => __$TrainerClientDetailDtoCopyWithImpl<_TrainerClientDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerClientDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerClientDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.checkInDay, checkInDay) || other.checkInDay == checkInDay)&&(identical(other.checkInHour, checkInHour) || other.checkInHour == checkInHour)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.goals, goals) || other.goals == goals)&&(identical(other.healthNotes, healthNotes) || other.healthNotes == healthNotes)&&(identical(other.emergencyContactName, emergencyContactName) || other.emergencyContactName == emergencyContactName)&&(identical(other.emergencyContactPhone, emergencyContactPhone) || other.emergencyContactPhone == emergencyContactPhone)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.trainerId, trainerId) || other.trainerId == trainerId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,status,createdAt,checkInDay,checkInHour,dateOfBirth,goals,healthNotes,emergencyContactName,emergencyContactPhone,avatarUrl,avatarPath,trainerId);

@override
String toString() {
  return 'TrainerClientDetailDto(id: $id, name: $name, email: $email, phone: $phone, status: $status, createdAt: $createdAt, checkInDay: $checkInDay, checkInHour: $checkInHour, dateOfBirth: $dateOfBirth, goals: $goals, healthNotes: $healthNotes, emergencyContactName: $emergencyContactName, emergencyContactPhone: $emergencyContactPhone, avatarUrl: $avatarUrl, avatarPath: $avatarPath, trainerId: $trainerId)';
}


}

/// @nodoc
abstract mixin class _$TrainerClientDetailDtoCopyWith<$Res> implements $TrainerClientDetailDtoCopyWith<$Res> {
  factory _$TrainerClientDetailDtoCopyWith(_TrainerClientDetailDto value, $Res Function(_TrainerClientDetailDto) _then) = __$TrainerClientDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? email, String? phone, String status, String createdAt, int? checkInDay, int? checkInHour, String? dateOfBirth, String? goals, String? healthNotes, String? emergencyContactName, String? emergencyContactPhone, String? avatarUrl, String? avatarPath, String? trainerId
});




}
/// @nodoc
class __$TrainerClientDetailDtoCopyWithImpl<$Res>
    implements _$TrainerClientDetailDtoCopyWith<$Res> {
  __$TrainerClientDetailDtoCopyWithImpl(this._self, this._then);

  final _TrainerClientDetailDto _self;
  final $Res Function(_TrainerClientDetailDto) _then;

/// Create a copy of TrainerClientDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = freezed,Object? phone = freezed,Object? status = null,Object? createdAt = null,Object? checkInDay = freezed,Object? checkInHour = freezed,Object? dateOfBirth = freezed,Object? goals = freezed,Object? healthNotes = freezed,Object? emergencyContactName = freezed,Object? emergencyContactPhone = freezed,Object? avatarUrl = freezed,Object? avatarPath = freezed,Object? trainerId = freezed,}) {
  return _then(_TrainerClientDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,checkInDay: freezed == checkInDay ? _self.checkInDay : checkInDay // ignore: cast_nullable_to_non_nullable
as int?,checkInHour: freezed == checkInHour ? _self.checkInHour : checkInHour // ignore: cast_nullable_to_non_nullable
as int?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,goals: freezed == goals ? _self.goals : goals // ignore: cast_nullable_to_non_nullable
as String?,healthNotes: freezed == healthNotes ? _self.healthNotes : healthNotes // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactName: freezed == emergencyContactName ? _self.emergencyContactName : emergencyContactName // ignore: cast_nullable_to_non_nullable
as String?,emergencyContactPhone: freezed == emergencyContactPhone ? _self.emergencyContactPhone : emergencyContactPhone // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,trainerId: freezed == trainerId ? _self.trainerId : trainerId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
