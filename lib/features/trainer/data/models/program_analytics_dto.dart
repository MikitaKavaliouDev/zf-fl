import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_analytics_dto.freezed.dart';
part 'program_analytics_dto.g.dart';

@freezed
abstract class ProgramAnalyticsDto with _$ProgramAnalyticsDto {
  const factory ProgramAnalyticsDto({
    required double completionRate,
    required int totalSessions,
    required int completedSessions,
    required int activeClients,
    required String targetFrequency,
    required double averageProgress,
  }) = _ProgramAnalyticsDto;

  factory ProgramAnalyticsDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramAnalyticsDtoFromJson(json);
}
