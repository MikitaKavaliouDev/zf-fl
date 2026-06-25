import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/sharing_config_dto.dart';

part 'sharing_state.freezed.dart';

@freezed
sealed class SharingState with _$SharingState {
  const factory SharingState.initial() = SharingInitial;

  const factory SharingState.loading() = SharingLoading;

  const factory SharingState.loaded({
    required SharingConfigDto config,
  }) = SharingLoaded;

  const factory SharingState.saving() = SharingSaving;

  const factory SharingState.error(String message) = SharingError;
}
