import 'package:elevenlabs_agents/elevenlabs_agents.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/voice_message.dart';

/// Wraps the ElevenLabs [ConversationClient] and exposes
/// a simple interface for the [VoiceCoachCubit] to consume.
///
/// The agent ID is hardcoded to match the iOS app.
@lazySingleton
class VoiceCoachService extends ChangeNotifier {
  static const String agentId = 'agent_3501ksjc2xtnemsbkta6xfm7hg7x';

  // ── ElevenLabs SDK ──────────────────────────────────────────────────

  late final ConversationClient _client;

  // ── Exposed state ───────────────────────────────────────────────────

  ConversationStatus get status => _client.status;
  bool get isSpeaking => _client.isSpeaking;
  bool get isMuted => _client.isMuted;
  String? get conversationId => _client.conversationId;

  /// Transcript messages from the conversation.
  List<VoiceMessage> get messages => List.unmodifiable(_messages);
  final List<VoiceMessage> _messages = [];

  /// VAD score (0.0–1.0) for waveform visualization.
  double audioLevel = 0.0;

  /// Current agent mode (listening / speaking).
  ConversationMode _agentMode = ConversationMode.listening;
  ConversationMode get agentMode => _agentMode;

  /// The last error message (if any).
  String? lastError;

  /// Whether the mic permission has been shown to the user before.
  bool get wasMicPermissionShown =>
      UserDefaultsHelper.wasMicPermissionShown;

  // ── Callbacks ───────────────────────────────────────────────────────

  VoidCallback? onConnected;
  VoidCallback? onDisconnected;
  void Function(String message)? onError;

  // ── Lifecycle ───────────────────────────────────────────────────────

  VoiceCoachService() {
    _initClient();
  }

  void _initClient() {
    _client = ConversationClient(
      callbacks: ConversationCallbacks(
        onConnect: ({required conversationId}) {
          _messages.clear();
          _agentMode = ConversationMode.listening;
          notifyListeners();
          onConnected?.call();
        },
        onDisconnect: (details) {
          notifyListeners();
          onDisconnected?.call();
        },
        onStatusChange: ({required status}) {
          notifyListeners();
        },
        onModeChange: ({required mode}) {
          _agentMode = mode;
          notifyListeners();
        },
        onMessage: ({required message, required source}) {
          _messages.add(VoiceMessage(
            id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
            role: source == Role.ai
                ? VoiceMessageRole.agent
                : VoiceMessageRole.user,
            content: message,
            timestamp: DateTime.now(),
          ));
          notifyListeners();
        },
        onUserTranscript: ({required eventId, required transcript}) {
          // Finalized user transcript — already captured in onMessage
        },
        onVadScore: ({required vadScore}) {
          audioLevel = vadScore;
          notifyListeners();
        },
        onError: (message, [context]) {
          lastError = message;
          notifyListeners();
          onError?.call(message);
        },
      ),
    );
    _client.addListener(notifyListeners);
  }

  // ── Public API ──────────────────────────────────────────────────────

  /// Request microphone permission. Returns true if granted.
  Future<bool> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();
    final granted = status == PermissionStatus.granted;
    UserDefaultsHelper.markMicPermissionShown();
    return granted;
  }

  /// Check if microphone permission is already granted.
  Future<bool> hasMicrophonePermission() async {
    return await Permission.microphone.isGranted;
  }

  /// Open app settings (when permission is denied).
  Future<void> openSettings() async {
    await openAppSettings();
  }

  /// Start the ElevenLabs conversation session.
  Future<void> start({
    required String userId,
    Map<String, dynamic>? dynamicVariables,
    ConversationOverrides? overrides,
  }) async {
    // Reset state
    _messages.clear();
    audioLevel = 0.0;
    lastError = null;

    try {
      await _client.startSession(
        agentId: agentId,
        userId: userId,
        dynamicVariables: dynamicVariables ??
            <String, dynamic>{
              'userId': userId,
              'userID': userId,
            },
        overrides: overrides,
      );
    } catch (e) {
      lastError = e.toString();
      notifyListeners();
      onError?.call(e.toString());
    }
  }

  /// End the current conversation session.
  Future<void> stop() async {
    try {
      await _client.endSession();
    } catch (_) {
      // Best-effort cleanup
    }
    _messages.clear();
    audioLevel = 0.0;
    lastError = null;
    notifyListeners();
  }

  /// Toggle connection on/off.
  Future<void> toggle({
    required String userId,
    Map<String, dynamic>? dynamicVariables,
    ConversationOverrides? overrides,
  }) async {
    switch (_client.status) {
      case ConversationStatus.disconnected:
      case ConversationStatus.disconnecting:
        await start(
          userId: userId,
          dynamicVariables: dynamicVariables,
          overrides: overrides,
        );
      case ConversationStatus.connecting:
      case ConversationStatus.connected:
        await stop();
    }
  }

  /// Mute/unmute the microphone.
  Future<void> setMuted(bool muted) async {
    await _client.setMicMuted(muted);
  }

  Future<void> toggleMute() async {
    await _client.toggleMute();
  }

  /// Send a text message during the conversation.
  void sendMessage(String text) {
    _client.sendUserMessage(text);
  }

  /// Send contextual info (invisible to user, visible to agent).
  void sendContextualUpdate(String text) {
    _client.sendContextualUpdate(text);
  }

  /// Send feedback for the last agent response.
  void sendFeedback(bool isPositive) {
    _client.sendFeedback(isPositive: isPositive);
  }

  @override
  void dispose() {
    _client.removeListener(notifyListeners);
    _client.dispose();
    super.dispose();
  }
}

/// Shared preferences helper for permission tracking.
class UserDefaultsHelper {
  static bool get wasMicPermissionShown =>
      false; // Placeholder — use SharedPreferences in production

  static void markMicPermissionShown() {
    // In production, persist to SharedPreferences
  }
}
