// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billing_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BillingOnboardingDto _$BillingOnboardingDtoFromJson(
  Map<String, dynamic> json,
) => _BillingOnboardingDto(url: json['url'] as String);

Map<String, dynamic> _$BillingOnboardingDtoToJson(
  _BillingOnboardingDto instance,
) => <String, dynamic>{'url': instance.url};

_SubscriptionUpdateResponse _$SubscriptionUpdateResponseFromJson(
  Map<String, dynamic> json,
) => _SubscriptionUpdateResponse(
  success: json['success'] as bool,
  url: json['url'] as String?,
);

Map<String, dynamic> _$SubscriptionUpdateResponseToJson(
  _SubscriptionUpdateResponse instance,
) => <String, dynamic>{'success': instance.success, 'url': instance.url};
