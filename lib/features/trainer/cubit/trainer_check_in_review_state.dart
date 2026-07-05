import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_check_in_list_item_dto.dart';

part 'trainer_check_in_review_state.freezed.dart';

@freezed
sealed class TrainerCheckInReviewState with _$TrainerCheckInReviewState {
  const factory TrainerCheckInReviewState.initial() =
      TrainerCheckInReviewInitial;

  const factory TrainerCheckInReviewState.loading() =
      TrainerCheckInReviewLoading;

  const factory TrainerCheckInReviewState.loaded({
    @Default(<TrainerCheckInListItemDto>[])
    List<TrainerCheckInListItemDto> pendingCheckIns,
    @Default(<TrainerCheckInListItemDto>[])
    List<TrainerCheckInListItemDto> reviewedCheckIns,
    @Default('SUBMITTED') String selectedStatus,
  }) = TrainerCheckInReviewLoaded;

  const factory TrainerCheckInReviewState.error(String message) =
      TrainerCheckInReviewError;
}
