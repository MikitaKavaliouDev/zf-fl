import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_program_brief_dto.dart';
import 'trainer_template_summary_dto.dart';

part 'program_library_response.freezed.dart';
part 'program_library_response.g.dart';

@freezed
abstract class ProgramLibraryResponse with _$ProgramLibraryResponse {
  const factory ProgramLibraryResponse({
    @Default([]) List<TrainerProgramBriefDto> userPrograms,
    @Default([]) List<TrainerTemplateSummaryDto> systemTemplates,
    @Default([]) List<TrainerTemplateSummaryDto> userTemplates,
  }) = _ProgramLibraryResponse;

  factory ProgramLibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramLibraryResponseFromJson(json);
}
