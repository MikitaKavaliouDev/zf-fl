import 'package:freezed_annotation/freezed_annotation.dart';

import 'program_dto.dart';

part 'assigned_program_dto.freezed.dart';
part 'assigned_program_dto.g.dart';

/// Wrapper DTO for a trainer-assigned program returned from
/// GET /api/client/programs in the `assignedPrograms` array.
///
/// Backend shape (from route.ts):
/// ```json
/// {
///   "assignmentId": "...",
///   "startDate": "2026-06-19T10:17:38.866Z",
///   "isActive": true,
///   "program": { ... ProgramDto fields ... },
///   "source": "assigned"
/// }
/// ```
@freezed
abstract class AssignedProgramDto with _$AssignedProgramDto {
  const factory AssignedProgramDto({
    required String assignmentId,
    String? startDate,
    @Default(false) bool isActive,
    required ProgramDto program,
    @Default('assigned') String source,
  }) = _AssignedProgramDto;

  factory AssignedProgramDto.fromJson(Map<String, dynamic> json) =>
      _$AssignedProgramDtoFromJson(json);
}
