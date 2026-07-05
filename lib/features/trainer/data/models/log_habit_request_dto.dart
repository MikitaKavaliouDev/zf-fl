import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_habit_request_dto.freezed.dart';
part 'log_habit_request_dto.g.dart';

@freezed
abstract class LogHabitRequestDto with _$LogHabitRequestDto {
  const factory LogHabitRequestDto({
    required String date,
    required bool isCompleted,
    String? note,
  }) = _LogHabitRequestDto;

  factory LogHabitRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LogHabitRequestDtoFromJson(json);
}
