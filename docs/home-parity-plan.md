# ZIRO.FIT Home Screen — Full Parity Implementation Plan

## Status Summary
- **Data Layer**: ✅ Complete (models, API service, repository, cubit)
- **UI Layer**: ⚠️ 60% complete (core structure exists, missing features)

## Missing Features (to achieve full iOS parity)

### 1. Missing Sections (not in home_screen.dart)
| iOS Section | Flutter Gap | Action |
|---|---|---|
| Invitation Hero (pending link request) | Widget exists but not integrated | Integrate into home_screen.dart conditional flow |
| Streak Motivation Hook | Widget exists but not integrated | Integrate if `workoutManager.currentStreak > 0` (skip for now - needs workout integration) |
| Daily Targets Section | Widget exists but not integrated | Integrate with feature flag check |

### 2. ActiveProgramWidget Enhancement
Current `_ActiveProgramCard` shows only:
- Program name
- Description
- Simple progress bar (text only)

Missing (from iOS ActiveProgramWidget):
- Progress percentage display ("65% Complete")
- Template list with status icons:
  - COMPLETED: green checkmark in circle, strikethrough name
  - NEXT: blue dot, "Start" button
  - PENDING: gray number, lock icon
- Tappable card → navigate to program detail
- `onStartTemplate` callback for starting workouts

### 3. Navigation Fixes Required
| Widget | Current Navigation | Required Fix |
|---|---|---|
| CoachCard | Not implemented | Navigate to `/trainer/${trainer.username}` |
| CheckInBanner | `/workout` (wrong) | Navigate to `/home/check-in` (new route needed) |
| UpcomingSessionCard | `/workout` (wrong) | Navigate to `/workout/history/${session.id}` |
| ActiveProgramCard | `/workout` (wrong) | Navigate to `/home/program-detail` (new route needed) |
| ZiroHeader avatar | Not implemented | Navigate to `/profile` |
| ZiroHeader bell | Not implemented | Navigate to `/home/notifications` |

## Delegation Tasks

### Task A: HomeScreen Integration (deep/unspecified-high)
**What**: Update home_screen.dart to integrate missing sections
**Files**: lib/features/home/presentation/home_screen.dart
**Changes**:
1. Add `InvitationHeroCard` import and conditional render (check `pendingLinkRequest` from HomeState)
2. Add `DailyTargetsSection` import and conditional render (feature flag check)
3. Fix all navigation callbacks to proper routes
4. Add `onStartTemplate` callback to ActiveProgram card

### Task B: ActiveProgramWidget Enhancement (visual-engineering)  
**What**: Replace `_ActiveProgramCard` with full-featured `ActiveProgramWidget`
**Files**: lib/features/home/presentation/home_screen.dart (replace `_ActiveProgramCard`)
**Changes**:
1. Add progress percentage display
2. Add templates list with status icons (using existing icons)
3. Add Start button for NEXT template
4. Add lock icon for PENDING templates
5. Wire up `onStartTemplate` callback

### Task C: Notification Integration (deep/unspecified-high)
**What**: Handle notification tap to show notifications screen
**Depends**: NotificationsCubit or simple route navigation for now
**Files**: Update HomeState to include pendingLinkRequest, or use simple navigation

## Verification Checklist (before marking complete)
- [ ] `dart analyze lib/features/home/` → zero errors
- [ ] `flutter test` → all 23 tests pass  
- [ ] All iOS sections present in correct order
- [ ] All navigation taps lead to correct destinations
- [ ] No hardcoded colors/radii/typography values