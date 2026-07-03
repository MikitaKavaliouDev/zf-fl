// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_session_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateSessionRequestDto {

 String get startTime; String get endTime; String? get notes; String? get templateId;
/// Create a copy of UpdateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateSessionRequestDtoCopyWith<UpdateSessionRequestDto> get copyWith => _$UpdateSessionRequestDtoCopyWithImpl<UpdateSessionRequestDto>(this as UpdateSessionRequestDto, _$identity);

  /// Serializes this UpdateSessionRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateSessionRequestDto&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.templateId, templateId) || other.templateId == templateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,notes,templateId);

@override
String toString() {
  return 'UpdateSessionRequestDto(startTime: $startTime, endTime: $endTime, notes: $notes, templateId: $templateId)';
}


}

/// @nodoc
abstract mixin class $UpdateSessionRequestDtoCopyWith<$Res>  {
  factory $UpdateSessionRequestDtoCopyWith(UpdateSessionRequestDto value, $Res Function(UpdateSessionRequestDto) _then) = _$UpdateSessionRequestDtoCopyWithImpl;
@useResult
$Res call({
 String startTime, String endTime, String? notes, String? templateId
});




}
/// @nodoc
class _$UpdateSessionRequestDtoCopyWithImpl<$Res>
    implements $UpdateSessionRequestDtoCopyWith<$Res> {
  _$UpdateSessionRequestDtoCopyWithImpl(this._self, this._then);

  final UpdateSessionRequestDto _self;
  final $Res Function(UpdateSessionRequestDto) _then;

/// Create a copy of UpdateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startTime = null,Object? endTime = null,Object? notes = freezed,Object? templateId = freezed,}) {
  return _then(_self.copyWith(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateSessionRequestDto].
extension UpdateSessionRequestDtoPatterns on UpdateSessionRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateSessionRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateSessionRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateSessionRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _UpdateSessionRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateSessionRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateSessionRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String startTime,  String endTime,  String? notes,  String? templateId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateSessionRequestDto() when $default != null:
return $default(_that.startTime,_that.endTime,_that.notes,_that.templateId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String startTime,  String endTime,  String? notes,  String? templateId)  $default,) {final _that = this;
switch (_that) {
case _UpdateSessionRequestDto():
return $default(_that.startTime,_that.endTime,_that.notes,_that.templateId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String startTime,  String endTime,  String? notes,  String? templateId)?  $default,) {final _that = this;
switch (_that) {
case _UpdateSessionRequestDto() when $default != null:
return $default(_that.startTime,_that.endTime,_that.notes,_that.templateId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateSessionRequestDto implements UpdateSessionRequestDto {
  const _UpdateSessionRequestDto({required this.startTime, required this.endTime, this.notes, this.templateId});
  factory _UpdateSessionRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateSessionRequestDtoFromJson(json);

@override final  String startTime;
@override final  String endTime;
@override final  String? notes;
@override final  String? templateId;

/// Create a copy of UpdateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSessionRequestDtoCopyWith<_UpdateSessionRequestDto> get copyWith => __$UpdateSessionRequestDtoCopyWithImpl<_UpdateSessionRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateSessionRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSessionRequestDto&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.templateId, templateId) || other.templateId == templateId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,startTime,endTime,notes,templateId);

@override
String toString() {
  return 'UpdateSessionRequestDto(startTime: $startTime, endTime: $endTime, notes: $notes, templateId: $templateId)';
}


}

/// @nodoc
abstract mixin class _$UpdateSessionRequestDtoCopyWith<$Res> implements $UpdateSessionRequestDtoCopyWith<$Res> {
  factory _$UpdateSessionRequestDtoCopyWith(_UpdateSessionRequestDto value, $Res Function(_UpdateSessionRequestDto) _then) = __$UpdateSessionRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String startTime, String endTime, String? notes, String? templateId
});




}
/// @nodoc
class __$UpdateSessionRequestDtoCopyWithImpl<$Res>
    implements _$UpdateSessionRequestDtoCopyWith<$Res> {
  __$UpdateSessionRequestDtoCopyWithImpl(this._self, this._then);

  final _UpdateSessionRequestDto _self;
  final $Res Function(_UpdateSessionRequestDto) _then;

/// Create a copy of UpdateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startTime = null,Object? endTime = null,Object? notes = freezed,Object? templateId = freezed,}) {
  return _then(_UpdateSessionRequestDto(
startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
