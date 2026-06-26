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
        child: RepaintBoundary(
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
      