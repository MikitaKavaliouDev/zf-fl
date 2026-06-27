import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/trainer_preview_media_dto.dart';
import '../data/trainer_repository.dart';
import 'trainer_detail_state.dart';

class TrainerDetailCubit extends Cubit<TrainerDetailState> {
  final TrainerRepository _repository;

  TrainerDetailCubit(this._repository) : super(const TrainerDetailInitial());

  // ── Load Aggregated Profile ──

  Future<void> load(String username) async {
    emit(const TrainerDetailLoading());
    try {
      final trainer = await _repository.getTrainerDetail(username);
      // Load preview media eagerly alongside the profile (silent, no loading state)
      List<TrainerPreviewMediaDto> previewMedia = [];
      try {
        previewMedia = await _repository.getPreviewMedia(trainer.id);
      } catch (_) {
        // Graceful: preview media is non-critical
      }
      emit(TrainerDetailLoaded(
        trainer: trainer,
        previewMedia: previewMedia,
      ));
    } catch (e) {
      emit(const TrainerDetailError('Failed to load trainer details.'));
    }
  }

  // ── Refresh (pull-to-refresh) ──

  Future<void> refresh(String username) async {
    final current = state;
    if (current is TrainerDetailLoaded) {
      try {
        final trainer = await _repository.getTrainerDetail(username);
        List<TrainerPreviewMediaDto> previewMedia = current.previewMedia;
        try {
          previewMedia = await _repository.getPreviewMedia(trainer.id);
        } catch (_) {
          // Graceful: keep existing preview media on refresh failure
        }
        // If the link was pending and the trainer has now accepted,
        // clear the pending flag.
        final clearedPending =
            current.linkRequestPending && trainer.isLinked;
        emit(current.copyWith(
          trainer: trainer,
          previewMedia: previewMedia,
          linkRequestPending:
              clearedPending ? false : current.linkRequestPending,
        ));
      } catch (_) {
        // Graceful: keep existing data on refresh failure
      }
    }
  }

  // ── Link / Connect ──

  Future<void> linkTrainer(String trainerUsername) async {
    final current = state;
    if (current is! TrainerDetailLoaded) return;
    // Optimistic update: mark as linking
    emit(current.copyWith(isLinking: true, linkError: null));
    try {
      await _repository.linkTrainer(trainerUsername);
      // Reload the full profile to get updated isLinked status
      final trainer = await _repository.getTrainerDetail(trainerUsername);
      emit(current.copyWith(
        trainer: trainer,
        isLinking: false,
        // If the backend still returns isLinked: false, the link request
        // is pending trainer approval.
        linkRequestPending: !trainer.isLinked,
      ));
    } catch (e) {
      emit(current.copyWith(
        isLinking: false,
        linkError: 'Failed to connect. Please try again.',
      ));
    }
  }

  // ── Unlink / Disconnect ──

  Future<void> unlinkTrainer(String trainerUsername) async {
    final current = state;
    if (current is! TrainerDetailLoaded) return;
    emit(current.copyWith(isUnlinking: true, linkError: null));
    try {
      await _repository.unlinkTrainer();
      final trainer = await _repository.getTrainerDetail(trainerUsername);
      emit(current.copyWith(
        trainer: trainer,
        isUnlinking: false,
        linkRequestPending: false,
      ));
    } catch (e) {
      emit(current.copyWith(
        isUnlinking: false,
        linkError: 'Failed to disconnect. Please try again.',
      ));
    }
  }

  // ── Schedule (lazy-loaded) ──

  Future<void> loadSchedule(String username) async {
    final current = state;
    if (current is! TrainerDetailLoaded) return;
    if (current.schedule != null || current.isLoadingSchedule) return;
    emit(current.copyWith(isLoadingSchedule: true));
    try {
      final schedule = await _repository.getTrainerSchedule(username);
      emit(current.copyWith(schedule: schedule, isLoadingSchedule: false));
    } catch (_) {
      emit(current.copyWith(isLoadingSchedule: false));
    }
  }

  // ── Clear link error (after showing snackbar) ──

  void clearLinkError() {
    final current = state;
    if (current is TrainerDetailLoaded && current.linkError != null) {
      emit(current.copyWith(linkError: null));
    }
  }

  Future<String?> createCheckoutSession(String packageId) async {
    final current = state;
    if (current is! TrainerDetailLoaded) return null;
    try {
      final url = await _repository.createCheckoutSession(
        type: 'PACKAGE_SALE',
        id: packageId,
      );
      return url;
    } catch (e) {
      emit(current.copyWith(
        checkoutError: 'Failed to start checkout. Please try again.',
      ));
      return null;
    }
  }
}
