import 'package:freezed_annotation/freezed_annotation.dart';

import 'program_dto.dart';

part 'program_library_response.freezed.dart';
part 'program_library_response.g.dart';

/// Response from GET /api/client/programs.
@freezed
abstract class ProgramLibraryResponse with _$ProgramLibraryResponse {
  const factory ProgramLibraryResponse({
    @Default(<ProgramDto>[]) List<ProgramDto> assignedPrograms,
    @Default(<ProgramDto>[]) List<ProgramDto> personalPrograms,
    @Default(<TemplateLibraryItem>[]) List<TemplateLibraryItem> personalTemplates,
    @Default(<TemplateLibraryItem>[]) List<TemplateLibraryItem> systemTemplates,
    @Default(<String>[]) List<String> categories,
  }) = _ProgramLibraryResponse;

  factory ProgramLibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$ProgramLibraryResponseFromJson(json);
}

/// A template item in the program library.
@freezed
abstract class TemplateLibraryItem with _$TemplateLibraryItem {
  const factory TemplateLibraryItem({
    required String id,
    required String name,
    String? description,
    required String programId,
    @Default(0) int order,
    String? source,
    required TemplateLibraryProgram program,
    @Default(0) int exerciseCount,
    required List<TemplateLibraryExercise> exercises,
  }) = _TemplateLibraryItem;

  factory TemplateLibraryItem.fromJson(Map<String, dynamic> json) =>
      _$TemplateLibraryItemFromJson(json);
}

@freezed
abstract class TemplateLibraryProgram with _$TemplateLibraryProgram {
  const factory TemplateLibraryProgram({
    required String name,
    String? trainerId,
  }) = _TemplateLibraryProgram;

  factory TemplateLibraryProgram.fromJson(Map<String, dynamic> json) =>
      _$TemplateLibraryProgramFromJson(json);
}

@freezed
abstract class TemplateLibraryExercise with _$TemplateLibraryExercise {
  const factory TemplateLibraryExercise({
    required String id,
    @Default(0) int order,
    String? type,
    String? exerciseId,
    String? targetReps,
    int? durationSeconds,
    String? notes,
    required TemplateLibraryExerciseDetail exercise,
  }) = _TemplateLibraryExercise;

  factory TemplateLibraryExercise.fromJson(Map<String, dynamic> json) =>
      _$TemplateLibraryExerciseFromJson(json);
}

@freezed
abstract class TemplateLibraryExerciseDetail with _$TemplateLibraryExerciseDetail {
  const factory TemplateLibraryExerciseDetail({
    required String id,
    required String name,
    String? muscleGroup,
    String? equipment,
  }) = _TemplateLibraryExerciseDetail;

  factory TemplateLibraryExerciseDetail.fromJson(Map<String, dynamic> json) =>
      _$TemplateLibraryExerciseDetailFromJson(json);
}
