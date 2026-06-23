import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_dashboard_trainer.freezed.dart';
part 'client_dashboard_trainer.g.dart';

@freezed
abstract class ClientDashboardTrainer with _$ClientDashboardTrainer {
  const factory ClientDashboardTrainer({
    required String id,
    required String name,
    required String username,
    required String email,
  }) = _ClientDashboardTrainer;

  factory ClientDashboardTrainer.fromJson(Map<String, dynamic> json) =>
      _$ClientDashboardTrainerFromJson(json);
}
