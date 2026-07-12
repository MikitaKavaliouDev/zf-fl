import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/stripe_status_dto.dart';

part 'payouts_state.freezed.dart';

@freezed
sealed class PayoutsState with _$PayoutsState {
  const factory PayoutsState.initial() = PayoutsInitial;
  const factory PayoutsState.loading() = PayoutsLoading;
  const factory PayoutsState.loaded(StripeStatusDto status) = PayoutsLoaded;
  const factory PayoutsState.error(String message) = PayoutsError;
}
