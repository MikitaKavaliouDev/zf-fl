# Trainer Mode Porting — Implementation Plan

## Status: Pre-Implementation Plan
## Last Verified: 2026-07-01 — All 60+ backend endpoints read and contract-verified

---

## 1. Overview

Port the iOS trainer role (`V:\Ziro-Fit`) to the existing Flutter client app (`V:\zf-fl`). The Flutter app already has full client mode — this plan adds the **trainer role** as a parallel mode sharing ~60% of infrastructure.

### Architecture Decision: Single App, Dual Mode

- One Flutter app. One GoRouter.
- Auth determines mode: `user.role == "trainer"` → trainer shell, `"client"` → client shell.
- Shared: `lib/core/` (100%), auth (95%), workout session, notifications, sync engine, Drift DB, theme.

---

## 2. Milestone Map

| # | Milestone | Files New/Modified | Dependencies |
|---|-----------|-------------------|--------------|
| 1 | Auth routing + Trainer Tab Shell | 4 | None |
| 2 | Trainer Dashboard | 5 | Milestone 1 |
| 3 | Calendar (3 views + session creation) | 8 | Milestone 1 |
| 4 | Clients list + detail + program assign | 10 | Milestone 1 |
| 5 | Trainer Programs library + detail | 8 | Milestone 1 |
| 6 | More/Settings screen | 4 | Milestone 1 |
| 7 | Check-in review + nutrition + vault + events | 12 | Milestones 1, 4 |

---

## 3. PHASE 1 — Dual-Mode Auth & Tab Shell

### 3.1 Files to Create

#### `lib/core/models/app_mode.dart` (new)
```dart
enum AppMode { client, trainer }

extension AppModeX on AppMode {
  bool get isTrainer => this == AppMode.trainer;
  bool get isClient => this == AppMode.client;
}
```

#### `lib/features/trainer/presentation/trainer_shell.dart` (new)
- Scaffold with BottomNavigationBar (5 tabs: Calendar, Programs, Dashboard, Clients, More)
- Stack overlay with WorkoutMiniPlayer (same pattern as `_MainShell` in `app_router.dart`)
- Uses `StatefulNavigationShell` from GoRouter
- **Tab bar items**:
  1. Calendar — `Icons.calendar_month_outlined` / `Icons.calendar_month_rounded`
  2. Programs — `Icons.fitness_center_outlined` / `Icons.fitness_center_rounded`
  3. Dashboard — `Icons.home_outlined` / `Icons.home_rounded`
  4. Clients — `Icons.people_outlined` / `Icons.people_rounded`
  5. More — `Icons.more_horiz_outlined` / `Icons.more_horiz_rounded`

### 3.2 Files to Modify

#### `lib/features/auth/cubit/auth_state.dart` (modify)
- Add `@Default(false) bool isTrainer` to `AuthAuthenticated`
- Derive from `user.role == 'trainer'`

Example:
```dart
const factory AuthState.authenticated({
  required User user,
  @Default(false) bool isOffline,
  @Default(false) bool isTrainer,
}) = AuthAuthenticated;
```

#### `lib/features/auth/cubit/auth_cubit.dart` (modify — ~5 lines)
- In `_routeByUserState()`:
```dart
void _routeByUserState(User user) {
  if (user.role == 'pending') {
    emit(AuthState.pendingRole(user: user));
  } else if (!user.hasCompletedOnboarding) {
    emit(AuthState.needsOnboarding(user: user));
  } else {
    emit(AuthState.authenticated(
      user: user,
      isTrainer: user.role == 'trainer',
    ));
  }
}
```

#### `lib/core/router/app_router.dart` (modify)
- Add import for `TrainerShell`
- Add second `StatefulShellRoute.indexedStack` for trainer tabs
- Modify `redirect` to check `authState is AuthAuthenticated && authState.isTrainer`
- Trainer shell routes:
  1. `/trainer/calendar` → `TrainerDashboardScreen` (placeholder — real screens later)
  2. `/trainer/programs`
  3. `/trainer/dashboard`
  4. `/trainer/clients`
  5. `/trainer/more`
- Trainer routes are under `/trainer/` prefix to avoid conflicts with client routes

#### `lib/core/di/injection.dart` (verify)
- No changes needed unless new injectable services are added during implementation

### 3.3 Verification — Phase 1

```bash
# 1. Start backend
cd V:\zirofit-next && npm run dev

# 2. Login as trainer via API
curl -X POST http://localhost:3321/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"ada@ziro.fit","password":"password123"}'
# → Confirm accessToken returned, role="trainer"

# 3. Run Flutter
cd V:\zf-fl && flutter run
```

### 3.4 Files Map

| Action | Path | Lines |
|--------|------|-------|
| CREATE | `lib/core/models/app_mode.dart` | ~15 |
| CREATE | `lib/features/trainer/presentation/trainer_shell.dart` | ~120 |
| MODIFY | `lib/features/auth/cubit/auth_state.dart` | +1 param |
| MODIFY | `lib/features/auth/cubit/auth_cubit.dart` | +5 lines |
| MODIFY | `lib/core/router/app_router.dart` | +80 lines (trainer routes) |

---

## 4. DTO Definitions (Complete — Verified from Backend Contracts)

> All DTOs go in `lib/features/trainer/data/models/`.
> Use freezed + json_serializable. Follow `User` / `AuthResponse` patterns.

### 4.1 Calendar

```dart
// trainer_calendar_event_dto.dart
@freezed
class TrainerCalendarEventDto with _$TrainerCalendarEventDto {
  const factory TrainerCalendarEventDto({
    required String id,
    required String title,
    required String start,        // ISO string from API
    required String end,          // ISO string (falls back to start+1h)
    required String type,         // "booking" | "session_planned" | "session_completed" | "session_in_progress"
    String? clientId,
    required String clientName,
    String? clientAvatarUrl,
    String? notes,
    String? templateId,
    String? templateName,
  }) = _TrainerCalendarEventDto;
  factory TrainerCalendarEventDto.fromJson(Map<String, dynamic> json) => _$TrainerCalendarEventDtoFromJson(json);
}

// trainer_calendar_session_response_dto.dart (for PUT response)
// Same as above but also has status field and no templateId/templateName

// create_session_request_dto.dart
@freezed
class CreateSessionRequestDto with _$CreateSessionRequestDto {
  const factory CreateSessionRequestDto({
    required String clientId,
    required String startTime,
    required String endTime,
    String? notes,
    String? templateId,
    @Default(false) bool repeats,
    int? repeatWeeks,
    List<int>? repeatDays,
    int? clientStartDay,
  }) = _CreateSessionRequestDto;
  factory CreateSessionRequestDto.fromJson(Map<String, dynamic> json) => _$CreateSessionRequestDtoFromJson(json);
}

// update_session_request_dto.dart
@freezed
class UpdateSessionRequestDto with _$UpdateSessionRequestDto {
  const factory UpdateSessionRequestDto({
    required String startTime,
    required String endTime,
    String? notes,
    String? templateId,
  }) = _UpdateSessionRequestDto;
  factory UpdateSessionRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateSessionRequestDtoFromJson(json);
}

// client_summary_item_dto.dart (for calendar grid)
@freezed
class ClientSummaryItemDto with _$ClientSummaryItemDto {
  const factory ClientSummaryItemDto({
    required String date,
    required String clientId,
    required String clientFirstName,
    required String clientLastName,
    String? clientAvatarUrl,
  }) = _ClientSummaryItemDto;
  factory ClientSummaryItemDto.fromJson(Map<String, dynamic> json) => _$ClientSummaryItemDtoFromJson(json);
}
```

### 4.2 Clients

```dart
// trainer_client_list_item_dto.dart
@freezed
class TrainerClientListItemDto with _$TrainerClientListItemDto {
  const factory TrainerClientListItemDto({
    required String id,
    required String name,
    String? email,          // omitted (not null) when missing
    String? phone,
    required String status,  // "active" | "inactive" | "pending"
    String? userId,
    String? avatarUrl,
    String? lastWorkoutDate,
    required String engagementScore, // "high" | "medium" | "low"
    String? activeProgramName,
  }) = _TrainerClientListItemDto;
  factory TrainerClientListItemDto.fromJson(Map<String, dynamic> json) => _$TrainerClientListItemDtoFromJson(json);
}

// trainer_client_detail_dto.dart
@freezed
class TrainerClientDetailDto with _$TrainerClientDetailDto {
  const factory TrainerClientDetailDto({
    required String id,
    required String name,
    String? email,
    String? phone,
    required String status,
    required String createdAt,
    int? checkInDay,
    int? checkInHour,
    String? dateOfBirth,
    String? goals,
    String? healthNotes,
    String? emergencyContactName,
    String? emergencyContactPhone,
  }) = _TrainerClientDetailDto;
  factory TrainerClientDetailDto.fromJson(Map<String, dynamic> json) => _$TrainerClientDetailDtoFromJson(json);
}

// update_client_request_dto.dart
@freezed
class UpdateClientRequestDto with _$UpdateClientRequestDto {
  const factory UpdateClientRequestDto({
    String? name,
    String? email,
    String? phone,
    String? status,
    int? checkInDay,
    int? checkInHour,
  }) = _UpdateClientRequestDto;
  factory UpdateClientRequestDto.fromJson(Map<String, dynamic> json) => _$UpdateClientRequestDtoFromJson(json);
}

// assign_program_request_dto.dart
@freezed
class AssignProgramRequestDto with _$AssignProgramRequestDto {
  const factory AssignProgramRequestDto({
    required String programId,
    String? startDate,
    @Default("3 sessions / week") String frequency,
  }) = _AssignProgramRequestDto;
  factory AssignProgramRequestDto.fromJson(Map<String, dynamic> json) => _$AssignProgramRequestDtoFromJson(json);
}

// assign_program_response_dto.dart
@freezed
class AssignProgramResponseDto with _$AssignProgramResponseDto {
  const factory AssignProgramResponseDto({
    required dynamic assignment,
    required int sessionCount,
  }) = _AssignProgramResponseDto;
  factory AssignProgramResponseDto.fromJson(Map<String, dynamic> json) => _$AssignProgramResponseDtoFromJson(json);
}
```

### 4.3 Client Analytics

```dart
// client_analytics_dto.dart
@freezed
class ClientAnalyticsDto with _$ClientAnalyticsDto {
  const factory ClientAnalyticsDto({
    required List<String> heatmapDates,
    required List<VolumeHistoryItem> volumeHistory,
    required List<MuscleDistributionItem> muscleDistribution,
    required List<RecentPrItem> recentPRs,
    required double consistency,
  }) = _ClientAnalyticsDto;
  factory ClientAnalyticsDto.fromJson(Map<String, dynamic> json) => _$ClientAnalyticsDtoFromJson(json);
}

@freezed
class VolumeHistoryItem with _$VolumeHistoryItem {
  const factory VolumeHistoryItem({
    required String date,
    required double volume,
  }) = _VolumeHistoryItem;
  factory VolumeHistoryItem.fromJson(Map<String, dynamic> json) => _$VolumeHistoryItemFromJson(json);
}

@freezed
class MuscleDistributionItem with _$MuscleDistributionItem {
  const factory MuscleDistributionItem({
    required String muscle,
    required int count,
  }) = _MuscleDistributionItem;
  factory MuscleDistributionItem.fromJson(Map<String, dynamic> json) => _$MuscleDistributionItemFromJson(json);
}

@freezed
class RecentPrItem with _$RecentPrItem {
  const factory RecentPrItem({
    required String exercise,
    required double value,
    required String type,
    required String date,
  }) = _RecentPrItem;
  factory RecentPrItem.fromJson(Map<String, dynamic> json) => _$RecentPrItemFromJson(json);
}
```

### 4.4 Client Habits

```dart
// trainer_habit_dto.dart
@freezed
class TrainerHabitDto with _$TrainerHabitDto {
  const factory TrainerHabitDto({
    required String id,
    required String clientId,
    required String trainerId,
    required String title,
    String? description,
    required String frequency, // "DAILY" | "WEEKLY"
    required bool isActive,
    @Default([]) List<TrainerHabitLogDto> logs,
    required String createdAt,
    required String updatedAt,
    String? deletedAt,
  }) = _TrainerHabitDto;
  factory TrainerHabitDto.fromJson(Map<String, dynamic> json) => _$TrainerHabitDtoFromJson(json);
}

// trainer_habit_log_dto.dart
@freezed
class TrainerHabitLogDto with _$TrainerHabitLogDto {
  const factory TrainerHabitLogDto({
    required String id,
    required String habitId,
    required String clientId,
    required String date,
    required bool isCompleted,
    String? note,
  }) = _TrainerHabitLogDto;
  factory TrainerHabitLogDto.fromJson(Map<String, dynamic> json) => _$TrainerHabitLogDtoFromJson(json);
}

// create_habit_request_dto.dart
@freezed
class CreateHabitRequestDto with _$CreateHabitRequestDto {
  const factory CreateHabitRequestDto({
    required String title,
    String? description,
    @Default("DAILY") String frequency,
  }) = _CreateHabitRequestDto;
  factory CreateHabitRequestDto.fromJson(Map<String, dynamic> json) => _$CreateHabitRequestDtoFromJson(json);
}
```

### 4.5 Nutrition Plan (Trainer-Managed)

```dart
// trainer_nutrition_plan_dto.dart
@freezed
class TrainerNutritionPlanDto with _$TrainerNutritionPlanDto {
  const factory TrainerNutritionPlanDto({
    required String id,
    String? programId,
    required String title,
    int? calories,
    int? protein,
    int? carbs,
    int? fats,
    String? mealNotes,
    String? habitNotes,
    String? foodsToEat,
    String? foodsToAvoid,
    String? mealTiming,
    String? hydration,
    String? supplements,
    required bool isActive,
    required String createdAt,
  }) = _TrainerNutritionPlanDto;
  factory TrainerNutritionPlanDto.fromJson(Map<String, dynamic> json) => _$TrainerNutritionPlanDtoFromJson(json);
}

// upsert_nutrition_plan_request_dto.dart
@freezed
class UpsertNutritionPlanRequestDto with _$UpsertNutritionPlanRequestDto {
  const factory UpsertNutritionPlanRequestDto({
    required String title,
    int? calories,
    int? protein,
    int? carbs,
    int? fats,
    String? mealNotes,
    String? habitNotes,
    String? foodsToEat,
    String? foodsToAvoid,
    String? mealTiming,
    String? hydration,
    String? supplements,
    bool? isActive,
    String? programId,
  }) = _UpsertNutritionPlanRequestDto;
  factory UpsertNutritionPlanRequestDto.fromJson(Map<String, dynamic> json) => _$UpsertNutritionPlanRequestDtoFromJson(json);
}
```

### 4.6 Programs & Templates

```dart
// trainer_program_brief_dto.dart
@freezed
class TrainerProgramBriefDto with _$TrainerProgramBriefDto {
  const factory TrainerProgramBriefDto({
    required String id,
    required String name,
    String? description,
    String? trainerId,
    String? category,
    required String createdAt,
    @Default([]) List<TrainerTemplateSummaryDto> templates,
  }) = _TrainerProgramBriefDto;
  factory TrainerProgramBriefDto.fromJson(Map<String, dynamic> json) => _$TrainerProgramBriefDtoFromJson(json);
}

// trainer_template_summary_dto.dart
@freezed
class TrainerTemplateSummaryDto with _$TrainerTemplateSummaryDto {
  const factory TrainerTemplateSummaryDto({
    required String id,
    required String name,
    String? description,
    required int order,
    required int exerciseCount,
  }) = _TrainerTemplateSummaryDto;
  factory TrainerTemplateSummaryDto.fromJson(Map<String, dynamic> json) => _$TrainerTemplateSummaryDtoFromJson(json);
}

// active_program_item_dto.dart
@freezed
class ActiveProgramItemDto with _$ActiveProgramItemDto {
  const factory ActiveProgramItemDto({
    required String programId,
    required String programName,
    required String clientId,
    required String clientName,
    String? clientAvatarUrl,
    required String assignedDate,
    required int currentWeek,
    required int totalWeeks,
    required int sessionsCompleted,
    required int totalSessions,
    required double completionRate,
    String? nextSessionDate,
    required String status, // "active" | "completed"
  }) = _ActiveProgramItemDto;
  factory ActiveProgramItemDto.fromJson(Map<String, dynamic> json) => _$ActiveProgramItemDtoFromJson(json);
}

// program_analytics_dto.dart
@freezed
class ProgramAnalyticsDto with _$ProgramAnalyticsDto {
  const factory ProgramAnalyticsDto({
    required double completionRate,
    required int totalSessions,
    required int completedSessions,
    required int activeClients,
    required String targetFrequency,
    required double averageProgress,
  }) = _ProgramAnalyticsDto;
  factory ProgramAnalyticsDto.fromJson(Map<String, dynamic> json) => _$ProgramAnalyticsDtoFromJson(json);
}
```

### 4.7 Session Creation Data

```dart
// session_creation_data_dto.dart
@freezed
class SessionCreationDataDto with _$SessionCreationDataDto {
  const factory SessionCreationDataDto({
    required List<SessionCreationClientDto> clients,
    required List<SessionCreationTemplateDto> templates,
  }) = _SessionCreationDataDto;
  factory SessionCreationDataDto.fromJson(Map<String, dynamic> json) => _$SessionCreationDataDtoFromJson(json);
}

@freezed
class SessionCreationClientDto with _$SessionCreationClientDto {
  const factory SessionCreationClientDto({
    required String id,
    required String name,
    required int availableCredits,
  }) = _SessionCreationClientDto;
  factory SessionCreationClientDto.fromJson(Map<String, dynamic> json) => _$SessionCreationClientDtoFromJson(json);
}

@freezed
class SessionCreationTemplateDto with _$SessionCreationTemplateDto {
  const factory SessionCreationTemplateDto({
    required String id,
    required String name,
    required SessionCreationProgramRef program,
  }) = _SessionCreationTemplateDto;
  factory SessionCreationTemplateDto.fromJson(Map<String, dynamic> json) => _$SessionCreationTemplateDtoFromJson(json);
}

@freezed
class SessionCreationProgramRef with _$SessionCreationProgramRef {
  const factory SessionCreationProgramRef({
    String? trainerId,
  }) = _SessionCreationProgramRef;
  factory SessionCreationProgramRef.fromJson(Map<String, dynamic> json) => _$SessionCreationProgramRefFromJson(json);
}
```

### 4.8 Check-ins

```dart
// trainer_check_in_list_item_dto.dart
@freezed
class TrainerCheckInListItemDto with _$TrainerCheckInListItemDto {
  const factory TrainerCheckInListItemDto({
    required String id,
    required String clientId,
    required String date,
    required String status,  // "SUBMITTED" | "REVIEWED"
    String? trainerResponse,
    String? reviewedAt,
    required CheckInClientRef client,
  }) = _TrainerCheckInListItemDto;
  factory TrainerCheckInListItemDto.fromJson(Map<String, dynamic> json) => _$TrainerCheckInListItemDtoFromJson(json);
}

@freezed
class CheckInClientRef with _$CheckInClientRef {
  const factory CheckInClientRef({
    required String id,
    required String name,
    String? avatarPath,
  }) = _CheckInClientRef;
  factory CheckInClientRef.fromJson(Map<String, dynamic> json) => _$CheckInClientRefFromJson(json);
}

// review_check_in_request_dto.dart
@freezed
class ReviewCheckInRequestDto with _$ReviewCheckInRequestDto {
  const factory ReviewCheckInRequestDto({
    required String trainerResponse,
  }) = _ReviewCheckInRequestDto;
  factory ReviewCheckInRequestDto.fromJson(Map<String, dynamic> json) => _$ReviewCheckInRequestDtoFromJson(json);
}
```

### 4.9 Resource Vault

```dart
// resource_vault_item_dto.dart
@freezed
class ResourceVaultItemDto with _$ResourceVaultItemDto {
  const factory ResourceVaultItemDto({
    required String id,
    required String title,
    String? description,
    required String fileUrl,
    required String fileType, // "PDF" | "VIDEO" | "LINK"
    required String createdAt,
  }) = _ResourceVaultItemDto;
  factory ResourceVaultItemDto.fromJson(Map<String, dynamic> json) => _$ResourceVaultItemDtoFromJson(json);
}
```

### 4.10 Events

```dart
// trainer_event_dto.dart
@freezed
class TrainerEventDto with _$TrainerEventDto {
  const factory TrainerEventDto({
    required String id,
    required String title,
    required String startTime,
    required String endTime,
    required double price,
    required int capacity,
    required String locationName,
    required String address,
    String? city,
    String? description,
    double? latitude,
    double? longitude,
    String? imageUrl,
    String? category,
    required String createdAt,
  }) = _TrainerEventDto;
  factory TrainerEventDto.fromJson(Map<String, dynamic> json) => _$TrainerEventDtoFromJson(json);
}
```

### 4.11 Recipes

```dart
// trainer_recipe_dto.dart
@freezed
class TrainerRecipeDto with _$TrainerRecipeDto {
  const factory TrainerRecipeDto({
    required String id,
    required String name,
    String? description,
    String? instructions,
    double? proteinG,
    double? carbsG,
    double? fatG,
    int? calories,
    String? difficulty,
    int? prepTime,
    int? cookTime,
    required bool isPublished,
    @Default([]) List<RecipeTagDto> tags,
    @Default([]) List<ProductDto> products,
    required String createdAt,
  }) = _TrainerRecipeDto;
  factory TrainerRecipeDto.fromJson(Map<String, dynamic> json) => _$TrainerRecipeDtoFromJson(json);
}
```

### 4.12 Trainer Settings

```dart
// trainer_settings_dto.dart
@freezed
class TrainerSettingsDto with _$TrainerSettingsDto {
  const factory TrainerSettingsDto({
    required int defaultCheckInDay,
    required int defaultCheckInHour,
  }) = _TrainerSettingsDto;
  factory TrainerSettingsDto.fromJson(Map<String, dynamic> json) => _$TrainerSettingsDtoFromJson(json);
}
```

### 4.13 Assessments

```dart
// trainer_assessment_dto.dart
@freezed
class TrainerAssessmentDto with _$TrainerAssessmentDto {
  const factory TrainerAssessmentDto({
    required String id,
    required String name,
    String? description,
    required String unit,
    String? trainerId,
    required String createdAt,
  }) = _TrainerAssessmentDto;
  factory TrainerAssessmentDto.fromJson(Map<String, dynamic> json) => _$TrainerAssessmentDtoFromJson(json);
}
```

### 4.14 Preview Media

```dart
// trainer_preview_media_dto.dart
@freezed
class TrainerPreviewMediaDto with _$TrainerPreviewMediaDto {
  const factory TrainerPreviewMediaDto({
    required String id,
    required int order,
    required String type, // "image" | "video"
    required String url,
    String? thumbnailUrl,
    String? caption,
    required String createdAt,
  }) = _TrainerPreviewMediaDto;
  factory TrainerPreviewMediaDto.fromJson(Map<String, dynamic> json) => _$TrainerPreviewMediaDtoFromJson(json);
}
```

---

## 5. API Services — Complete Definitions

All services go in `lib/features/trainer/data/`. Use `@injectable` with Dio injection. Follow `AuthApiService` pattern.

### `TrainerCalendarApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `getEvents(startDate, endDate)` | `GET /api/trainer/calendar` | Returns `TrainerCalendarEventDto[]` |
| `createSession(request)` | `POST /api/trainer/calendar` | Returns `{ message }` |
| `updateSession(sessionId, request)` | `PUT /api/trainer/calendar/{id}` | Returns `CalendarSessionResponse` |
| `deleteSession(sessionId)` | `DELETE /api/trainer/calendar/{id}` | Returns `{ deletedId }` |
| `sendReminder(sessionId)` | `POST /api/trainer/calendar/sessions/{id}/remind` | Returns `{ message }` |
| `getClientsSummary(startDate, endDate)` | `GET /api/trainer/calendar/clients-summary` | Returns `ClientSummaryItemDto[]` |

### `TrainerClientsApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `getClients({search, sortBy, limit, cursor})` | `GET /api/trainer/clients` | Returns `TrainerClientListItemDto[] + isPremium` |
| `getClientDetail(clientId)` | `GET /api/trainer/clients/{id}` | Returns `TrainerClientDetailDto` |
| `updateClient(clientId, request)` | `PUT /api/trainer/clients/{id}` | Returns updated client |
| `deleteClient(clientId)` | `DELETE /api/trainer/clients/{id}` | Returns `{ message }` |
| `createClient(request)` | `POST /api/trainer/clients` | Returns new client (201) |
| `getClientAnalytics(clientId, {days})` | `GET /api/trainer/clients/{id}/analytics` | Returns `ClientAnalyticsDto` |
| `getHabits(clientId)` | `GET /api/trainer/clients/{id}/habits` | Returns `TrainerHabitDto[]` |
| `createHabit(clientId, request)` | `POST /api/trainer/clients/{id}/habits` | Returns `TrainerHabitDto` |
| `updateHabit(clientId, habitId, request)` | `PUT /api/trainer/clients/{id}/habits/{habitId}` | Returns `TrainerHabitDto` |
| `deleteHabit(clientId, habitId)` | `DELETE /api/trainer/clients/{id}/habits/{habitId}` | Returns `{ message }` |
| `logHabit(clientId, habitId, request)` | `POST /api/trainer/clients/{id}/habits/{habitId}/log` | Returns `TrainerHabitLogDto` |
| `getNutritionPlan(clientId)` | `GET /api/trainer/clients/{id}/nutrition` | Returns `TrainerNutritionPlanDto` or null |
| `upsertNutritionPlan(clientId, request)` | `POST /api/trainer/clients/{id}/nutrition` | UPSERTS. Returns `TrainerNutritionPlanDto` |
| `assignProgram(clientId, request)` | `POST /api/trainer/clients/{id}/assign-program` | Returns `AssignProgramResponseDto` |
| `cancelProgram(clientId, programId)` | `POST /api/trainer/clients/{id}/programs/{programId}/cancel` | Returns `{ message, cancelledSessions }` |
| `acceptLinkRequest(notificationId)` | `POST /api/trainer/link-requests/{id}/accept` | Complex merge logic (backend side) |
| `declineLinkRequest(notificationId)` | `POST /api/trainer/link-requests/{id}/decline` | Returns `{ message }` |

### `TrainerProgramsApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `getPrograms({lightweight})` | `GET /api/trainer/programs` | Returns user + system programs/templates |
| `createProgram(request)` | `POST /api/trainer/programs` | Returns `ProgramDto` |
| `deleteProgram(programId)` | `DELETE /api/trainer/programs/{id}` | Returns `{ message }` |
| `getActivePrograms()` | `GET /api/trainer/programs/active` | Returns `ActiveProgramItemDto[]` |
| `getProgramAnalytics(programId)` | `GET /api/trainer/programs/{id}/analytics` | Returns `ProgramAnalyticsDto` |
| `getTemplates()` | `GET /api/trainer/programs/templates` | Returns lightweight template list |
| `createTemplate(request)` | `POST /api/trainer/programs/templates` | Returns template |
| `deleteTemplate(templateId)` | `DELETE /api/trainer/programs/templates/{id}` | Returns `{ message }` |
| `addExercise(templateId, request)` | `POST /api/trainer/programs/templates/{id}/exercises` | Returns `TemplateExerciseDto` |
| `updateExercise(templateId, stepId, request)` | `PUT /api/trainer/programs/templates/{id}/exercises/{stepId}` | Returns updated step |
| `deleteExercise(templateId, stepId)` | `DELETE /api/trainer/programs/templates/{id}/exercises/{stepId}` | Returns `{ message }` |
| `addRestStep(templateId, request)` | `POST /api/trainer/programs/templates/{id}/rest` | Returns `TemplateExerciseDto` |
| `copyTemplate(templateId)` | `POST /api/trainer/programs/templates/{id}/copy` | Returns `{ newTemplate, newProgram? }` |
| `getWorkoutTemplates({page, limit})` | `GET /api/trainer/workout-templates` | Paginated. Returns + meta |

### `TrainerCheckInApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `listCheckIns({status, checkInType})` | `GET /api/trainer/check-ins` | Returns `TrainerCheckInListItemDto[]` |
| `getCheckInDetail(id)` | `GET /api/trainer/check-ins/{id}` | Returns `{ current, previous?, history[] }` |
| `deleteCheckIn(id)` | `DELETE /api/trainer/check-ins/{id}` | Returns `{ message }` |
| `reviewCheckIn(id, request)` | `PATCH /api/trainer/check-ins/{id}/review` | Returns updated check-in |
| `listPending()` | `GET /api/trainer/check-ins/pending` | Returns `TrainerCheckInListItemDto[]` |
| `createRequest(request)` | `POST /api/trainer/check-ins/request` | Check-in request CRUD |
| `listRequests({status})` | `GET /api/trainer/check-ins/requests` | Returns requests |
| `cancelRequest(id)` | `DELETE /api/trainer/check-ins/requests/{id}` | Returns `{ message }` |
| `upsertSchedule(request)` | `POST /api/trainer/check-ins/schedule` | Returns schedule |
| `getClientSchedule(clientId)` | `GET /api/trainer/check-ins/schedule/{clientId}` | Returns schedule |

### `TrainerResourceVaultApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `listResources()` | `GET /api/trainer/resource-vault` | Returns `ResourceVaultItemDto[]` |
| `createResource(request)` | `POST /api/trainer/resource-vault` | Returns `ResourceVaultItemDto` |
| `deleteResource(id)` | `DELETE /api/trainer/resource-vault/{id}` | Returns `{ message }` |
| `assignResource(resourceId, clientId)` | `POST /api/trainer/resource-vault/{id}/assign` | Returns assignment |
| `unassignResource(resourceId, clientId)` | `POST /api/trainer/resource-vault/{id}/unassign` | Returns `{ message }` |

### `TrainerEventsApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `listEvents()` | `GET /api/trainer/events` | Returns `TrainerEventDto[]` |
| `createEvent(request)` | `POST /api/trainer/events` | Returns `TrainerEventDto` |
| `updateEvent(id, request)` | `PUT /api/trainer/events/{id}` | Returns `TrainerEventDto` |
| `deleteEvent(id)` | `DELETE /api/trainer/events/{id}` | Returns `{ message }` |
| `uploadEventImage(file)` | `POST /api/trainer/events/upload` | Multipart. Returns `{ imagePath, publicUrl }` |
| `lookupCheckIn(bookingId)` | `GET /api/trainer/events/check-in` | Returns booking+event+attendee |
| `confirmCheckIn(bookingId)` | `POST /api/trainer/events/check-in` | Returns `{ success, checkedInAt, bookingId }` |

### `TrainerRecipesApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `listRecipes()` | `GET /api/trainer/recipes` | Returns `TrainerRecipeDto[]` |
| `getRecipe(id)` | `GET /api/trainer/recipes/{id}` | Returns `TrainerRecipeDto` |
| `createRecipe(request)` | `POST /api/trainer/recipes` | Returns `TrainerRecipeDto` |
| `updateRecipe(id, request)` | `PUT /api/trainer/recipes/{id}` | Returns `TrainerRecipeDto` |
| `deleteRecipe(id)` | `DELETE /api/trainer/recipes/{id}` | Returns `{ message }` |

### `TrainerMiscApiService`
| Method | Endpoint | Notes |
|--------|----------|-------|
| `getSessionCreationData()` | `GET /api/trainer/session-creation-data` | Returns dropdown data |
| `getSettings()` | `GET /api/trainer/settings` | Returns `TrainerSettingsDto` |
| `updateSettings(request)` | `PATCH /api/trainer/settings` | Returns `TrainerSettingsDto` |
| `getTrainerProfile()` | `GET /api/trainer/profile` | Returns full profile |
| `listAssessments()` | `GET /api/trainer/assessments` | Returns `TrainerAssessmentDto[]` |
| `createAssessment(request)` | `POST /api/trainer/assessments` | Returns `TrainerAssessmentDto` |
| `getPreviewMedia(trainerId)` | `GET /api/trainer/preview/{trainerId}` | PUBLIC. Returns `TrainerPreviewMediaDto[]` |
| `uploadPreviewMedia(file, {caption, order})` | `POST /api/trainer/preview/media` | Multipart. Returns media |
| `deletePreviewMedia(id)` | `DELETE /api/trainer/preview/media/{id}` | Returns `{ message }` |
| `reorderPreviewMedia(orderIds)` | `PUT /api/trainer/preview/media/{id}/reorder` | Returns `{ message }` |
| `submitSessionFeedback(sessionId, notes)` | `PUT /api/trainer/sessions/{id}/feedback` | Returns `{ id, trainerNotes, trainerNotesUpdatedAt }` |

---

## 6. PHASE 2 — Trainer Dashboard

### 6.1 Files to Create

#### `lib/features/trainer/data/trainer_dashboard_api_service.dart`
- `GET /api/trainer/calendar/clients-summary?startDate=...&endDate=...` — today's client count
- `GET /api/trainer/programs/active` — active programs across all clients
- `GET /api/trainer/calendar?startDate=...&endDate=...` — today's events/sessions

#### `lib/features/trainer/cubit/trainer_dashboard_cubit.dart`
- State: sealed `TrainerDashboardState` (initial, loading, loaded, error)
- `loadDashboard()` → parallel fetch: clients summary + active programs + today's events
- `refresh()` → pull-to-refresh

#### `lib/features/trainer/presentation/dashboard/trainer_dashboard_screen.dart`
- Today's date header + greeting
- Upcoming sessions row (horizontal scroll, cards)
- Active programs summary (progress cards per client)
- Quick stats row (active clients, pending check-ins, upcoming sessions count)
- Pull-to-refresh

### 6.2 iOS Reference
- `V:\Ziro-Fit\Ziro Fit\Views\Trainer\DashboardView.swift` (433 lines)
  - Quick stats cards row
  - Today's sessions section
  - Pending check-ins section
  - Active programs section
  - Quick actions (Create Session, Check-in Review, etc.)

### 6.3 Verification
```bash
curl -X GET "http://localhost:3321/api/trainer/calendar/clients-summary?startDate=2026-07-01&endDate=2026-07-01" \
  -H "Authorization: Bearer <trainer_token>"
# → Confirm returns { data: { summary: [...] } }

curl -X GET "http://localhost:3321/api/trainer/programs/active" \
  -H "Authorization: Bearer <trainer_token>"
# → Confirm returns { data: { activePrograms: [...] } }
```

---

## 7. PHASE 3 — Calendar (3 Views + Session Creation)

### 7.1 Files to Create

#### `lib/features/trainer/cubit/trainer_calendar_cubit.dart`
- State: sealed `TrainerCalendarState` (initial, loading, loaded, error)
- `loadEvents(startDate, endDate)` → `GET /api/trainer/calendar`
- `createSession(request)` → `POST /api/trainer/calendar`
- `updateSession(id, request)` → `PUT /api/trainer/calendar/{id}`
- `deleteSession(id)` → `DELETE /api/trainer/calendar/{id}`
- `sendReminder(sessionId)` → `POST /api/trainer/calendar/sessions/{id}/remind`
- `loadClientsSummary(startDate, endDate)` → `GET .../calendar/clients-summary`
- `loadSessionCreationData()` → `GET /api/trainer/session-creation-data`

#### `lib/features/trainer/presentation/calendar/`
- `trainer_calendar_screen.dart` — main screen with mode toggle (Agenda / Day / Month)
- `trainer_agenda_view.dart` — vertical scrolling list grouped by date
- `trainer_day_view.dart` — single-day timeline (hour slots)
- `trainer_month_view.dart` — month grid with client circles per day cell
- `trainer_event_card.dart` — card for session/booking display
- `trainer_create_session_sheet.dart` — modal bottom sheet with client picker, template picker, date/time, repeat options

### 7.2 iOS Reference
- `V:\Ziro-Fit\Ziro Fit\Views\Trainer\CalendarView.swift` (780 lines)
  - Segmented control: Agenda / Day / Month
  - Agenda: grouped sessions list
  - Day: hour-based timeline
  - Month: grid with overlapping client circles
  - Create session via "+" button → sheet modal

### 7.3 Verification
```bash
curl -X GET "http://localhost:3321/api/trainer/session-creation-data" \
  -H "Authorization: Bearer <trainer_token>"
# → Returns clients[] + templates[] for dropdowns
```

---

## 8. PHASE 4 — Clients List + Detail + Program Assignment

### 8.1 Files to Create

#### `lib/features/trainer/cubit/trainer_clients_cubit.dart`
- `loadClients()` → `GET /api/trainer/clients`
- `searchClients(query)` → same endpoint with `?search=`
- `loadClientDetail(id)` → `GET /api/trainer/clients/{id}`
- `updateClient(id, data)` → `PUT /api/trainer/clients/{id}`
- `deleteClient(id)` → `DELETE /api/trainer/clients/{id}`
- `assignProgram(clientId, request)` → `POST .../assign-program`
- `cancelProgram(clientId, programId)` → `POST .../cancel`

#### `lib/features/trainer/cubit/trainer_client_analytics_cubit.dart`
- `loadAnalytics(clientId, {days})` → `GET /api/trainer/clients/{id}/analytics`
- State: heatmap dates, volume history, muscle distribution, PRs, consistency

#### `lib/features/trainer/cubit/trainer_client_habits_cubit.dart`
- `loadHabits(clientId)` → `GET /api/trainer/clients/{id}/habits`
- `createHabit(clientId, request)` → `POST .../habits`
- `updateHabit(clientId, habitId, request)` → `PUT .../habits/{id}`
- `deleteHabit(clientId, habitId)` → `DELETE .../habits/{id}`

#### `lib/features/trainer/cubit/trainer_client_nutrition_cubit.dart`
- `loadPlan(clientId)` → `GET /api/trainer/clients/{id}/nutrition`
- `upsertPlan(clientId, request)` → `POST .../nutrition`

#### `lib/features/trainer/presentation/clients/`
- `trainer_clients_screen.dart` — searchable client list with status badges
- `trainer_client_detail_screen.dart` — client detail with segmented tabs:
  - Profile tab (info, edit)
  - Program tab (current program, assign new, cancel)
  - Analytics tab (charts: heatmap, volume, muscle, PRs)
  - Habits tab (list, add, toggle)
  - Nutrition tab (view/plan editor)
  - Check-ins tab (history)
- `trainer_assign_program_sheet.dart` — program picker + start date + frequency
- `trainer_habit_tile.dart` — habit row with toggle and delete
- `trainer_nutrition_plan_editor_sheet.dart` — full nutrition plan form

### 8.2 iOS Reference
- `V:\Ziro-Fit\Ziro Fit\Views\Trainer\ClientsView.swift` (260 lines)
- `V:\Ziro-Fit\Ziro Fit\Views\Trainer\ClientDetailView.swift`
  - Profile, Program, Analytics, Habits, Nutrition, Check-ins tabs

### 8.3 Verification
```bash
curl -X GET "http://localhost:3321/api/trainer/clients" \
  -H "Authorization: Bearer <trainer_token>"
# → Confirm clients list with isPremium

curl -X GET "http://localhost:3321/api/trainer/clients/{id}/analytics?days=30" \
  -H "Authorization: Bearer <trainer_token>"
# → Confirm analytics shape
```

---

## 9. PHASE 5 — Trainer Programs Library + Detail

### 9.1 Files to Create

#### `lib/features/trainer/cubit/trainer_programs_cubit.dart`
- `loadPrograms()` → `GET /api/trainer/programs`
- `createProgram(request)` → `POST /api/trainer/programs`
- `deleteProgram(id)` → `DELETE /api/trainer/programs/{id}`
- `loadActivePrograms()` → `GET .../programs/active`
- `loadProgramAnalytics(programId)` → `GET .../programs/{id}/analytics`
- `loadTemplates()` → `GET .../programs/templates`
- `createTemplate(request)` → `POST .../programs/templates`
- `deleteTemplate(templateId)` → `DELETE .../programs/templates/{id}`
- `copyTemplate(templateId)` → `POST .../programs/templates/{id}/copy`
- `addExercise(templateId, data)` → `POST .../templates/{id}/exercises`
- `updateExercise(templateId, stepId, data)` → `PUT .../exercises/{stepId}`
- `deleteExercise(templateId, stepId)` → `DELETE .../exercises/{stepId}`
- `addRestStep(templateId, duration)` → `POST .../templates/{id}/rest`

#### `lib/features/trainer/presentation/programs/`
- `trainer_programs_screen.dart` — program library (user programs + system programs sections)
- `trainer_program_detail_screen.dart` — program with templates list + analytics card
- `trainer_template_detail_screen.dart` — template with exercise list (reorder, edit, delete)
- `trainer_create_program_sheet.dart` — name + description
- `trainer_create_template_sheet.dart` — name + description + program picker
- `trainer_exercise_picker_sheet.dart` — reuse existing `ExercisePickerSheet` from `lib/features/trainers/presentation/widgets/exercise_picker_sheet.dart`
- `trainer_active_programs_screen.dart` — all active programs across clients

### 9.2 Reuse Note
- Share `ExercisePickerSheet` with existing workout flow
- Share `TemplateDto` with existing client program screens
- Program creation on trainer side also uses `POST /api/trainer/programs` (supports `client` and `trainer` roles)

### 9.3 iOS Reference
- `V:\Ziro-Fit\Ziro Fit\Views\Trainer\TrainerProgramsView.swift` (630 lines)

### 9.4 Verification
```bash
curl -X GET "http://localhost:3321/api/trainer/programs" \
  -H "Authorization: Bearer <trainer_token>"
# → Confirm userPrograms + systemPrograms + userTemplates + systemTemplates
```

---

## 10. PHASE 6 — More/Settings

### 10.1 Files to Create

#### `lib/features/trainer/cubit/trainer_settings_cubit.dart`
- `loadSettings()` → `GET /api/trainer/settings`
- `updateSettings(data)` → `PATCH /api/trainer/settings`

#### `lib/features/trainer/presentation/trainer_more_screen.dart`
- Profile section (name, email, avatar — from `GET /api/trainer/profile`)
- Settings: default check-in day, default check-in hour
- Link requests management (accept/decline)
- Sign out

### 10.2 iOS Reference
- `V:\Ziro-Fit\Ziro Fit\Views\Common\MoreView.swift` (838 lines)

### 10.3 Verification
```bash
curl -X GET "http://localhost:3321/api/trainer/settings" \
  -H "Authorization: Bearer <trainer_token>"
# → Returns { data: { defaultCheckInDay, defaultCheckInHour } }
```

---

## 11. PHASE 7 — Check-ins, Nutrition, Resource Vault, Events

### 11.1 Files to Create

#### `lib/features/trainer/cubit/trainer_check_ins_cubit.dart`
- `loadPending()` → `GET /api/trainer/check-ins/pending`
- `loadHistory()` → `GET /api/trainer/check-ins?status=REVIEWED`
- `getDetail(id)` → `GET /api/trainer/check-ins/{id}`
- `reviewCheckIn(id, response)` → `PATCH .../check-ins/{id}/review`
- `createRequest(clientId, type, dueDate)` → `POST .../check-ins/request`
- `loadSchedule(clientId)` → `GET .../check-ins/schedule/{clientId}`

#### `lib/features/trainer/presentation/check_ins/`
- `trainer_check_in_list_screen.dart` — pending check-ins queue
- `trainer_check_in_review_screen.dart` — detail view with response form

#### `lib/features/trainer/cubit/resource_vault_cubit.dart`
- `loadResources()` → `GET /api/trainer/resource-vault`
- `createResource(data)` → `POST .../resource-vault`
- `deleteResource(id)` → `DELETE .../resource-vault/{id}`
- `assignResource(resourceId, clientId)` → `POST .../resource-vault/{id}/assign`
- `unassignResource(resourceId, clientId)` → `POST .../resource-vault/{id}/unassign`

#### `lib/features/trainer/presentation/resource_vault/`
- `resource_vault_screen.dart` — grid/list of resources
- `resource_detail_sheet.dart` — view/edit/assign resource

#### `lib/features/trainer/cubit/trainer_events_cubit.dart`
- `loadEvents()` → `GET /api/trainer/events`
- `createEvent(data)` → `POST /api/trainer/events`
- `updateEvent(id, data)` → `PUT /api/trainer/events/{id}`
- `deleteEvent(id)` → `DELETE /api/trainer/events/{id}`
- `uploadImage(file)` → `POST .../events/upload`
- `lookupCheckIn(bookingId)` → `GET .../events/check-in`
- `confirmCheckIn(bookingId)` → `POST .../events/check-in`

#### `lib/features/trainer/presentation/events/`
- `trainer_events_screen.dart` — event list
- `trainer_event_editor_sheet.dart` — create/edit form
- `trainer_check_in_tool.dart` — QR or lookup check-in tool

#### `lib/features/trainer/cubit/trainer_recipes_cubit.dart`
- `loadRecipes()` → `GET /api/trainer/recipes`
- `createRecipe(data)` → `POST /api/trainer/recipes`
- `updateRecipe(id, data)` → `PUT /api/trainer/recipes/{id}`
- `deleteRecipe(id)` → `DELETE /api/trainer/recipes/{id}`

#### `lib/features/trainer/presentation/recipes/`
- `trainer_recipes_screen.dart` — recipe library
- `trainer_recipe_editor_sheet.dart` — recipe form with tags + products

---

## 12. Backend Verification Protocol (Rule 7 — MANDATORY)

### 12.1 Start Backend
```bash
cd V:\zirofit-next
npm run dev
# → Listens on port 3321
```

### 12.2 Login as Trainer
```bash
LOGIN_RESULT=$(curl -s -X POST http://localhost:3321/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"ada@ziro.fit","password":"password123"}')
TOKEN=$(echo $LOGIN_RESULT | jq -r '.data.accessToken')
echo $TOKEN
# → Confirm non-empty JWT
```

### 12.3 Verify Each Endpoint Group

For each phase, before marking complete:

```bash
# Calendar GET
curl -s -X GET "http://localhost:3321/api/trainer/calendar?startDate=2026-01-01&endDate=2026-12-31" \
  -H "Authorization: Bearer $TOKEN" | jq '.data.events | length'
# → Returns events array (could be empty, but must be array)

# Clients list
curl -s -X GET "http://localhost:3321/api/trainer/clients" \
  -H "Authorization: Bearer $TOKEN" | jq '.data.clients | length'
# → Returns client list

# Programs
curl -s -X GET "http://localhost:3321/api/trainer/programs" \
  -H "Authorization: Bearer $TOKEN" | jq '.data'
# → Returns userPrograms, systemPrograms, etc.

# Settings
curl -s -X GET "http://localhost:3321/api/trainer/settings" \
  -H "Authorization: Bearer $TOKEN" | jq '.data'
# → Returns { defaultCheckInDay, defaultCheckInHour }
```

### 12.4 DTO Verification Script

Create `scripts/verify_trainer_contracts.sh`:

```bash
#!/bin/bash
# Requires: jq, curl, backend running on :3321
# Login
TOKEN=$(curl -s -X POST http://localhost:3321/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"ada@ziro.fit","password":"password123"}' | jq -r '.data.accessToken')

echo "=== Calendar events ==="
curl -s "http://localhost:3321/api/trainer/calendar?startDate=2026-01-01&endDate=2026-12-31" \
  -H "Authorization: Bearer $TOKEN" | jq '.data.events[0] | keys'

echo "=== Clients list ==="
curl -s "http://localhost:3321/api/trainer/clients" \
  -H "Authorization: Bearer $TOKEN" | jq '.data.clients[0] | keys'

echo "=== Client detail ==="
CLIENT_ID=$(curl -s "http://localhost:3321/api/trainer/clients" \
  -H "Authorization: Bearer $TOKEN" | jq -r '.data.clients[0].id')
curl -s "http://localhost:3321/api/trainer/clients/$CLIENT_ID" \
  -H "Authorization: Bearer $TOKEN" | jq '.data.client | keys'

echo "=== Programs ==="
curl -s "http://localhost:3321/api/trainer/programs" \
  -H "Authorization: Bearer $TOKEN" | jq '.data | keys'

echo "=== Settings ==="
curl -s "http://localhost:3321/api/trainer/settings" \
  -H "Authorization: Bearer $TOKEN" | jq '.data'

echo "=== Session creation data ==="
curl -s "http://localhost:3321/api/trainer/session-creation-data" \
  -H "Authorization: Bearer $TOKEN" | jq '.data | keys'

echo "=== Check-ins pending ==="
curl -s "http://localhost:3321/api/trainer/check-ins/pending" \
  -H "Authorization: Bearer $TOKEN" | jq '.data | length'

echo "=== Active programs ==="
curl -s "http://localhost:3321/api/trainer/programs/active" \
  -H "Authorization: Bearer $TOKEN" | jq '.data.activePrograms | length'
```

### 12.5 Pass Criteria

- Every endpoint returns HTTP 200/201 (not 401/403/500)
- All response fields match Flutter DTOs (field names, types, nullability)
- `dart analyze` — zero errors
- `flutter test` — all tests pass

---

## 13. File Creation Order (Dependency-Aware)

```
Phase 1 (foundation):
  1. lib/core/models/app_mode.dart
  2. lib/features/auth/cubit/auth_state.dart (modify)
  3. lib/features/auth/cubit/auth_cubit.dart (modify)
  4. lib/features/trainer/presentation/trainer_shell.dart
  5. lib/core/router/app_router.dart (modify)
  6. Run build_runner + dart analyze

Phase 2-7 (parallelizable after Phase 1):
  A. Models (DTOs) — ALL at once, no dependencies between DTOs
  B. API Services — ALL at once, no dependencies between services
  C. Cubits — depend on models + API services
  D. Screens — depend on cubits

Recommended parallel order:
  Step 1: Phase 1 (sequential — shell depends on auth)
  Step 2: ALL DTOs in parallel (12+ model files)
  Step 3: ALL API services in parallel (8 service files)
  Step 4: ALL cubits in parallel (10+ cubit files)
  Step 5: ALL screens in parallel (per-phase groupings)
```

---

## 14. Offline-First Strategy (Matching Existing Pattern)

The existing codebase uses a **3-layer offline-first** approach. Trainer features must follow the same pattern:

### Layer 1: ResponseCache (Fast Cold-Start Reads)
- Same `ResponseCache` from `lib/core/network/response_cache.dart`
- Repository wraps API calls with `_cache.get()` first → `_api.call()` → `_cache.set()`
- **Applies to**: Trainer Dashboard, Calendar events, Clients list, Programs library
- **Does NOT apply to**: Check-in submissions (real-time), analytics (always fresh)

### Layer 2: Sync Engine (Background Data Consistency)
- Drift DB tables already registered in `SyncTables.all` for ALL trainer entities:
  ```
  clients, trainer_profiles, trainer_services, trainer_packages,
  trainer_testimonials, trainer_programs, calendar_events, bookings,
  workout_sessions, exercises, workout_templates, notifications
  ```
- `SyncCubit` auto-syncs on connectivity restore — **no additional work needed**
- Trainer mutations that write to Drift + API get auto-synced for free

### Layer 3: PendingActionRecords (Offline Mutations)
- When a trainer performs a mutation while offline:
  1. Write to Drift local DB directly
  2. Insert `PendingActionRecord` with action (`create`/`update`/`delete`)
  3. When connectivity restores, sync engine pushes pending actions
- **Applies to**: Creating calendar sessions, assigning programs, creating templates

### Repository Implementation Pattern (copy this exactly)

```dart
// lib/features/trainer/data/trainer_dashboard_repository.dart
@singleton
class TrainerDashboardRepository {
  final TrainerCalendarApiService _api;
  final ResponseCache _cache;

  static const _dashboardCacheKey = 'trainer:dashboard';

  Future<TrainerDashboardData> getDashboard({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await _cache.get<TrainerDashboardData>(
        _dashboardCacheKey,
        TrainerDashboardData.fromJson,
      );
      if (cached != null) return cached;
    }
    return _refreshDashboard();
  }

  Future<TrainerDashboardData> _refreshDashboard() async {
    final response = await _api.getDashboardData(); // parallel fetch
    await _cache.set(_dashboardCacheKey, response.toJson());
    return response;
  }

  Future<void> invalidateCache() async => _cache.remove(_dashboardCacheKey);
}
```

### Repository Class Plan

| Repository | Cache Key | Strategy |
|------------|-----------|----------|
| `TrainerDashboardRepository` | `trainer:dashboard` | Cache-first (clients summary + active programs + today's events) |
| `TrainerCalendarRepository` | `trainer:calendar:{startDate}:{endDate}` | Cache-first, time-bucketed |
| `TrainerClientsRepository` | `trainer:clients` | Cache-first, force refresh on pull |
| `TrainerProgramsRepository` | `trainer:programs` | Cache-first |
| `TrainerCheckInRepository` | None | API-first (real-time data) |
| `TrainerEventsRepository` | `trainer:events` | Cache-first |
| `TrainerSettingsRepository` | `trainer:settings` | Cache-first |

### What This Means for the Plan

All Phase 2-7 file creation lists that say `*ApiService` should now also include a corresponding `*Repository` and `ResponseCache` integration. The existing sync engine + Drift tables handle offline persistence automatically — no extra DB writes needed in the repository layer.

---

## 15. Reuse Table (Updated from Analysis)

| Existing File | Reuse in Trainer Mode |
|---------------|----------------------|
| `lib/core/network/dio_client.dart` | 100% — same Dio, same interceptors |
| `lib/core/security/token_storage.dart` | 100% — same secure storage |
| `lib/features/auth/data/auth_api_service.dart` | 100% — login/register/me is role-agnostic |
| `lib/features/auth/cubit/auth_cubit.dart` | 95% — add `isTrainer` flag to `authenticated` state |
| `lib/core/router/app_router.dart` | 70% — add trainer `StatefulShellRoute` alongside existing |
| `lib/features/trainers/presentation/widgets/workout_mini_player.dart` | 100% — same overlay in trainer shell |
| `lib/features/trainers/presentation/widgets/exercise_picker_sheet.dart` | 100% — used in template exercise editing |
| `lib/features/trainers/data/models/template_dto.dart` | 100% — shared between client and trainer |
| `lib/features/home/data/models/program_dto.dart` | 100% — `ProgramDto` used by both modes |
| `lib/core/database/app_database.dart` | 100% — same DB, already has all trainer tables |
| `lib/features/notifications/` | 100% — same notification system |
| `lib/core/theme/app_theme.dart` | 100% — same design tokens |
| `lib/core/connectivity/connectivity_service.dart` | 100% — shared |
| `lib/features/sync/` | 100% — shared sync engine |

---

## 16. Risk Register

| Risk | Impact | Mitigation |
|------|--------|------------|
| Backend trainer endpoints not fully implemented (e.g. some return 501) | Blocks testing | Verify ALL endpoints in Phase 0 before building UI |
| Auth interceptor doesn't handle trainer token refresh differently | Auth failures | AuthInterceptor is role-agnostic — same JWT refresh |
| GoRouter redirect logic gets complex with dual-mode | Routing bugs | Keep `redirect` simple: check `isTrainer` → prefix all trainer routes with `/trainer/` |
| Client-mode features accidentally visible to trainer | UX confusion | Trainer routes are under `/trainer/` prefix, client under `/`. Router redirect ensures separation. |
| Existing Drift tables don't have trainer-specific fields | Sync issues | Tables already have `trainerId` fields. Verify against Prisma. |
