import 'package:freezed_annotation/freezed_annotation.dart';

part 'fitness_goal_dto.freezed.dart';
part 'fitness_goal_dto.g.dart';

@freezed
abstract class FitnessGoalDto with _$FitnessGoalDto {
  const factory FitnessGoalDto({
    required String id,
    required String clientId,
    required String type,
    required double targetValue,
    double? currentValue,
    required DateTime startDate,
    DateTime? endDate,
    String? exerciseName,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
  }) = _FitnessGoalDto;

  const FitnessGoalDto._();

  factory FitnessGoalDto.fromJson(Map<String, dynamic> json) =>
      _$FitnessGoalDtoFromJson(json);
}
