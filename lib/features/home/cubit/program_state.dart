import 'package:freezed_annotation/freezed_annotation.dart';

import '../../trainers/data/models/template_dto.dart';
import '../data/models/assigned_program_dto.dart';
import '../data/models/program_dto.dart';

part 'program_state.freezed.dart';

@freezed
sealed class ProgramState with _$ProgramState {
  const factory ProgramState.initial() = ProgramInitial;

  const factory ProgramState.loading() = ProgramLoading;

  const factory ProgramState.loaded({
    /// Programs assigned by the trainer (with assignment wrapper).
    @Default(<AssignedProgramDto>[]) List<AssignedProgramDto> assignedPrograms,

    /// Programs created by the client themselves.
    @Default(<ProgramDto>[]) List<ProgramDto> personalPrograms,

    /// All available templates (personal + system + local), merged.
    @Default(<TemplateDto>[]) List<TemplateDto> templates,

    /// Sorted unique program categories.
    @Default(<String>[]) List<String> categories,

    /// The ID of the currently active program (if any).
    String? activeProgramId,

    /// Whether a set-active operation is in progress.
    @Default(false) bool isSettingActive,
  }) = ProgramLoaded;

  const factory ProgramState.error(String message) = ProgramError;
}
