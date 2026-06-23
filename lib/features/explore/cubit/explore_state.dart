import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/explore_city.dart';
import '../data/models/explore_category.dart';
import '../data/models/explore_event_dto.dart';
import '../data/models/featured_content.dart';

part 'explore_state.freezed.dart';

/// Which section of the explore tab is visible.
enum ExploreSection { trainers, events }

@freezed
sealed class ExploreState with _$ExploreState {
  const factory ExploreState.initial() = ExploreStateInitial;

  const factory ExploreState.loading() = ExploreStateLoading;

  const factory ExploreState.loaded({
    required ExploreSection selectedSection,
    required ExploreContent content,
    ExploreCity? selectedCity,
    ExploreCategory? selectedCategory,
  }) = ExploreStateLoaded;

  const factory ExploreState.error(String message) = ExploreStateError;
}

@freezed
sealed class ExploreContent with _$ExploreContent {
  const factory ExploreContent({
    @Default(<ExploreCity>[]) List<ExploreCity> cities,
    @Default(<ExploreCategory>[]) List<ExploreCategory> categories,
    @Default(<FeaturedTrainerDto>[]) List<FeaturedTrainerDto> featuredTrainers,
    @Default(<FeaturedTrainerDto>[]) List<FeaturedTrainerDto> nearbyTrainers,
    @Default(<FeaturedTrainerDto>[]) List<FeaturedTrainerDto> recommendedTrainers,
    FeaturedTrainerDto? spotlightTrainer,
    @Default(<ExploreEventDto>[]) List<ExploreEventDto> featuredEvents,
    @Default(<ExploreEventDto>[]) List<ExploreEventDto> upcomingEvents,
    @Default(<DateTime>[]) List<DateTime> sortedEventDates,
    @Default(<String, List<ExploreEventDto>>{}) Map<String, List<ExploreEventDto>> groupedEvents,
    @Default(0) int totalTrainersCount,
  }) = _ExploreContent;
}
