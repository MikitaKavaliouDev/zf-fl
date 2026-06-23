import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_program_response.freezed.dart';
part 'active_program_response.g.dart';

@freezed
abstract class ActiveProgramResponse with _$ActiveProgramResponse {
  const factory ActiveProgramResponse({
    required ProgramBasicInfo program,
    required ProgramProgress progress,
    required List<ProgramTemplateStatus> templates,
  }) = _ActiveProgramResponse;

  factory ActiveProgramResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveProgramResponseFromJson(json);
}

@freezed
abstract class ProgramBasicInfo with _$ProgramBasicInfo {
  const factory ProgramBasicInfo({
    required String id,
    required String name,
    String? description,
  }) = _ProgramBasicInfo;

  factory ProgramBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$ProgramBasicInfoFromJson(json);
}

@freezed
abstract class ProgramProgress with _$ProgramProgress {
  const factory ProgramProgress({
    required int completedCount,
    required int totalCount,
    required int progressPercentage,
    String? nextTemplateId,
  }) = _ProgramProgress;

  factory ProgramProgress.fromJson(Map<String, dynamic> json) =>
      _$ProgramProgressFromJson(json);
}

@freezed
abstract class ProgramTemplateStatus with _$ProgramTemplateStatus {
  const factory ProgramTemplateStatus({
    required String id,
    required String name,
    String? description,
    required int order,
    required String status,
    required int exerciseCount,
  }) = _ProgramTemplateStatus;

  factory ProgramTemplateStatus.fromJson(Map<String, dynamic> json) =>
      _$ProgramTemplateStatusFromJson(json);
}
