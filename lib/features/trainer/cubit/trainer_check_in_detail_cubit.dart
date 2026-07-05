import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/trainer_checkin_api_service.dart';
import '../data/models/review_check_in_request_dto.dart';
import 'trainer_check_in_detail_state.dart';

@injectable
class TrainerCheckInDetailCubit
    extends Cubit<TrainerCheckInDetailState> {
  final TrainerCheckInApiService _api;

  TrainerCheckInDetailCubit(this._api)
      : super(const TrainerCheckInDetailState.initial());

  /// Load full check-in detail by ID.
  Future<void> loadDetail(String id) async {
    emit(const TrainerCheckInDetailState.loading());
    try {
      final checkIn = await _api.getCheckInDetail(id);
      emit(TrainerCheckInDetailState.loaded(checkIn: checkIn));
      developer.log('Check-in detail loaded: ${checkIn.id}',
          name: 'trainer');
    } catch (e) {
      developer.log('Check-in detail load failed: $e', name: 'trainer');
      emit(TrainerCheckInDetailState.error(e.toString()));
    }
  }

  /// Submit a review (trainer response) for this check-in.
  Future<void> submitReview(String id, String text) async {
    final current = state;
    if (current is! TrainerCheckInDetailLoaded) return;
    final previousCheckIn = current.checkIn;

    emit(current.copyWith(isSubmitting: true));
    try {
      await _api.reviewCheckIn(
        id,
        ReviewCheckInRequestDto(trainerResponse: text),
      );
      // Reload the detail to get the updated status + reviewedAt
      final checkIn = await _api.getCheckInDetail(id);
      emit(TrainerCheckInDetailState.loaded(checkIn: checkIn));
      developer.log('Check-in review submitted: $id', name: 'trainer');
    } catch (e) {
      developer.log('Check-in review failed: $e', name: 'trainer');
      emit(TrainerCheckInDetailState.loaded(checkIn: previousCheckIn));
    }
  }

  /// Reload the same check-in.
  Future<void> refresh(String id) async {
    await loadDetail(id);
  }
}
