// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_program_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActiveProgramItemDto {

 String get programId; String get programName; String get clientId; String get clientName; String? get clientAvatarUrl; String get assignedDate; int get currentWeek; int get totalWeeks; int get sessionsCompleted; int get totalSessions; double get completionRate; String? get nextSessionDate; String get status;
/// Create a copy of ActiveProgramItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveProgramItemDtoCopyWith<ActiveProgramItemDto> get copyWith => _$ActiveProgramItemDtoCopyWithImpl<ActiveProgramItemDto>(this as ActiveProgramItemDto, _$identity);

  /// Serializes this ActiveProgramItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveProgramItemDto&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.programName, programName) || other.programName == programName)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientAvatarUrl, clientAvatarUrl) || other.clientAvatarUrl == clientAvatarUrl)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.currentWeek, currentWeek) || other.currentWeek == currentWeek)&&(identical(other.totalWeeks, totalWeeks) || other.totalWeeks == totalWeeks)&&(identical(other.sessionsCompleted, sessionsCompleted) || other.sessionsCompleted == sessionsCompleted)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&(identical(other.nextSessionDate, nextSessionDate) || other.nextSessionDate == nextSessionDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,programId,programName,clientId,clientName,clientAvatarUrl,assignedDate,currentWeek,totalWeeks,sessionsCompleted,totalSessions,completionRate,nextSessionDate,status);

@override
String toString() {
  return 'ActiveProgramItemDto(programId: $programId, programName: $programName, clientId: $clientId, clientName: $clientName, clientAvatarUrl: $clientAvatarUrl, assignedDate: $assignedDate, currentWeek: $currentWeek, totalWeeks: $totalWeeks, sessionsCompleted: $sessionsCompleted, totalSessions: $totalSessions, completionRate: $completionRate, nextSessionDate: $nextSessionDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $ActiveProgramItemDtoCopyWith<$Res>  {
  factory $ActiveProgramItemDtoCopyWith(ActiveProgramItemDto value, $Res Function(ActiveProgramItemDto) _then) = _$ActiveProgramItemDtoCopyWithImpl;
@useResult
$Res call({
 String programId, String programName, String clientId, String clientName, String? clientAvatarUrl, String assignedDate, int currentWeek, int totalWeeks, int sessionsCompleted, int totalSessions, double completionRate, String? nextSessionDate, String status
});




}
/// @nodoc
class _$ActiveProgramItemDtoCopyWithImpl<$Res>
    implements $ActiveProgramItemDtoCopyWith<$Res> {
  _$ActiveProgramItemDtoCopyWithImpl(this._self, this._then);

  final ActiveProgramItemDto _self;
  final $Res Function(ActiveProgramItemDto) _then;

/// Create a copy of ActiveProgramItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? programId = null,Object? programName = null,Object? clientId = null,Object? clientName = null,Object? clientAvatarUrl = freezed,Object? assignedDate = null,Object? currentWeek = null,Object? totalWeeks = null,Object? sessionsCompleted = null,Object? totalSessions = null,Object? completionRate = null,Object? nextSessionDate = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,programName: null == programName ? _self.programName : programName // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientAvatarUrl: freezed == clientAvatarUrl ? _self.clientAvatarUrl : clientAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as String,currentWeek: null == currentWeek ? _self.currentWeek : currentWeek // ignore: cast_nullable_to_non_nullable
as int,totalWeeks: null == totalWeeks ? _self.totalWeeks : totalWeeks // ignore: cast_nullable_to_non_nullable
as int,sessionsCompleted: null == sessionsCompleted ? _self.sessionsCompleted : sessionsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,nextSessionDate: freezed == nextSessionDate ? _self.nextSessionDate : nextSessionDate // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveProgramItemDto].
extension ActiveProgramItemDtoPatterns on ActiveProgramItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveProgramItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveProgramItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveProgramItemDto value)  $default,){
final _that = this;
switch (_that) {
case _ActiveProgramItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveProgramItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveProgramItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String programId,  String programName,  String clientId,  String clientName,  String? clientAvatarUrl,  String assignedDate,  int currentWeek,  int totalWeeks,  int sessionsCompleted,  int totalSessions,  double completionRate,  String? nextSessionDate,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveProgramItemDto() when $default != null:
return $default(_that.programId,_that.programName,_that.clientId,_that.clientName,_that.clientAvatarUrl,_that.assignedDate,_that.currentWeek,_that.totalWeeks,_that.sessionsCompleted,_that.totalSessions,_that.completionRate,_that.nextSessionDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String programId,  String programName,  String clientId,  String clientName,  String? clientAvatarUrl,  String assignedDate,  int currentWeek,  int totalWeeks,  int sessionsCompleted,  int totalSessions,  double completionRate,  String? nextSessionDate,  String status)  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramItemDto():
return $default(_that.programId,_that.programName,_that.clientId,_that.clientName,_that.clientAvatarUrl,_that.assignedDate,_that.currentWeek,_that.totalWeeks,_that.sessionsCompleted,_that.totalSessions,_that.completionRate,_that.nextSessionDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String programId,  String programName,  String clientId,  String clientName,  String? clientAvatarUrl,  String assignedDate,  int currentWeek,  int totalWeeks,  int sessionsCompleted,  int totalSessions,  double completionRate,  String? nextSessionDate,  String status)?  $default,) {final _that = this;
switch (_that) {
case _ActiveProgramItemDto() when $default != null:
return $default(_that.programId,_that.programName,_that.clientId,_that.clientName,_that.clientAvatarUrl,_that.assignedDate,_that.currentWeek,_that.totalWeeks,_that.sessionsCompleted,_that.totalSessions,_that.completionRate,_that.nextSessionDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActiveProgramItemDto implements ActiveProgramItemDto {
  const _ActiveProgramItemDto({required this.programId, required this.programName, required this.clientId, required this.clientName, this.clientAvatarUrl, required this.assignedDate, required this.currentWeek, required this.totalWeeks, required this.sessionsCompleted, required this.totalSessions, required this.completionRate, this.nextSessionDate, required this.status});
  factory _ActiveProgramItemDto.fromJson(Map<String, dynamic> json) => _$ActiveProgramItemDtoFromJson(json);

@override final  String programId;
@override final  String programName;
@override final  String clientId;
@override final  String clientName;
@override final  String? clientAvatarUrl;
@override final  String assignedDate;
@override final  int currentWeek;
@override final  int totalWeeks;
@override final  int sessionsCompleted;
@override final  int totalSessions;
@override final  double completionRate;
@override final  String? nextSessionDate;
@override final  String status;

/// Create a copy of ActiveProgramItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveProgramItemDtoCopyWith<_ActiveProgramItemDto> get copyWith => __$ActiveProgramItemDtoCopyWithImpl<_ActiveProgramItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActiveProgramItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveProgramItemDto&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.programName, programName) || other.programName == programName)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientAvatarUrl, clientAvatarUrl) || other.clientAvatarUrl == clientAvatarUrl)&&(identical(other.assignedDate, assignedDate) || other.assignedDate == assignedDate)&&(identical(other.currentWeek, currentWeek) || other.currentWeek == currentWeek)&&(identical(other.totalWeeks, totalWeeks) || other.totalWeeks == totalWeeks)&&(identical(other.sessionsCompleted, sessionsCompleted) || other.sessionsCompleted == sessionsCompleted)&&(identical(other.totalSessions, totalSessions) || other.totalSessions == totalSessions)&&(identical(other.completionRate, completionRate) || other.completionRate == completionRate)&&(identical(other.nextSessionDate, nextSessionDate) || other.nextSessionDate == nextSessionDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,programId,programName,clientId,clientName,clientAvatarUrl,assignedDate,currentWeek,totalWeeks,sessionsCompleted,totalSessions,completionRate,nextSessionDate,status);

@override
String toString() {
  return 'ActiveProgramItemDto(programId: $programId, programName: $programName, clientId: $clientId, clientName: $clientName, clientAvatarUrl: $clientAvatarUrl, assignedDate: $assignedDate, currentWeek: $currentWeek, totalWeeks: $totalWeeks, sessionsCompleted: $sessionsCompleted, totalSessions: $totalSessions, completionRate: $completionRate, nextSessionDate: $nextSessionDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ActiveProgramItemDtoCopyWith<$Res> implements $ActiveProgramItemDtoCopyWith<$Res> {
  factory _$ActiveProgramItemDtoCopyWith(_ActiveProgramItemDto value, $Res Function(_ActiveProgramItemDto) _then) = __$ActiveProgramItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String programId, String programName, String clientId, String clientName, String? clientAvatarUrl, String assignedDate, int currentWeek, int totalWeeks, int sessionsCompleted, int totalSessions, double completionRate, String? nextSessionDate, String status
});




}
/// @nodoc
class __$ActiveProgramItemDtoCopyWithImpl<$Res>
    implements _$ActiveProgramItemDtoCopyWith<$Res> {
  __$ActiveProgramItemDtoCopyWithImpl(this._self, this._then);

  final _ActiveProgramItemDto _self;
  final $Res Function(_ActiveProgramItemDto) _then;

/// Create a copy of ActiveProgramItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? programId = null,Object? programName = null,Object? clientId = null,Object? clientName = null,Object? clientAvatarUrl = freezed,Object? assignedDate = null,Object? currentWeek = null,Object? totalWeeks = null,Object? sessionsCompleted = null,Object? totalSessions = null,Object? completionRate = null,Object? nextSessionDate = freezed,Object? status = null,}) {
  return _then(_ActiveProgramItemDto(
programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,programName: null == programName ? _self.programName : programName // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientAvatarUrl: freezed == clientAvatarUrl ? _self.clientAvatarUrl : clientAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,assignedDate: null == assignedDate ? _self.assignedDate : assignedDate // ignore: cast_nullable_to_non_nullable
as String,currentWeek: null == currentWeek ? _self.currentWeek : currentWeek // ignore: cast_nullable_to_non_nullable
as int,totalWeeks: null == totalWeeks ? _self.totalWeeks : totalWeeks // ignore: cast_nullable_to_non_nullable
as int,sessionsCompleted: null == sessionsCompleted ? _self.sessionsCompleted : sessionsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalSessions: null == totalSessions ? _self.totalSessions : totalSessions // ignore: cast_nullable_to_non_nullable
as int,completionRate: null == completionRate ? _self.completionRate : completionRate // ignore: cast_nullable_to_non_nullable
as double,nextSessionDate: freezed == nextSessionDate ? _self.nextSessionDate : nextSessionDate // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
