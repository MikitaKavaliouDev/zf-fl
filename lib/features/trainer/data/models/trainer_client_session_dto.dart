import 'package:freezed_annotation/freezed_annotation.dart';

import 'trainer_client_exercise_log_entry.dart';

part 'trainer_client_session_dto.freezed.dart';
part 'trainer_client_session_dto.g.dart';

List<TrainerClientExerciseLogEntry> _exerciseLogsFromJson(
    List<dynamic>? json) {
  if (json == null) return [];
  return json
      .map((e) =>
          TrainerClientExerciseLogEntry.fromJson(e as Map<String, dynamic>))
      .toList();
}

@freezed
abstract class TrainerClientSessionDto with _$TrainerClientSessionDto {
  const factory TrainerClientSessionDto({
    required String id,
    required String clientId,
    @Default('') String name,
    required String startTime,
    String? endTime,
    required String status,
    String? notes,
    bool? isTrainerLed,
    String? createdAt,
    String? updatedAt,
    @JsonKey(
      name: 'exerciseLogs',
      defaultValue: [],
      fromJson: _exerciseLogsFromJson,
      includeToJson: false,
    )
    @Default([])
    List<TrainerClientExerciseLogEntry> exerciseLogs,
  }) = _TrainerClientSessionDto;

  factory TrainerClientSessionDto.fromJson(Map<String, dynamic> json) =>
      _$TrainerClientSessionDtoFromJson(json);
}

/// Extension with computed properties for session analytics.
extension TrainerClientSessionDtoX on TrainerClientSessionDto {
  /// Total volume (sum of weight × reps for completed exercise logs).
  double get volume {
    if (exerciseLogs.isEmpty) return 0;
    double total = 0;
    for (final log in exerciseLogs) {
      if (log.isCompleted && log.weight != null && log.reps != null) {
        total += log.weight! * log.reps!;
      }
    }
    return total;
  }

  /// Number of completed exercise sets.
  int get totalSets {
    return exerciseLogs.where((l) => l.isCompleted).length;
  }

  /// Unique exercise names in this session.
  List<String> get exerciseNames {
    return exerciseLogs
        .map((l) => l.exerciseName)
        .where((n) => n.isNotEmpty)
        .toSet()
        .toList();
  }
}
