# Voice Coach — ElevenLabs Conversational AI Agent

## OVERVIEW

AI voice coaching via ElevenLabs `ConversationClient`. Capsule-shaped mic button toggles a real-time voice conversation. Two widget variants: full `VoiceCoachButton` (capsule) and `VoiceCoachCompactButton` (56px circle for workout control bar).

## STRUCTURE

```
cubit/                          — VoiceCoachCubit + VoiceCoachState (sealed)
data/
  services/
    voice_coach_service.dart     — Wraps elevenlabs_agents ConversationClient
    voice_settings_api_service.dart — Dio CRUD for voice selection
  models/
    voice_message.dart           — Freezed: id, role (user/agent), content, timestamp
    voice_settings_dto.dart      — Freezed: VoiceSettingsValues, VoiceSettingsResponseDto, VoiceDto
presentation/
  widgets/
    voice_coach_button.dart      — Capsule FAB with pulse animation
    voice_coach_compact_button.dart — Compact circle for workout overlay
```

## KEY COMPONENTS

| File | Lines | Role |
|---|---|---|
| `voice_coach_cubit.dart` | 209 | Lifecycle: configure → start/stop/toggle → emit state. Listens to WorkoutRealtimeService for AI tool events. |
| `voice_coach_state.dart` | 28 | Sealed: `disconnected`, `connecting`, `connected(messages, audioLevel, agentState, conversationId?)`, `error(message)`. Sub-enum `VoiceCoachAgentState` = `listening|thinking|speaking|unknown`. |
| `voice_coach_service.dart` | 227 | `@lazySingleton ChangeNotifier`. Owns `ConversationClient`. Callbacks: onConnect/onDisconnect/onMessage/onModeChange/onVadScore/onError. Hardcoded agent ID: `agent_3501ksjc2xtnemsbkta6xfm7hg7x`. |
| `voice_settings_api_service.dart` | 50 | `@injectable`. GET/PUT `/api/user/voice-settings`, GET `/api/ai-trainer/voices`. Default voice ID: `JBFqnCBsd9RMbkH7EtoT`. |
| `voice_coach_button.dart` | 267 | Capsule (rounded-99). Color: indigo=disconnected, blue=connecting, red=connected, orange=error. Pulse animation when connected. Mic permission bottom sheet on first tap. |
| `voice_coach_compact_button.dart` | 234 | 56px circle. Same states/colors/pulse as capsule. Used in workout screen control bar. |

## INTEGRATION POINTS

- **main.dart `_ZiroFitAppState`**: Creates `VoiceCoachCubit` via DI at init, calls `.configure(userId:)` on `AuthAuthenticated`, provides via `BlocProvider.value`. Closes on app dispose.
- **DI**: `VoiceCoachService` = `@lazySingleton`, `VoiceCoachCubit` = `@injectable` (factory, gets `VoiceCoachService` + `WorkoutRealtimeService`).
- **WorkoutSessionScreen**: Comment noting realtime subscription lifecycle is managed by VoiceCoachCubit (line 89).
- **Realtime**: Cubit subscribes to `WorkoutRealtimeService.events` on connect, unsubscribes on disconnect/error.

## DEPENDENCIES

- `elevenlabs_agents: ^0.6.1` — `ConversationClient`, `ConversationCallbacks`, `ConversationMode`, `ConversationStatus`
- `permission_handler` — microphone permission request/grant check
