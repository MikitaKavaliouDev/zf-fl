import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_message.freezed.dart';

/// A single message in the voice coach conversation transcript.
@freezed
abstract class VoiceMessage with _$VoiceMessage {
  const factory VoiceMessage({
    required String id,
    required VoiceMessageRole role,
    required String content,
    required DateTime timestamp,
  }) = _VoiceMessage;
}

enum VoiceMessageRole { user, agent }
