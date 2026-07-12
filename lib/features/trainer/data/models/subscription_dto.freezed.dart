// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionDto {

 String get tier; String? get subscriptionStatus; String get tierName; String get tierId; bool get stripeCancelAtPeriodEnd; String? get stripeCurrentPeriodEnd; String? get stripeCancelAt; String? get trialEndsAt; bool get freeMode;
/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionDtoCopyWith<SubscriptionDto> get copyWith => _$SubscriptionDtoCopyWithImpl<SubscriptionDto>(this as SubscriptionDto, _$identity);

  /// Serializes this SubscriptionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionDto&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.tierName, tierName) || other.tierName == tierName)&&(identical(other.tierId, tierId) || other.tierId == tierId)&&(identical(other.stripeCancelAtPeriodEnd, stripeCancelAtPeriodEnd) || other.stripeCancelAtPeriodEnd == stripeCancelAtPeriodEnd)&&(identical(other.stripeCurrentPeriodEnd, stripeCurrentPeriodEnd) || other.stripeCurrentPeriodEnd == stripeCurrentPeriodEnd)&&(identical(other.stripeCancelAt, stripeCancelAt) || other.stripeCancelAt == stripeCancelAt)&&(identical(other.trialEndsAt, trialEndsAt) || other.trialEndsAt == trialEndsAt)&&(identical(other.freeMode, freeMode) || other.freeMode == freeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tier,subscriptionStatus,tierName,tierId,stripeCancelAtPeriodEnd,stripeCurrentPeriodEnd,stripeCancelAt,trialEndsAt,freeMode);

@override
String toString() {
  return 'SubscriptionDto(tier: $tier, subscriptionStatus: $subscriptionStatus, tierName: $tierName, tierId: $tierId, stripeCancelAtPeriodEnd: $stripeCancelAtPeriodEnd, stripeCurrentPeriodEnd: $stripeCurrentPeriodEnd, stripeCancelAt: $stripeCancelAt, trialEndsAt: $trialEndsAt, freeMode: $freeMode)';
}


}

/// @nodoc
abstract mixin class $SubscriptionDtoCopyWith<$Res>  {
  factory $SubscriptionDtoCopyWith(SubscriptionDto value, $Res Function(SubscriptionDto) _then) = _$SubscriptionDtoCopyWithImpl;
@useResult
$Res call({
 String tier, String? subscriptionStatus, String tierName, String tierId, bool stripeCancelAtPeriodEnd, String? stripeCurrentPeriodEnd, String? stripeCancelAt, String? trialEndsAt, bool freeMode
});




}
/// @nodoc
class _$SubscriptionDtoCopyWithImpl<$Res>
    implements $SubscriptionDtoCopyWith<$Res> {
  _$SubscriptionDtoCopyWithImpl(this._self, this._then);

  final SubscriptionDto _self;
  final $Res Function(SubscriptionDto) _then;

/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tier = null,Object? subscriptionStatus = freezed,Object? tierName = null,Object? tierId = null,Object? stripeCancelAtPeriodEnd = null,Object? stripeCurrentPeriodEnd = freezed,Object? stripeCancelAt = freezed,Object? trialEndsAt = freezed,Object? freeMode = null,}) {
  return _then(_self.copyWith(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: freezed == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String?,tierName: null == tierName ? _self.tierName : tierName // ignore: cast_nullable_to_non_nullable
as String,tierId: null == tierId ? _self.tierId : tierId // ignore: cast_nullable_to_non_nullable
as String,stripeCancelAtPeriodEnd: null == stripeCancelAtPeriodEnd ? _self.stripeCancelAtPeriodEnd : stripeCancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,stripeCurrentPeriodEnd: freezed == stripeCurrentPeriodEnd ? _self.stripeCurrentPeriodEnd : stripeCurrentPeriodEnd // ignore: cast_nullable_to_non_nullable
as String?,stripeCancelAt: freezed == stripeCancelAt ? _self.stripeCancelAt : stripeCancelAt // ignore: cast_nullable_to_non_nullable
as String?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as String?,freeMode: null == freeMode ? _self.freeMode : freeMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionDto].
extension SubscriptionDtoPatterns on SubscriptionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionDto value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionDto value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tier,  String? subscriptionStatus,  String tierName,  String tierId,  bool stripeCancelAtPeriodEnd,  String? stripeCurrentPeriodEnd,  String? stripeCancelAt,  String? trialEndsAt,  bool freeMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
return $default(_that.tier,_that.subscriptionStatus,_that.tierName,_that.tierId,_that.stripeCancelAtPeriodEnd,_that.stripeCurrentPeriodEnd,_that.stripeCancelAt,_that.trialEndsAt,_that.freeMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tier,  String? subscriptionStatus,  String tierName,  String tierId,  bool stripeCancelAtPeriodEnd,  String? stripeCurrentPeriodEnd,  String? stripeCancelAt,  String? trialEndsAt,  bool freeMode)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionDto():
return $default(_that.tier,_that.subscriptionStatus,_that.tierName,_that.tierId,_that.stripeCancelAtPeriodEnd,_that.stripeCurrentPeriodEnd,_that.stripeCancelAt,_that.trialEndsAt,_that.freeMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tier,  String? subscriptionStatus,  String tierName,  String tierId,  bool stripeCancelAtPeriodEnd,  String? stripeCurrentPeriodEnd,  String? stripeCancelAt,  String? trialEndsAt,  bool freeMode)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionDto() when $default != null:
return $default(_that.tier,_that.subscriptionStatus,_that.tierName,_that.tierId,_that.stripeCancelAtPeriodEnd,_that.stripeCurrentPeriodEnd,_that.stripeCancelAt,_that.trialEndsAt,_that.freeMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionDto implements SubscriptionDto {
  const _SubscriptionDto({required this.tier, required this.subscriptionStatus, required this.tierName, required this.tierId, required this.stripeCancelAtPeriodEnd, this.stripeCurrentPeriodEnd, this.stripeCancelAt, this.trialEndsAt, required this.freeMode});
  factory _SubscriptionDto.fromJson(Map<String, dynamic> json) => _$SubscriptionDtoFromJson(json);

@override final  String tier;
@override final  String? subscriptionStatus;
@override final  String tierName;
@override final  String tierId;
@override final  bool stripeCancelAtPeriodEnd;
@override final  String? stripeCurrentPeriodEnd;
@override final  String? stripeCancelAt;
@override final  String? trialEndsAt;
@override final  bool freeMode;

/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionDtoCopyWith<_SubscriptionDto> get copyWith => __$SubscriptionDtoCopyWithImpl<_SubscriptionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionDto&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.subscriptionStatus, subscriptionStatus) || other.subscriptionStatus == subscriptionStatus)&&(identical(other.tierName, tierName) || other.tierName == tierName)&&(identical(other.tierId, tierId) || other.tierId == tierId)&&(identical(other.stripeCancelAtPeriodEnd, stripeCancelAtPeriodEnd) || other.stripeCancelAtPeriodEnd == stripeCancelAtPeriodEnd)&&(identical(other.stripeCurrentPeriodEnd, stripeCurrentPeriodEnd) || other.stripeCurrentPeriodEnd == stripeCurrentPeriodEnd)&&(identical(other.stripeCancelAt, stripeCancelAt) || other.stripeCancelAt == stripeCancelAt)&&(identical(other.trialEndsAt, trialEndsAt) || other.trialEndsAt == trialEndsAt)&&(identical(other.freeMode, freeMode) || other.freeMode == freeMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tier,subscriptionStatus,tierName,tierId,stripeCancelAtPeriodEnd,stripeCurrentPeriodEnd,stripeCancelAt,trialEndsAt,freeMode);

@override
String toString() {
  return 'SubscriptionDto(tier: $tier, subscriptionStatus: $subscriptionStatus, tierName: $tierName, tierId: $tierId, stripeCancelAtPeriodEnd: $stripeCancelAtPeriodEnd, stripeCurrentPeriodEnd: $stripeCurrentPeriodEnd, stripeCancelAt: $stripeCancelAt, trialEndsAt: $trialEndsAt, freeMode: $freeMode)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionDtoCopyWith<$Res> implements $SubscriptionDtoCopyWith<$Res> {
  factory _$SubscriptionDtoCopyWith(_SubscriptionDto value, $Res Function(_SubscriptionDto) _then) = __$SubscriptionDtoCopyWithImpl;
@override @useResult
$Res call({
 String tier, String? subscriptionStatus, String tierName, String tierId, bool stripeCancelAtPeriodEnd, String? stripeCurrentPeriodEnd, String? stripeCancelAt, String? trialEndsAt, bool freeMode
});




}
/// @nodoc
class __$SubscriptionDtoCopyWithImpl<$Res>
    implements _$SubscriptionDtoCopyWith<$Res> {
  __$SubscriptionDtoCopyWithImpl(this._self, this._then);

  final _SubscriptionDto _self;
  final $Res Function(_SubscriptionDto) _then;

/// Create a copy of SubscriptionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tier = null,Object? subscriptionStatus = freezed,Object? tierName = null,Object? tierId = null,Object? stripeCancelAtPeriodEnd = null,Object? stripeCurrentPeriodEnd = freezed,Object? stripeCancelAt = freezed,Object? trialEndsAt = freezed,Object? freeMode = null,}) {
  return _then(_SubscriptionDto(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String,subscriptionStatus: freezed == subscriptionStatus ? _self.subscriptionStatus : subscriptionStatus // ignore: cast_nullable_to_non_nullable
as String?,tierName: null == tierName ? _self.tierName : tierName // ignore: cast_nullable_to_non_nullable
as String,tierId: null == tierId ? _self.tierId : tierId // ignore: cast_nullable_to_non_nullable
as String,stripeCancelAtPeriodEnd: null == stripeCancelAtPeriodEnd ? _self.stripeCancelAtPeriodEnd : stripeCancelAtPeriodEnd // ignore: cast_nullable_to_non_nullable
as bool,stripeCurrentPeriodEnd: freezed == stripeCurrentPeriodEnd ? _self.stripeCurrentPeriodEnd : stripeCurrentPeriodEnd // ignore: cast_nullable_to_non_nullable
as String?,stripeCancelAt: freezed == stripeCancelAt ? _self.stripeCancelAt : stripeCancelAt // ignore: cast_nullable_to_non_nullable
as String?,trialEndsAt: freezed == trialEndsAt ? _self.trialEndsAt : trialEndsAt // ignore: cast_nullable_to_non_nullable
as String?,freeMode: null == freeMode ? _self.freeMode : freeMode // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
