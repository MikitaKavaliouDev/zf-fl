import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_client_package_dto.dart';

part 'trainer_client_packages_state.freezed.dart';

@freezed
sealed class TrainerClientPackagesState with _$TrainerClientPackagesState {
  const factory TrainerClientPackagesState.initial() =
      TrainerClientPackagesInitial;

  const factory TrainerClientPackagesState.loading() =
      TrainerClientPackagesLoading;

  const factory TrainerClientPackagesState.loaded(
    List<TrainerClientPackageDto> packages,
  ) = TrainerClientPackagesLoaded;

  const factory TrainerClientPackagesState.error(String message) =
      TrainerClientPackagesError;
}
