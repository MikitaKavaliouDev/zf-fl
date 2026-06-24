# Notifications Feature — ZIRO.FIT Flutter

## Source References

| Source | Location |
|--------|----------|
| iOS Reference | `~/pr/Ziro-Fit/Ziro Fit/Views/Common/NotificationsView.swift` |
| iOS ViewModel | `~/pr/Ziro-Fit/Ziro Fit/ViewModels/NotificationsViewModel.swift` |
| iOS Model | `~/pr/Ziro-Fit/Ziro Fit/Models/NotificationModel.swift` |
| iOS Header | `~/pr/Ziro-Fit/Ziro Fit/Views/Components/ZiroSheetHeader.swift` |
| iOS Background | `~/pr/Ziro-Fit/Ziro Fit/Views/Components/SheetBackgroundModifier.swift` |
| iOS Colors | `~/pr/Ziro-Fit/Ziro Fit/Utilities/Color+Extensions.swift` |
| iOS Bell Badge (Client) | `~/pr/Ziro-Fit/Ziro Fit/Views/ZiroMe/PersonalHomeView.swift` |
| iOS Bell Badge (Trainer) | `~/pr/Ziro-Fit/Ziro Fit/Views/Trainer/DashboardView.swift` |
| iOS Tab Badge | `~/pr/Ziro-Fit/Ziro Fit/Views/Common/CustomTabBar.swift` |
| Flutter Drift Table | `lib/core/database/tables/notifications_table.dart` |
| Flutter Generated Entity | `lib/core/database/app_database.g.dart` (line 7003) |
| Flutter Sync Registry | `lib/core/database/sync_tables_registry.dart` |
| Flutter Route | `lib/core/router/app_router.dart` (line 262, placeholder) |
| Flutter Bell Icon | `lib/features/home/presentation/widgets/ziro_header.dart` (line 78) |
| Flutter AppColors | `lib/core/theme/app_theme.dart` |

---

## 1. Data Model

### Drift Table (Existing — `lib/core/database/tables/notifications_table.dart`)

```dart
class Notifications extends Table {
  TextColumn get id => text().clientDefault(() => const Uuid().v4())();
  TextColumn get userId => text()();
  TextColumn get message => text()();
  TextColumn get type => text()();
  BoolColumn get readStatus => boolean().clientDefault(() => false)();
  TextColumn get metadata => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get deletedAt => integer().nullable()();
  TextColumn get syncStatus => text().clientDefault(() => 'pending')();
}
```

### iOS Model (Reference — `NotificationModel.swift`)

```swift
struct NotificationModel: Identifiable, Codable {
    let id: String
    let userId: String
    let senderId: String?
    let message: String
    let type: String                          // "client_link_request", "link_request", "workout_completed", "check_in", "booking"
    var readStatus: Bool
    let createdAt: Date
    let targetRole: String?                   // "client" | "trainer" | nil
    let data: [String: String]?               // arbitrary key-value payload, e.g. ["sessionId": "...", "trainerUsername": "..."]
}
```

### Flutter DTO (Implemented — `lib/features/notifications/data/models/notification_dto.dart`)

The freezed DTO matches both the Drift entity and the iOS model:

```dart
@freezed
abstract class NotificationDto with _$NotificationDto {
  const factory NotificationDto({
    required String id,
    required String userId,
    String? senderId,
    required String message,
    required String type,
    @JsonKey(name: 'readStatus') required bool readStatus,
    @JsonKey(name: 'createdAt') required int createdAt,
    @Default(0) @JsonKey(name: 'updatedAt') int updatedAt,
    String? targetRole,
    String? metadata,
    @Default('synced') @JsonKey(name: 'syncStatus') String syncStatus,
  }) = _NotificationDto;

  const NotificationDto._();
  factory NotificationDto.fromJson(Map<String, dynamic> json) => _$NotificationDtoFromJson(json);
}
```

### Notification Types (from iOS)

| `type` value | Icon (iOS SF Symbol) | Icon Color | Link Request? |
|---|---|---|---|
| `client_link_request` | `person.badge.plus.fill` | `.blue` | ✅ Yes |
| `link_request` | `person.badge.plus.fill` | `.blue` | ✅ Yes |
| `workout_completed` | `dumbbell.fill` | `.purple` | ❌ |
| `check_in` | `checkmark.circle.fill` | `.green` | ❌ |
| `booking` | `calendar` | `.orange` | ❌ |
| _fallback_ | `bell.fill` | `.blue` | ❌ |

A notification is treated as a link request when:
- `type == "client_link_request"` OR `type == "link_request"` OR `message` contains "requests to connect" or "wants to connect"

---

## 2. API Contract

> **Note**: Backend repo at `~/pr/zirofit-next` is the source of truth. The following is reconstructed from iOS ViewModel calls and documented API contracts.

| Method | Path | Auth | Purpose |
|--------|------|------|---------|
| `GET` | `/api/notifications` | JWT | Fetch all notifications |
| `PUT` | `/api/notifications/:id` | JWT | Mark notification read |
| `POST` | `/api/notifications/:id/accept` | JWT | Accept link request |
| `POST` | `/api/notifications/:id/decline` | JWT | Decline link request |

**Response envelope** (standard across backend):
```json
{
  "data": { ... },
  "error": { "message": "...", "code": "..." }  // on failure
}
```

All dates are transmitted as **Unix timestamps in milliseconds**. The sync engine uses snake_case on the wire and camelCase internally.

---

## 3. iOS UI Reference (Exact Replication Target)

### 3.1 NotificationsScreen — Full Layout

```
┌─────────────────────────────────┐
│  ─── (drag handle capsule)      │  ← ZiroSheetHeader overlay
│  Notifications           Done   │  ← 17pt semibold title, 44pt height
├─────────────────────────────────┤
│                                 │
│  ┌─────────────────────────┐    │  ← NotificationRow
│  │ (icon)  Message text...  │ ●  │     - 40×40 icon circle
│  │         Date          ══ │    │     - 16px spacing icon↔text
│  └─────────────────────────┘    │     - unread dot (8×8 blue)
│  ┌─────────────────────────┐    │     - read rows: clear bg
│  │ (icon)  Message text...  │    │     - unread rows: blue 5% bg
│  │         Date        ═══  │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ (icon)  LINK REQUEST     │    │
│  │         Message text...  │    │
│  │         Date             │    │
│  │  ┌──────────┐ ┌──────┐  │    │  ← Accept (blue) / Decline (red) buttons
│  │  │  Accept  │ │Decl.│  │    │     - corner radius 8
│  └─────────────────────────┘    │
│                                 │
│  [Empty state when none:]       │
│     🔕 (50pt, gray 50%)        │
│     "No notifications" (gray)  │
└─────────────────────────────────┘
```

### 3.2 NotificationRow — Spacing & Dimensions

| Element | Value | Notes |
|---------|-------|-------|
| Icon circle size | `40×40` | Circle filled with iconColor at 10% opacity |
| Icon size | `20` | System image size |
| Icon↔text spacing | `16` | HStack spacing |
| Message font | `15` (subheadline) | `.subheadline` = 15pt |
| Message color | `Color.theme.textPrimary` | Black on light |
| Message line limit | `3` | `.lineLimit(3)` |
| Date font | `11` (caption2) | `.caption2` = 11pt |
| Date color | `.gray` | |
| Cross-mode badge font | `11 bold` (caption2 bold) | |
| Cross-mode badge h-padding | `4` | |
| Cross-mode badge corner radius | `4` | |
| Row padding | `16` all sides | `.padding()` = default 16 |
| Unread dot size | `8×8` | `.fill(Color.blue)` |
| Unread dot position | `padding(.top, 6)` | Top-right of row |
| Action button v-padding | `8` | |
| Action button corner radius | `8` | |
| Action button spacing | `12` | HStack spacing |
| Action button h-padding | `16` | `.padding(.horizontal)` |
| Action button bottom padding | `16` | `.padding(.bottom, 16)` |
| Empty state icon size | `50` | |
| Empty state spacing | `20` | Between icon and text |
| Link request detection | `contains("requests to connect") \|\| contains("wants to connect")` | Plus type check |

### 3.3 Icon→Color Mapping (Flutter equivalent)

```dart
({IconData icon, Color color}) _iconForNotification(NotificationDto n) {
  final isLinkRequest = n.type == 'client_link_request' || n.type == 'link_request' ||
      (n.message.contains('requests to connect') || n.message.contains('wants to connect'));

  if (isLinkRequest) return (icon: Icons.person_add_alt_1, color: AppColors.primary); // blue

  switch (n.type) {
    case 'workout_completed': return (icon: Icons.fitness_center, color: Color(0xFF7C3AED)); // purple
    case 'check_in':          return (icon: Icons.check_circle,     color: Color(0xFF22C55E)); // green
    case 'booking':           return (icon: Icons.calendar_month,   color: Color(0xFFF97316)); // orange
    default:                  return (icon: Icons.notifications,     color: AppColors.primary); // blue
  }
}
```

### 3.4 Cross-Mode Badges

When a notification has a `targetRole` different from the current user mode, show a badge:

```
┌───────────────────────────────────────────┐
│ (icon)  Message text...                    │
│         Date    ┌─────────────┐            │
│                 │ Professional│  ← orange bg 20%, orange text
│                 └─────────────┘            │
└───────────────────────────────────────────┘
```

- "Professional": `Color(0xFFF97316).withOpacity(0.2)` bg, `Color(0xFFF97316)` text, for `targetRole == "trainer"` shown in client mode
- "Personal": `AppColors.primary.withOpacity(0.2)` bg, `AppColors.primary` text, for `targetRole == "client"` shown in trainer mode

### 3.5 Bell Badge (Header)

**Client mode** (dot badge):
- Red circle, 8×8, positioned at top-right of bell icon
- offset: `(2, -2)` relative to bell icon

**Trainer mode** (numeric badge):
- Red circle with count text: 10pt bold white
- minWidth: 20, padding: 4
- offset: `(6, -6)` relative to bell icon

### 3.6 Sheet Header

```
┌─────────────────────────────────┐
│   ─── (capsule 40×5, gray 20%) │  ← padding top 10, bottom 8
│  Cancel     Notifications   Done│  ← 17pt semibold title, 44pt height
│                                 │  ← horizontal padding 20 for buttons
└─────────────────────────────────┘
  Background: .ultraThinMaterial   → Flutter: BackdropFilter blur
```

### 3.7 Sheet Background

In iOS: `.ziroSheetBackground()` = `Color.theme.backgroundPrimary` + `.ultraThinMaterial` overlay.
In Flutter: Apply `BackdropFilter` with blur, or a semi-transparent background matching `AppColors.background`.

### 3.8 Tap Handling (from iOS `handleTap`)

1. Mark notification as read (optimistic)
2. If link request → open `TrainerInvitationDetailView`
3. If `notification.data["sessionId"]` exists → open session detail
4. If cross-mode (`targetRole != currentMode`) → show "Switch Profile?" alert
5. Otherwise → no navigation (just mark read)

---

## 4. Final File Structure

```
lib/features/notifications/
├── cubit/
│   ├── notifications_cubit.dart          # @injectable — fetch, markAsRead, markAllAsRead, acceptRequest, declineRequest, pendingLinkRequest
│   ├── notifications_state.dart          # freezed sealed: initial, loading, loaded(list, unreadCount), error(message)
│   ├── notifications_state.freezed.dart  # generated
│   └── notifications_cubit.freezed.dart  # (empty — no events, direct method calls)
├── data/
│   ├── api/
│   │   └── notification_api_service.dart  # @injectable — 5 endpoints via Dio
│   ├── models/
│   │   ├── notification_dto.dart          # freezed DTO, 10 fields
│   │   ├── notification_dto.freezed.dart  # generated
│   │   └── notification_dto.g.dart        # generated
│   └── repositories/
│       └── notification_repository.dart   # @singleton — delegates to API, sorts desc
└── presentation/
    ├── notifications_screen.dart          # full list with header, pull-to-refresh, empty/loading states
    └── widgets/
        ├── notification_row.dart          # individual row (260 lines)
        └── ziro_sheet_header.dart         # reusable modal header component
```

### Integration Points

| Component | File | Integration |
|-----------|------|-------------|
| **App DI** | `lib/main.dart` | `NotificationsCubit` registered via `MultiBlocProvider.value`, auto-fetched on startup |
| **Router** | `lib/core/router/app_router.dart` | `/home/notifications` route → `NotificationsScreen()` with slide-up transition |
| **Bell Badge** | `lib/features/home/presentation/widgets/ziro_header.dart` | Red dot badge driven by `context.watch<NotificationsCubit>().unreadCount` |
| **Sync** | `lib/core/database/sync_tables_registry.dart` | `notifications` registered as sync table (already existed) |
| **Drift DB** | `lib/core/database/tables/notifications_table.dart` | `Notifications` table with 10 columns (already existed) |

### API Endpoints Implemented

| Method | Path | Service Method | Purpose |
|--------|------|----------------|---------|
| `GET` | `/api/notifications` | `fetchNotifications()` | Fetch all notifications |
| `PUT` | `/api/notifications/:id` | `markAsRead(id)` | Mark notification read |
| `PUT` | `/api/notifications/read-all` | `markAllAsRead()` | Mark all as read |
| `POST` | `/api/notifications/:id/accept` | `acceptRequest(id)` | Accept link request |
| `POST` | `/api/notifications/:id/decline` | `declineRequest(id)` | Decline link request |

### Verification

- `dart analyze lib/features/notifications/` → ✅ No issues found
- `dart analyze lib/` → ✅ Zero errors
- `flutter test` → ✅ 23/23 tests pass

---

## 6. Design Tokens Reference (Flutter AppColors)

From `lib/core/theme/app_theme.dart`:

```dart
static const Color primary       = Color(0xFF007AFF);  // blue accent
static const Color background    = Color(0xFFFFFFFF);  // white
static const Color card          = Color(0xFFFFFFFF);  // white
static const Color mutedSurface  = Color(0xFFFAFAFA);  // near-white
static const Color borderMuted   = Color(0xFFF4F4F5);  // light gray
static const Color borderActive  = Color(0xFFE5E7EB);  // medium gray
static const Color foreground    = Color(0xFF18181B);  // near-black
static const Color mutedText     = Color(0xFF71717A);  // medium gray text
```

Additional colors needed for notifications (not in AppColors):
```dart
static const Color purpleAccent  = Color(0xFF7C3AED);  // workout_completed icon
static const Color greenAccent   = Color(0xFF22C55E);  // check_in icon
static const Color orangeAccent  = Color(0xFFF97316);  // booking icon, Professional badge
static const Color errorRed      = Color(0xFFEF4444);  // decline, badge dot
```

### Radius Tokens
- Icon circle: `24` (radius for 48×48 to get 40×40 visible area)
- Action buttons: `8.0`
- Cross-mode badge: `4.0`
- Sheet header drag handle: `2.5` (capsule 40×5)
- Input/buttons: `99.0` (from theme)

### Typography
| Usage | Font Size | Weight | Color |
|-------|-----------|--------|-------|
| Header title | `17` | `w600` | `foreground` |
| Notification message | `15` | regular | `foreground` |
| Date/time | `11` | regular | `mutedText` |
| Cross-mode badge | `11` | `w700` | orange/blue |
| Action button | `15` | `w700` | white / red |
| Empty state icon | `50` | — | `mutedText` 50% |
| Empty state text | `17` | regular | `mutedText` |
