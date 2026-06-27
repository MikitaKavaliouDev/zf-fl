import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../sync/workout_realtime_service.dart';
import '../data/services/voice_coach_service.dart';
import 'voice_coach_state.dart';

/// Manages the ElevenLabs Conversational AI Agent lifecycle.
///
/// Wraps [VoiceCoachService] and exposes [VoiceCoachState] to the UI.
/// Subscribes to [WorkoutRealtimeService] when connected so the app
/// receives Supabase Realtime updates from the AI's Server Tool actions.
@injectable
class VoiceCoachCubit extends Cubit<VoiceCoachState> {
  final VoiceCoachService _service;
  final WorkoutRealtimeService _realtimeService;

  /// The authenticated user ID (Supabase UUID) to pass as a dynamic variable.
  String? _userId;

  /// Whether the mic permission education sheet has been shown.
  bool _micPermissionShown = false;
  bool get wasMicPermissionShown => _micPermissionShown;

  StreamSubscription<AIWorkoutEvent>? _realtimeSub;

  VoiceCoachCubit(this._service, this._realtimeService)
      : super(const VoiceCoachState.disconnected()) {
    // Forward service state changes to cubit state.
    _service.onConnected = _onServiceConnected;
    _service.onDisconnected = _onServiceDisconnected;
    _service.onError = _onServiceError;
  }

  // ── Configuration ─────────────────────────────────────────────────

  /// Set the user ID (must be called before [start] or [toggle]).
  void configure({required String userId}) {
    _userId = userId;
  }

  // ── Public API ────────────────────────────────────────────────────

  /// Request microphone permission. Returns true if granted.
  Future<bool> requestMicrophonePermission() async {
    final granted = await _service.requestMicrophonePermission();
    _micPermissionShown = true;
    return granted;
  }

  /// Check if microphone permission is already granted.
  Future<bool> hasMicrophonePermission() async {
    return await _service.hasMicrophonePermission();
  }

  /// Open app settings (when permission is denied).
  Future<void> openSettings() async {
    await _service.openSettings();
  }

  /// Start the ElevenLabs conversation.
  Future<void> start() async {
    final userId = _userId;
    if (userId == null || userId.isEmpty) {
      developer.log(
        '[VoiceCoach] start called without userId — configure first',
        name: 'voice_coach',
      );
      emit(const VoiceCoachState.error('User not configured.'));
      return;
    }

    emit(const VoiceCoachState.connecting());

    await _service.start(userId: userId);
  }

  /// Stop the ElevenLabs conversation.
  Future<void> stop() async {
    await _service.stop();
    _unsubscribeRealtime();
    emit(const VoiceCoachState.disconnected());
  }

  /// Toggle connection on/off.
  Future<void> toggle() async {
    final userId = _userId;
    if (userId == null || userId.isEmpty) {
      developer.log(
        '[VoiceCoach] toggle called without userId',
        name: 'voice_coach',
      );
      emit(const VoiceCoachState.error('User not configured.'));
      return;
    }

    switch (state) {
      case VoiceCoachDisconnected():
      case VoiceCoachError():
        await start();
      case VoiceCoachConnecting():
        // Already connecting — do nothing
      case VoiceCoachConnected():
        await stop();
    }
  }

  /// Mute/unmute the microphone.
  Future<void> setMuted(bool muted) async {
    await _service.setMuted(muted);
  }

  Future<void> toggleMute() async {
    await _service.toggleMute();
  }

  /// Send a text message during the conversation.
  void sendMessage(String text) {
    if (state is VoiceCoachConnected) {
      _service.sendMessage(text);
    }
  }

  /// Send feedback for the last agent response.
  void sendFeedback(bool isPositive) {
    _service.sendFeedback(isPositive);
  }

  // ── Internal Event Handlers ───────────────────────────────────────

  void _onServiceConnected() {
    // Subscribe to Supabase Realtime for AI agent DB changes.
    if (_userId != null && _userId!.isNotEmpty) {
      _realtimeService.subscribe(_userId!);
      _realtimeSub = _realtimeService.events.listen(_onAIWorkoutEvent);
    }

    emit(VoiceCoachState.connected(
      messages: _service.messages,
      audioLevel: _service.audioLevel,
      agentState: _mapAgentMode(_service.agentMode),
      conversationId: _service.conversationId,
    ));
  }

  void _onServiceDisconnected() {
    _unsubscribeRealtime();
    emit(const VoiceCoachState.disconnected());
  }

  void _onServiceError(String message) {
    _unsubscribeRealtime();
    emit(VoiceCoachState.error(message));
  }

  // ── Realtime Event Forwarding ─────────────────────────────────────

  void _onAIWorkoutEvent(AIWorkoutEvent event) {
    // Log events for debugging — the workout screen cubit will also
    // listen to these events via the stream.
    developer.log(
      '[VoiceCoach] AI event: $event',
      name: 'voice_coach',
    );
  }

  void _unsubscribeRealtime() {
    _realtimeSub?.cancel();
    _realtimeSub = null;
    _realtimeService.unsubscribe();
  }

  // ── Helpers ────────────────────────────────────────────────────────

  VoiceCoachAgentState _mapAgentMode(dynamic agentMode) {
    // The elevenlabs_agents package uses ConversationMode enum.
    // We map it to our own simplified enum.
    switch (agentMode.toString()) {
      case 'ConversationMode.listening':
        return VoiceCoachAgentState.listening;
      case 'ConversationMode.speaking':
        return VoiceCoachAgentState.speaking;
      default:
        return VoiceCoachAgentState.unknown;
    }
  }

  /// Refresh state from the service (called by UI on rebuild).
  void refreshState() {
    if (state is VoiceCoachConnected) {
      emit(VoiceCoachState.connected(
        messages: _service.messages,
        audioLevel: _service.audioLevel,
        agentState: _mapAgentMode(_service.agentMode),
        conversationId: _service.conversationId,
      ));
    }
  }

  @override
  Future<void> close() async {
    _unsubscribeRealtime();
    await _service.stop();
    super.close();
  }
}
