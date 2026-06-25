import 'package:freezed_annotation/freezed_annotation.dart';

import '../../auth/data/models/user.dart';
import '../data/models/privacy_settings_dto.dart';

part 'more_state.freezed.dart';

@freezed
sealed class MoreState with _$MoreState {
  const factory MoreState.initial() = MoreInitial;

  const factory MoreState.loading() = MoreLoading;

  const factory MoreState.loaded({
    User? user,
    PrivacySettingsDto? privacy,
  }) = MoreLoaded;

  const factory MoreState.error(String message) = MoreError;
}
