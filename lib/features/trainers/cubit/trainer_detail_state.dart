import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_package_dto.dart';

part 'trainer_detail_state.freezed.dart';

@freezed
sealed class TrainerDetailState with _$TrainerDetailState {
  const factory TrainerDetailState.initial() = TrainerDetailInitial;

  const factory TrainerDetailState.loading() = TrainerDetailLoading;

  const factory TrainerDetailState.loaded({
    required TrainerDetailDto trainer,
    @Default(<TrainerPackageDto>[]) List<TrainerPackageDto> packages,
  }) = TrainerDetailLoaded;

  const factory TrainerDetailState.error(String message) = TrainerDetailError;
}
