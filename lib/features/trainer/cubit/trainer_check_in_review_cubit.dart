import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_checkin_api_service.dart';
import 'trainer_check_in_review_state.dart';

@injectable
class TrainerCheckInReviewCubit
    extends Cubit<TrainerCheckInReviewState> {
  final TrainerCheckInApiService _api;

  TrainerCheckInReviewCubit(this._api)
      : super(const TrainerCheckInReviewState.initial());

  /// Load all check-ins, splitting into pending and reviewed.
  Future<void> loadCheckIns({String? status}) async {
    emit(const TrainerCheckInReviewState.loading());
    try {
      final allCheckIns = await _api.getCheckIns();
      final pending = allCheckIns
          .where((c) => c.status == 'SUBMITTED')
          .toList();
      final reviewed = allCheckIns
          .where((c) => c.status == 'REVIEWED')
          .toList();
      emit(TrainerCheckInReviewState.loaded(
        pendingCheckIns: pending,
        reviewedCheckIns: reviewed,
        selectedStatus: status ?? 'SUBMITTED',
      ));
    } catch (e) {
      developer.log('Failed to load check-ins: $e', name: 'trainer');
      emit(TrainerCheckInReviewState.error(e.toString()));
    }
  }

  /// Switch the active segment filter and reload.
  Future<void> setStatusFilter(String status) async {
    final current = state;
    if (current is TrainerCheckInReviewLoaded) {
      emit(current.copyWith(selectedStatus: status));
    }
  }

  /// Pull-to-refresh: reload all check-ins.
  Future<void> refresh() async {
    await loadCheckIns();
  }
}
