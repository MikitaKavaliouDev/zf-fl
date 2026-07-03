import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/active_program_item_dto.dart';
import '../data/models/program_analytics_dto.dart';
import '../data/models/trainer_program_brief_dto.dart';

part 'trainer_programs_state.freezed.dart';

@freezed
sealed class TrainerProgramsState with _$TrainerProgramsState {
  const factory TrainerProgramsState.initial() = TrainerProgramsInitial;

  const factory TrainerProgramsState.loading() = TrainerProgramsLoading;

  const factory TrainerProgramsState.loaded({
    @Default([]) List<TrainerProgramBriefDto> programs,
    @Default([]) List<ActiveProgramItemDto> activePrograms,
    ProgramAnalyticsDto? analytics,
  }) = TrainerProgramsLoaded;

  const factory TrainerProgramsState.error(String message) =
      TrainerProgramsError;
}
