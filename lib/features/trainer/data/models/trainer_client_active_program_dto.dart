import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_client_program_template_dto.dart';

part 'trainer_client_active_program_dto.freezed.dart';
part 'trainer_client_active_program_dto.g.dart';

@freezed
abstract class TrainerClientActiveProgramDto
    with _$TrainerClientActiveProgramDto {
  const factory TrainerClientActiveProgramDto({
    required ProgramInfo program,
    required ProgramProgress progress,
    @Default(<TrainerClientProgramTemplateDto>[])
    List<TrainerClientProgramTemplateDto> templates,
  }) = _TrainerClientActiveProgramDto;

  factory TrainerClientActiveProgramDto.fromJson(
          Map<String, dynamic> json) =>
      _$TrainerClientActiveProgramDtoFromJson(json);
}

@freezed
abstract class ProgramInfo with _$ProgramInfo {
  const factory ProgramInfo({
    required String id,
    required String name,
    String? description,
  }) = _ProgramInfo;

  factory ProgramInfo.fromJson(Map<String, dynamic> json) =>
      _$ProgramInfoFromJson(json);
}

@freezed
abstract class ProgramProgress with _$ProgramProgress {
  const factory ProgramProgress({
    @Default(0) int completedCount,
    @Default(0) int totalCount,
    @Default(0.0) double progressPercentage,
    String? nextTemplateId,
  }) = _ProgramProgress;

  factory ProgramProgress.fromJson(Map<String, dynamic> json) =>
      _$ProgramProgressFromJson(json);
}
