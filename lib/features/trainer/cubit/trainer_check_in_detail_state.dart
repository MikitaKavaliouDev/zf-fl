import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_check_in_detail_dto.dart';

part 'trainer_check_in_detail_state.freezed.dart';

@freezed
sealed class TrainerCheckInDetailState with _$TrainerCheckInDetailState {
  const factory TrainerCheckInDetailState.initial() =
      TrainerCheckInDetailInitial;

  const factory TrainerCheckInDetailState.loading() =
      TrainerCheckInDetailLoading;

  const factory TrainerCheckInDetailState.loaded({
    required TrainerCheckInDetailDto checkIn,
    @Default(false) bool isSubmitting,
  }) = TrainerCheckInDetailLoaded;

  const factory TrainerCheckInDetailState.error(String message) =
      TrainerCheckInDetailError;
}
