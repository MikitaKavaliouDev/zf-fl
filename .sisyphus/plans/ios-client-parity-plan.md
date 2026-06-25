# ZIRO.FIT — iOS Client Tab Parity Implementation Plan

## Scope: 6 Waves · ~86 Files · 13 Commits

---

## Parallel Execution Groups

```
Wave 0: Routing Foundation (blocks ALL)
  │
  ├── Wave 1: Check-In Wizard   ───┐
  ├── Wave 2: Profile → More        │  ← Fully parallel after Wave 0
  ├── Wave 3: Analytics Tab         │
  │                                 │
  └── Wave 4: Sub-Screens ──────────┘  ← depends on Wave 0 + Wave 2
  
Wave 5: Educational Onboarding (zero dependencies, anytime)
```

---

## WAVE 0 — Routing Foundation (3 files)
**Goal**: StatefulShellRoute, fix Workout tab, add Analytics tab, wire sub-route stubs

| Task | File | Category | Skills |
|------|------|----------|--------|
| 0.1 | `pubspec.yaml` — add fl_chart | writing | — |
| 0.2 | `app_router.dart` — ShellRoute→StatefulShellRoute, 5th tab, fix Workout | coding | — |
| 0.3 | `lib/core/di/` — register AppDatabase singleton if needed | coding | — |

**Verification**: 5 tabs render, tab state preserved, `/workout` shows history, `/workout/session` full-screen, all existing tests pass

---

## WAVE 1 — Check-In Wizard (14 files)
**Goal**: Replace `/home/check-in` placeholder with real 4-step wizard

| Task | Files | Category | Skills |
|------|-------|----------|--------|
| 1.1 Data layer | 5 files: api_service, repository, 3 models (request, config, summary) | deep | — |
| 1.2 Cubit | 2 files: check_in_cubit, check_in_state (6 states: initial, step1-4, submitting, success, error) | deep | — |
| 1.3 UI | 6 files: wizard screen + 4 step widgets + success screen | visual-engineering | frontend-ui-ux |
| 1.4 Wire route | Modify app_router.dart — replace _PlaceholderScreen | quick | — |

**Backend**: POST /api/client/check-in, GET /api/client/check-in/config, POST /api/client/upload

---

## WAVE 2 — Profile → More Screen (14 files)
**Goal**: Full MoreView with profile card, 6 preference sections, sign out, brand footer

| Task | Files | Category | Skills |
|------|-------|----------|--------|
| 2.1 Data + cubit | 4 files: api_service, repository, more_cubit, more_state | deep | — |
| 2.2 MoreScreen UI | 7 files: screen + 5 widgets (profile_card, section_header, more_row, experimental, sign_out, brand_footer) | visual-engineering | frontend-ui-ux |
| 2.3 Profile settings | 1 file: profile_settings_screen.dart | visual-engineering | frontend-ui-ux |

**Backend**: GET/PUT /api/client/privacy, existing auth state for user data

---

## WAVE 3 — Analytics Tab (20 files)
**Goal**: 5th tab with configurable chart widgets, fl_chart dependency

| Task | Files | Category | Skills |
|------|-------|----------|--------|
| 3.1 Data layer | 6 files: api_service, repository, 3 models (analytics, progress, widget_config) | deep | — |
| 3.2 Cubits | 4 files: analytics_cubit + state, widget_config_cubit + state | deep | — |
| 3.3 Chart widgets | 7 files: 6 chart widgets + heatmap | visual-engineering | frontend-ui-ux |
| 3.4 Screen | 2 files: analytics_screen, manage_widgets_screen | visual-engineering | frontend-ui-ux |

**Backend**: GET /api/client/analytics, GET /api/client/progress, GET/PUT /api/client/widget-config
**Dependency**: fl_chart (added in Wave 0)

---

## WAVE 4 — Sub-Screens (31 files)
**Goal**: All sub-screens — measurements, goals, daily targets, settings, packages, history

| Task | Files | Category | Skills |
|------|-------|----------|--------|
| 4A Measurements | 6 files: screen, history, measurement model, cubit, state, add sheet | visual-engineering | frontend-ui-ux |
| 4B Fitness Goals | 8 files: screen, goal_card, add_goal, cubit, state, api_service, repository, model | deep | — |
| 4C Daily Targets | 4 files: screen, add_target, cubit, state | deep | — |
| 4D Settings | 6 files: privacy, appearance, notifications, data_privacy, voice, sharing | visual-engineering | frontend-ui-ux |
| 4E Packages | 5 files: packages_screen, transaction_history, api_service, cubit, state | deep | — |
| 4F Static | 2 files: what's_new, contact_support | quick | — |

**Backend**: All endpoints verified — fitness-goals, daily-targets, privacy, sharing, progress, packages

---

## WAVE 5 — Educational Onboarding (4 files)
**Goal**: Carousel onboarding guides

| Task | Files | Category | Skills |
|------|-------|----------|--------|
| 5.1 UI | 4 files: 2 screens + 2 widgets (step_card, page_indicator) | visual-engineering | frontend-ui-ux |

---

## Verification Gate (per commit)
```bash
dart analyze lib/        # Zero errors
flutter test             # All tests pass
```

## Final QA Checklist
- [ ] `dart analyze` zero errors
- [ ] `flutter test` all pass (39 existing + new)
- [ ] No mock data in production code
- [ ] All 8 design tokens respected
- [ ] 5 tabs with state preservation
- [ ] Check-in wizard: 4-step → submit → success
- [ ] More screen: all sections, sign out works
- [ ] Analytics: all chart types with real data
- [ ] No "Coming soon" anywhere
