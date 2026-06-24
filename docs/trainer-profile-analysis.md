# Trainer Profile (Public-Facing) — Full Analysis

> **Generated**: 2026-06-24
> **Sources**:
> - iOS Reference: `~/pr/Ziro-Fit/Ziro Fit/Views/ZiroMe/PublicTrainerProfileView.swift` (803 lines)
> - Backend: `~/pr/zirofit-next/src/app/api/trainers/[username]/`
> - Flutter Current: `lib/features/trainers/presentation/trainer_detail_screen.dart` (235 lines)
> - iOS Explore Doc: `docs/ios-explore-tab.md` (Section 4)

---

## Table of Contents

1. [Overview](#1-overview)
2. [iOS Reference Implementation](#2-ios-reference-implementation)
3. [Backend API Contracts](#3-backend-api-contracts)
4. [Flutter Current Implementation](#4-flutter-current-implementation)
5. [Business Logic & Interactive States](#5-business-logic--interactive-states)
6. [Navigation & Presentation](#6-navigation--presentation)
7. [Gap Analysis: iOS vs Flutter](#7-gap-analysis-ios-vs-flutter)
8. [Implementation Roadmap](#8-implementation-roadmap)

---

## 1. Overview

The **public trainer profile** is the destination screen when a client taps on a trainer card anywhere in the app (Explore tab, Trainer Discovery, Home coach card, etc.). It serves as the primary conversion surface — where clients learn about a trainer, view packages, read testimonials, see transformation photos, check availability, and ultimately **connect** or **purchase**.

### Entry Points (iOS)

| Source | Trigger | Presentation |
|---|---|---|
| `ExploreScreen` | Tap trainer card (nearby, featured, recommended) | Sheet |
| `TrainerDiscoveryView` | Tap search result card | Sheet |
| `PersonalHomeView` Coach Card | Tap linked trainer name | Sheet |
| Trending tags / Category filter | Tap → `TrainerDiscoveryView` → trainer card | Sheet |
| `TrainerMapView` | Tap annotation → selection card → "Open" | Sheet |

### Entry Points (Flutter Current)

| Source | Trigger | Route |
|---|---|---|
| `ExploreScreen` | Tap trainer card | `/trainer/:username` (full-screen push) |
| `TrainerDiscoveryScreen` | Tap search result | `/trainer/:username` |
| Router path | Direct URL | `/trainer/:username` → `TrainerDetailScreen` |

---

## 2. iOS Reference Implementation

**File**: `PublicTrainerProfileView.swift` (803 lines)
**Layout style**: App Store / profile-inspiration design

### 2.1 Full Screen Layout

```
ZStack(alignment: .top)
├── ScrollView (ignores top safe area)
│   ├── Banner (200pt)
│   │   ├── AsyncImage or blue→purple gradient
│   │   └── Avatar (72px, offset +20x +30y, 3pt white stroke)
│   │
│   ├── Identity Row
│   │   ├── Name (20pt bold)
│   │   ├── Specialties (13pt, secondary, "•" separated)
│   │   ├── Location (11pt, mappin icon)
│   │   ├── Rating (12pt, star icon)
│   │   └── [Connect / Pending / Connected] button (Capsule)
│   │
│   ├── Tag Badges Row (horizontal scroll)
│   │   ├── ★ 4.8, "X Reviews", specialty tags, location
│   │   └── TagBadge: icon + text, 10pt corner radius, tinted bg
│   │
│   ├── "Ask for Custom Plan" button (full-width, blue tinted)
│   │
│   ├── Segmented Tab Bar
│   │   About | Packages | Photos | Reviews | Events | Schedule
│   │
│   └── Tab Content (varies by selection)
│
└── Dismiss button (chevron.left, ultraThinMaterial circle, top-left)
```

### 2.2 Tab Content Breakdown

#### About Tab
| Element | Spec |
|---|---|
| Bio text | HTML stripped via `.strippingHTML()` |
| Header | "About" — 20pt bold |
| Body | 14pt, secondary color, 4pt line spacing |
| Sections rendered | About Me, Philosophy, Methodology, Branding |

#### Packages Tab
| Element | Spec |
|---|---|
| Layout | Horizontal scroll of `MembershipCardView` |
| Card width | 260pt |
| Content | Package name, session count, price, currency, description |
| Featured | "Recommended" indicator on first package |
| Action | Tap → `initiatePurchase(packageId:)` → Stripe checkout via SafariView |

#### Photos Tab
| Element | Spec |
|---|---|
| Layout | 2-column `LazyVGrid`, 12pt spacing |
| Image | AsyncImage, 150pt height, 14pt corner radius |
| Optional | Caption badge (blue, 7pt black) overlaid |
| Empty state | Gray placeholder, "No photos yet" |

#### Reviews Tab
| Element | Spec |
|---|---|
| Layout | Horizontal scroll of testimonial cards |
| Card width | 220pt, 14pt corner radius |
| Content | Client name + 5-star rating (8pt) + testimonial text (12pt, secondary, max 4 lines, 2pt line spacing) + date (9pt, gray) |
| Background | `backgroundSecondary` with 1px stroke, `primary` 10% |

#### Events Tab
| Element | Spec |
|---|---|
| State | Placeholder: "No upcoming events" if none |
| Content | `ExploreEventRow` list if events available |

#### Schedule Tab
| Element | Spec |
|---|---|
| Day selector | M T W T F S S — circular buttons, 46×46, blue when selected |
| Availability dots | Green dot indicator on days with availability |
| Time slots | `LazyVGrid` (adaptive min 88pt): clock icon + time label |
| Slot tap | Opens `CustomProgramRequestView` |
| API | `GET /api/trainers/{username}/schedule` |

### 2.3 Connect Button States

| State | Visual | Action |
|---|---|---|
| **Not linked** | Blue capsule, "Connect", shadow | `linkWithTrainer(username:)` → `POST /api/client/trainer/link` |
| **Pending** | Gray capsule, "Pending" | — (disabled) |
| **Linked** | Green capsule, "Connected" | Context menu → "Unlink from Trainer" → confirmation → `DELETE /api/client/trainer/link` |

### 2.4 Custom Program Request (`CustomProgramRequestView`)

3-step wizard with progress bar:
1. **Goal**: TextEditor for goals description
2. **Duration**: Select 4/8/12 weeks
3. **Confirm**: Sparkle icon + summary + "Send Request"

### 2.5 Data Loading Strategy

```swift
func loadTrainerProfile() async {
    // 1. Read cache first for instant display
    if let cached = cacheManager.getTrainerProfile(identifier) {
        self.trainer = cached
    }
    // 2. Fetch fresh data from API
    do {
        let profile = try await api.fetchTrainerProfile(identifier)
        self.trainer = profile
        cacheManager.saveTrainerProfile(profile, for: identifier)
    } catch {
        // Gracefully handle — don't clear existing data
    }
}
```

- Uses username or ID (accepts both)
- Cache-first, then API refresh
- Graceful error handling (keeps stale cache on failure)
- Parallel fetches: profile + packages

---

## 3. Backend API Contracts

### 3.1 Core Profile: `GET /api/trainers/[username]`

The primary endpoint. Uses raw SQL aggregation (`getTrainerAggregatedProfile`) to return **everything in one call**.

**Response shape** (from `trainerService.ts` `getTrainerAggregatedProfile`):

```typescript
{
  id: string,                    // User.id (UUID)
  name: string,
  username: string | null,
  email: string,
  role: string,                  // "trainer"
  tier: string | null,
  isLinked: boolean,             // Added by route handler

  profile: {
    id: string,                  // Profile.id
    userId: string,
    profilePhotoPath: string | null,  // Transformed via Supabase
    bannerImagePath: string | null,   // Transformed via Supabase
    aboutMe: string | null,
    philosophy: string | null,
    methodology: string | null,
    branding: string | null,
    certifications: string | null,    // Comma-separated string
    specialties: string[],            // JSON array
    trainingTypes: string[],          // ["IN_PERSON", "ONLINE"]
    minServicePrice: string | null,   // Converted to string
    averageRating: number | null,     // Rounded to 1 decimal
    businessCurrency: string,         // Default "PLN"

    locations: Array<{
      id: string,
      address: string,
      latitude: number | null,
      longitude: number | null
    }>,
    services: Array<{
      id: string, title: string, description: string,
      price: string | null, currency: string | null, duration: number | null
    }>,
    testimonials: Array<{
      id: string, clientName: string, testimonialText: string,
      rating: number | null, createdAt: string
    }>,
    transformationPhotos: Array<{
      id: string, imagePath: string, caption: string | null,
      clientName: string | null, publicUrl: string | null
    }>,
    socialLinks: Array<{
      id: string, platform: string, username: string, profileUrl: string
    }>,
    externalLinks: Array<{
      id: string, label: string, linkUrl: string
    }>,
    benefits: Array<{
      id: string, title: string, description: string | null, iconName: string | null
    }>
  },
  stats: {
    clientsCoached: number,
    reviewCount: number,
    averageRating: number | null
  },
  packages: Array<{
    id: string, name: string, description: string | null,
    price: string,           // price.toString() — always string
    numberOfSessions: number
  }>
}
```

> **Key finding**: The aggregated endpoint returns ALL data in a single call — profile bio, images, locations, services, testimonials, transformation photos, social links, external links, benefits, AND packages. The Flutter client only needs **one API call** for the full profile.

### 3.2 Public Details: `GET /api/trainers/[username]/public`

Alternative endpoint returning a differently structured profile (used by iOS `PublicTrainerProfileView`):

```typescript
{
  data: {
    id: string,
    name: string,
    username: string | null,
    role: string,
    profile: {
      bio: { aboutMe, philosophy, methodology, branding } | null,
      images: { profilePhoto: string | null, bannerImage: string | null },
      professional: {
        specialties: string[],
        trainingTypes: TrainingType[],
        certifications: string | null,
        averageRating: number | null,
        minServicePrice: number | null,
        businessCurrency: string
      },
      locations: Location[],
      services: Service[],
      testimonials: Testimonial[],
      transformations: Transformation[],
      socials: SocialLink[],
      benefits: Benefit[],
      isLinked?: boolean
    } | null
  }
}
```

### 3.3 Supporting Endpoints

| Method | Path | Response Shape | Purpose |
|---|---|---|---|
| `GET` | `/api/trainers/[username]/packages` | `{ data: { packages: Package[] } }` | Packages only (price is string) |
| `GET` | `/api/trainers/[username]/testimonials` | `{ data: { testimonials: Testimonial[] } }` | Testimonials only (ordered by createdAt desc) |
| `GET` | `/api/trainers/[username]/transformation-photos` | `{ data: { photos: Photo[] } }` | Transformation photos only |
| `GET` | `/api/trainers/[username]/schedule` | `{ data: { availability: Record<string, string[]>, bookings: Array<{startTime, endTime}> } }` | Weekly availability + confirmed bookings |
| `POST` | `/api/client/trainer/link` | `{ data: { message: string } }` | Connect to trainer (body: `{ trainerUsername: string }`) |
| `DELETE` | `/api/client/trainer/link` | `{ data: { message: string } }` | Disconnect from trainer |
| `GET` | `/api/client/trainer/link?trainerUsername=` | `{ data: { isLinked: boolean } }` | Check link status |
| `POST` | `/api/checkout/session` | `{ data: { url: string } }` | Stripe checkout (body: `{ type: "PACKAGE_SALE", packageId: string, isMobile: true }`) |

### 3.4 Data Loading Recommendation for Flutter

The **aggregated endpoint** (`GET /api/trainers/[username]`) returns everything in one call. The Flutter app should:

1. **Load aggregated profile** in a single parallel call
2. **Optionally preload** packages if the aggregated endpoint doesn't always return them (the backend always does for the aggregated route)
3. **Schedule endpoint** called on-demand when Schedule tab is selected

```
load() ──→ GET /api/trainers/{username} ──→ Full profile
                                          (includes profile, stats, packages)
```

This matches iOS behavior (parallel fetches) but is more efficient since the backend already aggregates.

---

## 4. Flutter Current Implementation

### 4.1 File Structure

```
lib/features/trainers/
├── cubit/
│   ├── trainer_detail_cubit.dart       # 35 lines — load, linkTrainer
│   └── trainer_detail_state.dart       # 20 lines — freezed sealed (initial, loading, loaded, error)
├── data/
│   ├── trainer_api_service.dart         # 86 lines — getPromotedTrainers, getTrainers, getTrainerDetail, getTrainerPackages, linkTrainer
│   ├── trainer_repository.dart         # 65 lines — wrapper
│   └── models/
│       ├── trainer_detail_dto.dart      # 40 lines — freezed model
│       ├── trainer_list_item_dto.dart   # 73 lines — list item + summary + stats
│       ├── trainer_location.dart        # 17 lines — freezed model
│       ├── trainer_package_dto.dart     # 18 lines — freezed model
│       └── promoted_trainer_dto.dart    # 22 lines — freezed model
└── presentation/
    ├── trainer_detail_screen.dart       # 235 lines — THE PROFILE SCREEN
    └── widgets/                         # No profile-specific widgets
```

### 4.2 Current `TrainerDetailDto` (Model)

```dart
@freezed
abstract class TrainerDetailDto with _$TrainerDetailDto {
  const factory TrainerDetailDto({
    required String id,
    String? name,
    String? username,
    String? email,
    String? profilePhotoPath,
    String? bio,
    double? averageRating,
    @JsonKey(fromJson: _parseStringList) @Default(<String>[]) List<String> specialties,
    @JsonKey(fromJson: _parseStringList) @Default(<String>[]) List<String> certifications,
    @Default(false) bool isVerified,
    @Default(false) bool isLinked,
    String? businessCurrency,
    List<TrainerLocation>? locations,
    @Default(<dynamic>[]) List<dynamic> services,
    Map<String, dynamic>? stats,
  }) = _TrainerDetailDto;
}
```

**Gaps vs backend shape:**
| Missing Field | Backend Has |
|---|---|
| `bannerImagePath` | ✅ `profile.bannerImagePath` |
| `aboutMe`, `philosophy`, `methodology`, `branding` | ✅ `profile.aboutMe`, etc. |
| `trainingTypes` | ✅ `profile.trainingTypes` |
| `minServicePrice` | ✅ `profile.minServicePrice` |
| `testimonials` | ✅ `profile.testimonials` |
| `transformationPhotos` | ✅ `profile.transformationPhotos` |
| `socialLinks` | ✅ `profile.socialLinks` |
| `externalLinks` | ✅ `profile.externalLinks` |
| `benefits` | ✅ `profile.benefits` |
| `stats.reviewCount` | ✅ `stats.reviewCount` |
| `stats.clientsCoached` | ✅ `stats.clientsCoached` |
| `packages` | ✅ Root-level `packages` array |

### 4.3 Current UI (`TrainerDetailScreen`)

```
Scaffold
├── AppBar ("Trainer")
└── SingleChildScrollView
    ├── Profile Header (centered)
    │   ├── CircleAvatar (radius 48)
    │   ├── Name (22pt bold)
    │   ├── Rating (star icon + number)
    │   └── Linked badge (if linked)
    ├── About (bio text)
    ├── Specialties (Chip list)
    ├── Packages (Card list)
    └── Link button (full-width ElevatedButton)
```

**Current widgets used**: Only Material Design basics — `CircleAvatar`, `Chip`, `Card`, `ListTile`, `ElevatedButton`.

### 4.4 Current Cubit & State

```dart
class TrainerDetailCubit extends Cubit<TrainerDetailState> {
  Future<void> load(String username) async {
    emit(const TrainerDetailLoading());
    try {
      final trainer = await _repository.getTrainerDetail(username);
      final packages = await _repository.getTrainerPackages(username);
      emit(TrainerDetailLoaded(trainer: trainer, packages: packages));
    } catch (e) {
      emit(const TrainerDetailError('Failed to load trainer details.'));
    }
  }
}
```

- Makes **two API calls** sequentially (`getTrainerDetail` + `getTrainerPackages`)
- No caching, no optimistic updates
- `linkTrainer()` reloads the entire profile after linking

---

## 5. Business Logic & Interactive States

### 5.1 Connect/Link Flow

```
[Not Linked]
     │
     ├── tap "Connect"
     │     └── POST /api/client/trainer/link
     │           ├── Success → re-fetch profile → isLinked=true
     │           └── Error → show error toast
     │
[Linked]
     │
     ├── show "Connected" (green badge)
     ├── context menu → "Unlink Trainer"
     │     └── Confirmation dialog
     │           ├── Confirm → DELETE /api/client/trainer/link
     │           └── Cancel → dismiss
     │
[Pending]    (if backend supports pending state)
     │
     └── show "Pending" (gray badge, disabled)
```

### 5.2 Purchase Flow (Package → Stripe)

```
Tap "Buy" on package card
  │
  └── POST /api/checkout/session
        { type: "PACKAGE_SALE", packageId: string, isMobile: true }
        │
        └── Response: { data: { url: "https://..." } }
              │
              ├── iOS: Open SafariView with Stripe Checkout URL
              └── Flutter: Open in-app browser / launchUrl / Stripe SDK
                    │
                    └── On return:
                          ├── zirofitapp://packages/{id}/success → confirm
                          └── zirofitapp://packages/{id}/cancel → dismiss
```

### 5.3 Schedule & Booking Flow

```
Tap Schedule tab
  │
  └── GET /api/trainers/{username}/schedule
        │
        └── Render weekly grid:
              ├── Day selector (M T W T F S S)
              ├── Green dot = has availability
              └── Time slots per selected day
                    │
                    └── Tap slot → CustomProgramRequestView (3-step wizard)
```

---

## 6. Navigation & Presentation

### iOS Presentation

| Aspect | Behavior |
|---|---|
| Presentation | `.sheet` from all entry points |
| Detents | `.large` (full height) |
| Drag indicator | Hidden? (likely `.large` with no medium detent) |
| Dismiss | Chevron left button (ultraThinMaterial circle, top-left) |
| Background | ZStack with translucent header |

### Flutter Current Presentation

| Aspect | Behavior |
|---|---|
| Presentation | Full-screen route push (`/trainer/:username`) |
| Transition | Default Material PageRoute (slide from right) |
| AppBar | Standard `AppBar` with back button |
| Dismiss | Back button in AppBar |

### Recommended Flutter Presentation

| Entry Point | Presentation | Rationale |
|---|---|---|
| Explore tab card | Bottom sheet (slide-up) | Matches iOS behavior for browse → detail flow |
| Deep link / direct URL | Full-screen route | Direct navigation context |
| Home coach card | Bottom sheet | Consistent with explore flow |

---

## 7. Gap Analysis: iOS vs Flutter

### 7.1 Critical Gaps (Must Have for Parity)

| # | Feature | iOS | Flutter | Effort |
|---|---|---|---|---|
| 1 | **Banner image** | 200pt hero with gradient overlay | Not implemented | 0.5 day |
| 2 | **Tabbed content** (About/Packages/Photos/Reviews/Schedule) | Segmented tab bar with 6 tabs | Flat single-column layout | 1-2 days |
| 3 | **Testimonials/Reviews** | Horizontal scroll of testimonial cards | Not loaded or displayed | 0.5 day |
| 4 | **Transformation Photos** | 2-column grid with captions | Not loaded or displayed | 0.5 day |
| 5 | **Schedule & Booking** | Weekly availability grid + CustomProgramRequest | Not loaded or displayed | 1-2 days |
| 6 | **Connect button states** (Not linked/Pending/Linked) | Capsule button with 3 visual states | Single disabled "Linked" or active "Link with Trainer" | 0.5 day |
| 7 | **"Ask for Custom Plan" CTA** | Full-width blue tinted button | Not implemented | 0.5 day |
| 8 | **Tag badges row** | Horizontal scroll of info badges | Not implemented | 0.5 day |
| 9 | **Packages as horizontal scroll** | Horizontal scroll of MembershipCardView (260pt) | Vertical Card list with ListTile | 0.5 day |

### 7.2 Medium Gaps

| # | Feature | iOS | Flutter | Effort |
|---|---|---|---|---|
| 10 | **Cache-first loading** | CacheManager read then API refresh | No caching | 0.5 day |
| 11 | **Optimistic link/unlink** | Local state mutation + background API | Full reload after link | 0.5 day |
| 12 | **Empty states** | "No photos yet", "No upcoming events" | Not implemented (no tab structure) | 0.5 day |
| 13 | **Social links display** | `socialLinks` rendered in About tab | Not loaded | 0.5 day |
| 14 | **Benefits display** | `benefits` with iconName + title + description | Not loaded | 0.5 day |
| 15 | **Services display** | `services` with price, currency, duration | Loaded as untyped `List<dynamic>` | 0.5 day |
| 16 | **Certifications display** | Comma-separated in About or TagBadges | Loaded but not displayed in UI | 0.5 day |

### 7.3 Low Gaps

| # | Feature | iOS | Flutter | Effort |
|---|---|---|---|---|
| 17 | **Stripe purchase flow** | SafariView with Stripe Checkout | Backend URL received, SDK not wired | 1 day |
| 18 | **CustomProgramRequest wizard** | 3-step wizard | Not implemented | 1 day |
| 19 | **Events tab content** | Event list if trainer has events | Not loaded | 0.5 day |
| 20 | **Unlink confirmation** | Context menu → "Disconnect Trainer" → alert | Not implemented | 0.25 day |
| 21 | **External links display** | `externalLinks` rendered in About tab | Not loaded | 0.25 day |

### 7.4 Data Model Gaps

| Missing in `TrainerDetailDto` | Backend JSON Path | Type |
|---|---|---|
| `bannerImagePath` | `profile.bannerImagePath` | `String?` |
| `aboutMe` | `profile.aboutMe` | `String?` |
| `philosophy` | `profile.philosophy` | `String?` |
| `methodology` | `profile.methodology` | `String?` |
| `branding` | `profile.branding` | `String?` |
| `trainingTypes` | `profile.trainingTypes` | `List<String>` |
| `minServicePrice` | `profile.minServicePrice` | `String?` |
| `reviewCount` | `stats.reviewCount` | `int` |
| `clientsCoached` | `stats.clientsCoached` | `int` |
| `testimonials` | `profile.testimonials` | `List<TestimonialDto>` |
| `transformationPhotos` | `profile.transformationPhotos` | `List<TransformationPhotoDto>` |
| `socialLinks` | `profile.socialLinks` | `List<SocialLinkDto>` |
| `externalLinks` | `profile.externalLinks` | `List<ExternalLinkDto>` |
| `benefits` | `profile.benefits` | `List<BenefitDto>` |
| `packages` | top-level `packages` | `List<TrainerPackageDto>` |

---

## 8. Implementation Roadmap

### Phase 1 — Data Layer (update models)

1. **Update `TrainerDetailDto`** to include all backend fields:
   - Add banner fields (`bannerImagePath`)
   - Add bio sub-fields (`aboutMe`, `philosophy`, `methodology`, `branding`)
   - Add professional fields (`trainingTypes`, `minServicePrice`)
   - Add stats (`reviewCount`, `clientsCoached`)
   - Add relational data: `testimonials`, `transformationPhotos`, `socialLinks`, `externalLinks`, `benefits`
   - Add `packages` field (remove separate `getTrainerPackages` call)
2. **Create sub-models** with freezed:
   - `TrainerTestimonialDto`
   - `TrainerTransformationPhotoDto`
   - `TrainerSocialLinkDto`
   - `TrainerExternalLinkDto`
   - `TrainerBenefitDto`
   - `TrainerServiceDto` (replace untyped `List<dynamic>`)
3. **Simplify API calls**: Remove separate `getTrainerPackages()` — the aggregated profile already includes packages
4. **Add `unlinkTrainer()`** to `TrainerApiService` + `TrainerRepository`

### Phase 2 — Cubit / State Enhancement

5. **Enhance `TrainerDetailCubit`**:
   - Single `load(username)` call → aggregated profile
   - Add `unlinkTrainer()` with optimistic update
   - Add `refresh()` for pull-to-refresh
   - Add error boundary with retry
6. **Enhance `TrainerDetailState`**:
   - Add `unlinked`, `linking`, `linked`, `unlinking` sub-states for link flow
   - Keep existing `loaded` with full data

### Phase 3 — UI Rewrite (match iOS layout)

7. **Build banner + avatar overlay widget**:
   - `_TrainerBanner` — 200pt with gradient, AsyncImage, fallback gradient
   - Avatar positioned at bottom of banner (offset)
8. **Build identity row**:
   - Name, specialties, location, rating
   - Connect button with 3 states
9. **Build tag badges row**:
   - Horizontal scroll: rating, reviews count, specialties, location
10. **Build "Ask for Custom Plan" button**
11. **Build segmented tab bar + tab content**:
    - `_AboutTab` — bio sections (About Me, Philosophy, Methodology, Branding), social links, external links, benefits
    - `_PackagesTab` — horizontal scroll of package cards with purchase CTA
    - `_PhotosTab` — 2-column grid of transformation photos with captions
    - `_ReviewsTab` — horizontal scroll of testimonial cards with ratings
    - `_ScheduleTab` — weekly day selector + time slots

### Phase 4 — Navigation & Polish

12. **Refactor presentation**:
    - From Explore: show as bottom sheet (consistent with iOS)
    - From Home coach card: show as bottom sheet
    - Direct route: full-screen (existing behavior)
13. **Add unlink flow**: Context menu or long-press on "Connected" → confirmation dialog
14. **Add Stripe purchase flow**: Wire `flutter_stripe` with checkout session endpoint
15. **Add empty states** for all tabs

---

## Appendix A: Complete Backend Response Shape (Aggregated Profile)

Reference from `trainerService.ts` `getTrainerAggregatedProfile()`:

```typescript
interface AggregatedTrainerProfile {
  id: string;                    // User.id
  name: string;
  username: string | null;
  email: string;
  role: string;
  tier: string | null;
  isLinked?: boolean;            // Added by route handler

  profile: {
    id: string;                  // Profile.id
    userId: string;
    profilePhotoPath: string | null;
    bannerImagePath: string | null;
    aboutMe: string | null;
    philosophy: string | null;
    methodology: string | null;
    branding: string | null;
    certifications: string | null;
    specialties: string[];
    trainingTypes: string[];
    minServicePrice: string | null;
    averageRating: number | null;
    businessCurrency: string;

    locations: Location[];
    services: Service[];
    testimonials: Testimonial[];
    transformationPhotos: TransformationPhoto[];
    socialLinks: SocialLink[];
    externalLinks: ExternalLink[];
    benefits: Benefit[];
  };

  stats: {
    clientsCoached: number;
    reviewCount: number;
    averageRating: number | null;
  };

  packages: Package[];
}
```

## Appendix B: API Response Envelope

All endpoints wrap responses in standard envelope:

```typescript
// Success
{ "data": <response shape> }

// Error
{ "error": { "message": string, "code"?: string, "details"?: any } }
```

## Appendix C: Key Design Tokens (from iOS)

| Element | Value |
|---|---|
| Banner height | 200pt |
| Avatar size | 72px (with 3pt white stroke border) |
| Avatar offset | +20pt X, +30pt Y from banner bottom |
| Name font | 20pt bold |
| Specialties font | 13pt, secondary color |
| Location font | 11pt with mappin icon |
| Rating font | 12pt with star icon |
| Bio body | 14pt, secondary, 4pt line spacing |
| Connect button | Capsule (borderRadius 99) |
| Tag badge corner radius | 10pt |
| Segmented tab bar | Custom segmented control |
| Package card | 260pt wide, horizontal scroll |
| Photo grid | 2 columns, 12pt spacing, 150pt height, 14pt corner radius |
| Testimonial card | 220pt wide, 14pt corner radius |
| Schedule day button | 46×46 circular |
| Dismiss button | ultaThinMaterial circle, top-left |
