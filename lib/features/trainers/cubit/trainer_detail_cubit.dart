import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_preview_media_dto.dart';
import '../data/trainer_repository.dart';
import 'trainer_detail_state.dart';

class TrainerDetailCubit extends Cubit<TrainerDetailState> {
  final TrainerRepository _repository;
  final QueryClient _queryClient;
  DateTime? _lastLoadTime;

  /// Profile data is relatively static — skip background refresh if within
  /// this window. Matches a QueryBuilder staleTime: 120s pattern.
  static const Duration _staleTime = Duration(seconds: 120);

  TrainerDetailCubit(this._repository, this._queryClient)
      : super(const TrainerDetailInitial());

  /// Whether cached data is still fresh (no background refresh needed).
  bool get _isFresh =>
      _lastLoadTime != null &&
      DateTime.now().difference(_lastLoadTime!) < _staleTime;

  /// Query key for tanquery caching.
  QueryKey _profileKey(String username) =>
      QueryKey(['trainer', 'detail', username]);

  // ── Load Aggregated Profile ──

  Future<void> load(String username) async {
    emit(const TrainerDetailLoading());

    // Check tanquery cache first for instant load
    final cached = _queryClient.getQueryData<TrainerDetailDto>(
      _profileKey(username),
    );
    if (cached != null) {
      // Show cached data immediately
      List<TrainerPreviewMediaDto>? cachedMedia;
      try {
        cachedMedia = await _repository.getPreviewMedia(cached.id);
      } catch (_) {}
      emit(TrainerDetailLoaded(
        trainer: cached,
        previewMedia: cachedMedia ?? [],
      ));
      _lastLoadTime = DateTime.now();
      // Background refresh (SWR) — skip if data is still fresh
      if (!_isFresh) {
        _refreshInBackground(username);
      }
      return;
    }

    try {
      final trainer = await _repository.getTrainerDetail(username);
      // Store in tanquery cache
      _queryClient.setQueryData(_profileKey(username), trainer);

      List<TrainerPreviewMediaDto> previewMedia = [];
      try {
        previewMedia = await _repository.getPreviewMedia(trainer.id);
      } catch (_) {
        // Graceful: preview media is non-critical
      }
      _lastLoadTime = DateTime.now();
      emit(TrainerDetailLoaded(
        trainer: trainer,
        previewMedia: previewMedia,
      ));
    } catch (e) {
      emit(const TrainerDetailError('Failed to load trainer details.'));
    }
  }

  /// Background refresh — preserves current emission, updates state silently.
  Future<void> _refreshInBackground(String username) async {
    try {
      final trainer = await _repository.getTrainerDetail(username);
      _queryClient.setQueryData(_profileKey(username), trainer);

      final current = state;
      if (current is TrainerDetailLoaded) {
        List<TrainerPreviewMediaDto> previewMedia = current.previewMedia;
        try {
          previewMedia = await _repository.getPreviewMedia(trainer.id);
        } catch (_) {}
        emit(current.copyWith(
          trainer: trainer,
          previewMedia: previewMedia,
        ));
      }
    } catch (_) {
      // Graceful: keep existing data on background refresh failure
    }
  }

  // ── Refresh (pull-to-refresh) ──

  Future<void> refresh(String username) async {
    final current = state;
    if (current is TrainerDetailLoaded) {
      // Invalidate tanquery cache then reload
      _queryClient.invalidateQueries(queryKey: _profileKey(username));
      try {
        final trainer = await _repository.getTrainerDetail(username);
        _queryClient.setQueryData(_profileKey(username), trainer);

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
