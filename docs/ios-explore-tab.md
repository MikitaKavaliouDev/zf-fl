# iOS Explore Tab — Full User Flow & UI Documentation (Client Mode)

> Reference app: `~/pr/Ziro-Fit`
> Source: `Ziro Fit/Views/ZiroMe/`, `Ziro Fit/ViewModels/ZiroMe/`, `Ziro Fit/ViewModels/`, `Ziro Fit/Models/`, `Ziro Fit/Services/API/`

---

## 1. Tab Entry Point

**Files**: `MainTabView.swift` (line 44), `CustomTabBar.swift` (lines 223, 238–239)

In **personal (client) mode**, the tab bar renders 5 tabs (left to right):

| Tab | Icon (SF Symbol) | `AppTab` enum | Screen |
|---|---|---|---|
| **Explore** | `sparkles` | `.programs` | `PersonalExploreView` |
| Workouts | `clock` | `.clients` | `WorkoutHistoryView` |
| Home | `house.fill` | `.home` | `PersonalHomeView` |
| Analytics | `chart.xyaxis.line` | `.analytics` | `PersonalAnalyticsView` |
| More | `ellipsis.circle` | `.more` | `MoreView` |

In `MainTabView.swift`, the Explore tab view is conditionally rendered (not NavigationStack-wrapped):

```swift
PersonalExploreView()
    .opacity(mode == .personal && selected == .programs ? 1 : 0)
    .allowsHitTesting(mode == .personal && selected == .programs)
```

**Note**: The Explore tab is the **first tab**, positioned at the far left. Tapping it sets `appState.selectedTab = .programs`.

---

## 2. Main Explore Screen: `PersonalExploreView`

**File**: `PersonalExploreView.swift` (334 lines)
**ViewModel**: `ExploreViewModel` (`ExploreViewModel.swift`, 547 lines)

### Layout Structure

```
ZStack(alignment: .top)
├── Background: Color.theme.backgroundPrimary (ignores safe area)
├── ScrollView
│   ├── Spacer (75pt for floating header)
│   ├── ExploreSlidingSegment (Telegram-style capsule tab: Trainers | Events)
│   │
│   ├── [TRAINERS TAB]
│   │   ├── 0. Featured Specialist Hero (TrainerSpotlightHeroCard)
│   │   ├── 1. Browse by Category (ExploreCategoryFilter)
│   │   ├──     Trending Tags (TrendingTagsView)
│   │   ├── 2. Trainers Near You (horizontal scroll, ExploreTrainerCard)
│   │   ├── 3. Featured Trainers (horizontal scroll, ExploreTrainerCard)
│   │   ├── 4. Ziro Recommends (horizontal scroll, ExploreTrainerCard)
│   │   └── 5. Map Spotlight Preview Card (MapSpotlightPreviewCard)
│   │
│   ├── [EVENTS TAB]
│   │   ├── 1. Featured Events Carousel (ExploreFeaturedCarousel → FeaturedEventCard)
│   │   └── 2. Upcoming Events (date-sectioned LazyVStack, ExploreEventRow)
│   │       OR ExploreEmptyEventsView if no events
│   │
│   └── Bottom padding: 110pt
│
└── Floating: ExploreCityHeader (frosted glass, zIndex: 1)
```

### 2.1 Floating Header: `ExploreCityHeader`

**Component**: `ExploreComponents.swift` lines 52–141

```
┌──────────────────────────────────────┐
│  [📍 SF / Select City]      [🔍][🗺️] │
│   Current Location / Active Region   │
└──────────────────────────────────────┘
```

| Element | Details |
|---|---|
| Left icon | Circle 38×38 — `location.fill` (blue) if current location, `mappin.and.ellipse` (red) if selected city |
| City name | 20pt bold, `-0.4pt` tracking, chevron down 11pt |
| Subtitle | 11pt medium — "Current Location" or "Active Region" |
| Search button | `magnifyingglass` 20pt → opens `TrainerDiscoveryView` (fresh, no filters) |
| Map button | `map` 20pt → opens `TrainerMapView` |
| Background | `ultraThinMaterial` (frosted glass) |
| Haptics | `UISelectionFeedbackGenerator` on all button taps |

**Tap city → CityPickerSheet** (`ExploreComponents.swift` lines 936–1002):
- "Current Location" row (checkmark if selected)
- List of cities from API metadata

### 2.2 Segmented Tab: `ExploreSlidingSegment`

**Component**: `ExploreComponents.swift` lines 1062–1103

```
┌──────────────────────────────────────┐
│    [  Trainers  ]  │  [  Events  ]    │
└──────────────────────────────────────┘
```

- Two tabs: **Trainers** and **Events**
- Animated capsule indicator with `matchedGeometryEffect(id: "ExploreTabBackground")`
- Spring animation (response: 0.3, dampingFraction: 0.7)
- Background: `ultraThinMaterial`, 24pt corner radius, 1px stroke border
- Font: 13pt bold, accent color when selected, gray when not

### 2.3 Trainers Tab Sections

#### 0. Featured Specialist Hero: `TrainerSpotlightHeroCard`

**Component**: `ExploreComponents.swift` lines 655–808

```
┌──────────────────────────────────────┐
│  "Featured Specialist" (headline)     │
│                                       │
│  ┌─────────────────────────────────┐ │
│  │ 👤  SPOTLIGHT SPECIALIST  ★ 5.0 │ │
│  │     John Doe                    │ │
│  │     Calisthenics • Strength     │ │
│  │  "Bio text..."                  │ │
│  │  📍 New York      [View →]      │ │
│  └─────────────────────────────────┘ │
└──────────────────────────────────────┘
```

| Element | Spec |
|---|---|
| Card size | Full width (horizontal padding), 22pt corner radius |
| Background | Dark gradient: `#141d42` → `#08081f`, plus purple glow circle (180pt, blur 35) offset right |
| Profile image | 68×68 circle, blue→purple gradient stroke ring (2pt) |
| Badge | "SPOTLIGHT SPECIALIST" — gradient blue→purple, 8pt black, white text, 6pt corner radius |
| Name | 18pt bold, white |
| Specialties | 11pt, white 80% opacity, separated by • |
| Rating | Star icon + number, black 35% opaque capsule, 8pt corner radius |
| Bio | 13pt, white 85% opacity, max 2 lines |
| CTA | "View Profile" + arrow, white 18% opacity background, 10pt corner radius |
| Shadow | Blue 12% opacity, 12pt radius, y: 6 |

**Data**: Uses `viewModel.featuredTrainers.first ?? viewModel.nearbyTrainers.first`. If no trainers, this section is hidden.

#### 1. Browse by Category: `ExploreCategoryFilter`

**Component**: `ExploreComponents.swift` lines 342–400

```
"Browse by Category" (headline)
[🏋️ All] [🧘 Yoga] [🏃 HIIT] [🤸 Calisthenics] [🧘 Mobility] [💪 Pilates] [🥊 Boxing]...
```

| Element | Spec |
|---|---|
| Each pill | Leading icon (24×24 circle) + name (13pt bold) |
| Selected state | Icon filled with theme color + white icon, tinted background, 1.5pt colored border |
| Unselected state | Icon outline on ~12% opacity background, gray border |
| Animation | Spring (response: 0.3, dampingFraction: 0.7) |
| Haptics | `UISelectionFeedbackGenerator` |

Each `ExploreCategory` has a computed `systemIconName` and `themeColor` based on name:

| Category | Icon | Color |
|---|---|---|
| All | `sparkles` | Purple |
| Yoga | `figure.mind.and.body` | Teal |
| Calisthenics | `figure.gymnastics` | Cyan |
| Strength | `dumbbell.fill` | Red |
| Cardio/HIIT | `figure.run` | Orange |
| Pilates | `figure.stretch` | Pink |
| CrossFit | `flame.fill` | Orange |
| Wellness | `heart.fill` | Green |

#### Trending Tags: `TrendingTagsView`

**Component**: `ExploreComponents.swift` lines 811–854

```
TRENDING SEARCHES
[✨ #Strength] [✨ #Yoga] [✨ #HIIT] [✨ #Calisthenics] [✨ #Mobility] [✨ #Pilates]
```

- Hardcoded tags: `["Strength", "Yoga", "HIIT", "Calisthenics", "Mobility", "Pilates"]`
- "TRENDING SEARCHES" label: 10pt bold, secondary, 0.8pt tracking
- Each tag: sparkles icon + `#Tag`, 12pt bold, blue tinted capsule with 1px border
- **Tap → opens `TrainerDiscoveryView`** with specialty pre-filtered + sort=closest

#### 2. Trainers Near You / 3. Featured / 4. Ziro Recommends: `ExploreTrainerCard`

**Component**: `ExploreComponents.swift` lines 541–652

```
┌──────────────────┐
│ ┌──────────────┐ │
│ │   [avatar]   │ │
│ │   144×144    │ │
│ │        ★ 4.8 │ │
│ └──────────────┘ │
│ ┌──────────────┐ │
│ │ John Doe     │ │
│ │ Strength     │ │
│ │ 📍 NYC       │ │
│ └──────────────┘ │
└──────────────────┘
```

| Element | Spec |
|---|---|
| Card width | 144pt |
| Image area | 144×144, 16pt corner radius, gray 5% bg |
| Avatar | AsyncImage, scaledToFill, or person.fill placeholder (padding 26) |
| Rating overlay | Top-right: star + rating, black 60% bg, 8pt corner radius, padding 8 |
| Promotion badge | Top-left: "Featured" (yellow, star.fill) or "Ziro Recommends" (indigo, sparkles) |
| Name | 15pt bold, 1 line |
| Specialty | 11pt semibold, secondary, 1 line (first specialty) |
| Location | 10pt, secondary, with mappin icon / 9pt |
| Spacing | 8pt between items, `hStack` spacing inside VStack |

**Data sources**:
- "Near You": `viewModel.nearbyTrainers` → API `/trainers?sortBy=distance&pageSize=10`
- "Featured": `viewModel.featuredTrainers` → API `/explore/promoted-trainers?category=FEATURED`
- "Recommends": `viewModel.recommendedTrainers` → API `/explore/promoted-trainers?category=ZIRO_RECOMMENDED`

**Tap → `PublicTrainerProfileView` sheet**.

#### 5. Map Spotlight: `MapSpotlightPreviewCard`

**Component**: `ExploreComponents.swift` lines 857–924

```
┌──────────────────────────────────────┐
│ [🗺️ icon] Interactive Match Map   >  │
│            N elite coaches online     │
└──────────────────────────────────────┘
```

- Blue accent background + darker bottom gradient overlay
- Map icon: 54×54 rounded rect, blue→purple gradient, circle decoration + `map.fill`
- Title: 16pt bold, white
- Subtitle: 11pt medium, white 80% opacity — `"{count} elite coaches online near you"`
- Chevron right, 13pt bold, white 70% opacity
- 18pt corner radius, shadow with accent color 22% opacity
- **Tap → `TrainerMapView` sheet**

### 2.4 Events Tab Sections

#### Featured Events Carousel: `ExploreFeaturedCarousel` → `FeaturedEventCard`

**Component**: `ExploreComponents.swift` lines 144–338

```
┌─────────────────────────────────────┐
│         ┌───────────────────────┐    │
│         │ [Host Badge]  [FREE]  │    │
│         │                       │    │
│         │     Event Image       │    │
│         │     290×180           │    │
│         │                       │    │
│         │  ┌──────────────────┐ │    │
│         │  │ Event Title     │ │    │
│         │  │ 🕐 9:00  📍 NYC │ │    │
│         │  │ [HIIT] [CARDIO] │ │    │
│         │  │ ████████░░ 12/15│ │    │
│         │  └──────────────────┘ │    │
│         └───────────────────────┘    │
└─────────────────────────────────────┘
```

| Element | Spec |
|---|---|
| Card | 290×180, 20pt corner radius |
| Image | AsyncImage scaledToFill, or gray rect + sparkles placeholder |
| Gradient | Black linear gradient bottom→top (85%→20%→clear) |
| Host badge | Left top: icon depends on `organizerType` (brand→bolt, corporate→building, gym→dumbbell, trainer→person) + uppercase host name, 8pt black, 8pt corner radius |
| Status badge | Right top: "FREE" (green), "🔥 SELLING FAST" (orange), or category (black 60%) |
| Bottom panel | `black 28% + ultraThinMaterial` background |
| Title | 15pt bold, white, 1 line |
| Time | clock.fill icon + `.shortened` time, 11pt caption, white 85% |
| Location | mappin icon + location name, 11pt caption |
| Highlights | Up to 2, white 18% bg, 8pt bold, 6pt corner radius |
| Capacity bar | "X spots left" + "Y/Z filled", ratio bar (blue or orange if >80%), 3pt height |
| Shadow | Black 15%, 8pt radius, y: 4 |

#### Upcoming Events List: `ExploreEventRow`

**Component**: `ExploreComponents.swift` lines 403–538

```
┌──────────────────────────────────────┐
│ ┌────┐  HOST: ZIRO CREW     Selling │
│ │ MAY│  Community HIIT        out  │
│ │ 15 │  9:00 AM • Free             │
│ └────┘  📍 Central Park            │
│         [HIIT] [Cardio]            │
└──────────────────────────────────────┘
```

| Element | Spec |
|---|---|
| Height | 88pt (image), or standalone date widget |
| Image | 88×88 rounded rect, or `EventDateWidget` (large: 54×54) if no image |
| Date widget | Red gradient top (month) + white bg (day), 10pt corner radius, shadow |
| Host | Icon + uppercase name, 8pt black, color-coded per type |
| Title | 15pt bold, 2 line limit |
| Time+Price | 11pt, secondary color, price blue/green |
| Location | 11pt, mappin icon |
| Highlights | Up to 2, blue tinted pills, 8pt bold |
| "Selling out" | Right side: orange badge, 9pt black, 6pt corner radius |
| Card bg | `backgroundSecondary` 50% opacity, 16pt corner radius, 1px stroke |

#### Empty State: `ExploreEmptyEventsView`

**Component**: `ExploreEmptyEventsView.swift` (70 lines)

```
       📅 (calendar.badge.exclamationmark in blue circle)
 No Upcoming Events
 "Check back later for new workshops..."
        [Notify Me]
```

- "Notify Me" button → calls `subscribeToEventNotifications()` on `ExploreViewModel`
- 80pt circle with calendar icon, blue accent
- Title + subtitle centered
- Loading state: shows ProgressView during subscription

#### Date Section Headers

```
Today — Tomorrow — Thursday, Jun 25
```

Formatted with: "Today", "Tomorrow", or `EEEE, MMM d`. Headers are pinned (`pinnedViews: [.sectionHeaders]`) with background matching the main background.

### 2.5 Sheet Presentations from `PersonalExploreView`

| Trigger | Destination | Sheet type |
|---|---|---|
| Search / tag tap | `TrainerDiscoveryView` (with optional filters) | Full sheet |
| Map icon | `TrainerMapView` (passes events) | Full sheet |
| City tap | `CityPickerSheet` | ZiroSheet |
| Trainer card | `PublicTrainerProfileView` | Sheet |
| Event card (carousel) | `EventDetailView` (presentationDetents: .large, no drag indicator) | Sheet |
| Event card (list) | `EventDetailView` | Sheet |
| "Notify Me" | (inline) subscribe to push notifications | Inline API call |

### 2.6 `ExploreViewModel` Data Flow

**File**: `ExploreViewModel.swift` (547 lines)

```swift
class ExploreViewModel: ObservableObject {
    @Published var selectedCity: ExploreCity?
    @Published var selectedCategory: ExploreCategory?
    @Published var featuredEvents: [ExploreEvent] = []
    @Published var upcomingEvents: [Date: [ExploreEvent]] = [:]  // Grouped by date
    @Published var sortedDates: [Date] = []
    @Published var featuredTrainers: [TrainerPublicProfile] = []
    @Published var nearbyTrainers: [TrainerPublicProfile] = []
    @Published var recommendedTrainers: [TrainerPublicProfile] = []
    @Published var cities: [ExploreCity] = []
    @Published var categories: [ExploreCategory] = []
    @Published var userLocationCity: String?
    // ...
}
```

**Loading strategy**: `loadContent()` launches 3 independent `Task`s in parallel:

1. **Featured & Promoted** — fetches `fetchExploreFeatured()` (events) + `fetchPromotedTrainers(category: "FEATURED")` + `fetchPromotedTrainers(category: "ZIRO_RECOMMENDED")`
2. **Events list** — fetches `fetchExploreEvents()` grouped by `Calendar.current.startOfDay(for:)`
3. **Nearby Trainers** — fetches `searchTrainers(page: 1, pageSize: 10, sortBy: "distance")`

**Location reactivity**: `Combine` pipeline observes `locationManager.$userLocation` (debounced 10m distance) and `$selectedCity` changes to reload content.

**Category filter**: `$selectedCategory` changes trigger `loadEventsList()` to reload only events.

**Onboarding filters**: Accepts `initialFilters` tuple (specialty, location, lat, lon) from `AppState.initialTrainerFilters` or `TrainerFindingOnboardingView`.

---

## 3. Full Search & Discovery: `TrainerDiscoveryView`

**File**: `TrainerDiscoveryView.swift` (472 lines)
**ViewModel**: `TrainerDiscoveryViewModel` (`TrainerDiscoveryViewModel.swift`, 267 lines)

Opened as a sheet from:
- `PersonalExploreView` → search icon, trending tags, category tap
- `PersonalHomeView` → "Need a Coach?" banner, TrainerFindingOnboarding completion

### Layout

```
ZStack(alignment: .top)
├── ScrollView (results, pull-to-refresh)
│   └── LazyVStack(spacing: 16)
│       ├── Trainers section (if .specialists or .all)
│       │   ├── Empty state (contextual messages)
│       │   └── TrainerDiscoveryCard list (with infinite scroll)
│       ├── Events section (if .events or .all)
│       │   ├── Empty state
│       │   └── ExploreEventRow list (with infinite scroll)
│       └── Generic empty state (if .all + no results & search)
│
└── Material Header Overlay (zIndex: 1)
    ├── Drag handle (Capsule 40×5)
    ├── "Discover specialists and events" (28pt bold)
    ├── Segmented Picker: [Specialists | Events | All]
    ├── Search bar + Filter button
    └── Active filter chips (horizontal scroll, removable)
```

#### Header Details

| Element | Spec |
|---|---|
| Drag handle | Capsule, secondary 20% opacity, 40×5, padding top 10, bottom 8 |
| Title | 28pt bold, `Color.theme.textPrimary`, padding horizontal |
| Segmented picker | `SegmentedPickerStyle`, bound to `$viewModel.discoveryType` |
| Search bar | magnifyingglass icon + TextField, 12pt padding, 12pt corner radius, `backgroundSecondary` 50% opacity |
| Placeholder | "Specialty or Specialist Name" or "Search events..." |
| Filter icon | `line.3.horizontal.decrease.circle` — blue if `hasActiveFilters`, gray otherwise |
| Active filter chips | Horizontal ScrollView, removable chip per filter |
| Header inset | 200pt (235pt if active filters) |
| Background | `ultraThinMaterial` |

### 3.1 Discovery Types (`DiscoveryType` enum)

| Case | Shows |
|---|---|
| `.specialists` | Trainers only |
| `.events` | Events only |
| `.all` | Both, with section headers |

### 3.2 Trainer Discovery Card: `TrainerDiscoveryCard`

**Component**: `TrainerDiscoveryView.swift` lines 384–471

```
┌──────────────────────────────────────┐
│ ┌────────┐  Name            ★ 4.8  │
│ │        │  Strength, HIIT          │
│ │ 80×80  │  📍 NYC                  │
│ │ avatar │  15 Reviews              │
│ └────────┘                          │
└──────────────────────────────────────┘
```

| Element | Spec |
|---|---|
| Image | 80×80, 12pt corner radius (AsyncImage or gray placeholder) |
| Name | .headline, `textPrimary` |
| Rating | Star fill (yellow) + number, caption2 bold |
| Specialties | caption, secondary, comma-separated, 1 line |
| Location | caption2, mappin icon, secondary |
| Reviews | caption2, blue, "X Reviews" |
| Card | 16pt padding, 16pt corner radius, 60% opacity bg, 1px stroke (primary 10%) |

### 3.3 Filter Sheet: `FilterSheet`

**Component**: `TrainerDiscoveryView.swift` lines 295–382

| Section | Control |
|---|---|
| Sort By | Picker with all `SortOption` cases |
| Location | TextField "Enter City or Region" |
| Specialty | Horizontal scroll of toggle pills (background: blue when selected, gray 10% otherwise) |
| Minimum Rating | Slider 0→5, step 0.5 |
| Reset All | Red button |

**Sort options** (`SortOption` enum, `.apiKey` mapping):

| Display | API Key |
|---|---|
| Closest | `distance` |
| Highest Rated | `rating` |
| Newest | `newest` |
| Name (A-Z) | `name_asc` |
| Name (Z-A) | `name_desc` |
| Price: Low to High | `price_asc` |
| Price: High to Low | `price_desc` |

### 3.4 `TrainerDiscoveryViewModel` Data Flow

**Pagination**: Page size 20, `loadMore()` triggered by `.onAppear` of last item.

**Search debounce**: 500ms text debounce + 300ms filter debounce, combined via `CombineLatest3`.

**Local fuzzy fallback**: When `searchText` is non-empty, caches pre-search results and performs local filtering (name + specialties match) as supplement to API results.

**API parameters mapping**:

```
searchTrainers(
    page, pageSize,
    query: searchText (or nil),
    location: selectedLocation (or nil),
    sortBy: selectedSortOption.apiKey,
    minRating: > 0 ? minRating : nil,
    specialties: selectedSpecialty (or nil),
    latitude: initialLat ?? locationManager.lat,
    longitude: initialLong ?? locationManager.lng
)
```

### 3.5 Empty States

Contextual empty messages for trainers:

| Condition | Message |
|---|---|
| Search text not empty | "No specialists found for '{query}'" + "Try a different name or specialty" |
| Location selected | "No specialists in {location} yet" + "Try searching for 'Online' or nearby areas" |
| Filters active | "No specialists match your filters" + "Try clearing some filters" |
| No filters, no search | "Discovery is coming to life..." + "We're connecting you with the best professionals" |
| All empty (`.all`) | Magnifying glass + "No results found for '{query}'" |

---

## 4. Trainer Profile Detail: `PublicTrainerProfileView`

**File**: `PublicTrainerProfileView.swift` (803 lines)

Opened as a sheet from any trainer card tap.

### Full Layout (App Store-inspired)

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
│   │   └── TagBadge component: icon + text, 10pt corner radius, tinted bg
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

### Tab Content

#### About
- Bio text with HTML stripped via `.strippingHTML()`
- "About" header (20pt bold) + body (14pt, secondary, 4pt line spacing)

#### Packages
- Horizontal scroll of `MembershipCardView` (260pt wide)
  - Package name, session count, price, currency, description
  - "Recommended" indicator on first package
  - Tap calls `initiatePurchase(packageId:)` → Stripe checkout

#### Photos
- 2-column `LazyVGrid`, 12pt spacing
- Each: AsyncImage (150pt height, 14pt corner radius) + optional caption badge (blue, 7pt black)

#### Reviews
- Horizontal scroll of testimonial cards (220pt wide, 14pt corner radius)
  - Client name + star rating (5 stars, 8pt)
  - Testimonial text (12pt, secondary, max 4 lines, 2pt line spacing)
  - Date (9pt, gray)

#### Events
- Placeholder: "No upcoming events"

#### Schedule
- Day selector: M T W T F S S (circular buttons, 46×46, blue when selected, gray6 when not)
- Green dot indicator on days with availability
- Time slots in `LazyVGrid` (adaptive min 88pt): `clock` icon + time label
- Tapping a time slot opens `CustomProgramRequestView`
- **API**: `GET /api/trainers/{username}/schedule`

### Connect Button States

| State | Visual | Action |
|---|---|---|
| Not linked | Blue capsule, "Connect", shadow | `linkWithTrainer(username:)` |
| Pending | Gray capsule, "Pending" | — |
| Linked | Green capsule, "Connected" | Context menu → "Unlink from Trainer" (with confirmation) |

### Custom Program Request (`CustomProgramRequestView`)

3-step wizard with progress bar:
1. **Goal**: TextEditor for goals description
2. **Duration**: Select 4/8/12 weeks
3. **Confirm**: Sparkle icon + summary + "Send Request"

### Data Loading

- On appear: `loadTrainerProfile()` → reads cache first, then fetches `GET /api/trainers/{identifier}` (uses username or id)
- Fetches schedule via `GET /api/trainers/{username}/schedule`

### API Calls in Profile

| Action | Endpoint | Method |
|---|---|---|
| Load profile | `GET /api/trainers/{username}` | GET |
| Link client | `POST /api/client/trainer/link` | POST |
| Unlink client | `DELETE /api/client/trainer/link` | DELETE |
| Purchase package | `POST /api/checkout/session` | POST |
| Fetch schedule | `GET /api/trainers/{username}/schedule` | GET |

---

## 5. Event Detail: `EventDetailView`

**File**: `EventDetailView.swift` (311 lines)
**ViewModel**: `EventDetailViewModel` (`EventDetailViewModel.swift`, 55 lines)

### Layout

```
ZStack(alignment: .bottom)
├── ScrollView
│   ├── Hero Image (250pt) + gradient overlay (black bottom)
│   ├── Title (title bold)
│   ├── Hosted by Name (subheadline, secondary)
│   │
│   ├── Attendance Section
│   │   └── "X Attending" + "X spots left" + capacity bar (Capsule, 8pt height)
│   │
│   ├── Date & Time
│   │   └── Calendar icon + date + time range
│   │
│   ├── Location
│   │   ├── Pin icon + location name + address
│   │   └── Mini Map (180pt, .standard, tappable → Apple Maps)
│   │
│   └── About Event
│       └── Description text (body, secondary, 4pt line spacing)
│
├── Bottom Action Bar
│   ├── Price + "Total Price" label
│   └── [Enroll Now / Enrolled / Event Full] button
│
└── Dismiss button (X icon, ultraThinMaterial circle, top-left)
```

### Enrollment Flow (`EventDetailViewModel.enroll()`)

```swift
if event.price > 0 {
    // Paid → Stripe Checkout via /api/checkout/session
    // Opens SafariView with returned URL
} else {
    // Free → Direct join via POST /api/events/{id}/join
    // Shows success alert, refreshes details
}
```

- Sheet opens with `presentationDetents([.large])` and hidden drag indicator

---

## 6. Interactive Map: `TrainerMapView`

**File**: `TrainerMapView.swift` (1208 lines)

### Layout

```
ZStack(alignment: .top)
├── Map (full screen, edge-to-edge)
│   ├── Annotations (clustered)
│   └── UserAnnotation
│
├── Header Layer
│   ├── Close button (X, ultraThinMaterial circle)
│   ├── MapFilterPill (right side)
│   │   └── MapFilterMenu overlay (when open)
│   └── Location button (location.fill, ultraThinMaterial circle)
│
├── Bottom Area
│   ├── Selection Content Card (if cluster selected)
│   │   ├── Single → TrainerMapCard or EventMapCard
│   │   └── Multiple → ClusterListView
│   ├── Search Results Layer (when searchText not empty)
│   │   └── Locations / Specialists / Events sections
│   └── Search Bar (Capsule, ultraThinMaterial)
```

### Key Features

| Feature | Details |
|---|---|
| Map framework | MapKit (native) |
| Clustering | Custom: dynamic epsilon based on zoom level (span/15), minimum 0.0001 |
| Annotation design | Single: 44/50pt card with avatar/image. Cluster: stacked cards + count badge |
| Filter modes | All, Trainers, Events, Yoga Coaches |
| Filter menu | Overlay with checkmark, ultraThinMaterial, 250pt width, 20pt corner radius |
| Search | `MKLocalSearch` for locations + `searchTrainers()`/`fetchExploreEvents()` for content |
| Selection card | `TrainerMapCard` or `EventMapCard` — ultraThinMaterial, 16pt corner radius, "Open" button |

### Map Annotation Components

```
SingleItemAnnotationView (50pt, 60pt selected):
┌──────────────┐
│   [avatar]   │
│  44/54×44/54 │
│  rounded 9pt │
└──────────────┘

ClusterAnnotationView:
    ┌──────────────┐
    │  \ [card2] /│  (stacked with rotation)
    │ [card1]   │
    │   \ [5] /  │  (badge count)
    └──────────────┘
```

---

## 7. Onboarding → Explore Flow: `TrainerFindingOnboardingView`

**File**: `TrainerFindingOnboardingView.swift` (306 lines)

Presented as `.fullScreenCover` from `PersonalHomeView` when user has no trainer and hasn't seen it before.

4-step flow:
1. **Intro**: "Let's Find Your Coach" — shield icon, explanatory text
2. **Goal selection**: Grid of goals (flexible 2-column) — Strengthen, Lose Weight, Gain Muscle, Improve Flexibility, Sport Specific, General Fitness
3. **Location preference**: Local (with city text field + mini map) vs Online
4. **Summary**: Selected goal + city with "Show Matches" button

**On completion** → calls `onFinish(specialty, location)` → sets `discoveryFilters` → opens `TrainerDiscoveryView` with those filters pre-applied.

---

## 8. Entry Points from Home: `PersonalHomeView`

**File**: `PersonalHomeView.swift` (977 lines)

### "Need a Coach?" Banner
- Visible when `viewModel.trainer == nil` AND `!coachBannerDismissed`
- Blue→purple gradient, swipeable to dismiss (DragGesture)
- Tap → `showingDiscovery = true` → `TrainerDiscoveryView`

### Coach Card (when connected)
- Shows trainer name, chevron right
- Context menu → "Disconnect Trainer"
- Tap → `PublicTrainerProfileView` (partial profile, full fetch on load)

### Trainer Finding Onboarding
- Triggered when `!appState.hasSeenTrainerFinding && viewModel.trainer == nil`
- After educational onboarding completes
- Fills discovery filters and opens `TrainerDiscoveryView` with them

---

## 9. Models Summary

### `ExploreCity` (`ExploreModels.swift`)
```swift
struct ExploreCity: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let imageUrl: String?
    let latitude: Double?
    let longitude: Double?
    var type: CityType  // .currentLocation or .city
}
```

### `ExploreCategory` (`ExploreModels.swift`)
```swift
struct ExploreCategory: Identifiable, Codable, Equatable {
    let id: String
    let name: String
    let iconUrl: String?
    // Computed: systemIconName, themeColor
}
```

### `ExploreEvent` (`ExploreModels.swift`)
```swift
struct ExploreEvent: Identifiable, Codable, Equatable {
    let id: String
    let title: String
    let description: String?
    let startTime: Date
    let endTime: Date?
    let price: Double?
    let currency: String?
    let locationName: String
    let address: String?
    var latitude: Double?
    var longitude: Double?
    var imageUrl: String?
    let categoryId: String?
    let cityId: String?
    let priceDisplay: String?   // "40 PLN" or "Free"
    let hostName: String?
    let hostId: String?
    let trainerName: String?
    let trainerId: String?
    let enrolledCount: Int?
    let capacity: Int?
    let isBooked: Bool?
    let isNearCapacity: Bool?
    var trainer: EventTrainer?
    let organizerType: String?   // "brand", "corporate", "gym", "trainer"
    let highlights: [String]?
    // Computed: isFull, spotsLeft, resolvedHostName, date
}
```

### `TrainerPublicProfile` (`WorkoutModels.swift` line 801)
```swift
struct TrainerPublicProfile: Identifiable, Codable, Equatable {
    let id: String
    let name: String?
    let email: String?
    let username: String?
    let avatarUrl: String?
    let bannerUrl: String?
    let bio: String?
    let philosophy: String?
    let methodology: String?
    let specialties: [String]?
    let location: String?
    let locations: [TrainerLocation]?
    let rating: Double?
    let reviewCount: Int?
    let packages: [TrainerPackage]?
    let services: [TrainerService]?
    let testimonials: [Testimonial]?
    let transformationPhotos: [TransformationPhoto]?
    let socialLinks: [SocialLink]?
    let externalLinks: [ExternalLink]?
    let certifications: [String]?
    let qualifications: [String]?
    let benefits: [Benefit]?
    let distance: Double?
    var isConnected: Bool?
    var linkStatus: LinkStatus?   // .none, .pending, .linked, .rejected
    let updatedAt: Date?
    var promotionCategory: String?  // "FEATURED" or "ZIRO_RECOMMENDED"
    // CodingKeys: flattened + nested "profile", "stats", "packages"
}
```

### `SearchTrainersResponse` (`WorkoutModels.swift` line 780)
```swift
struct SearchTrainersResponse: Codable {
    let trainers: [TrainerPublicProfile]
    let totalTrainers: Int
    let currentPage: Int
    let totalPages: Int
}
```

### `PromotedTrainer` (`ExploreModels.swift`)
```swift
struct PromotedTrainer: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let username: String?
    let avatarUrl: String?
    let rating: Double?
    let isVerified: Bool?
    let specialties: [String]?
    let promotionCategory: String
    let promotedAt: String?
    // Has toTrainerPublicProfile() converter
}
```

---

## 9.5 Standalone Events Browser: `EventsListView` & `EventsViewModel`

**File**: `EventsListView.swift` (119 lines), `EventsViewModel.swift` (102 lines)

A separate, standalone events browser with its own search and filtering. **Note**: This view has a `showingEventsList` state and sheet presentation in `PersonalExploreView`, but no trigger button is currently wired in the main UI — it exists as a reusable component.

### `EventsViewModel` Features
- Search text debounced at 500ms
- Filter by category (`selectedCategory`) and free-only toggle (`isFreeOnly`)
- Pagination: page size 12, `loadNextPageIfNeeded` infinite scroll trigger
- API: `fetchExploreEvents()` with all query params

### `EventsListView` Layout
- Search bar at top (magnifyingglass + TextField)
- Horizontal filter chips: "All", "Yoga", "HIIT", "Free"
- LazyVStack with `EventRowView` (simplified card: image 100×80, title, date, location, price)
- NavigationLink to `EventDetailView`
- Uses `scrollContentBackground(.hidden)` on Form

---

## 10. UI Test Coverage

**File**: `Ziro FitUITests/ScreenshotTests.swift` (line 247)

```swift
func testScreenshot_Client_TrainerDiscovery() throws {
    app.buttons["Programs"].tap() // In personal mode, explore tab
    // ...
}
```

The explore tab is accessed via the **"Programs"** accessibility button (because internally it uses `.programs` AppTab enum, visible only in code). In personal mode, the tab bar label is "Explore" but the accessibility identifier remains "Programs".

---

## 12. API Endpoints Consumed by Explore

| Endpoint | Method | Used By |
|---|---|---|
| `/explore/metadata` | GET | `ExploreViewModel` → cities + categories |
| `/explore/featured`?lat=&long=&cityId= | GET | `ExploreViewModel` → featured events + trainers |
| `/explore/promoted-trainers?category=FEATURED\|ZIRO_RECOMMENDED` | GET | `ExploreViewModel` → promoted sections |
| `/events`?page=&limit=&lat=&long=&cityId=&category=&search= | GET | `ExploreViewModel` + `TrainerDiscoveryViewModel` → events list |
| `/events/{id}` | GET | `EventDetailViewModel` → event detail |
| `/events/{id}/join` | POST | `EventDetailViewModel` → free event enroll |
| `/events/search?q=` | GET | `APIService+Explore` → event search |
| `/checkout/session` | POST | `EventDetailViewModel` + `PublicTrainerProfileView` → Stripe checkout |
| `/trainers`?page=&pageSize=&q=&location=&sortBy=&minRating=&specialties=&latitude=&longitude= | GET | `ExploreViewModel` + `TrainerDiscoveryViewModel` → trainer search |
| `/trainers/{identifier}` | GET | `PublicTrainerProfileView` → full profile |
| `/trainers/{username}/schedule` | GET | `PublicTrainerProfileView` → availability |
| `/client/trainer/link` | POST / DELETE | `PublicTrainerProfileView` → connect/unlink |

---

## 12. Navigation & Transition Map

```
[Tab Bar: Explore]
    │
    ▼
[PersonalExploreView]
    │
    ├── tap city header ───────────► [CityPickerSheet]
    ├── tap search icon ───────────► [TrainerDiscoveryView]
    ├── tap trending tag ──────────► [TrainerDiscoveryView] (pre-filtered)
    ├── tap category ──────────────► (reloads events)
    ├── tap trainer card ──────────► [PublicTrainerProfileView]
    │                                ├── tap Connect
    │                                ├── tap Package → Stripe SafariView
    │                                ├── tap Schedule slot → [CustomProgramRequestView]
    │                                └── tap "Ask for Custom Plan" → [CustomProgramRequestView]
    ├── tap event card ────────────► [EventDetailView]
    │                                ├── tap Enroll (free) → inline success
    │                                └── tap Enroll (paid) → SafariView (Stripe)
    ├── tap map icon ──────────────► [TrainerMapView]
    │                                ├── tap annotation → card overlay
    │                                ├── tap card Open → profile/event detail
    │                                └── tap filter → MapFilterMenu
    └── pull to refresh ───────────► reloadContent()

[PersonalHomeView]
    │
    ├── tap "Need a Coach?" ───────► [TrainerDiscoveryView]
    ├── tap coach card ────────────► [PublicTrainerProfileView]
    └── after TrainerFindingOnboarding ──► [TrainerDiscoveryView] (pre-filtered)
```
