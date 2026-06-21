import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_state.freezed.dart';

@freezed
sealed class SyncState with _$SyncState {
  const factory SyncState.idle({
    @Default(true) bool isOnline,
    @Default(0) int lastSyncAt,
  }) = SyncIdle;

  const factory SyncState.syncing({
    required bool isOnline,
    required int lastSyncAt,
    String? currentTable,
    @Default(0.0) double progress,
  }) = SyncInProgress;

  const factory SyncState.error({
    required bool isOnline,
    required int lastSyncAt,
    required String message,
  }) = SyncError;
}
