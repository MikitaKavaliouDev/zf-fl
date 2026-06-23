import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/explore_event_dto.dart';

part 'trainer_discovery_state.freezed.dart';

enum DiscoveryType { specialists, events, all }

enum SortOption {
  closest,
  highestRated,
  newest,
  nameAsc,
  nameDesc,
  priceLowHigh,
  priceHighLow;

  String get apiKey {
    switch (this) {
      case SortOption.closest:
        return 'distance';
      case SortOption.highestRated:
        return 'rating';
      case SortOption.newest:
        return 'newest';
      case SortOption.nameAsc:
        return 'name_asc';
      case SortOption.nameDesc:
        return 'name_desc';
      case SortOption.priceLowHigh:
        return 'price_asc';
      case SortOption.priceHighLow:
        return 'price_desc';
    }
  }
}

@freezed
sealed class TrainerDiscoveryState with _$TrainerDiscoveryState {
  const factory TrainerDiscoveryState.initial() = TrainerDiscoveryInitial;

  const factory TrainerDiscoveryState.loaded({
    required DiscoveryType discoveryType,
    required String searchQuery,
    required String? location,
    required SortOption sortBy,
    required String? specialty,
    required double minRating,
    required bool hasActiveFilters,
    required List<dynamic> trainers,
    required List<ExploreEventDto> events,
    required int trainerPage,
    required bool hasMoreTrainers,
    required int eventPage,
    required bool hasMoreEvents,
    required bool loadingTrainers,
    required bool loadingEvents,
    String? errorMessage,
  }) = TrainerDiscoveryLoaded;

  const factory TrainerDiscoveryState.error(String message) =
      TrainerDiscoveryError;
}
