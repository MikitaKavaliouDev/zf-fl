import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_dto.freezed.dart';
part 'subscription_dto.g.dart';

/// Represents the trainer's current subscription plan.
///
/// Returned by GET /api/billing/subscription
@freezed
abstract class SubscriptionDto with _$SubscriptionDto {
  const factory SubscriptionDto({
    required String tier,
    required String? subscriptionStatus,
    required String tierName,
    required String tierId,
    required bool stripeCancelAtPeriodEnd,
    String? stripeCurrentPeriodEnd,
    String? stripeCancelAt,
    String? trialEndsAt,
    required bool freeMode,
  }) = _SubscriptionDto;

  factory SubscriptionDto.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDtoFromJson(json);
}
