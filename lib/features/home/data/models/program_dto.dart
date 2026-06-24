import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../trainers/data/models/template_dto.dart';

part 'program_dto.freezed.dart';
part 'program_dto.g.dart';

/// DTO for a workout program (routine).
///
/// Matches backend Prisma `WorkoutProgram` model.
/// Returned from POST /api/client/programs and GET /api/client/programs.
@freezed
abstract class ProgramDto with _$ProgramDto {
  const factory ProgramDto({
    required String id,
    required String name,
    String? description,
    String? trainerId,
    String? category,
    @Default(<TemplateDto>[]) List<TemplateDto> templates,
    @Default(<String>[]) List<String> templateLabels,
    @Default(false) bool isScheduled,
    int? scheduledStartDate,
    String? scheduleFrequency,
    @Default(0) int activeTemplateIndex,
    String? trainerName,
    String? trainerAvatarUrl,
    /// Source of the program: "assigned", "self", or null.
    String? source,
    /// Assignment metadata (only for assigned programs).
    String? assignmentId,
    int? startDate,
    @Default(false) bool isActive,
  }) = _ProgramDto;

  factory ProgramDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramDtoFromJson(json);
}
