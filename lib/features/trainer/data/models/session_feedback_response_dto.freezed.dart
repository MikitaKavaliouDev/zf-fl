// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_feedback_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionFeedbackResponseDto {

 String get id; String? get trainerNotes; String? get trainerNotesUpdatedAt;
/// Create a copy of SessionFeedbackResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionFeedbackResponseDtoCopyWith<SessionFeedbackResponseDto> get copyWith => _$SessionFeedbackResponseDtoCopyWithImpl<SessionFeedbackResponseDto>(this as SessionFeedbackResponseDto, _$identity);

  /// Serializes this SessionFeedbackResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionFeedbackResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.trainerNotes, trainerNotes) || other.trainerNotes == trainerNotes)&&(identical(other.trainerNotesUpdatedAt, trainerNotesUpdatedAt) || other.trainerNotesUpdatedAt == trainerNotesUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainerNotes,trainerNotesUpdatedAt);

@override
String toString() {
  return 'SessionFeedbackResponseDto(id: $id, trainerNotes: $trainerNotes, trainerNotesUpdatedAt: $trainerNotesUpdatedAt)';
}


}

/// @nodoc
abstract mixin class $SessionFeedbackResponseDtoCopyWith<$Res>  {
  factory $SessionFeedbackResponseDtoCopyWith(SessionFeedbackResponseDto value, $Res Function(SessionFeedbackResponseDto) _then) = _$SessionFeedbackResponseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? trainerNotes, String? trainerNotesUpdatedAt
});




}
/// @nodoc
class _$SessionFeedbackResponseDtoCopyWithImpl<$Res>
    implements $SessionFeedbackResponseDtoCopyWith<$Res> {
  _$SessionFeedbackResponseDtoCopyWithImpl(this._self, this._then);

  final SessionFeedbackResponseDto _self;
  final $Res Function(SessionFeedbackResponseDto) _then;

/// Create a copy of SessionFeedbackResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? trainerNotes = freezed,Object? trainerNotesUpdatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainerNotes: freezed == trainerNotes ? _self.trainerNotes : trainerNotes // ignore: cast_nullable_to_non_nullable
as String?,trainerNotesUpdatedAt: freezed == trainerNotesUpdatedAt ? _self.trainerNotesUpdatedAt : trainerNotesUpdatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionFeedbackResponseDto].
extension SessionFeedbackResponseDtoPatterns on SessionFeedbackResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionFeedbackResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionFeedbackResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionFeedbackResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _SessionFeedbackResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionFeedbackResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _SessionFeedbackResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? trainerNotes,  String? trainerNotesUpdatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionFeedbackResponseDto() when $default != null:
return $default(_that.id,_that.trainerNotes,_that.trainerNotesUpdatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? trainerNotes,  String? trainerNotesUpdatedAt)  $default,) {final _that = this;
switch (_that) {
case _SessionFeedbackResponseDto():
return $default(_that.id,_that.trainerNotes,_that.trainerNotesUpdatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? trainerNotes,  String? trainerNotesUpdatedAt)?  $default,) {final _that = this;
switch (_that) {
case _SessionFeedbackResponseDto() when $default != null:
return $default(_that.id,_that.trainerNotes,_that.trainerNotesUpdatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionFeedbackResponseDto implements SessionFeedbackResponseDto {
  const _SessionFeedbackResponseDto({required this.id, this.trainerNotes, this.trainerNotesUpdatedAt});
  factory _SessionFeedbackResponseDto.fromJson(Map<String, dynamic> json) => _$SessionFeedbackResponseDtoFromJson(json);

@override final  String id;
@override final  String? trainerNotes;
@override final  String? trainerNotesUpdatedAt;

/// Create a copy of SessionFeedbackResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionFeedbackResponseDtoCopyWith<_SessionFeedbackResponseDto> get copyWith => __$SessionFeedbackResponseDtoCopyWithImpl<_SessionFeedbackResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionFeedbackResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionFeedbackResponseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.trainerNotes, trainerNotes) || other.trainerNotes == trainerNotes)&&(identical(other.trainerNotesUpdatedAt, trainerNotesUpdatedAt) || other.trainerNotesUpdatedAt == trainerNotesUpdatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,trainerNotes,trainerNotesUpdatedAt);

@override
String toString() {
  return 'SessionFeedbackResponseDto(id: $id, trainerNotes: $trainerNotes, trainerNotesUpdatedAt: $trainerNotesUpdatedAt)';
}


}

/// @nodoc
abstract mixin class _$SessionFeedbackResponseDtoCopyWith<$Res> implements $SessionFeedbackResponseDtoCopyWith<$Res> {
  factory _$SessionFeedbackResponseDtoCopyWith(_SessionFeedbackResponseDto value, $Res Function(_SessionFeedbackResponseDto) _then) = __$SessionFeedbackResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? trainerNotes, String? trainerNotesUpdatedAt
});




}
/// @nodoc
class __$SessionFeedbackResponseDtoCopyWithImpl<$Res>
    implements _$SessionFeedbackResponseDtoCopyWith<$Res> {
  __$SessionFeedbackResponseDtoCopyWithImpl(this._self, this._then);

  final _SessionFeedbackResponseDto _self;
  final $Res Function(_SessionFeedbackResponseDto) _then;

/// Create a copy of SessionFeedbackResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? trainerNotes = freezed,Object? trainerNotesUpdatedAt = freezed,}) {
  return _then(_SessionFeedbackResponseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,trainerNotes: freezed == trainerNotes ? _self.trainerNotes : trainerNotes // ignore: cast_nullable_to_non_nullable
as String?,trainerNotesUpdatedAt: freezed == trainerNotesUpdatedAt ? _self.trainerNotesUpdatedAt : trainerNotesUpdatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
