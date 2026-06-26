import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/profile_core_info_dto.dart';
import '../data/models/profile_text_content_dto.dart';

part 'profile_config_state.freezed.dart';

@freezed
sealed class ProfileConfigState with _$ProfileConfigState {
  const factory ProfileConfigState.initial() = ProfileConfigInitial;

  const factory ProfileConfigState.loading() = ProfileConfigLoading;

  const factory ProfileConfigState.loaded({
    required ProfileCoreInfoDto coreInfo,
    ProfileTextContentDto? textContent,
    @Default(false) bool isSaving,
    @Default(false) bool hasUnsavedChanges,
    String? avatarUrl,
  }) = ProfileConfigLoaded;

  const factory ProfileConfigState.error(String message) = ProfileConfigError;

  const factory ProfileConfigState.saveSuccess(String message) =
      ProfileConfigSaveSuccess;
}
