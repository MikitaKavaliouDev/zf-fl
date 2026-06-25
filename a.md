<response>
  <reasoning>
    Tapping the back button on the Trainer profile screen (`TrainerDetailScreen`) was not working because the app navigated to `/trainer/:username` using `context.go` instead of `context.push`. This replaces the history stack in GoRouter, which meant `router.canPop()` returned false and the back button did nothing.

    To resolve this issue:
    1. We will update all navigation sites that lead to `/trainer/:username` to use `context.push` instead of `context.go`. This preserves the previous screens (like Explore, Home, or Map) in the history stack, so returning behaves naturally.
    2. We will also add a fallback to `context.go('/explore')` (or go back to a default shell tab) inside the back button's `onTap` within `TrainerDetailScreen` so that in any edge cases where a user navigates directly or without history, the button still gracefully navigates them out of the trainer screen.
    3. We will create a `TASKS.md` file to list this task as complete.
  </reasoning>
  <modifications>
    <file path="lib/features/explore/presentation/widgets/explore_trainer_card.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../trainers/data/models/trainer_list_item_dto.dart';

/// Horizontal scroll trainer card used in "Near You", "Featured", "Recommends" sections.
/// Matches iOS ExploreTrainerCard — ExploreComponents.swift lines 541-652.
class ExploreTrainerCard extends StatelessWidget {
  final TrainerListItemDto trainer;
  final String? promotionLabel;

  const ExploreTrainerCard({
    super.key,
    required this.trainer,
    this.promotionLabel,
  });

  String get _name =>
      trainer.name ?? trainer.profile?.name ?? trainer.username ?? 'Trainer';

  String? get _specialty {
    final certs = trainer.profile?.certifications;
    if (certs != null && certs.isNotEmpty) return certs.first;
    return null;
  }

  double? get _rating => trainer.profile?.averageRating;

  String? get _photoPath => trainer.profile?.profilePhotoPath;

  String? get _location {
    final locations = trainer.profile?.locations;
    if (locations != null && locations.isNotEmpty) {
      final loc = locations.first;
      final address = loc.address;
      if (address != null && address.isNotEmpty) return address;
      return loc.toString();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: trainer.username != null
          ? () => context.push('/trainer/${trainer.username}')
          : null,
      child: Container(
        width: 144,
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area (144x144)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Container(
                    width: 144,
                    height: 144,
                    color: AppColors.mutedSurface,
                    child: _photoPath != null
                        ? Image.network(
                            _photoPath!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, _, _) => const Icon(
                              Icons.person_rounded,
                              size: 48,
                              color: AppColors.mutedText,
                            ),
                          )
                        : const Icon(
                            Icons.person_rounded,
                            size: 48,
                            color: AppColors.mutedText,
                          ),
                  ),
                ),
                // Rating overlay top-right
                if (_rating != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, size: 10, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            _rating!.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                // Promotion badge top-left
                if (promotionLabel != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: promotionLabel == 'Featured'
                            ? Colors.amber.withValues(alpha: 0.9)
                            : const Color(0xFF4F46E5).withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            promotionLabel == 'Featured'
                                ? Icons.star_rounded
                                : Icons.auto_awesome_rounded,
                            size: 10,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            promotionLabel!,
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            // Info section
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _specialty ?? 'Fitness Professional',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mutedText,
                    ),
                  ),
                  if (_location != null) ...[
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 10, color: AppColors.mutedText),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            _location!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/home/presentation/widgets/coach_card.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../data/models/client_dashboard_trainer.dart';

/// Card showing the client's linked coach.
///
/// Matches iOS Coach Card — PersonalHomeView.swift lines 417-470.
/// Shows: shield icon, "COACH" label, trainer name, chevron right.
class CoachCard extends StatelessWidget {
  final ClientDashboardTrainer trainer;

  const CoachCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/trainer/${trainer.username}'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Shield icon in blue circle
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shield_rounded,
                size: 24,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 16),
            // Label + name
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'COACH',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mutedText,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    trainer.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
            // Chevron right
            const Icon(
              Icons.chevron_right_rounded,
              size: 20,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/trainers/presentation/widgets/trainer_card.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/network/image_url_helper.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/trainer_list_item_dto.dart';

class TrainerCard extends StatelessWidget {
  final TrainerListItemDto trainer;

  const TrainerCard({super.key, required this.trainer});

  String get _name =>
      trainer.name ?? trainer.profile?.name ?? trainer.username ?? 'Trainer';

  String? get _photoPath => trainer.profile?.profilePhotoPath;

  String? get _specialty {
    final certs = trainer.profile?.certifications;
    if (certs != null && certs.isNotEmpty) return certs.first;
    return null;
  }

  String? get _location {
    final locations = trainer.profile?.locations;
    if (locations != null && locations.isNotEmpty) {
      final loc = locations.first;
      final address = loc.address;
      if (address != null && address.isNotEmpty) return address;
      return loc.toString();
    }
    return null;
  }

  double? get _rating => trainer.profile?.averageRating;

  int get _reviewCount => trainer.stats?.reviewCount ?? 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: trainer.username != null
            ? () => context.push('/trainer/${trainer.username}')
            : null,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted, width: 0.5),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Left: Profile Image (80x80, radius 12) ---
              _ProfileImage(photoPath: _photoPath),

              const SizedBox(width: 16),

              // --- Right: Info Column ---
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Rating row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                        if (_rating != null) ...[
                          const SizedBox(width: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                _rating!.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.foreground,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Specialty
                    Text(
                      _specialty ?? 'Fitness Professional',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Location row
                    if (_location != null) ...[
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 14,
                            color: AppColors.mutedText,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              _location!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],

                    // Distance
                    if (trainer.distance != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '${trainer.distance!.toStringAsFixed(1)} km away',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),

                    // Reviews + Link status row
                    Row(
                      children: [
                        if (_reviewCount > 0)
                          Text(
                            '$_reviewCount Reviews',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        const Spacer(),
                        if (trainer.isLinked)
                          const Icon(
                            Icons.link_rounded,
                            size: 16,
                            color: AppColors.primary,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 80×80 rounded profile image with loading and error states.
class _ProfileImage extends StatelessWidget {
  final String? photoPath;

  const _ProfileImage({required this.photoPath});

  @override
  Widget build(BuildContext context) {
    final url = resolveImageUrl(photoPath);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        width: 80,
        height: 80,
        child: url.isNotEmpty
            ? Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  final total = loadingProgress.expectedTotalBytes;
                  final progress = total != null
                      ? loadingProgress.cumulativeBytesLoaded / total
                      : null;
                  return _Placeholder(
                    child: Center(
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 2,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const _Placeholder(
                  child: Icon(Icons.person_rounded, size: 36),
                ),
              )
            : const _Placeholder(
                child: Icon(Icons.person_rounded, size: 36),
              ),
      ),
    );
  }
}

/// Gray placeholder used for image loading and error states.
class _Placeholder extends StatelessWidget {
  final Widget child;

  const _Placeholder({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/explore/presentation/trainer_map_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart' as latlong;

import 'package:ziro_fit/core/di/injection.dart' as di;
import 'package:ziro_fit/features/explore/cubit/explore_map_cubit.dart';
import 'package:ziro_fit/features/explore/cubit/explore_map_state.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_cluster_annotation.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_cluster_list_view.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_event_card.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_filter_menu.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_search_bar.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_single_item_annotation.dart';
import 'package:ziro_fit/features/explore/presentation/widgets/map_trainer_card.dart';

/// Full-screen map with clustered trainer and event markers.
///
/// Mirrors iOS [TrainerMapView] layout:
///   - Map with flutter_map (OSM tiles) as the base layer
///   - Filter pill + overlay menu (top right)
///   - Location re-center button (below filter pill)
///   - Close button (top left)
///   - Selection content card (bottom, above search bar)
///   - MapSearchBar (bottom)
class TrainerMapScreen extends StatefulWidget {
  const TrainerMapScreen({super.key});

  @override
  State<TrainerMapScreen> createState() => _TrainerMapScreenState();
}

class _TrainerMapScreenState extends State<TrainerMapScreen> {
  final MapController _mapController = MapController();
  late final ExploreMapCubit _cubit;
  bool _hasZoomedToUser = false;
  bool _showFilterMenu = false;
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _cubit = di.getIt<ExploreMapCubit>()..load();
  }

  @override
  void dispose() {
    _cubit.close();
    _mapController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<ExploreMapCubit, ExploreMapState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is ExploreMapLoaded) {
            // Auto-zoom to user location on first successful load.
            if (!_hasZoomedToUser &&
                state.userLat != null &&
                state.userLng != null) {
              _mapController.move(
                latlong.LatLng(state.userLat!, state.userLng!),
                12.0,
              );
              _hasZoomedToUser = true;
            }
          } else if (state is ExploreMapError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is ExploreMapLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ExploreMapError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xFF8E8E93)),
                ),
              ),
            );
          }

          if (state is ExploreMapLoaded) {
            return _buildMapContent(state);
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  /// Builds the full map UI with all overlay layers.
  Widget _buildMapContent(ExploreMapLoaded state) {
    return Stack(
      children: [
        // 1. Map layer (base)
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: const latlong.LatLng(52.2297, 21.0122),
            initialZoom: 11.0,
            onMapEvent: _onMapEvent,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'fit.ziro.app',
            ),
            MarkerLayer(
              markers: _buildMarkers(state.clusters, state.selectedClusterId),
            ),
          ],
        ),

        // 2. Dismiss overlay (taps outside filter menu close it)
        if (_showFilterMenu)
          GestureDetector(
            onTap: () {
              setState(() => _showFilterMenu = false);
            },
            child: Container(color: Colors.transparent),
          ),

        // 3. Header layer (top)
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 16,
          right: 16,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button (top left)
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  customBorder: const CircleBorder(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.7),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // Right column: filter pill -> location button
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Filter pill + overlay menu
                  Stack(
                    children: [
                      MapFilterPill(
                        onTap: () {
                          setState(
                              () => _showFilterMenu = !_showFilterMenu);
                        },
                      ),
                      if (_showFilterMenu)
                        Positioned(
                          top: 50,
                          right: 0,
                          child: MapFilterMenu(
                            selectedMode: state.filterMode,
                            onSelect: (mode) {
                              _cubit.setFilter(mode);
                              setState(() => _showFilterMenu = false);
                            },
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Location re-center button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _centerOnUser,
                      customBorder: const CircleBorder(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.my_location,
                          size: 16,
                          color: Color(0xFF007aff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // 4. Bottom layer: selection card + search bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Selection card (if any trainer/event/cluster is selected)
              if (state.selectedClusterId != null ||
                  state.selectedTrainer != null ||
                  state.selectedEvent != null)
                _buildSelectionContent(state),

              // Search bar
              MapSearchBar(
                onSearch: (query) {
                  _cubit.search(query);
                },
                onLocationSelected: (lat, lng, name) {
                  _mapController.move(latlong.LatLng(lat, lng), 14.0);
                  FocusScope.of(context).unfocus();
                },
              ),

              // Safe area inset at the very bottom
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 8,
              ),
            ],
          ),
        ),

        // Tap-outside-to-dismiss keyboard (covers the map area above
        // the bottom content). We use a translucent listener so map
        // gestures are not stolen.
        Positioned(
          top: 0,
          bottom: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.bottom -
              200, // above the search bar zone
          child: Listener(
            onPointerDown: (_) => FocusScope.of(context).unfocus(),
            child: Container(color: Colors.transparent),
          ),
        ),
      ],
    );
  }

  /// Build flutter_map [Marker]s from the cubit's cluster list.
  ///
  /// Markers outside the visible viewport are culled by flutter_map
  /// automatically, so we can safely return all clusters here.
  List<Marker> _buildMarkers(
    List<MapCluster> clusters,
    String? selectedClusterId,
  ) {
    return clusters.map((cluster) {
      final isSelected = cluster.id == selectedClusterId;
      return Marker(
        point: latlong.LatLng(cluster.latitude, cluster.longitude),
        width: 80,
        height: 80,
        child: cluster.items.length == 1
            ? SingleItemAnnotation(
                item: cluster.items.first,
                isSelected: isSelected,
                onTap: () => _cubit.selectCluster(cluster.id),
              )
            : ClusterAnnotation(
                cluster: cluster,
                isSelected: isSelected,
                onTap: () => _cubit.selectCluster(cluster.id),
              ),
      );
    }).toList();
  }

  /// Handles map camera events.
  ///
  /// On [MapEventMoveEnd] we extract the current zoom and notify the
  /// cubit so it can recalculate clusters at the new zoom level.
  void _onMapEvent(MapEvent event) {
    if (event is MapEventMoveEnd) {
      final zoom = _mapController.camera.zoom;
      _cubit.setZoomLevel(zoom);
    }
  }

  /// Re-centres the map to the user's current location (zoom 14).
  void _centerOnUser() {
    final state = _cubit.state;
    if (state is ExploreMapLoaded &&
        state.userLat != null &&
        state.userLng != null) {
      _mapController.move(
        latlong.LatLng(state.userLat!, state.userLng!),
        14.0,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location not available')),
      );
    }
  }

  /// Renders the appropriate selection card based on what is selected.
  ///
  /// Priority:
  ///   1. Single trainer selected ([state.selectedTrainer])
  ///   2. Single event selected ([state.selectedEvent])
  ///   3. Cluster with 1 item -> show detail card for that item
  ///   4. Cluster with >1 items -> show [ClusterListView]
  Widget _buildSelectionContent(ExploreMapLoaded state) {
    // Single trainer selected directly (e.g. from ClusterListView tap).
    if (state.selectedTrainer != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TrainerMapCard(
            trainer: state.selectedTrainer!,
            onOpen: () {
              final username = state.selectedTrainer!.username;
              if (username != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.push('/trainer/$username');
                });
              }
            },
          ),
        );
      }

    // Single event selected directly.
    if (state.selectedEvent != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: EventMapCard(
          event: state.selectedEvent!,
          onView: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.push('/explore/event/${state.selectedEvent!.id}');
            });
          },
        ),
      );
    }

    // Cluster selection.
    final clusterId = state.selectedClusterId;
    if (clusterId != null) {
      final cluster =
          state.clusters.where((c) => c.id == clusterId).firstOrNull;
      if (cluster == null) return const SizedBox.shrink();

      if (cluster.items.length == 1) {
        // Single item inside the cluster → show detail card directly.
        return cluster.items.first.when(
          trainer: (trainer) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TrainerMapCard(
                trainer: trainer,
                onOpen: () {
                  final username = trainer.username;
                  if (username != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      context.push('/trainer/$username');
                    });
                  }
                },
              ),
            );
          },
          event: (event) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: EventMapCard(
                event: event,
                onView: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.push('/explore/event/${event.id}');
                  });
                },
              ),
            );
          },
        );
      }

      // Multi-item cluster → show list view.
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClusterListView(
          items: cluster.items,
          onSelectTrainer: (trainer) {
            _cubit.selectTrainer(trainer);
          },
          onSelectEvent: (event) {
            _cubit.selectEvent(event);
          },
          onClose: () {
            _cubit.clearSelection();
          },
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
      ]]>
    </file>
    <file path="lib/features/explore/presentation/trainer_discovery_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/trainer_discovery_cubit.dart';
import '../cubit/trainer_discovery_state.dart';
import 'widgets/explore_event_row.dart';

/// Full Trainer/Event Discovery Screen — opened as a sheet from explore.
/// Matches iOS TrainerDiscoveryView.
class TrainerDiscoveryScreen extends StatefulWidget {
  final String? initialQuery;
  final String? initialSpecialty;

  const TrainerDiscoveryScreen({
    super.key,
    this.initialQuery,
    this.initialSpecialty,
  });

  @override
  State<TrainerDiscoveryScreen> createState() => _TrainerDiscoveryScreenState();
}

class _TrainerDiscoveryScreenState extends State<TrainerDiscoveryScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialQuery ?? '';
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      context.read<TrainerDiscoveryCubit>().init(
        initialQuery: widget.initialQuery,
        initialSpecialty: widget.initialSpecialty ??
            (extra?['specialty'] as String?),
        initialLocation: extra?['location'] as String?,
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<TrainerDiscoveryCubit>().loadMoreTrainers();
      context.read<TrainerDiscoveryCubit>().loadMoreEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<TrainerDiscoveryCubit, TrainerDiscoveryState>(
        builder: (context, state) {
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Header overlay area
              SliverToBoxAdapter(
                child: _DiscoveryHeader(
                  searchController: _searchController,
                  onSearchChanged: (value) =>
                      context.read<TrainerDiscoveryCubit>().search(value),
                ),
              ),

              // Results
              if (state is TrainerDiscoveryLoaded) ...[
                // Active filter chips
                if (state.hasActiveFilters)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          if (state.location != null && state.location!.isNotEmpty)
                            _FilterChip(
                              label: state.location!,
                              onRemove: () => context.read<TrainerDiscoveryCubit>().applyFilters(location: null),
                            ),
                          if (state.specialty != null)
                            _FilterChip(
                              label: state.specialty!,
                              onRemove: () => context.read<TrainerDiscoveryCubit>().applyFilters(specialty: null),
                            ),
                          if (state.minRating > 0)
                            _FilterChip(
                              label: '★ ${state.minRating.toStringAsFixed(1)}+',
                              onRemove: () => context.read<TrainerDiscoveryCubit>().applyFilters(minRating: 0),
                            ),
                        ],
                      ),
                    ),
                  ),

                // Specialists section
                if (state.discoveryType != DiscoveryType.events)
                  _buildTrainersSection(state, context),

                // Events section
                if (state.discoveryType != DiscoveryType.specialists)
                  _buildEventsSection(state, context),
              ],

              // Empty state
              if (state is TrainerDiscoveryLoaded &&
                  state.trainers.isEmpty &&
                  state.events.isEmpty)
                SliverFillRemaining(
                  child: _EmptyState(state: state),
                ),

              // Error state
              if (state is TrainerDiscoveryError)
                SliverFillRemaining(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.mutedText),
                          const SizedBox(height: 16),
                          Text(state.message, textAlign: TextAlign.center),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => context.read<TrainerDiscoveryCubit>().refresh(),
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTrainersSection(TrainerDiscoveryLoaded state, BuildContext context) {
    if (state.loadingTrainers) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        ),
      );
    }

    if (state.trainers.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Icon(Icons.search_rounded, size: 48, color: AppColors.mutedText),
              const SizedBox(height: 12),
              Text(
                state.searchQuery.isNotEmpty
                    ? 'No specialists found for "${state.searchQuery}"'
                    : 'No specialists found',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
              ),
              const SizedBox(height: 4),
              const Text(
                'Try a different name or specialty',
                style: TextStyle(fontSize: 12, color: AppColors.mutedText),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Loading spinner as last item when loading more
          if (index == state.trainers.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
            );
          }
          final trainer = state.trainers[index];
          return _TrainerDiscoveryCard(
            trainer: trainer,
            onTap: trainer.username != null
                ? () => context.push('/trainer/${trainer.username}')
                : null,
          );
        },
        childCount: state.trainers.length + (state.loadingTrainers ? 1 : 0),
      ),
    );
  }

  Widget _buildEventsSection(TrainerDiscoveryLoaded state, BuildContext context) {
    if (state.loadingEvents) {
      return const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(32),
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        ),
      );
    }

    if (state.events.isEmpty) {
      return SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Icon(Icons.event_busy_rounded, size: 48, color: AppColors.mutedText),
              const SizedBox(height: 12),
              const Text(
                'No events found',
                style: TextStyle(fontSize: 14, color: AppColors.mutedText),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Loading spinner as last item when loading more
          if (index == state.events.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
            );
          }
          final event = state.events[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: index == state.events.length - 1 ? 0 : 12,
            ),
            child: ExploreEventRow(
              event: event,
              onTap: () => context.push('/explore/event/${event.id}'),
            ),
          );
        },
        childCount: state.events.length + (state.loadingEvents ? 1 : 0),
      ),
    );
  }
}

// ─── HEADER ─────────────────────────────────────────────────────

class _DiscoveryHeader extends StatelessWidget {
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;

  const _DiscoveryHeader({
    required this.searchController,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerDiscoveryCubit, TrainerDiscoveryState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.background,
            border: Border(
              bottom: BorderSide(color: AppColors.borderMuted, width: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle + back button row
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppColors.borderActive,
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                    ),
                  ),
                  // Close button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.mutedSurface,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: AppColors.foreground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Title
              const Text(
                'Discover specialists and events',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 16),

              // Segmented picker
              Row(
                children: [
                  _SegmentButton(
                    label: 'Specialists',
                    selected: state is TrainerDiscoveryLoaded &&
                        state.discoveryType == DiscoveryType.specialists,
                    onTap: () => context.read<TrainerDiscoveryCubit>().setDiscoveryType(DiscoveryType.specialists),
                  ),
                  const SizedBox(width: 8),
                  _SegmentButton(
                    label: 'Events',
                    selected: state is TrainerDiscoveryLoaded &&
                        state.discoveryType == DiscoveryType.events,
                    onTap: () => context.read<TrainerDiscoveryCubit>().setDiscoveryType(DiscoveryType.events),
                  ),
                  const SizedBox(width: 8),
                  _SegmentButton(
                    label: 'All',
                    selected: state is TrainerDiscoveryLoaded &&
                        state.discoveryType == DiscoveryType.all,
                    onTap: () => context.read<TrainerDiscoveryCubit>().setDiscoveryType(DiscoveryType.all),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Search bar + filter
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: state is TrainerDiscoveryLoaded && state.discoveryType == DiscoveryType.events
                            ? 'Search events...'
                            : 'Specialty or Specialist Name',
                        prefixIcon: const Icon(Icons.search_rounded, size: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: AppColors.mutedSurface,
                        contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onChanged: onSearchChanged,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => _showFilterSheet(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.mutedSurface,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.filter_list_rounded,
                        size: 20,
                        color: state is TrainerDiscoveryLoaded && state.hasActiveFilters
                            ? AppColors.primary
                            : AppColors.mutedText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => _FilterSheetContent(),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SegmentButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: selected ? Colors.white : AppColors.foreground,
          ),
        ),
      ),
    );
  }
}

// ─── FILTER SHEET ──────────────────────────────────────────────

class _FilterSheetContent extends StatefulWidget {
  @override
  State<_FilterSheetContent> createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<_FilterSheetContent> {
  final _locationController = TextEditingController();
  SortOption _selectedSort = SortOption.closest;
  String? _selectedSpecialty;
  double _minRating = 0;

  static const _specialties = [
    'Strength', 'Yoga', 'HIIT', 'Calisthenics', 'Pilates', 'Cardio', 'Boxing', 'Mobility',
  ];

  @override
  void initState() {
    super.initState();
    final state = context.read<TrainerDiscoveryCubit>().state;
    if (state is TrainerDiscoveryLoaded) {
      _locationController.text = state.location ?? '';
      _selectedSort = state.sortBy;
      _selectedSpecialty = state.specialty;
      _minRating = state.minRating;
    }
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.borderActive,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          const Text('Sort By', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          DropdownButtonFormField<SortOption>(
            initialValue: _selectedSort,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            items: SortOption.values.map((opt) {
              return DropdownMenuItem(
                value: opt,
                child: Text(_sortLabel(opt)),
              );
            }).toList(),
            onChanged: (v) => setState(() => _selectedSort = v ?? SortOption.closest),
          ),
          const SizedBox(height: 20),
          const Text('Location', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          TextField(
            controller: _locationController,
            decoration: const InputDecoration(
              hintText: 'Enter City or Region',
              isDense: true,
              prefixIcon: Icon(Icons.location_on_outlined, size: 18),
            ),
          ),
          const SizedBox(height: 20),
          const Text('Specialty', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: _specialties.map((s) {
                final selected = _selectedSpecialty == s;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedSpecialty = selected ? null : s),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary.withValues(alpha: 0.15) : AppColors.mutedSurface,
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(
                          color: selected ? AppColors.primary : AppColors.borderMuted,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          s,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: selected ? AppColors.primary : AppColors.foreground,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('Minimum Rating', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(
                _minRating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
            ],
          ),
          Slider(
            value: _minRating,
            min: 0,
            max: 5,
            divisions: 10,
            onChanged: (v) => setState(() => _minRating = v),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _locationController.clear();
                      _selectedSort = SortOption.closest;
                      _selectedSpecialty = null;
                      _minRating = 0;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: const Text('Reset All'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<TrainerDiscoveryCubit>().applyFilters(
                      location: _locationController.text.isEmpty ? null : _locationController.text,
                      sortBy: _selectedSort,
                      specialty: _selectedSpecialty,
                      minRating: _minRating,
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text('Apply Filters'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _sortLabel(SortOption opt) {
    switch (opt) {
      case SortOption.closest: return 'Closest';
      case SortOption.highestRated: return 'Highest Rated';
      case SortOption.newest: return 'Newest';
      case SortOption.nameAsc: return 'Name (A-Z)';
      case SortOption.nameDesc: return 'Name (Z-A)';
      case SortOption.priceLowHigh: return 'Price: Low to High';
      case SortOption.priceHighLow: return 'Price: High to Low';
    }
  }
}

// ─── TRAINER DISCOVERY CARD ─────────────────────────────────────

class _TrainerDiscoveryCard extends StatelessWidget {
  final dynamic trainer;
  final VoidCallback? onTap;

  const _TrainerDiscoveryCard({required this.trainer, this.onTap});

  @override
  Widget build(BuildContext context) {
    final name = trainer.name ?? trainer.profile?.name ?? 'Trainer';
    final specialties = trainer.profile?.certifications is List
        ? List<String>.from(trainer.profile.certifications ?? [])
        : <String>[];
    final rating = trainer.profile?.averageRating;
    final photoUrl = trainer.profile?.profilePhotoPath;
    final locations = trainer.profile?.locations;
    final location = locations != null && locations.isNotEmpty
        ? (locations.first.address ?? locations.first.toString())
        : null;
    final reviewCount = trainer.stats?.reviewCount ?? 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.primary.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
              // Avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 80,
                  height: 80,
                  color: AppColors.mutedSurface,
                  child: photoUrl != null
                      ? Image.network(
                          photoUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => const Icon(Icons.person_rounded, size: 36, color: AppColors.mutedText),
                        )
                      : const Icon(Icons.person_rounded, size: 36, color: AppColors.mutedText),
                ),
              ),
              const SizedBox(width: 16),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                        if (rating != null) ...[
                          const SizedBox(width: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.star_rounded, size: 14, color: Colors.amber),
                              const SizedBox(width: 2),
                              Text(
                                rating.toStringAsFixed(1),
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (specialties.isNotEmpty)
                      Text(
                        specialties.join(', '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.mutedText,
                        ),
                      ),
                    if (location != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 12, color: AppColors.mutedText),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: const TextStyle(fontSize: 11, color: AppColors.mutedText),
                          ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      '$reviewCount Reviews',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── FILTER CHIP ────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _FilterChip({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          GestureDetector(
            onTap: onRemove,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.close_rounded, size: 14, color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── EMPTY STATE ────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final TrainerDiscoveryLoaded state;

  const _EmptyState({required this.state});

  @override
  Widget build(BuildContext context) {
    String title;
    String subtitle;

    if (state.searchQuery.isNotEmpty) {
      title = 'No results found for "${state.searchQuery}"';
      subtitle = 'Try a different name or specialty';
    } else if (state.location != null && state.location!.isNotEmpty) {
      title = 'No specialists in ${state.location} yet';
      subtitle = 'Try searching for "Online" or nearby areas';
    } else if (state.hasActiveFilters) {
      title = 'No specialists match your filters';
      subtitle = 'Try clearing some filters';
    } else {
      title = 'Discovery is coming to life...';
      subtitle = 'We\'re connecting you with the best professionals';
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.explore_outlined, size: 64, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/explore/presentation/widgets/trainer_spotlight_hero_card.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../trainers/data/models/trainer_list_item_dto.dart';

/// Featured Specialist hero card — dark gradient spotlight card.
/// Matches iOS TrainerSpotlightHeroCard — ExploreComponents.swift lines 655-808.
class TrainerSpotlightHeroCard extends StatelessWidget {
  final TrainerListItemDto? trainer;

  const TrainerSpotlightHeroCard({super.key, this.trainer});

  @override
  Widget build(BuildContext context) {
    if (trainer == null) return const SizedBox.shrink();

    final name = trainer!.name ?? trainer!.profile?.name ?? 'Trainer';
    final specialties = trainer!.profile?.certifications ?? [];
    final rating = trainer!.profile?.averageRating;
    final bio = trainer!.profile?.bio;
    final photoPath = trainer!.profile?.profilePhotoPath;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: trainer!.username != null
            ? () => context.push('/trainer/${trainer!.username}')
            : null,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF141d42), Color(0xFF08081f)],
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.12),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Spotlight badge + rating row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'SPOTLIGHT SPECIALIST',
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (rating != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.35),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star_rounded, size: 12, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            rating.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              // Profile image + info row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile image with gradient ring
                  Container(
                    width: 68,
                    height: 68,
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
                      ),
                    ),
                    child: CircleAvatar(
                      backgroundColor: AppColors.mutedSurface,
                      backgroundImage: photoPath != null
                          ? NetworkImage(photoPath)
                          : null,
                      child: photoPath == null
                          ? const Icon(Icons.person_rounded, size: 30, color: AppColors.mutedText)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Name + specialties
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          specialties.take(2).join(' • '),
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                        if (bio != null && bio.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            bio,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withValues(alpha: 0.85),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // View Profile CTA
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Profile',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 14, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
      ]]>
    </file>
    <file path="lib/features/trainers/presentation/trainer_detail_screen.dart">
      <![CDATA[
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/trainer_detail_cubit.dart';
import '../cubit/trainer_detail_state.dart';
import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_package_dto.dart';
import '../data/models/trainer_testimonial_dto.dart';
import '../data/trainer_repository.dart';
import 'widgets/about_section.dart';
import 'widgets/connect_button.dart';
import 'widgets/custom_program_request_sheet.dart';
import 'widgets/package_card.dart';
import 'widgets/photos_section.dart';
import 'widgets/preview_carousel.dart';
import 'widgets/review_card.dart';
import 'widgets/schedule_section.dart';
import 'widgets/tag_badge.dart';
import 'widgets/trainer_profile_banner.dart';

/// Full-screen trainer profile matching iOS PublicTrainerProfileView layout.
///
/// Layout (from iOS, lines 36-245):
///   ZStack(alignment: .top)
///     ScrollView (ignores top safe area)
///       Banner (200pt) + Avatar overlay
///       Identity Row (name, specialties, location, rating)
///       Tag Badges Row (horizontal scroll)
///       "Ask for Custom Plan" button
///       About section (expandable bio)
///       Packages section (horizontal scroll)
///       Photos section (horizontal scroll)
///       Reviews section (horizontal scroll)
///       Schedule section (day selector + time slots)
///     Dismiss button + Connect pill (top overlay)
class TrainerDetailScreen extends StatelessWidget {
  final String username;

  const TrainerDetailScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: getIt<TrainerRepository>(),
      child: BlocProvider(
        create: (context) {
          final cubit = TrainerDetailCubit(
            context.read<TrainerRepository>(),
          );
          cubit.load(username);
          return cubit;
        },
        child: BlocConsumer<TrainerDetailCubit, TrainerDetailState>(
          listener: (context, state) {
            if (state is TrainerDetailLoaded && state.linkError != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.linkError!),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              context.read<TrainerDetailCubit>().clearLinkError();
            }
          },
          builder: (context, state) {
            return switch (state) {
              TrainerDetailInitial() || TrainerDetailLoading() =>
                const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              TrainerDetailLoaded(:final trainer) =>
                _ProfileContent(
                  trainer: trainer,
                  username: username,
                ),
              TrainerDetailError(:final message) => Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 48),
                        const SizedBox(height: 16),
                        Text(message),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<TrainerDetailCubit>().load(username),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────
// Main Profile Content (iOS-matching layout)
// ────────────────────────────────────────────

class _ProfileContent extends StatelessWidget {
  final TrainerDetailDto trainer;
  final String username;

  const _ProfileContent({
    required this.trainer,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TrainerDetailCubit>();
    final name = trainer.name ?? trainer.username ?? 'Professional';
    final specialties = trainer.specialties;
    final location = trainer.locations.isNotEmpty
        ? trainer.locations.first.address
        : null;

    return Scaffold(
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Banner + Avatar ──
                TrainerProfileBanner(
                  bannerImageUrl: trainer.bannerImagePath,
                  avatarUrl: trainer.profilePhotoPath,
                ),
                const SizedBox(height: 36), // space for avatar offset

                // ── Identity Row ──
                _IdentityRow(
                  name: name,
                  specialties: specialties,
                  location: location,
                  rating: trainer.averageRating,
                  reviewCount: trainer.reviewCount,
                ),

                // ── Tag Badges Row ──
                _TagBadgesRow(
                  rating: trainer.averageRating,
                  reviewCount: trainer.reviewCount,
                  specialties: specialties,
                  location: location,
                ),

                // ── "Ask for Custom Plan" button ──
                _CustomPlanButton(
                  trainerName: name,
                ),
                const SizedBox(height: 8),

                // ── Preview Carousel (images + videos) ──
                BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
                  builder: (context, state) {
                    if (state is! TrainerDetailLoaded ||
                        state.previewMedia.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return PreviewCarousel(media: state.previewMedia);
                  },
                ),

                // ── About Section ──
                AboutSection(
                  aboutMe: trainer.aboutMe,
                  philosophy: trainer.philosophy,
                  methodology: trainer.methodology,
                  branding: trainer.branding,
                ),

                // ── Packages Section ──
                _PackagesSection(
                  packages: trainer.packages,
                  trainerName: name,
                ),

                // ── Photos Section ──
                if (trainer.transformationPhotos.isNotEmpty)
                  PhotosSection(photos: trainer.transformationPhotos),

                // ── Reviews Section ──
                _ReviewsSection(
                  testimonials: trainer.testimonials,
                  rating: trainer.averageRating,
                  reviewCount: trainer.reviewCount,
                ),

                // ── Schedule Section ──
                BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
                  builder: (context, state) {
                    if (state is! TrainerDetailLoaded) {
                      return const SizedBox.shrink();
                    }
                    return ScheduleSection(
                      trainerId: trainer.id,
                      trainerName: name,
                      schedule: state.schedule,
                      isLoading: state.isLoadingSchedule,
                      onLoadSchedule: () {
                        if (state.schedule == null && !state.isLoadingSchedule) {
                          cubit.loadSchedule(username);
                        }
                      },
                      onBookingSuccess: () =>
                          context.read<TrainerDetailCubit>().refresh(username),
                    );
                  },
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          // ── Top overlay: dismiss button + connect pill ──
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Dismiss button
                GestureDetector(
                  onTap: () {
                    final router = GoRouter.of(context);
                    if (router.canPop()) {
                      router.pop();
                    } else {
                      context.go('/explore');
                    }
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.mutedSurface.withAlpha(200),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 20,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
                const Spacer(),

                // Connect pill
                BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
                  builder: (context, state) {
                    if (state is! TrainerDetailLoaded) {
                      return const SizedBox.shrink();
                    }
                    return ConnectButton(
                      isLinked: trainer.isLinked,
                      isPending: state.linkRequestPending,
                      isLoading: state.isLinking,
                      onConnect: () => cubit.linkTrainer(username),
                      onUnlink: () => cubit.unlinkTrainer(username),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────
// Identity Row
// ────────────────────────────────────────────

class _IdentityRow extends StatelessWidget {
  final String name;
  final List<String> specialties;
  final String? location;
  final double? rating;
  final int reviewCount;

  const _IdentityRow({
    required this.name,
    required this.specialties,
    this.location,
    this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 2),

                // Specialties
                Text(
                  specialties.isNotEmpty
                      ? specialties.join(' • ')
                      : 'Fitness Professional',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 2),

                // Location
                if (location != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 11,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          location!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Rating
                if (rating != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 12,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating!.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (reviewCount > 0) ...[
                          const SizedBox(width: 6),
                          Text(
                            '$reviewCount reviews',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────
// Tag Badges Row (horizontal scroll)
// ────────────────────────────────────────────

class _TagBadgesRow extends StatelessWidget {
  final double? rating;
  final int reviewCount;
  final List<String> specialties;
  final String? location;

  const _TagBadgesRow({
    this.rating,
    required this.reviewCount,
    required this.specialties,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          if (rating != null)
            TagBadge(
              icon: Icons.star_rounded,
              text: rating!.toStringAsFixed(1),
              color: Colors.orange,
            ),
          if (reviewCount > 0)
            TagBadge(
              icon: Icons.person_rounded,
              text: '$reviewCount Reviews',
              color: AppColors.mutedText,
            ),
          ...specialties.take(3).map(
                (s) => TagBadge(
                  text: s,
                  color: AppColors.primary,
                ),
              ),
          if (location != null)
            TagBadge(
              icon: Icons.location_on_outlined,
              text: location!,
              color: const Color(0xFF22C55E),
            ),
        ].map((badge) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: badge,
            )).toList(),
      ),
    );
  }
}

// ────────────────────────────────────────────
// "Ask for Custom Plan" Button
// ────────────────────────────────────────────

class _CustomPlanButton extends StatelessWidget {
  final String trainerName;

  const _CustomPlanButton({required this.trainerName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) => CustomProgramRequestSheet(
            trainerName: trainerName,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                size: 14,
                color: AppColors.primary,
              ),
              SizedBox(width: 6),
              Text(
                'Ask for Custom Plan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────
// Packages Section (horizontal scroll)
// ────────────────────────────────────────────

class _PackagesSection extends StatelessWidget {
  final List<TrainerPackageDto> packages;
  final String trainerName;

  const _PackagesSection({
    required this.packages,
    required this.trainerName,
  });

  void _purchasePackage(BuildContext context, TrainerPackageDto pkg) async {
    try {
      final repo = getIt<TrainerRepository>();
      final url = await repo.createCheckoutSession(
        type: 'PACKAGE_SALE',
        id: pkg.id,
      );
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to start checkout: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              const Text(
                'Packages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        if (packages.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'No packages available yet',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          )
        else
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: packages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final pkg = packages[index];
                return PackageCard(
                  package: pkg,
                  isRecommended: index == 0,
                  onPurchase: () => _purchasePackage(context, pkg),
                );
              },
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _sectionDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(),
    );
  }
}

// ────────────────────────────────────────────
// Reviews Section (horizontal scroll)
// ────────────────────────────────────────────

class _ReviewsSection extends StatelessWidget {
  final List<TrainerTestimonialDto> testimonials;
  final double? rating;
  final int reviewCount;

  const _ReviewsSection({
    required this.testimonials,
    this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              if (rating != null) ...[
                const Icon(Icons.star_rounded, size: 14, color: Colors.orange),
                const SizedBox(width: 2),
                Text(
                  rating!.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              if (reviewCount > 0)
                Text(
                  '$reviewCount reviews',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
            ],
          ),
        ),
        if (testimonials.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'No reviews yet',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          )
        else
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                // testimonials are from TrainerDetailDto which has dynamic type
                // due to freezed JSON parsing
                final t = testimonials[index];
                // The items are TrainerTestimonialDto objects
                return ReviewCard(
                  testimonial: t,
                );
              },
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _sectionDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(),
    );
  }
}
      ]]>
    </file>
    <file path="TASKS.md">
      <![CDATA[
- [x] Fix back button on trainer profile screen by using `context.push` instead of `context.go` for trainer details and adding fallback pop routing in TrainerDetailScreen.
      ]]>
    </file>
  </modifications>
</response>