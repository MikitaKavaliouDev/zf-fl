import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_recent_session.freezed.dart';
part 'client_recent_session.g.dart';

@freezed
abstract class ClientRecentSession with _$ClientRecentSession {
  const factory ClientRecentSession({
    required String id,
    required DateTime startTime,
    DateTime? endTime,
    required String status,
    required String name,
    double? volume,
    double? totalVolume,
    int? durationSeconds,
  }) = _ClientRecentSession;

  const ClientRecentSession._(); // Required for custom getters

  factory ClientRecentSession.fromJson(Map<String, dynamic> json) =>
      _$ClientRecentSessionFromJson(json);

  /// Duration in minutes, computed from [endTime]-[startTime] or [durationSeconds].
  int get durationMinutes {
    if (durationSeconds != null) return durationSeconds! ~/ 60;
    if (endTime != null && startTime.isBefore(endTime!)) {
      return endTime!.difference(startTime).inMinutes;
    }
    return 0;
  }
}
