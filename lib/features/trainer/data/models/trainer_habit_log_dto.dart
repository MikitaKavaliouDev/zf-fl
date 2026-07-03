import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_habit_log_dto.freezed.dart';
part 'trainer_habit_log_dto.g.dart';

@freezed
abstract class TrainerHabitLogDto with _$TrainerHabitLogDto {
  const factory TrainerHabitLogDto({
    required String id,
    required String habitId,
    required String clientId,
    required String date,
    required bool isCompleted,
    String? note,
  }) = _TrainerHabitLogDto;

  factory TrainerHabitLogDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerHabitLogDtoFromJson(json);
}
