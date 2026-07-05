// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_client_package_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerClientPackageDto {

 String get id; String get clientId; String get packageId; int get sessionsRemaining; String get purchaseDate; ClientPackageInfo get package;
/// Create a copy of TrainerClientPackageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerClientPackageDtoCopyWith<TrainerClientPackageDto> get copyWith => _$TrainerClientPackageDtoCopyWithImpl<TrainerClientPackageDto>(this as TrainerClientPackageDto, _$identity);

  /// Serializes this TrainerClientPackageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerClientPackageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.sessionsRemaining, sessionsRemaining) || other.sessionsRemaining == sessionsRemaining)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.package, package) || other.package == package));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,packageId,sessionsRemaining,purchaseDate,package);

@override
String toString() {
  return 'TrainerClientPackageDto(id: $id, clientId: $clientId, packageId: $packageId, sessionsRemaining: $sessionsRemaining, purchaseDate: $purchaseDate, package: $package)';
}


}

/// @nodoc
abstract mixin class $TrainerClientPackageDtoCopyWith<$Res>  {
  factory $TrainerClientPackageDtoCopyWith(TrainerClientPackageDto value, $Res Function(TrainerClientPackageDto) _then) = _$TrainerClientPackageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String packageId, int sessionsRemaining, String purchaseDate, ClientPackageInfo package
});


$ClientPackageInfoCopyWith<$Res> get package;

}
/// @nodoc
class _$TrainerClientPackageDtoCopyWithImpl<$Res>
    implements $TrainerClientPackageDtoCopyWith<$Res> {
  _$TrainerClientPackageDtoCopyWithImpl(this._self, this._then);

  final TrainerClientPackageDto _self;
  final $Res Function(TrainerClientPackageDto) _then;

/// Create a copy of TrainerClientPackageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? packageId = null,Object? sessionsRemaining = null,Object? purchaseDate = null,Object? package = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,sessionsRemaining: null == sessionsRemaining ? _self.sessionsRemaining : sessionsRemaining // ignore: cast_nullable_to_non_nullable
as int,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as String,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as ClientPackageInfo,
  ));
}
/// Create a copy of TrainerClientPackageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientPackageInfoCopyWith<$Res> get package {
  
  return $ClientPackageInfoCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrainerClientPackageDto].
extension TrainerClientPackageDtoPatterns on TrainerClientPackageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerClientPackageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerClientPackageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerClientPackageDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerClientPackageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerClientPackageDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerClientPackageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String clientId,  String packageId,  int sessionsRemaining,  String purchaseDate,  ClientPackageInfo package)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerClientPackageDto() when $default != null:
return $default(_that.id,_that.clientId,_that.packageId,_that.sessionsRemaining,_that.purchaseDate,_that.package);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String clientId,  String packageId,  int sessionsRemaining,  String purchaseDate,  ClientPackageInfo package)  $default,) {final _that = this;
switch (_that) {
case _TrainerClientPackageDto():
return $default(_that.id,_that.clientId,_that.packageId,_that.sessionsRemaining,_that.purchaseDate,_that.package);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String clientId,  String packageId,  int sessionsRemaining,  String purchaseDate,  ClientPackageInfo package)?  $default,) {final _that = this;
switch (_that) {
case _TrainerClientPackageDto() when $default != null:
return $default(_that.id,_that.clientId,_that.packageId,_that.sessionsRemaining,_that.purchaseDate,_that.package);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerClientPackageDto implements TrainerClientPackageDto {
  const _TrainerClientPackageDto({required this.id, required this.clientId, required this.packageId, this.sessionsRemaining = 0, required this.purchaseDate, required this.package});
  factory _TrainerClientPackageDto.fromJson(Map<String, dynamic> json) => _$TrainerClientPackageDtoFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String packageId;
@override@JsonKey() final  int sessionsRemaining;
@override final  String purchaseDate;
@override final  ClientPackageInfo package;

/// Create a copy of TrainerClientPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerClientPackageDtoCopyWith<_TrainerClientPackageDto> get copyWith => __$TrainerClientPackageDtoCopyWithImpl<_TrainerClientPackageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerClientPackageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerClientPackageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.packageId, packageId) || other.packageId == packageId)&&(identical(other.sessionsRemaining, sessionsRemaining) || other.sessionsRemaining == sessionsRemaining)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.package, package) || other.package == package));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,packageId,sessionsRemaining,purchaseDate,package);

@override
String toString() {
  return 'TrainerClientPackageDto(id: $id, clientId: $clientId, packageId: $packageId, sessionsRemaining: $sessionsRemaining, purchaseDate: $purchaseDate, package: $package)';
}


}

/// @nodoc
abstract mixin class _$TrainerClientPackageDtoCopyWith<$Res> implements $TrainerClientPackageDtoCopyWith<$Res> {
  factory _$TrainerClientPackageDtoCopyWith(_TrainerClientPackageDto value, $Res Function(_TrainerClientPackageDto) _then) = __$TrainerClientPackageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String packageId, int sessionsRemaining, String purchaseDate, ClientPackageInfo package
});


@override $ClientPackageInfoCopyWith<$Res> get package;

}
/// @nodoc
class __$TrainerClientPackageDtoCopyWithImpl<$Res>
    implements _$TrainerClientPackageDtoCopyWith<$Res> {
  __$TrainerClientPackageDtoCopyWithImpl(this._self, this._then);

  final _TrainerClientPackageDto _self;
  final $Res Function(_TrainerClientPackageDto) _then;

/// Create a copy of TrainerClientPackageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? packageId = null,Object? sessionsRemaining = null,Object? purchaseDate = null,Object? package = null,}) {
  return _then(_TrainerClientPackageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,packageId: null == packageId ? _self.packageId : packageId // ignore: cast_nullable_to_non_nullable
as String,sessionsRemaining: null == sessionsRemaining ? _self.sessionsRemaining : sessionsRemaining // ignore: cast_nullable_to_non_nullable
as int,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as String,package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as ClientPackageInfo,
  ));
}

/// Create a copy of TrainerClientPackageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ClientPackageInfoCopyWith<$Res> get package {
  
  return $ClientPackageInfoCopyWith<$Res>(_self.package, (value) {
    return _then(_self.copyWith(package: value));
  });
}
}


/// @nodoc
mixin _$ClientPackageInfo {

 String get name; int get numberOfSessions;
/// Create a copy of ClientPackageInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientPackageInfoCopyWith<ClientPackageInfo> get copyWith => _$ClientPackageInfoCopyWithImpl<ClientPackageInfo>(this as ClientPackageInfo, _$identity);

  /// Serializes this ClientPackageInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientPackageInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.numberOfSessions, numberOfSessions) || other.numberOfSessions == numberOfSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,numberOfSessions);

@override
String toString() {
  return 'ClientPackageInfo(name: $name, numberOfSessions: $numberOfSessions)';
}


}

/// @nodoc
abstract mixin class $ClientPackageInfoCopyWith<$Res>  {
  factory $ClientPackageInfoCopyWith(ClientPackageInfo value, $Res Function(ClientPackageInfo) _then) = _$ClientPackageInfoCopyWithImpl;
@useResult
$Res call({
 String name, int numberOfSessions
});




}
/// @nodoc
class _$ClientPackageInfoCopyWithImpl<$Res>
    implements $ClientPackageInfoCopyWith<$Res> {
  _$ClientPackageInfoCopyWithImpl(this._self, this._then);

  final ClientPackageInfo _self;
  final $Res Function(ClientPackageInfo) _then;

/// Create a copy of ClientPackageInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? numberOfSessions = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,numberOfSessions: null == numberOfSessions ? _self.numberOfSessions : numberOfSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ClientPackageInfo].
extension ClientPackageInfoPatterns on ClientPackageInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClientPackageInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClientPackageInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClientPackageInfo value)  $default,){
final _that = this;
switch (_that) {
case _ClientPackageInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClientPackageInfo value)?  $default,){
final _that = this;
switch (_that) {
case _ClientPackageInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  int numberOfSessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClientPackageInfo() when $default != null:
return $default(_that.name,_that.numberOfSessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  int numberOfSessions)  $default,) {final _that = this;
switch (_that) {
case _ClientPackageInfo():
return $default(_that.name,_that.numberOfSessions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  int numberOfSessions)?  $default,) {final _that = this;
switch (_that) {
case _ClientPackageInfo() when $default != null:
return $default(_that.name,_that.numberOfSessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClientPackageInfo implements ClientPackageInfo {
  const _ClientPackageInfo({required this.name, this.numberOfSessions = 0});
  factory _ClientPackageInfo.fromJson(Map<String, dynamic> json) => _$ClientPackageInfoFromJson(json);

@override final  String name;
@override@JsonKey() final  int numberOfSessions;

/// Create a copy of ClientPackageInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientPackageInfoCopyWith<_ClientPackageInfo> get copyWith => __$ClientPackageInfoCopyWithImpl<_ClientPackageInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientPackageInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientPackageInfo&&(identical(other.name, name) || other.name == name)&&(identical(other.numberOfSessions, numberOfSessions) || other.numberOfSessions == numberOfSessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,numberOfSessions);

@override
String toString() {
  return 'ClientPackageInfo(name: $name, numberOfSessions: $numberOfSessions)';
}


}

/// @nodoc
abstract mixin class _$ClientPackageInfoCopyWith<$Res> implements $ClientPackageInfoCopyWith<$Res> {
  factory _$ClientPackageInfoCopyWith(_ClientPackageInfo value, $Res Function(_ClientPackageInfo) _then) = __$ClientPackageInfoCopyWithImpl;
@override @useResult
$Res call({
 String name, int numberOfSessions
});




}
/// @nodoc
class __$ClientPackageInfoCopyWithImpl<$Res>
    implements _$ClientPackageInfoCopyWith<$Res> {
  __$ClientPackageInfoCopyWithImpl(this._self, this._then);

  final _ClientPackageInfo _self;
  final $Res Function(_ClientPackageInfo) _then;

/// Create a copy of ClientPackageInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? numberOfSessions = null,}) {
  return _then(_ClientPackageInfo(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,numberOfSessions: null == numberOfSessions ? _self.numberOfSessions : numberOfSessions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
