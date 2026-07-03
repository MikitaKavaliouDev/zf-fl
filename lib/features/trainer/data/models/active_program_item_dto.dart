import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_program_item_dto.freezed.dart';
part 'active_program_item_dto.g.dart';

@freezed
abstract class ActiveProgramItemDto with _$ActiveProgramItemDto {
  const factory ActiveProgramItemDto({
    required String programId,
    required String programName,
    required String clientId,
    required String clientName,
    String? clientAvatarUrl,
    required String assignedDate,
    required int currentWeek,
    required int totalWeeks,
    required int sessionsCompleted,
    required int totalSessions,
    required double completionRate,
    String? nextSessionDate,
    required String status,
  }) = _ActiveProgramItemDto;

  factory ActiveProgramItemDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveProgramItemDtoFromJson(json);
}
