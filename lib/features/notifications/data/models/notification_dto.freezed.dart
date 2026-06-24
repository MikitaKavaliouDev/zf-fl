// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDto {

 String get id; String get userId; String? get senderId; String get message; String get type;@JsonKey(name: 'readStatus') bool get readStatus;@JsonKey(name: 'createdAt') int get createdAt;@JsonKey(name: 'updatedAt') int get updatedAt; String? get targetRole; String? get metadata;@JsonKey(name: 'syncStatus') String get syncStatus;
/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDtoCopyWith<NotificationDto> get copyWith => _$NotificationDtoCopyWithImpl<NotificationDto>(this as NotificationDto, _$identity);

  /// Serializes this NotificationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type)&&(identical(other.readStatus, readStatus) || other.readStatus == readStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,senderId,message,type,readStatus,createdAt,updatedAt,targetRole,metadata,syncStatus);

@override
String toString() {
  return 'NotificationDto(id: $id, userId: $userId, senderId: $senderId, message: $message, type: $type, readStatus: $readStatus, createdAt: $createdAt, updatedAt: $updatedAt, targetRole: $targetRole, metadata: $metadata, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class $NotificationDtoCopyWith<$Res>  {
  factory $NotificationDtoCopyWith(NotificationDto value, $Res Function(NotificationDto) _then) = _$NotificationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String? senderId, String message, String type,@JsonKey(name: 'readStatus') bool readStatus,@JsonKey(name: 'createdAt') int createdAt,@JsonKey(name: 'updatedAt') int updatedAt, String? targetRole, String? metadata,@JsonKey(name: 'syncStatus') String syncStatus
});




}
/// @nodoc
class _$NotificationDtoCopyWithImpl<$Res>
    implements $NotificationDtoCopyWith<$Res> {
  _$NotificationDtoCopyWithImpl(this._self, this._then);

  final NotificationDto _self;
  final $Res Function(NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? senderId = freezed,Object? message = null,Object? type = null,Object? readStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? targetRole = freezed,Object? metadata = freezed,Object? syncStatus = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,readStatus: null == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,targetRole: freezed == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDto].
extension NotificationDtoPatterns on NotificationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDto value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDto value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String? senderId,  String message,  String type, @JsonKey(name: 'readStatus')  bool readStatus, @JsonKey(name: 'createdAt')  int createdAt, @JsonKey(name: 'updatedAt')  int updatedAt,  String? targetRole,  String? metadata, @JsonKey(name: 'syncStatus')  String syncStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.id,_that.userId,_that.senderId,_that.message,_that.type,_that.readStatus,_that.createdAt,_that.updatedAt,_that.targetRole,_that.metadata,_that.syncStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String? senderId,  String message,  String type, @JsonKey(name: 'readStatus')  bool readStatus, @JsonKey(name: 'createdAt')  int createdAt, @JsonKey(name: 'updatedAt')  int updatedAt,  String? targetRole,  String? metadata, @JsonKey(name: 'syncStatus')  String syncStatus)  $default,) {final _that = this;
switch (_that) {
case _NotificationDto():
return $default(_that.id,_that.userId,_that.senderId,_that.message,_that.type,_that.readStatus,_that.createdAt,_that.updatedAt,_that.targetRole,_that.metadata,_that.syncStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String? senderId,  String message,  String type, @JsonKey(name: 'readStatus')  bool readStatus, @JsonKey(name: 'createdAt')  int createdAt, @JsonKey(name: 'updatedAt')  int updatedAt,  String? targetRole,  String? metadata, @JsonKey(name: 'syncStatus')  String syncStatus)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDto() when $default != null:
return $default(_that.id,_that.userId,_that.senderId,_that.message,_that.type,_that.readStatus,_that.createdAt,_that.updatedAt,_that.targetRole,_that.metadata,_that.syncStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDto extends NotificationDto {
  const _NotificationDto({required this.id, required this.userId, this.senderId, required this.message, required this.type, @JsonKey(name: 'readStatus') required this.readStatus, @JsonKey(name: 'createdAt') required this.createdAt, @JsonKey(name: 'updatedAt') this.updatedAt = 0, this.targetRole, this.metadata, @JsonKey(name: 'syncStatus') this.syncStatus = 'synced'}): super._();
  factory _NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String? senderId;
@override final  String message;
@override final  String type;
@override@JsonKey(name: 'readStatus') final  bool readStatus;
@override@JsonKey(name: 'createdAt') final  int createdAt;
@override@JsonKey(name: 'updatedAt') final  int updatedAt;
@override final  String? targetRole;
@override final  String? metadata;
@override@JsonKey(name: 'syncStatus') final  String syncStatus;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDtoCopyWith<_NotificationDto> get copyWith => __$NotificationDtoCopyWithImpl<_NotificationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.message, message) || other.message == message)&&(identical(other.type, type) || other.type == type)&&(identical(other.readStatus, readStatus) || other.readStatus == readStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,senderId,message,type,readStatus,createdAt,updatedAt,targetRole,metadata,syncStatus);

@override
String toString() {
  return 'NotificationDto(id: $id, userId: $userId, senderId: $senderId, message: $message, type: $type, readStatus: $readStatus, createdAt: $createdAt, updatedAt: $updatedAt, targetRole: $targetRole, metadata: $metadata, syncStatus: $syncStatus)';
}


}

/// @nodoc
abstract mixin class _$NotificationDtoCopyWith<$Res> implements $NotificationDtoCopyWith<$Res> {
  factory _$NotificationDtoCopyWith(_NotificationDto value, $Res Function(_NotificationDto) _then) = __$NotificationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String? senderId, String message, String type,@JsonKey(name: 'readStatus') bool readStatus,@JsonKey(name: 'createdAt') int createdAt,@JsonKey(name: 'updatedAt') int updatedAt, String? targetRole, String? metadata,@JsonKey(name: 'syncStatus') String syncStatus
});




}
/// @nodoc
class __$NotificationDtoCopyWithImpl<$Res>
    implements _$NotificationDtoCopyWith<$Res> {
  __$NotificationDtoCopyWithImpl(this._self, this._then);

  final _NotificationDto _self;
  final $Res Function(_NotificationDto) _then;

/// Create a copy of NotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? senderId = freezed,Object? message = null,Object? type = null,Object? readStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? targetRole = freezed,Object? metadata = freezed,Object? syncStatus = null,}) {
  return _then(_NotificationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,readStatus: null == readStatus ? _self.readStatus : readStatus // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,targetRole: freezed == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as String?,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
