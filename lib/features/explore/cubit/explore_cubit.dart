import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/explore_repository.dart';
import '../data/models/explore_city.dart';
import '../data/models/explore_category.dart';
import '../data/models/explore_event_dto.dart';
import '../data/models/explore_metadata.dart';
import '../data/models/featured_content.dart';
import '../data/models/paginated_events.dart';
import 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  final ExploreRepository _repository;

  ExploreCubit(this._repository) : super(const ExploreState.initial());

  /// Load all explore content in parallel: metadata, featured, nearby trainers.
  Future<void> loadContent({
    String? cityId,
    double? lat,
    double? lng,
  }) async {
    emit(const ExploreState.loading());
    try {
      final results = await Future.wait([
        _repository.getMetadata(),
        _repository.getFeaturedContent(cityId: cityId, lat: lat, lng: lng),
        _repository.getPromotedTrainers(category: 'ZIRO_RECOMMENDED'),
        _repository.getEvents(limit: 20, lat: lat, lon: lng),
      ]);

      final metadata = results[0] as ExploreMetadata;
      final featured = results[1] as FeaturedContent;
      final promotedRecommended = results[2] as List<FeaturedTrainerDto>;
      final eventsResult = results[3] as PaginatedEvents;

      final featuredTrainers = featured.featuredTrainers;
      final nearbyTrainers = featuredTrainers.where((t) => t.source == 'algorithm').toList();
      final spotlightTrainer = nearbyTrainers.isNotEmpty ? nearbyTrainers.first : null;

      // Group upcoming events by date
      final events = eventsResult.events;
      final now = DateTime.now();
      final upcomingEvents = events.where((e) => e.startTime.isAfter(now)).toList();
      final Map<String, List<ExploreEventDto>> grouped = {};
      final List<DateTime> sortedDates = [];
      for (final event in upcomingEvents) {
        final key = _dateKey(event.startTime);
        grouped.putIfAbsent(key, () => []).add(event);
        if (!sortedDates.any((d) => _dateKey(d) == key)) {
          sortedDates.add(DateTime(event.startTime.year, event.startTime.month, event.startTime.day));
        }
      }
      sortedDates.sort();

      emit(ExploreStateLoaded(
        selectedSection: ExploreSection.trainers,
        content: ExploreContent(
          cities: metadata.cities,
          categories: metadata.categories,
          featuredTrainers: featured.featuredTrainers,
          nearbyTrainers: nearbyTrainers,
          recommendedTrainers: promotedRecommended,
          spotlightTrainer: spotlightTrainer,
          featuredEvents: featured.featuredEvents,
          upcomingEvents: upcomingEvents,
          sortedEventDates: sortedDates,
          groupedEvents: grouped,
          totalTrainersCount: featured.featuredTrainers.length + promotedRecommended.length,
        ),
      ));
    } catch (e) {
      developer.log('ExploreCubit.loadContent failed: $e', name: 'explore');
      emit(ExploreStateError(
        'Failed to load explore content. Please check your connection.',
      ));
    }
  }

  void setSection(ExploreSection section) {
    final current = state;
    if (current is ExploreStateLoaded) {
      emit(current.copyWith(selectedSection: section));
    }
  }

  void selectCity(ExploreCity? city) {
    final current = state;
    if (current is ExploreStateLoaded) {
      emit(current.copyWith(selectedCity: city));
      // Reload content with new city filter
      loadContent(
        cityId: city?.id,
        lat: city?.latitude,
        lng: city?.longitude,
      );
    }
  }

  void selectCategory(ExploreCategory? category) {
    final current = state;
    if (current is ExploreStateLoaded) {
      emit(current.copyWith(selectedCategory: category));
    }
  }

  Future<void> refresh() async {
    final current = state;
    if (current is ExploreStateLoaded) {
      await loadContent(
        cityId: current.selectedCity?.id,
        lat: current.selectedCity?.latitude,
        lng: current.selectedCity?.longitude,
      );
    } else {
      await loadContent();
    }
  }

  /// Build a date key string for grouping.
  String _dateKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}
