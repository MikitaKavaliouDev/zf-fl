import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ziro_fit/features/explore/data/models/explore_event_dto.dart';
import 'package:ziro_fit/features/trainers/data/models/trainer_list_item_dto.dart';

part 'explore_map_state.freezed.dart';

/// Represents one map annotation item (trainer or event).
@freezed
sealed class MapItem with _$MapItem {
  const factory MapItem.trainer(TrainerListItemDto trainer) = MapItemTrainer;
  const factory MapItem.event(ExploreEventDto event) = MapItemEvent;
}

/// A cluster of map items at a single coordinate.
@freezed
sealed class MapCluster with _$MapCluster {
  const factory MapCluster({
    required String id,
    required double latitude,
    required double longitude,
    required List<MapItem> items,
  }) = _MapCluster;
}

/// Filter mode matching iOS MapFilterMode.
enum MapFilterMode { all, trainers, events, yoga }

@freezed
sealed class ExploreMapState with _$ExploreMapState {
  const factory ExploreMapState.initial() = ExploreMapInitial;
  const factory ExploreMapState.loading() = ExploreMapLoading;
  const factory ExploreMapState.loaded({
    @Default([]) List<TrainerListItemDto> trainers,
    @Default([]) List<ExploreEventDto> events,
    @Default([]) List<MapCluster> clusters,
    @Default(MapFilterMode.all) MapFilterMode filterMode,
    String? searchQuery,
    String? selectedClusterId,
    TrainerListItemDto? selectedTrainer,
    ExploreEventDto? selectedEvent,
    @Default(true) bool hasMoreTrainers,
    @Default(true) bool hasMoreEvents,
    @Default(false) bool isLoadingMore,
    double? userLat,
    double? userLng,
    @Default(11.0) double zoomLevel,
  }) = ExploreMapLoaded;
  const factory ExploreMapState.error(String message) = ExploreMapError;
}
