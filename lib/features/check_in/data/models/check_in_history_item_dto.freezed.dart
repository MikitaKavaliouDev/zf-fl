// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_history_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckInHistoryItemDto {

 String get id; DateTime get date; String get status; bool get hasFeedback; int get photoCount; DateTime? get reviewedAt;
/// Create a copy of CheckInHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckInHistoryItemDtoCopyWith<CheckInHistoryItemDto> get copyWith => _$CheckInHistoryItemDtoCopyWithImpl<CheckInHistoryItemDto>(this as CheckInHistoryItemDto, _$identity);

  /// Serializes this CheckInHistoryItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckInHistoryItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasFeedback, hasFeedback) || other.hasFeedback == hasFeedback)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,hasFeedback,photoCount,reviewedAt);

@override
String toString() {
  return 'CheckInHistoryItemDto(id: $id, date: $date, status: $status, hasFeedback: $hasFeedback, photoCount: $photoCount, reviewedAt: $reviewedAt)';
}


}

/// @nodoc
abstract mixin class $CheckInHistoryItemDtoCopyWith<$Res>  {
  factory $CheckInHistoryItemDtoCopyWith(CheckInHistoryItemDto value, $Res Function(CheckInHistoryItemDto) _then) = _$CheckInHistoryItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, DateTime date, String status, bool hasFeedback, int photoCount, DateTime? reviewedAt
});




}
/// @nodoc
class _$CheckInHistoryItemDtoCopyWithImpl<$Res>
    implements $CheckInHistoryItemDtoCopyWith<$Res> {
  _$CheckInHistoryItemDtoCopyWithImpl(this._self, this._then);

  final CheckInHistoryItemDto _self;
  final $Res Function(CheckInHistoryItemDto) _then;

/// Create a copy of CheckInHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? status = null,Object? hasFeedback = null,Object? photoCount = null,Object? reviewedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hasFeedback: null == hasFeedback ? _self.hasFeedback : hasFeedback // ignore: cast_nullable_to_non_nullable
as bool,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckInHistoryItemDto].
extension CheckInHistoryItemDtoPatterns on CheckInHistoryItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckInHistoryItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckInHistoryItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckInHistoryItemDto value)  $default,){
final _that = this;
switch (_that) {
case _CheckInHistoryItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckInHistoryItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _CheckInHistoryItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime date,  String status,  bool hasFeedback,  int photoCount,  DateTime? reviewedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckInHistoryItemDto() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.hasFeedback,_that.photoCount,_that.reviewedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime date,  String status,  bool hasFeedback,  int photoCount,  DateTime? reviewedAt)  $default,) {final _that = this;
switch (_that) {
case _CheckInHistoryItemDto():
return $default(_that.id,_that.date,_that.status,_that.hasFeedback,_that.photoCount,_that.reviewedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime date,  String status,  bool hasFeedback,  int photoCount,  DateTime? reviewedAt)?  $default,) {final _that = this;
switch (_that) {
case _CheckInHistoryItemDto() when $default != null:
return $default(_that.id,_that.date,_that.status,_that.hasFeedback,_that.photoCount,_that.reviewedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckInHistoryItemDto implements CheckInHistoryItemDto {
  const _CheckInHistoryItemDto({required this.id, required this.date, required this.status, required this.hasFeedback, required this.photoCount, this.reviewedAt});
  factory _CheckInHistoryItemDto.fromJson(Map<String, dynamic> json) => _$CheckInHistoryItemDtoFromJson(json);

@override final  String id;
@override final  DateTime date;
@override final  String status;
@override final  bool hasFeedback;
@override final  int photoCount;
@override final  DateTime? reviewedAt;

/// Create a copy of CheckInHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckInHistoryItemDtoCopyWith<_CheckInHistoryItemDto> get copyWith => __$CheckInHistoryItemDtoCopyWithImpl<_CheckInHistoryItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckInHistoryItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckInHistoryItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.hasFeedback, hasFeedback) || other.hasFeedback == hasFeedback)&&(identical(other.photoCount, photoCount) || other.photoCount == photoCount)&&(identical(other.reviewedAt, reviewedAt) || other.reviewedAt == reviewedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,date,status,hasFeedback,photoCount,reviewedAt);

@override
String toString() {
  return 'CheckInHistoryItemDto(id: $id, date: $date, status: $status, hasFeedback: $hasFeedback, photoCount: $photoCount, reviewedAt: $reviewedAt)';
}


}

/// @nodoc
abstract mixin class _$CheckInHistoryItemDtoCopyWith<$Res> implements $CheckInHistoryItemDtoCopyWith<$Res> {
  factory _$CheckInHistoryItemDtoCopyWith(_CheckInHistoryItemDto value, $Res Function(_CheckInHistoryItemDto) _then) = __$CheckInHistoryItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime date, String status, bool hasFeedback, int photoCount, DateTime? reviewedAt
});




}
/// @nodoc
class __$CheckInHistoryItemDtoCopyWithImpl<$Res>
    implements _$CheckInHistoryItemDtoCopyWith<$Res> {
  __$CheckInHistoryItemDtoCopyWithImpl(this._self, this._then);

  final _CheckInHistoryItemDto _self;
  final $Res Function(_CheckInHistoryItemDto) _then;

/// Create a copy of CheckInHistoryItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? status = null,Object? hasFeedback = null,Object? photoCount = null,Object? reviewedAt = freezed,}) {
  return _then(_CheckInHistoryItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,hasFeedback: null == hasFeedback ? _self.hasFeedback : hasFeedback // ignore: cast_nullable_to_non_nullable
as bool,photoCount: null == photoCount ? _self.photoCount : photoCount // ignore: cast_nullable_to_non_nullable
as int,reviewedAt: freezed == reviewedAt ? _self.reviewedAt : reviewedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
