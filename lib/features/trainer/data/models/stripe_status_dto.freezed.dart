// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stripe_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StripeStatusDto {

@JsonKey(name: 'charges_enabled') bool get chargesEnabled;@JsonKey(name: 'details_submitted') bool get detailsSubmitted;@JsonKey(name: 'accountId') String? get accountId;
/// Create a copy of StripeStatusDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StripeStatusDtoCopyWith<StripeStatusDto> get copyWith => _$StripeStatusDtoCopyWithImpl<StripeStatusDto>(this as StripeStatusDto, _$identity);

  /// Serializes this StripeStatusDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StripeStatusDto&&(identical(other.chargesEnabled, chargesEnabled) || other.chargesEnabled == chargesEnabled)&&(identical(other.detailsSubmitted, detailsSubmitted) || other.detailsSubmitted == detailsSubmitted)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chargesEnabled,detailsSubmitted,accountId);

@override
String toString() {
  return 'StripeStatusDto(chargesEnabled: $chargesEnabled, detailsSubmitted: $detailsSubmitted, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $StripeStatusDtoCopyWith<$Res>  {
  factory $StripeStatusDtoCopyWith(StripeStatusDto value, $Res Function(StripeStatusDto) _then) = _$StripeStatusDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'charges_enabled') bool chargesEnabled,@JsonKey(name: 'details_submitted') bool detailsSubmitted,@JsonKey(name: 'accountId') String? accountId
});




}
/// @nodoc
class _$StripeStatusDtoCopyWithImpl<$Res>
    implements $StripeStatusDtoCopyWith<$Res> {
  _$StripeStatusDtoCopyWithImpl(this._self, this._then);

  final StripeStatusDto _self;
  final $Res Function(StripeStatusDto) _then;

/// Create a copy of StripeStatusDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chargesEnabled = null,Object? detailsSubmitted = null,Object? accountId = freezed,}) {
  return _then(_self.copyWith(
chargesEnabled: null == chargesEnabled ? _self.chargesEnabled : chargesEnabled // ignore: cast_nullable_to_non_nullable
as bool,detailsSubmitted: null == detailsSubmitted ? _self.detailsSubmitted : detailsSubmitted // ignore: cast_nullable_to_non_nullable
as bool,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StripeStatusDto].
extension StripeStatusDtoPatterns on StripeStatusDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StripeStatusDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StripeStatusDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StripeStatusDto value)  $default,){
final _that = this;
switch (_that) {
case _StripeStatusDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StripeStatusDto value)?  $default,){
final _that = this;
switch (_that) {
case _StripeStatusDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'charges_enabled')  bool chargesEnabled, @JsonKey(name: 'details_submitted')  bool detailsSubmitted, @JsonKey(name: 'accountId')  String? accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StripeStatusDto() when $default != null:
return $default(_that.chargesEnabled,_that.detailsSubmitted,_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'charges_enabled')  bool chargesEnabled, @JsonKey(name: 'details_submitted')  bool detailsSubmitted, @JsonKey(name: 'accountId')  String? accountId)  $default,) {final _that = this;
switch (_that) {
case _StripeStatusDto():
return $default(_that.chargesEnabled,_that.detailsSubmitted,_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'charges_enabled')  bool chargesEnabled, @JsonKey(name: 'details_submitted')  bool detailsSubmitted, @JsonKey(name: 'accountId')  String? accountId)?  $default,) {final _that = this;
switch (_that) {
case _StripeStatusDto() when $default != null:
return $default(_that.chargesEnabled,_that.detailsSubmitted,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StripeStatusDto implements StripeStatusDto {
  const _StripeStatusDto({@JsonKey(name: 'charges_enabled') required this.chargesEnabled, @JsonKey(name: 'details_submitted') required this.detailsSubmitted, @JsonKey(name: 'accountId') this.accountId});
  factory _StripeStatusDto.fromJson(Map<String, dynamic> json) => _$StripeStatusDtoFromJson(json);

@override@JsonKey(name: 'charges_enabled') final  bool chargesEnabled;
@override@JsonKey(name: 'details_submitted') final  bool detailsSubmitted;
@override@JsonKey(name: 'accountId') final  String? accountId;

/// Create a copy of StripeStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StripeStatusDtoCopyWith<_StripeStatusDto> get copyWith => __$StripeStatusDtoCopyWithImpl<_StripeStatusDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StripeStatusDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StripeStatusDto&&(identical(other.chargesEnabled, chargesEnabled) || other.chargesEnabled == chargesEnabled)&&(identical(other.detailsSubmitted, detailsSubmitted) || other.detailsSubmitted == detailsSubmitted)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chargesEnabled,detailsSubmitted,accountId);

@override
String toString() {
  return 'StripeStatusDto(chargesEnabled: $chargesEnabled, detailsSubmitted: $detailsSubmitted, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$StripeStatusDtoCopyWith<$Res> implements $StripeStatusDtoCopyWith<$Res> {
  factory _$StripeStatusDtoCopyWith(_StripeStatusDto value, $Res Function(_StripeStatusDto) _then) = __$StripeStatusDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'charges_enabled') bool chargesEnabled,@JsonKey(name: 'details_submitted') bool detailsSubmitted,@JsonKey(name: 'accountId') String? accountId
});




}
/// @nodoc
class __$StripeStatusDtoCopyWithImpl<$Res>
    implements _$StripeStatusDtoCopyWith<$Res> {
  __$StripeStatusDtoCopyWithImpl(this._self, this._then);

  final _StripeStatusDto _self;
  final $Res Function(_StripeStatusDto) _then;

/// Create a copy of StripeStatusDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chargesEnabled = null,Object? detailsSubmitted = null,Object? accountId = freezed,}) {
  return _then(_StripeStatusDto(
chargesEnabled: null == chargesEnabled ? _self.chargesEnabled : chargesEnabled // ignore: cast_nullable_to_non_nullable
as bool,detailsSubmitted: null == detailsSubmitted ? _self.detailsSubmitted : detailsSubmitted // ignore: cast_nullable_to_non_nullable
as bool,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
