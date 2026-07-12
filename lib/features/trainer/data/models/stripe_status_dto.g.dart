// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stripe_status_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StripeStatusDto _$StripeStatusDtoFromJson(Map<String, dynamic> json) =>
    _StripeStatusDto(
      chargesEnabled: json['charges_enabled'] as bool,
      detailsSubmitted: json['details_submitted'] as bool,
      accountId: json['accountId'] as String?,
    );

Map<String, dynamic> _$StripeStatusDtoToJson(_StripeStatusDto instance) =>
    <String, dynamic>{
      'charges_enabled': instance.chargesEnabled,
      'details_submitted': instance.detailsSubmitted,
      'accountId': instance.accountId,
    };
