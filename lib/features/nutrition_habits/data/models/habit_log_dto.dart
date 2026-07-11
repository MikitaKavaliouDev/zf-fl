import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_log_dto.freezed.dart';
part 'habit_log_dto.g.dart';

@freezed
abstract class HabitLogDto with _$HabitLogDto {
  const factory HabitLogDto({
    required String id,
    required String habitId,
    required String clientId,
    required String date,
    required bool isCompleted,
    String? note,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _HabitLogDto;

  const HabitLogDto._();

  factory HabitLogDto.fromJson(Map<String, dynamic> json) =>
      _$HabitLogDtoFromJson(json);
}
