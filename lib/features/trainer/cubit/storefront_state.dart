import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/storefront_profile_dto.dart';
import '../data/models/stripe_status_dto.dart';

part 'storefront_state.freezed.dart';

@freezed
sealed class StorefrontState with _$StorefrontState {
  const factory StorefrontState.initial() = StorefrontInitial;
  const factory StorefrontState.loading() = StorefrontLoading;
  const factory StorefrontState.loaded({
    required StorefrontProfileDto profile,
    StripeStatusDto? stripeStatus,
  }) = StorefrontLoaded;
  const factory StorefrontState.error(String message) = StorefrontError;
}
