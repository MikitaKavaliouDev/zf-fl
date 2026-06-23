import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_dashboard_session.freezed.dart';
part 'client_dashboard_session.g.dart';

@freezed
abstract class ClientDashboardSession with _$ClientDashboardSession {
  const factory ClientDashboardSession({
    required String id,
    required String title,
    required DateTime date,
    required int duration,
    @JsonKey(name: 'is_trainer_assigned') bool? isTrainerAssigned,
  }) = _ClientDashboardSession;

  factory ClientDashboardSession.fromJson(Map<String, dynamic> json) =>
      _$ClientDashboardSessionFromJson(json);
}
