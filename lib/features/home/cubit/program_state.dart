import 'package:freezed_annotation/freezed_annotation.dart';

import '../../trainers/data/models/template_dto.dart';
import '../data/models/program_dto.dart';

part 'program_state.freezed.dart';

@freezed
sealed class ProgramState with _$ProgramState {
  const factory ProgramState.initial() = ProgramInitial;

  const factory ProgramState.loading() = ProgramLoading;

  const factory ProgramState.loaded({
    @Default(<ProgramDto>[]) List<ProgramDto> programs,
    @Default(<TemplateDto>[]) List<TemplateDto> templates,
  }) = ProgramLoaded;

  const factory ProgramState.error(String message) = ProgramError;
}
