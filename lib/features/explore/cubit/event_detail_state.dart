import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/event_detail_dto.dart';

part 'event_detail_state.freezed.dart';

@freezed
sealed class EventDetailState with _$EventDetailState {
  const factory EventDetailState.initial() = EventDetailInitial;

  const factory EventDetailState.loading() = EventDetailLoading;

  const factory EventDetailState.loaded({
    required EventDetailDto event,
    @Default(false) bool enrolled,
    @Default(false) bool enrolling,
    @Default(null) String? checkoutUrl,
  }) = EventDetailLoaded;

  const factory EventDetailState.error(String message) = EventDetailError;
}
