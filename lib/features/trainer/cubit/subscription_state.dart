import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/subscription_dto.dart';

part 'subscription_state.freezed.dart';

@freezed
sealed class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.initial() = SubscriptionInitial;
  const factory SubscriptionState.loading() = SubscriptionLoading;
  const factory SubscriptionState.loaded(SubscriptionDto subscription) = SubscriptionLoaded;
  const factory SubscriptionState.error(String message) = SubscriptionError;
}
