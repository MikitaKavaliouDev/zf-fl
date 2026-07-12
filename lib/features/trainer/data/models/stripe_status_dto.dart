import 'package:freezed_annotation/freezed_annotation.dart';

part 'stripe_status_dto.freezed.dart';
part 'stripe_status_dto.g.dart';

/// Represents the Stripe Connect account status for a trainer.
///
/// Returned by GET /api/profile/me/billing
/// - `charges_enabled`: Whether the trainer can receive payouts
/// - `details_submitted`: Whether onboarding details have been submitted
/// - `accountId`: The Stripe Connect account ID (null if not connected)
@freezed
abstract class StripeStatusDto with _$StripeStatusDto {
  const factory StripeStatusDto({
    @JsonKey(name: 'charges_enabled') required bool chargesEnabled,
    @JsonKey(name: 'details_submitted') required bool detailsSubmitted,
    @JsonKey(name: 'accountId') String? accountId,
  }) = _StripeStatusDto;

  factory StripeStatusDto.fromJson(Map<String, dynamic> json) =>
      _$StripeStatusDtoFromJson(json);
}
