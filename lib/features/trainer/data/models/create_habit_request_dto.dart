import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_habit_request_dto.freezed.dart';
part 'create_habit_request_dto.g.dart';

@freezed
abstract class CreateHabitRequestDto with _$CreateHabitRequestDto {
  const factory CreateHabitRequestDto({
    required String title,
    String? description,
    @Default('DAILY') String frequency,
  }) = _CreateHabitRequestDto;

  factory CreateHabitRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreateHabitRequestDtoFromJson(json);
}
