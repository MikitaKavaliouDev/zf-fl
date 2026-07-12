// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionDto _$SubscriptionDtoFromJson(Map<String, dynamic> json) =>
    _SubscriptionDto(
      tier: json['tier'] as String,
      subscriptionStatus: json['subscriptionStatus'] as String?,
      tierName: json['tierName'] as String,
      tierId: json['tierId'] as String,
      stripeCancelAtPeriodEnd: json['stripeCancelAtPeriodEnd'] as bool,
      stripeCurrentPeriodEnd: json['stripeCurrentPeriodEnd'] as String?,
      stripeCancelAt: json['stripeCancelAt'] as String?,
      trialEndsAt: json['trialEndsAt'] as String?,
      freeMode: json['freeMode'] as bool,
    );

Map<String, dynamic> _$SubscriptionDtoToJson(_SubscriptionDto instance) =>
    <String, dynamic>{
      'tier': instance.tier,
      'subscriptionStatus': instance.subscriptionStatus,
      'tierName': instance.tierName,
      'tierId': instance.tierId,
      'stripeCancelAtPeriodEnd': instance.stripeCancelAtPeriodEnd,
      'stripeCurrentPeriodEnd': instance.stripeCurrentPeriodEnd,
      'stripeCancelAt': instance.stripeCancelAt,
      'trialEndsAt': instance.trialEndsAt,
      'freeMode': instance.freeMode,
    };
