import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../data/check_in_repository.dart';
import '../data/models/check_in_config_dto.dart';
import '../data/models/check_in_submission_dto.dart';
import 'check_in_state.dart';

@injectable
class CheckInCubit extends Cubit<CheckInState> {
  final CheckInRepository _repository;

  CheckInCubit(this._repository) : super(const CheckInState.initial());

  /// Fetch check-in config and initialise step 0.
  Future<void> loadConfig() async {
    try {
      emit(const CheckInState.step(
        submission: CheckInSubmissionDto(),
      ));
      final config = await _repository.getConfig();
      _emitStep(config: config);
    } catch (e) {
      developer.log('CheckInCubit.loadConfig failed: $e', name: 'check_in');
      // Still allow the wizard with no config.
      emit(const CheckInState.step(
        submission: CheckInSubmissionDto(),
      ));
    }
  }

  // --- Navigation ---

  void nextStep() {
    final s = state;
    if (s is! CheckInStep) return;
    if (s.step >= 3) return; // last step, submit handled separately
    _emitStep(step: s.step + 1, submission: s.submission, config: s.config);
  }

  void prevStep() {
    final s = state;
    if (s is! CheckInStep) return;
    if (s.step <= 0) return;
    _emitStep(step: s.step - 1, submission: s.submission, config: s.config);
  }

  // --- Body Metrics (Step 0) ---

  void updateWeight(double? value) {
    _patchSubmission((s) => s.copyWith(weight: value));
  }

  void updateWaistCm(double? value) {
    _patchSubmission((s) => s.copyWith(waistCm: value));
  }

  void updateSleepHours(double? value) {
    _patchSubmission((s) => s.copyWith(sleepHours: value));
  }

  // --- Wellness (Step 1) ---

  void updateEnergyLevel(int value) {
    _patchSubmission((s) => s.copyWith(energyLevel: value));
  }

  void updateStressLevel(int value) {
    _patchSubmission((s) => s.copyWith(stressLevel: value));
  }

  void updateHungerLevel(int value) {
    _patchSubmission((s) => s.copyWith(hungerLevel: value));
  }

  void updateDigestionLevel(int value) {
    _patchSubmission((s) => s.copyWith(digestionLevel: value));
  }

  void updateNutritionCompliance(String value) {
    _patchSubmission((s) => s.copyWith(nutritionCompliance: value));
  }

  // --- Notes (Step 3) ---

  void updateClientNotes(String value) {
    _patchSubmission((s) => s.copyWith(clientNotes: value));
  }

  // --- Photos (Step 2) ---

  void addPhoto(String imagePath, String? caption) {
    final s = state;
    if (s is! CheckInStep) return;
    final photo = CheckInPhotoDto(imagePath: imagePath, caption: caption);
    final updated = s.submission.copyWith(
      photos: [...s.submission.photos, photo],
    );
    _emitStep(submission: updated, config: s.config);
  }

  void removePhoto(int index) {
    final s = state;
    if (s is! CheckInStep) return;
    final updated = s.submission.copyWith(
      photos: [
        for (int i = 0; i < s.submission.photos.length; i++)
          if (i != index) s.submission.photos[i],
      ],
    );
    _emitStep(submission: updated, config: s.config);
  }

  // --- Submit ---

  Future<void> submit() async {
    final s = state;
    if (s is! CheckInStep) return;

    emit(const CheckInState.submitting());

    try {
      // 1. Upload any photos that have local file paths (not already imagePath).
      final photos = s.submission.photos;
      final uploadedPaths = <String>[];
      for (final photo in photos) {
        // Upload if it's a local file path (starts with / or file://)
        if (photo.imagePath.startsWith('/') ||
            photo.imagePath.startsWith('file://')) {
          final uploadResult = await _repository.uploadPhoto(
            photo.imagePath,
          );
          uploadedPaths.add(uploadResult.imagePath);
        } else {
          // Already a server path
          uploadedPaths.add(photo.imagePath);
        }
      }

      // 2. Build final submission with uploaded image paths.
      final finalSubmission = s.submission.copyWith(
        photos: [
          for (int i = 0; i < photos.length; i++)
            photos[i].copyWith(imagePath: uploadedPaths[i]),
        ],
      );

      // 3. Submit the check-in.
      final response = await _repository.submitCheckIn(finalSubmission);
      _repository.invalidateCache();
      emit(CheckInState.success(response));
    } catch (e) {
      developer.log('CheckInCubit.submit failed: $e', name: 'check_in');
      emit(const CheckInState.error('Failed to submit check-in. Please try again.'));
    }
  }

  // --- History & Detail ---

  /// Load check-in history list, sorted by date descending.
  Future<void> loadHistory() async {
    try {
      final items = await _repository.getHistory();
      items.sort((a, b) => b.date.compareTo(a.date));
      emit(CheckInState.historyLoaded(items));
    } catch (e) {
      developer.log('CheckInCubit.loadHistory failed: $e', name: 'check_in');
      emit(const CheckInState.error('Failed to load check-in history.'));
    }
  }

  /// Load a single check-in detail by ID.
  Future<void> loadDetail(String checkInId) async {
    try {
      final detail = await _repository.getDetail(checkInId);
      emit(CheckInState.detailLoaded(detail));
    } catch (e) {
      developer.log('CheckInCubit.loadDetail failed: $e', name: 'check_in');
      emit(const CheckInState.error('Failed to load check-in details.'));
    }
  }

  // --- Reset ---

  void reset() {
    emit(const CheckInState.initial());
  }

  // --- Helpers ---

  void _patchSubmission(
    CheckInSubmissionDto Function(CheckInSubmissionDto) update,
  ) {
    final s = state;
    if (s is! CheckInStep) return;
    final updated = update(s.submission);
    _emitStep(
      step: s.step,
      submission: updated,
      config: s.config,
    );
  }

  void _emitStep({
    int? step,
    CheckInSubmissionDto? submission,
    CheckInConfigDto? config,
  }) {
    final s = state;
    if (s is! CheckInStep) return;
    emit(CheckInState.step(
      step: step ?? s.step,
      submission: submission ?? s.submission,
      config: config ?? s.config,
    ));
  }
}
