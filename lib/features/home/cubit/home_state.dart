import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/active_program_response.dart';
import '../data/models/client_dashboard_response.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.loaded({
    required ClientDashboardResponse dashboard,
    ActiveProgramResponse? activeProgram,
    @Default(false) bool hasPendingInvitation,
    String? pendingInvitationMessage,
  }) = HomeLoaded;

  const factory HomeState.error(String message) = HomeError;
}
