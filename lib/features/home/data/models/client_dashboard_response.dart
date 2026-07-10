import 'package:freezed_annotation/freezed_annotation.dart';

import 'client_dashboard_session.dart';
import 'client_profile_data.dart';

part 'client_dashboard_response.freezed.dart';
part 'client_dashboard_response.g.dart';

@freezed
abstract class ClientDashboardResponse with _$ClientDashboardResponse {
  const factory ClientDashboardResponse({
    required ClientProfileData clientData,
    required String weightUnit,
    @Default(<ClientDashboardSession>[])
    List<ClientDashboardSession> upcomingClientSessions,
    DateTime? lastCheckIn,
  }) = _ClientDashboardResponse;

  factory ClientDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientDashboardResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ClientDashboardResponseToJson(this as _ClientDashboardResponse);
}
