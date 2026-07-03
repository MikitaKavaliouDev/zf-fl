// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_session_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateSessionRequestDto {

 String get clientId; String get startTime; String get endTime; String? get notes; String? get templateId; bool get repeats; int? get repeatWeeks; List<int>? get repeatDays; int? get clientStartDay;
/// Create a copy of CreateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateSessionRequestDtoCopyWith<CreateSessionRequestDto> get copyWith => _$CreateSessionRequestDtoCopyWithImpl<CreateSessionRequestDto>(this as CreateSessionRequestDto, _$identity);

  /// Serializes this CreateSessionRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateSessionRequestDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.repeats, repeats) || other.repeats == repeats)&&(identical(other.repeatWeeks, repeatWeeks) || other.repeatWeeks == repeatWeeks)&&const DeepCollectionEquality().equals(other.repeatDays, repeatDays)&&(identical(other.clientStartDay, clientStartDay) || other.clientStartDay == clientStartDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,startTime,endTime,notes,templateId,repeats,repeatWeeks,const DeepCollectionEquality().hash(repeatDays),clientStartDay);

@override
String toString() {
  return 'CreateSessionRequestDto(clientId: $clientId, startTime: $startTime, endTime: $endTime, notes: $notes, templateId: $templateId, repeats: $repeats, repeatWeeks: $repeatWeeks, repeatDays: $repeatDays, clientStartDay: $clientStartDay)';
}


}

/// @nodoc
abstract mixin class $CreateSessionRequestDtoCopyWith<$Res>  {
  factory $CreateSessionRequestDtoCopyWith(CreateSessionRequestDto value, $Res Function(CreateSessionRequestDto) _then) = _$CreateSessionRequestDtoCopyWithImpl;
@useResult
$Res call({
 String clientId, String startTime, String endTime, String? notes, String? templateId, bool repeats, int? repeatWeeks, List<int>? repeatDays, int? clientStartDay
});




}
/// @nodoc
class _$CreateSessionRequestDtoCopyWithImpl<$Res>
    implements $CreateSessionRequestDtoCopyWith<$Res> {
  _$CreateSessionRequestDtoCopyWithImpl(this._self, this._then);

  final CreateSessionRequestDto _self;
  final $Res Function(CreateSessionRequestDto) _then;

/// Create a copy of CreateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,Object? startTime = null,Object? endTime = null,Object? notes = freezed,Object? templateId = freezed,Object? repeats = null,Object? repeatWeeks = freezed,Object? repeatDays = freezed,Object? clientStartDay = freezed,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,repeats: null == repeats ? _self.repeats : repeats // ignore: cast_nullable_to_non_nullable
as bool,repeatWeeks: freezed == repeatWeeks ? _self.repeatWeeks : repeatWeeks // ignore: cast_nullable_to_non_nullable
as int?,repeatDays: freezed == repeatDays ? _self.repeatDays : repeatDays // ignore: cast_nullable_to_non_nullable
as List<int>?,clientStartDay: freezed == clientStartDay ? _self.clientStartDay : clientStartDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateSessionRequestDto].
extension CreateSessionRequestDtoPatterns on CreateSessionRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateSessionRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateSessionRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateSessionRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CreateSessionRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateSessionRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CreateSessionRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientId,  String startTime,  String endTime,  String? notes,  String? templateId,  bool repeats,  int? repeatWeeks,  List<int>? repeatDays,  int? clientStartDay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateSessionRequestDto() when $default != null:
return $default(_that.clientId,_that.startTime,_that.endTime,_that.notes,_that.templateId,_that.repeats,_that.repeatWeeks,_that.repeatDays,_that.clientStartDay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientId,  String startTime,  String endTime,  String? notes,  String? templateId,  bool repeats,  int? repeatWeeks,  List<int>? repeatDays,  int? clientStartDay)  $default,) {final _that = this;
switch (_that) {
case _CreateSessionRequestDto():
return $default(_that.clientId,_that.startTime,_that.endTime,_that.notes,_that.templateId,_that.repeats,_that.repeatWeeks,_that.repeatDays,_that.clientStartDay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientId,  String startTime,  String endTime,  String? notes,  String? templateId,  bool repeats,  int? repeatWeeks,  List<int>? repeatDays,  int? clientStartDay)?  $default,) {final _that = this;
switch (_that) {
case _CreateSessionRequestDto() when $default != null:
return $default(_that.clientId,_that.startTime,_that.endTime,_that.notes,_that.templateId,_that.repeats,_that.repeatWeeks,_that.repeatDays,_that.clientStartDay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateSessionRequestDto implements CreateSessionRequestDto {
  const _CreateSessionRequestDto({required this.clientId, required this.startTime, required this.endTime, this.notes, this.templateId, this.repeats = false, this.repeatWeeks, final  List<int>? repeatDays, this.clientStartDay}): _repeatDays = repeatDays;
  factory _CreateSessionRequestDto.fromJson(Map<String, dynamic> json) => _$CreateSessionRequestDtoFromJson(json);

@override final  String clientId;
@override final  String startTime;
@override final  String endTime;
@override final  String? notes;
@override final  String? templateId;
@override@JsonKey() final  bool repeats;
@override final  int? repeatWeeks;
 final  List<int>? _repeatDays;
@override List<int>? get repeatDays {
  final value = _repeatDays;
  if (value == null) return null;
  if (_repeatDays is EqualUnmodifiableListView) return _repeatDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? clientStartDay;

/// Create a copy of CreateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateSessionRequestDtoCopyWith<_CreateSessionRequestDto> get copyWith => __$CreateSessionRequestDtoCopyWithImpl<_CreateSessionRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateSessionRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateSessionRequestDto&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.repeats, repeats) || other.repeats == repeats)&&(identical(other.repeatWeeks, repeatWeeks) || other.repeatWeeks == repeatWeeks)&&const DeepCollectionEquality().equals(other._repeatDays, _repeatDays)&&(identical(other.clientStartDay, clientStartDay) || other.clientStartDay == clientStartDay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientId,startTime,endTime,notes,templateId,repeats,repeatWeeks,const DeepCollectionEquality().hash(_repeatDays),clientStartDay);

@override
String toString() {
  return 'CreateSessionRequestDto(clientId: $clientId, startTime: $startTime, endTime: $endTime, notes: $notes, templateId: $templateId, repeats: $repeats, repeatWeeks: $repeatWeeks, repeatDays: $repeatDays, clientStartDay: $clientStartDay)';
}


}

/// @nodoc
abstract mixin class _$CreateSessionRequestDtoCopyWith<$Res> implements $CreateSessionRequestDtoCopyWith<$Res> {
  factory _$CreateSessionRequestDtoCopyWith(_CreateSessionRequestDto value, $Res Function(_CreateSessionRequestDto) _then) = __$CreateSessionRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String clientId, String startTime, String endTime, String? notes, String? templateId, bool repeats, int? repeatWeeks, List<int>? repeatDays, int? clientStartDay
});




}
/// @nodoc
class __$CreateSessionRequestDtoCopyWithImpl<$Res>
    implements _$CreateSessionRequestDtoCopyWith<$Res> {
  __$CreateSessionRequestDtoCopyWithImpl(this._self, this._then);

  final _CreateSessionRequestDto _self;
  final $Res Function(_CreateSessionRequestDto) _then;

/// Create a copy of CreateSessionRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? startTime = null,Object? endTime = null,Object? notes = freezed,Object? templateId = freezed,Object? repeats = null,Object? repeatWeeks = freezed,Object? repeatDays = freezed,Object? clientStartDay = freezed,}) {
  return _then(_CreateSessionRequestDto(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,repeats: null == repeats ? _self.repeats : repeats // ignore: cast_nullable_to_non_nullable
as bool,repeatWeeks: freezed == repeatWeeks ? _self.repeatWeeks : repeatWeeks // ignore: cast_nullable_to_non_nullable
as int?,repeatDays: freezed == repeatDays ? _self._repeatDays : repeatDays // ignore: cast_nullable_to_non_nullable
as List<int>?,clientStartDay: freezed == clientStartDay ? _self.clientStartDay : clientStartDay // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
