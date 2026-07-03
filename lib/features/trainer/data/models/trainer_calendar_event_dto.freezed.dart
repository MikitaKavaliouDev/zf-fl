// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trainer_calendar_event_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainerCalendarEventDto {

 String get id; String get title; String get start; String get end; String get type; String? get clientId; String get clientName; String? get clientAvatarUrl; String? get notes; String? get templateId; String? get templateName;
/// Create a copy of TrainerCalendarEventDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainerCalendarEventDtoCopyWith<TrainerCalendarEventDto> get copyWith => _$TrainerCalendarEventDtoCopyWithImpl<TrainerCalendarEventDto>(this as TrainerCalendarEventDto, _$identity);

  /// Serializes this TrainerCalendarEventDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainerCalendarEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.type, type) || other.type == type)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientAvatarUrl, clientAvatarUrl) || other.clientAvatarUrl == clientAvatarUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.templateName, templateName) || other.templateName == templateName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,start,end,type,clientId,clientName,clientAvatarUrl,notes,templateId,templateName);

@override
String toString() {
  return 'TrainerCalendarEventDto(id: $id, title: $title, start: $start, end: $end, type: $type, clientId: $clientId, clientName: $clientName, clientAvatarUrl: $clientAvatarUrl, notes: $notes, templateId: $templateId, templateName: $templateName)';
}


}

/// @nodoc
abstract mixin class $TrainerCalendarEventDtoCopyWith<$Res>  {
  factory $TrainerCalendarEventDtoCopyWith(TrainerCalendarEventDto value, $Res Function(TrainerCalendarEventDto) _then) = _$TrainerCalendarEventDtoCopyWithImpl;
@useResult
$Res call({
 String id, String title, String start, String end, String type, String? clientId, String clientName, String? clientAvatarUrl, String? notes, String? templateId, String? templateName
});




}
/// @nodoc
class _$TrainerCalendarEventDtoCopyWithImpl<$Res>
    implements $TrainerCalendarEventDtoCopyWith<$Res> {
  _$TrainerCalendarEventDtoCopyWithImpl(this._self, this._then);

  final TrainerCalendarEventDto _self;
  final $Res Function(TrainerCalendarEventDto) _then;

/// Create a copy of TrainerCalendarEventDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? start = null,Object? end = null,Object? type = null,Object? clientId = freezed,Object? clientName = null,Object? clientAvatarUrl = freezed,Object? notes = freezed,Object? templateId = freezed,Object? templateName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientAvatarUrl: freezed == clientAvatarUrl ? _self.clientAvatarUrl : clientAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainerCalendarEventDto].
extension TrainerCalendarEventDtoPatterns on TrainerCalendarEventDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainerCalendarEventDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainerCalendarEventDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainerCalendarEventDto value)  $default,){
final _that = this;
switch (_that) {
case _TrainerCalendarEventDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainerCalendarEventDto value)?  $default,){
final _that = this;
switch (_that) {
case _TrainerCalendarEventDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String start,  String end,  String type,  String? clientId,  String clientName,  String? clientAvatarUrl,  String? notes,  String? templateId,  String? templateName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainerCalendarEventDto() when $default != null:
return $default(_that.id,_that.title,_that.start,_that.end,_that.type,_that.clientId,_that.clientName,_that.clientAvatarUrl,_that.notes,_that.templateId,_that.templateName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String start,  String end,  String type,  String? clientId,  String clientName,  String? clientAvatarUrl,  String? notes,  String? templateId,  String? templateName)  $default,) {final _that = this;
switch (_that) {
case _TrainerCalendarEventDto():
return $default(_that.id,_that.title,_that.start,_that.end,_that.type,_that.clientId,_that.clientName,_that.clientAvatarUrl,_that.notes,_that.templateId,_that.templateName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String start,  String end,  String type,  String? clientId,  String clientName,  String? clientAvatarUrl,  String? notes,  String? templateId,  String? templateName)?  $default,) {final _that = this;
switch (_that) {
case _TrainerCalendarEventDto() when $default != null:
return $default(_that.id,_that.title,_that.start,_that.end,_that.type,_that.clientId,_that.clientName,_that.clientAvatarUrl,_that.notes,_that.templateId,_that.templateName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainerCalendarEventDto implements TrainerCalendarEventDto {
  const _TrainerCalendarEventDto({required this.id, required this.title, required this.start, required this.end, required this.type, this.clientId, required this.clientName, this.clientAvatarUrl, this.notes, this.templateId, this.templateName});
  factory _TrainerCalendarEventDto.fromJson(Map<String, dynamic> json) => _$TrainerCalendarEventDtoFromJson(json);

@override final  String id;
@override final  String title;
@override final  String start;
@override final  String end;
@override final  String type;
@override final  String? clientId;
@override final  String clientName;
@override final  String? clientAvatarUrl;
@override final  String? notes;
@override final  String? templateId;
@override final  String? templateName;

/// Create a copy of TrainerCalendarEventDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainerCalendarEventDtoCopyWith<_TrainerCalendarEventDto> get copyWith => __$TrainerCalendarEventDtoCopyWithImpl<_TrainerCalendarEventDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainerCalendarEventDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainerCalendarEventDto&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.type, type) || other.type == type)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.clientName, clientName) || other.clientName == clientName)&&(identical(other.clientAvatarUrl, clientAvatarUrl) || other.clientAvatarUrl == clientAvatarUrl)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.templateId, templateId) || other.templateId == templateId)&&(identical(other.templateName, templateName) || other.templateName == templateName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,start,end,type,clientId,clientName,clientAvatarUrl,notes,templateId,templateName);

@override
String toString() {
  return 'TrainerCalendarEventDto(id: $id, title: $title, start: $start, end: $end, type: $type, clientId: $clientId, clientName: $clientName, clientAvatarUrl: $clientAvatarUrl, notes: $notes, templateId: $templateId, templateName: $templateName)';
}


}

/// @nodoc
abstract mixin class _$TrainerCalendarEventDtoCopyWith<$Res> implements $TrainerCalendarEventDtoCopyWith<$Res> {
  factory _$TrainerCalendarEventDtoCopyWith(_TrainerCalendarEventDto value, $Res Function(_TrainerCalendarEventDto) _then) = __$TrainerCalendarEventDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String start, String end, String type, String? clientId, String clientName, String? clientAvatarUrl, String? notes, String? templateId, String? templateName
});




}
/// @nodoc
class __$TrainerCalendarEventDtoCopyWithImpl<$Res>
    implements _$TrainerCalendarEventDtoCopyWith<$Res> {
  __$TrainerCalendarEventDtoCopyWithImpl(this._self, this._then);

  final _TrainerCalendarEventDto _self;
  final $Res Function(_TrainerCalendarEventDto) _then;

/// Create a copy of TrainerCalendarEventDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? start = null,Object? end = null,Object? type = null,Object? clientId = freezed,Object? clientName = null,Object? clientAvatarUrl = freezed,Object? notes = freezed,Object? templateId = freezed,Object? templateName = freezed,}) {
  return _then(_TrainerCalendarEventDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as String,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,clientId: freezed == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String?,clientName: null == clientName ? _self.clientName : clientName // ignore: cast_nullable_to_non_nullable
as String,clientAvatarUrl: freezed == clientAvatarUrl ? _self.clientAvatarUrl : clientAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,templateId: freezed == templateId ? _self.templateId : templateId // ignore: cast_nullable_to_non_nullable
as String?,templateName: freezed == templateName ? _self.templateName : templateName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
