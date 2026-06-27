import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/voice_message.dart';

part 'voice_coach_state.freezed.dart';

/// Current agent state (listening/thinking/speaking).
enum VoiceCoachAgentState { listening, thinking, speaking, unknown }

@freezed
sealed class VoiceCoachState with _$VoiceCoachState {
  /// Not connected to ElevenLabs agent.
  const factory VoiceCoachState.disconnected() = VoiceCoachDisconnected;

  /// Connecting to the ElevenLabs agent.
  const factory VoiceCoachState.connecting() = VoiceCoachConnecting;

  /// Connected to the ElevenLabs agent and conversation is active.
  const factory VoiceCoachState.connected({
    @Default(<VoiceMessage>[]) List<VoiceMessage> messages,
    @Default(0.0) double audioLevel,
    @Default(VoiceCoachAgentState.listening) VoiceCoachAgentState agentState,
    String? conversationId,
  }) = VoiceCoachConnected;

  /// Error occurred during connection or conversation.
  const factory VoiceCoachState.error(String message) = VoiceCoachError;
}
