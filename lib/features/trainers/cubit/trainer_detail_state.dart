import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_preview_media_dto.dart';
import '../data/models/trainer_schedule_dto.dart';

part 'trainer_detail_state.freezed.dart';

/// Sealed state for the Trainer Detail screen.
///
/// The loaded state carries the full trainer profile (from the aggregated
/// endpoint) plus a lazily-loaded schedule (null until fetched).
@freezed
sealed class TrainerDetailState with _$TrainerDetailState {
  /// Initial / before any load attempt.
  const factory TrainerDetailState.initial() = TrainerDetailInitial;

  /// Loading the aggregated profile.
  const factory TrainerDetailState.loading() = TrainerDetailLoading;

  /// Fully loaded with trainer data.
  /// [trainer] is the aggregated profile (includes packages, testimonials, etc.).
  /// [schedule] is loaded on-demand when the user views the schedule section.
  /// [previewMedia] is loaded eagerly alongside the profile.
  ///
  /// [linkRequestPending] is set to true when a link request has been submitted
  /// but the trainer has not yet accepted (backend returns isLinked: false after
  /// a successful link POST). It clears on the next refresh that returns isLinked: true,
  /// or when unlinked.
  const factory TrainerDetailState.loaded({
    required TrainerDetailDto trainer,
    TrainerScheduleDto? schedule,
    @Default(false) bool isLoadingSchedule,
    @Default(<TrainerPreviewMediaDto>[]) List<TrainerPreviewMediaDto> previewMedia,
    @Default(false) bool isLinking,
    @Default(false) bool isUnlinking,
    @Default(false) bool linkRequestPending,
    String? linkError,
    String? checkoutError,
  }) = TrainerDetailLoaded;

  /// Error state with retry capability.
  const factory TrainerDetailState.error(String message) = TrainerDetailError;
}
