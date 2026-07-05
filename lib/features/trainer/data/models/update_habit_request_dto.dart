import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_habit_request_dto.freezed.dart';
part 'update_habit_request_dto.g.dart';

@freezed
abstract class UpdateHabitRequestDto with _$UpdateHabitRequestDto {
  const factory UpdateHabitRequestDto({
    String? title,
    String? description,
    String? frequency,
    bool? isActive,
  }) = _UpdateHabitRequestDto;

  factory UpdateHabitRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateHabitRequestDtoFromJson(json);
}
