# Map View Gap Analysis: iOS → Flutter

## Overview
iOS `TrainerMapView.swift` (1208 lines) vs Flutter `TrainerMapScreen.dart` (58 lines).

The Flutter map is a bare OpenStreetMap centered on Warsaw with **zero markers, zero interactivity, no clustering, no search, no filters**. The iOS map is a full production feature.

---

## Feature Comparison

| Feature | iOS (TrainerMapView.swift) | Flutter (TrainerMapScreen.dart) | Gap |
|---|---|---|---|
| **Map Engine** | Apple MapKit | `flutter_map` (OSM) | Different engine — OK, flutter_map is intentional |
| **Trainer Pins** | ✅ Annotations with avatars | ❌ Empty loop, no markers | **CRITICAL** |
| **Event Pins** | ✅ Events with lat/lng shown on map | ❌ Events not even loaded | **CRITICAL** |
| **Clustering** | ✅ Dynamic epsilon (zoom-aware), DBSCAN-like | ❌ Not implemented | **CRITICAL** |
| **Single Item Annotation** | ✅ Rounded card with avatar/image, grows on selection | ❌ Not implemented | **CRITICAL** |
| **Cluster Annotation** | ✅ Stacked cards (up to 3) + blue count badge | ❌ Not implemented | **CRITICAL** |
| **Selection Card (Trainer)** | ✅ Bottom card: avatar, name, specialties, rating, "Open" btn | ❌ Not implemented | **CRITICAL** |
| **Selection Card (Event)** | ✅ Bottom card: image, title, location, date, "View" btn | ❌ Not implemented | **CRITICAL** |
| **Cluster List View** | ✅ Scrollable list of items in cluster | ❌ Not implemented | **CRITICAL** |
| **Filter Menu** | ✅ Pill button → dropdown: All/Trainers/Events/Yoga | ❌ Not implemented | **HIGH** |
| **Search Bar** | ✅ Capsule search "Search specialists or events" | ❌ Not implemented | **HIGH** |
| **Location Search** | ✅ MKLocalSearch for addresses/cities | ❌ Not implemented (use Nominatim) | **HIGH** |
| **Search Results** | ✅ Sections: Locations, Specialists, Events | ❌ Not implemented | **HIGH** |
| **User Location** | ✅ CLLocationManager, zoom to user on appear | ❌ Not implemented | **HIGH** |
| **Location Button** | ✅ Re-center to user location | ❌ Not implemented | **MEDIUM** |
| **Close Button** | ✅ Xmark circle button | ❌ Not implemented | **MEDIUM** |
| **Map Compass** | ✅ MapCompass | ❌ Not implemented | **LOW** |
| **Map Scale** | ✅ MapScaleView | ❌ Not implemented | **LOW** |
| **Pagination** | ✅ loadMore() for trainers + events | ❌ Map doesn't load events at all | **HIGH** |
| **Zoom-aware data** | ✅ Recalculates clusters on camera change | ❌ Static zoom level | **HIGH** |
| **Annotations animation** | ✅ Spring animation on selection | ❌ Not implemented | **MEDIUM** |

---

## Data Model Gaps

| Model | iOS has | Flutter has | Action needed |
|---|---|---|---|
| `ExploreEventDto.latitude` | `Double?` | ❌ Missing | Add field with `@JsonKey` |
| `ExploreEventDto.longitude` | `Double?` | ❌ Missing | Add field with `@JsonKey` |
| `TrainerLocation` | Full model with id, address, lat, lng | ❌ Missing | Create `TrainerLocation` freezed model |
| `TrainerProfileSummary.locations` | Typed `[TrainerLocation]` | `List<dynamic>` untyped | Retype to `List<TrainerLocation>?` |
| `ExploreEvent` image loading | `CachedAsyncImage` | Already has `imageUrl` | ✅ OK |

---

## Dependency Gaps

| Package | iOS | Flutter | Action |
|---|---|---|---|
| User Location | CoreLocation (built-in) | ❌ `geolocator` not in pubspec | Add `geolocator: ^11.0.0` |
| Location Search | MKLocalSearch (built-in) | ❌ No equivalent | Use Nominatim OSM API or Google Places |
| Image loading | CachedAsyncImage (custom impl) | Already has `cached_network_image`? | Check pubspec |

---

## Proposed Architecture (Flutter)

```
lib/features/explore/
├── cubit/
│   ├── explore_map_cubit.dart        # NEW: manages map state
│   └── explore_map_state.dart         # NEW: freezed sealed union
├── data/
│   ├── models/
│   │   ├── explore_event_dto.dart     # UPDATE: add lat/lng
│   │   └── trainer_location.dart      # NEW: freezed model
│   └── explore_api_service.dart       # Already has getEvents + searchTrainers ✅
├── presentation/
│   ├── explore_map_screen.dart        # REWRITE: complete UI
│   ├── widgets/
│   │   ├── map_single_item_annotation.dart   # NEW: avatar/image annotation
│   │   ├── map_cluster_annotation.dart        # NEW: stacked cards + badge
│   │   ├── map_trainer_card.dart              # NEW: trainer detail card
│   │   ├── map_event_card.dart                # NEW: event detail card
│   │   ├── map_cluster_list_view.dart         # NEW: cluster items list
│   │   ├── map_filter_menu.dart               # NEW: filter dropdown
│   │   ├── map_search_bar.dart                # NEW: search bar + results
│   │   └── map_header.dart                    # NEW: close + filter + location btn

lib/core/
└── location_service.dart             # NEW: wraps geolocator

lib/features/trainers/data/models/
└── trainer_list_item_dto.dart        # UPDATE: locations typed
```

---

## Clustering Algorithm (from iOS)

```swift
// iOS clustering logic to port to Dart:
let zoomFactor = currentSpan.latitudeDelta
let epsilon = max(0.0001, zoomFactor / 15.0)

// For each item with coordinates:
//   Find existing cluster within epsilon distance
//   If found: add item to existing cluster
//   If not: create new cluster
// Stable ID: "cluster_{lat_4dp}_{lng_4dp}"
```

Port to Dart using `latlong2` distance calculation:
```dart
LatLng.distanceBetween(lat1, lng1, lat2, lng2)  // meters
// Convert epsilon from degrees to meters at current latitude
final epsilonMeters = epsilon * 111320; // 1 degree ≈ 111.32km
```

---

## Implementation Order (Dependency Graph)

```
Phase 1 (parallel)          Phase 2 (parallel)      Phase 3
┌─────────────────┐        ┌────────────────────┐   ┌─────────────────┐
│ Data models     │───────→│ ExploreMapCubit    │──→│ TrainerMapScreen │
│ (Event lat/lng, │        │ (state, clustering, │   │ (full UI)       │
│  TrainerLocation)│        │  filter, search)    │   │                 │
└─────────────────┘        └────────────────────┘   └─────────────────┘
┌─────────────────┐        ┌────────────────────┐         │
│ Dependencies    │───────→│ UI widgets         │─────────┘
│ (geolocator,    │        │ (annotations, cards,│
│  LocationService)│        │  filter, search bar)│
└─────────────────┘        └────────────────────┘
```
