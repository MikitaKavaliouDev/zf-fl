import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_habit_log_dto.dart';

part 'trainer_habit_dto.freezed.dart';
part 'trainer_habit_dto.g.dart';

@freezed
abstract class TrainerHabitDto with _$TrainerHabitDto {
  const factory TrainerHabitDto({
    required String id,
    required String clientId,
    required String trainerId,
    required String title,
    String? description,
    required String frequency,
    required bool isActive,
    @Default(<TrainerHabitLogDto>[]) List<TrainerHabitLogDto> logs,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
  }) = _TrainerHabitDto;

  factory TrainerHabitDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerHabitDtoFromJson(json);
}
