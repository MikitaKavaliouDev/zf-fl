import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_dashboard_trainer.dart';
import 'client_recent_session.dart';
import 'dashboard_measurement.dart';

part 'client_profile_data.freezed.dart';
part 'client_profile_data.g.dart';

@freezed
abstract class ClientProfileData with _$ClientProfileData {
  const factory ClientProfileData({
    required String id,
    required String userId,
    required String name,
    required String email,
    ClientDashboardTrainer? trainer,
    @Default(<ClientRecentSession>[]) List<ClientRecentSession> workoutSessions,
    @Default(<DashboardMeasurement>[]) List<DashboardMeasurement> measurements,
    int? remainingCredits,
  }) = _ClientProfileData;

  factory ClientProfileData.fromJson(Map<String, dynamic> json) =>
      _$ClientProfileDataFromJson(json);
}
