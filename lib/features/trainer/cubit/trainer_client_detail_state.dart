import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_client_detail_dto.dart';

part 'trainer_client_detail_state.freezed.dart';

@freezed
sealed class TrainerClientDetailState with _$TrainerClientDetailState {
  const factory TrainerClientDetailState.initial() =
      TrainerClientDetailInitial;

  const factory TrainerClientDetailState.loading() =
      TrainerClientDetailLoading;

  const factory TrainerClientDetailState.loaded({
    required TrainerClientDetailDto client,
  }) = TrainerClientDetailLoaded;

  const factory TrainerClientDetailState.error(String message) =
      TrainerClientDetailError;
}
