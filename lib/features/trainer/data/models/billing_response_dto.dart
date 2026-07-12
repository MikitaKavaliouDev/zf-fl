import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_response_dto.freezed.dart';
part 'billing_response_dto.g.dart';

/// Response from POST /api/profile/me/billing (create Stripe onboarding URL)
@freezed
abstract class BillingOnboardingDto with _$BillingOnboardingDto {
  const factory BillingOnboardingDto({
    required String url,
  }) = _BillingOnboardingDto;

  factory BillingOnboardingDto.fromJson(Map<String, dynamic> json) =>
      _$BillingOnboardingDtoFromJson(json);
}

/// Response from PATCH /api/billing/subscription
@freezed
abstract class SubscriptionUpdateResponse with _$SubscriptionUpdateResponse {
  const factory SubscriptionUpdateResponse({
    required bool success,
    String? url,
  }) = _SubscriptionUpdateResponse;

  factory SubscriptionUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionUpdateResponseFromJson(json);
}

/// Request body for POST /api/billing/subscription
class CreateCheckoutRequest {
  final String tierId;

  const CreateCheckoutRequest({required this.tierId});

  Map<String, dynamic> toJson() => {'tierId': tierId};
}

/// Request body for PATCH /api/billing/subscription
class UpdateSubscriptionRequest {
  final String action;
  final String? tierId;

  const UpdateSubscriptionRequest({required this.action, this.tierId});

  Map<String, dynamic> toJson() => {
        'action': action,
        if (tierId != null) 'tierId': tierId,
      };
}
