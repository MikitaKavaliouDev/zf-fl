/// Lightweight model for exercise log entries embedded in trainer client sessions.
///
/// Matches the shape of `exerciseLogs` included by
/// GET /api/clients/:id/sessions from the backend Prisma query.
class TrainerClientExerciseLogEntry {
  final String id;
  final String exerciseId;
  final String exerciseName;
  final int? reps;
  final double? weight;
  final bool isCompleted;

  const TrainerClientExerciseLogEntry({
    required this.id,
    required this.exerciseId,
    required this.exerciseName,
    this.reps,
    this.weight,
    this.isCompleted = false,
  });

  factory TrainerClientExerciseLogEntry.fromJson(Map<String, dynamic> json) {
    final exercise = json['exercise'] as Map<String, dynamic>?;
    return TrainerClientExerciseLogEntry(
      id: json['id'] as String,
      exerciseId: json['exerciseId'] as String,
      exerciseName: exercise?['name'] as String? ?? '',
      reps: json['reps'] as int?,
      weight: (json['weight'] as num?)?.toDouble(),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}
