import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_list_item_dto.dart';

part 'trainer_list_state.freezed.dart';

@freezed
sealed class TrainerListState with _$TrainerListState {
  const factory TrainerListState.initial() = TrainerListInitial;

  const factory TrainerListState.loading() = TrainerListLoading;

  const factory TrainerListState.loaded({
    required List<TrainerListItemDto> trainers,
    required int page,
    required bool hasMore,
    String? query,
    double? lat,
    double? lng,
    String? sortBy,
    String? specialties,
    double? minRating,
    String? trainingTypes,
  }) = TrainerListLoaded;

  const factory TrainerListState.loadingMore(TrainerListLoaded previous) =
      TrainerListLoadingMore;

  const factory TrainerListState.error(String message) = TrainerListError;
}
