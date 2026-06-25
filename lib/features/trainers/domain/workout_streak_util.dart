import '../data/models/workout_session_dto.dart';

class WorkoutStreakUtil {
  /// Count completed sessions in the last 7 days (including today).
  static int weeklyWorkoutCount(List<WorkoutSessionDto> sessions) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final sevenDaysAgo = today.subtract(const Duration(days: 6));

    return sessions.where((s) {
      if (!_isCompleted(s)) return false;
      final dt = DateTime.parse(s.startTime).toLocal();
      final date = DateTime(dt.year, dt.month, dt.day);
      return !date.isBefore(sevenDaysAgo) && !date.isAfter(today);
    }).length;
  }

  /// Current consecutive-day streak (counting backward from today).
  /// A day counts if at least one session was completed on that day.
  static int currentStreak(List<WorkoutSessionDto> sessions) {
    final completedDates = _getCompletedDates(sessions);
    if (completedDates.isEmpty) return 0;

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    if (!completedDates.contains(todayDate)) return 0;

    int streak = 1;
    var checkDate = todayDate.subtract(const Duration(days: 1));

    while (completedDates.contains(checkDate)) {
      streak++;
      checkDate = checkDate.subtract(const Duration(days: 1));
    }

    return streak;
  }

  /// Longest consecutive-day streak ever recorded in the session list.
  static int longestStreak(List<WorkoutSessionDto> sessions) {
    final completedDates = _getCompletedDates(sessions);
    if (completedDates.isEmpty) return 0;

    final sorted = completedDates.toList()..sort();

    int longest = 1;
    int current = 1;

    for (int i = 1; i < sorted.length; i++) {
      final diff = sorted[i].difference(sorted[i - 1]).inDays;
      if (diff == 1) {
        current++;
        if (current > longest) longest = current;
      } else {
        current = 1;
      }
    }

    return longest;
  }

  /// Returns `true` if the session has been completed.
  static bool _isCompleted(WorkoutSessionDto s) {
    return s.endTime != null || s.status == 'completed';
  }

  /// Extracts a sorted set of unique local dates from completed sessions.
  static Set<DateTime> _getCompletedDates(List<WorkoutSessionDto> sessions) {
    final dates = <DateTime>{};
    for (final s in sessions) {
      if (!_isCompleted(s)) continue;
      final dt = DateTime.parse(s.startTime).toLocal();
      dates.add(DateTime(dt.year, dt.month, dt.day));
    }
    return dates;
  }
}
