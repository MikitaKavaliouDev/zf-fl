// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_list_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerClientListItemDto {

 String get id; String get name; String? get email; String? get phone; String get status; String? get userId; String? get avatarUrl; String? get avatarPath; String? get lastWorkoutDate; String get engagementScore; String? get activeProgramName;
/// Create a copy of TrainerClientListItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientListItemDtoCopyWith<TrainerClientListItemDto> get copyWith => _$TrainerClientListItemDtoCopyWithImpl<TrainerClientListItemDto>(this as TrainerClientListItemDto, _$identity);

  /// Serializes this TrainerClientListItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientListItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.lastWorkoutDate, lastWorkoutDate) || other.lastWorkoutDate == lastWorkoutDate)&&(identical(other.engagementScore, engagementScore) || other.engagementScore == engagementScore)&&(identical(other.activeProgramName, activeProgramName) || other.activeProgramName == activeProgramName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,status,userId,avatarUrl,avatarPath,lastWorkoutDate,engagementScore,activeProgramName);

@override
String toString() {
  return 'TrainerClientListItemDto(id: $id, name: $name, email: $email, phone: $phone, status: $status, userId: $userId, avatarUrl: $avatarUrl, avatarPath: $avatarPath, lastWorkoutDate: $lastWorkoutDate, engagementScore: $engagementScore, activeProgramName: $activeProgramName)';
}


}

/// @nodoc
abstract mixin class $TrainerClientListItemDtoCopyWith<$Res>  {
  factory $TrainerClientListItemDtoCopyWith(TrainerClientListItemDto value, $Res Function(TrainerClientListItemDto) _then) = _$TrainerClientListItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? email, String? phone, String status, String? userId, String? avatarUrl, String? avatarPath, String? lastWorkoutDate, String engagementScore, String? activeProgramName
});




}
/// @nodoc
class _$TrainerClientListItemDtoCopyWithImpl<$Res>
    implements $TrainerClientListItemDtoCopyWith<$Res> {
  _$TrainerClientListItemDtoCopyWithImpl(this._self, this._then);

  final TrainerClientListItemDto _self;
  final $Res Function(TrainerClientListItemDto) _then;

/// Create a copy of TrainerClientListItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? email = freezed,Object? phone = freezed,Object? status = null,Object? userId = freezed,Object? avatarUrl = freezed,Object? avatarPath = freezed,Object? lastWorkoutDate = freezed,Object? engagementScore = null,Object? activeProgramName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,lastWorkoutDate: freezed == lastWorkoutDate ? _self.lastWorkoutDate : lastWorkoutDate // ignore: cast_nullable_to_non_nullable
as String?,engagementScore: null == engagementScore ? _self.engagementScore : engagementScore // ignore: cast_nullable_to_non_nullable
as String,activeProgramName: freezed == activeProgramName ? _self.activeProgramName : activeProgramName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerClientListItemDto].
extension TrainerClientListItemDtoPatterns on TrainerClientListItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerClientListItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerClientListItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerClientListItemDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerClientListItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerClientListItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerClientListItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? email,  String? phone,  String status,  String? userId,  String? avatarUrl,  String? avatarPath,  String? lastWorkoutDate,  String engagementScore,  String? activeProgramName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerClientListItemDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.userId,_that.avatarUrl,_that.avatarPath,_that.lastWorkoutDate,_that.engagementScore,_that.activeProgramName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? email,  String? phone,  String status,  String? userId,  String? avatarUrl,  String? avatarPath,  String? lastWorkoutDate,  String engagementScore,  String? activeProgramName)  $default,) {final _that = this;
switch (_that) {
case _TrainerClientListItemDto():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.userId,_that.avatarUrl,_that.avatarPath,_that.lastWorkoutDate,_that.engagementScore,_that.activeProgramName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? email,  String? phone,  String status,  String? userId,  String? avatarUrl,  String? avatarPath,  String? lastWorkoutDate,  String engagementScore,  String? activeProgramName)?  $default,) {final _that = this;
switch (_that) {
case _TrainerClientListItemDto() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.status,_that.userId,_that.avatarUrl,_that.avatarPath,_that.lastWorkoutDate,_that.engagementScore,_that.activeProgramName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerClientListItemDto implements TrainerClientListItemDto {
  const _TrainerClientListItemDto({required this.id, required this.name, this.email, this.phone, required this.status, this.userId, this.avatarUrl, this.avatarPath, this.lastWorkoutDate, this.engagementScore = 'medium', this.activeProgramName});
  factory _TrainerClientListItemDto.fromJson(Map<String, dynamic> json) => _$TrainerClientListItemDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? email;
@override final  String? phone;
@override final  String status;
@override final  String? userId;
@override final  String? avatarUrl;
@override final  String? avatarPath;
@override final  String? lastWorkoutDate;
@override@JsonKey() final  String engagementScore;
@override final  String? activeProgramName;

/// Create a copy of TrainerClientListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerClientListItemDtoCopyWith<_TrainerClientListItemDto> get copyWith => __$TrainerClientListItemDtoCopyWithImpl<_TrainerClientListItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerClientListItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerClientListItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.status, status) || other.status == status)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.lastWorkoutDate, lastWorkoutDate) || other.lastWorkoutDate == lastWorkoutDate)&&(identical(other.engagementScore, engagementScore) || other.engagementScore == engagementScore)&&(identical(other.activeProgramName, activeProgramName) || other.activeProgramName == activeProgramName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email,phone,status,userId,avatarUrl,avatarPath,lastWorkoutDate,engagementScore,activeProgramName);

@override
String toString() {
  return 'TrainerClientListItemDto(id: $id, name: $name, email: $email, phone: $phone, status: $status, userId: $userId, avatarUrl: $avatarUrl, avatarPath: $avatarPath, lastWorkoutDate: $lastWorkoutDate, engagementScore: $engagementScore, activeProgramName: $activeProgramName)';
}


}

/// @nodoc
abstract mixin class _$TrainerClientListItemDtoCopyWith<$Res> implements $TrainerClientListItemDtoCopyWith<$Res> {
  factory _$TrainerClientListItemDtoCopyWith(_TrainerClientListItemDto value, $Res Function(_TrainerClientListItemDto) _then) = __$TrainerClientListItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? email, String? phone, String status, String? userId, String? avatarUrl, String? avatarPath, String? lastWorkoutDate, String engagementScore, String? activeProgramName
});




}
/// @nodoc
class __$TrainerClientListItemDtoCopyWithImpl<$Res>
    implements _$TrainerClientListItemDtoCopyWith<$Res> {
  __$TrainerClientListItemDtoCopyWithImpl(this._self, this._then);

  final _TrainerClientListItemDto _self;
  final $Res Function(_TrainerClientListItemDto) _then;

/// Create a copy of TrainerClientListItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? email = freezed,Object? phone = freezed,Object? status = null,Object? userId = freezed,Object? avatarUrl = freezed,Object? avatarPath = freezed,Object? lastWorkoutDate = freezed,Object? engagementScore = null,Object? activeProgramName = freezed,}) {
  return _then(_TrainerClientListItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,lastWorkoutDate: freezed == lastWorkoutDate ? _self.lastWorkoutDate : lastWorkoutDate // ignore: cast_nullable_to_non_nullable
as String?,engagementScore: null == engagementScore ? _self.engagementScore : engagementScore // ignore: cast_nullable_to_non_nullable
as String,activeProgramName: freezed == activeProgramName ? _self.activeProgramName : activeProgramName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
