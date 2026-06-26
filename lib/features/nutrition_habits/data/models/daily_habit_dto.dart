import 'package:freezed_annotation/freezed_annotation.dart';

import 'habit_log_dto.dart';

part 'daily_habit_dto.freezed.dart';
part 'daily_habit_dto.g.dart';

@freezed
abstract class DailyHabitDto with _$DailyHabitDto {
  const factory DailyHabitDto({
    required String id,
    required String clientId,
    required String trainerId,
    required String title,
    String? description,
    required String frequency,
    @Default(true) bool isActive,
    @Default(<HabitLogDto>[]) List<HabitLogDto> logs,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _DailyHabitDto;

  const DailyHabitDto._();

  factory DailyHabitDto.fromJson(Map<String, dynamic> json) =>
      _$DailyHabitDtoFromJson(json);
}
