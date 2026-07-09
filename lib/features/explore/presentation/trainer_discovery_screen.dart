import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/trainer_discovery_cubit.dart';
import '../data/models/paginated_events.dart';
import 'widgets/explore_event_row.dart';

/// Discovery type segment.
enum DiscoveryType { specialists, events, all }

/// Sort options matching backend API keys.
enum SortOption {
  closest,
  highestRated,
  newest,
  nameAsc,
  nameDesc,
  priceLowHigh,
  priceHighLow;

  String get apiKey {
    switch (this) {
      case SortOption.closest: return 'distance';
      case SortOption.highestRated: return 'rating';
      case SortOption.newest: return 'newest';
      case SortOption.nameAsc: return 'name_asc';
      case SortOption.nameDesc: return 'name_desc';
      case SortOption.priceLowHigh: return 'price_asc';
      case SortOption.priceHighLow: return 'price_desc';
    }
  }
}

/// Full Trainer/Event Discovery Screen — opened as a sheet from explore.
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

  // Local filter state
  DiscoveryType _discoveryType = DiscoveryType.all;
  String _searchQuery = '';
  String? _location;
  SortOption _sortBy = SortOption.closest;
  String? _specialty;
  double _minRating = 0;

  // Tracking for infinite scroll page params
  int _trainerPage = 1;
  int _eventPage = 1;

  late TrainerDiscoveryCubit _trainerCubit;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = widget.initialQuery ?? '';
    _searchQuery = widget.initialQuery ?? '';
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _trainerCubit = context.read<TrainerDiscoveryCubit>();
    if (!_initialized) {
      _initialized = true;
      final extra = GoRouterState.of(context).extra as Map<String, dynamic>?;
      _specialty = widget.initialSpecialty ?? (extra?['specialty'] as String?);
      _location = extra?['location'] as String?;
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
      _fetchNextTrainerPage();
      _fetchNextEventPage();
    }
  }

  void _fetchNextTrainerPage() {
    // InfiniteQueryBuilder exposes fetchNextPage as a callback in builder.
    // We re-fetch by invalidating with a different page param via setState.
    if (_discoveryType != DiscoveryType.events) {
      setState(() => _trainerPage++);
      // The key change triggers InfiniteQueryBuilder to load next page
    }
  }

  void _fetchNextEventPage() {
    if (_discoveryType != DiscoveryType.specialists) {
      setState(() => _eventPage++);
    }
  }

  void _onSearchChanged(String value) {
    _searchQuery = value;
    setState(() {
      _trainerPage = 1;
      _eventPage = 1;
    });
  }

  void _applyFilters({
    String? location,
    SortOption? sortBy,
    String? specialty,
    double? minRating,
  }) {
    setState(() {
      if (location != null) _location = location;
      if (sortBy != null) _sortBy = sortBy;
      _specialty = specialty;
      _minRating = minRating ?? 0;
      _trainerPage = 1;
      _eventPage = 1;
    });
  }

  bool get _hasActiveFilters =>
      (_location != null && _location!.isNotEmpty) ||
      _specialty != null ||
      _minRating > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('trainerDiscoveryScreen'),
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          // Header overlay area
          SliverToBoxAdapter(
            child: _DiscoveryHeader(
              searchController: _searchController,
              discoveryType: _discoveryType,
              hasActiveFilters: _hasActiveFilters,
              onSearchChanged: _onSearchChanged,
              onDiscoveryTypeChanged: (t) => setState(() => _discoveryType = t),
                  onFilterTap: () => _showFilterSheet(context),
            ),
          ),

          // Active filter chips
          if (_hasActiveFilters)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: [
                    if (_location != null && _location!.isNotEmpty)
                      _FilterChip(
                        label: _location!,
                        onRemove: () => _applyFilters(),
                      ),
                    if (_specialty != null)
                      _FilterChip(
                        label: _specialty!,
                        onRemove: () => _applyFilters(),
                      ),
                    if (_minRating > 0)
                      _FilterChip(
                        label: '★ ${_minRating.toStringAsFixed(1)}+',
                        onRemove: () => _applyFilters(minRating: 0),
                      ),
                  ],
                ),
              ),
            ),

          // Specialists section
          if (_discoveryType != DiscoveryType.events)
            _buildTrainersSection(context),

          // Events section
          if (_discoveryType != DiscoveryType.specialists)
            _buildEventsSection(context),

          // Bottom padding
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).padding.bottom + 24),
          ),
        ],
      ),
    );
  }

  // ─── TRAINERS ──────────────────────────────────────────────────

  Widget _buildTrainersSection(BuildContext context) {
    final trainerKey = QueryKey([
      'trainers',
      'search',
      _searchQuery.toLowerCase(),
      _sortBy.apiKey,
      _specialty ?? '',
      _minRating.toString(),
      _location ?? '',
    ]);

    return InfiniteQueryBuilder<TrainerListResponse, int>(
      initialPageParam: 1,
      queryKey: trainerKey,
      queryFn: (page) => _trainerCubit.searchTrainers(
        page: page,
        query: _searchQuery.isEmpty ? null : _searchQuery,
        location: _location,
        sortBy: _sortBy.apiKey,
        specialties: _specialty,
        minRating: _minRating > 0 ? _minRating : null,
      ),
      getNextPageParam: (lastPage, allPages, lastParam, allParams) {
        return lastPage.trainers.length >= 15 ? lastParam + 1 : null;
      },
      staleTime: const Duration(seconds: 30),
      builder: (context, state, fetchNextPage, fetchPreviousPage) {
        if (state.isLoading && !state.isFetched) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
          );
        }

        final allTrainers = state.data?.pages
                .expand((page) => page.trainers)
                .toList() ??
            [];

        if (allTrainers.isEmpty && !state.isFetching) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const Icon(Icons.search_rounded, size: 48, color: AppColors.mutedText),
                  const SizedBox(height: 12),
                  Text(
                    _searchQuery.isNotEmpty
                        ? 'No specialists found for "$_searchQuery"'
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
              // Loading spinner at end when fetching next page
              if (index == allTrainers.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              }
              final trainer = allTrainers[index];
              return RepaintBoundary(
                child: _TrainerDiscoveryCard(
                  trainer: trainer,
                  onTap: trainer.username != null
                      ? () => context.push('/trainer/${trainer.username}')
                      : null,
                ),
              );
            },
            childCount: allTrainers.length + (state.isFetching ? 1 : 0),
          ),
        );
      },
    );
  }

  // ─── EVENTS ────────────────────────────────────────────────────

  Widget _buildEventsSection(BuildContext context) {
    final eventKey = QueryKey([
      'explore',
      'events',
      'discovery',
      _searchQuery.toLowerCase(),
    ]);

    return InfiniteQueryBuilder<PaginatedEvents, int>(
      initialPageParam: 1,
      queryKey: eventKey,
      queryFn: (page) => _trainerCubit.getEvents(
        page: page,
        search: _searchQuery.isEmpty ? null : _searchQuery,
      ),
      getNextPageParam: (lastPage, allPages, lastParam, allParams) {
        return lastPage.hasMore ? lastParam + 1 : null;
      },
      staleTime: const Duration(seconds: 30),
      builder: (context, state, fetchNextPage, fetchPreviousPage) {
        if (state.isLoading && !state.isFetched) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(32),
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
            ),
          );
        }

        final allEvents = state.data?.pages
                .expand((page) => page.events)
                .toList() ??
            [];

        if (allEvents.isEmpty && !state.isFetching) {
          return const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  Icon(Icons.event_busy_rounded, size: 48, color: AppColors.mutedText),
                  SizedBox(height: 12),
                  Text(
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
              if (index == allEvents.length) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );
              }
              final event = allEvents[index];
              return RepaintBoundary(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: index == allEvents.length - 1 ? 0 : 12,
                  ),
                  child: ExploreEventRow(
                    event: event,
                    onTap: () => context.push('/explore/event/${event.id}'),
                  ),
                ),
              );
            },
            childCount: allEvents.length + (state.isFetching ? 1 : 0),
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
      builder: (ctx) => _FilterSheetContent(
        initialLocation: _location,
        initialSortBy: _sortBy,
        initialSpecialty: _specialty,
        initialMinRating: _minRating,
        onApply: (location, sortBy, specialty, minRating) {
          _applyFilters(
            location: location,
            sortBy: sortBy,
            specialty: specialty,
            minRating: minRating,
          );
        },
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════
// HEADER
// ═══════════════════════════════════════════════════════════════════

class _DiscoveryHeader extends StatelessWidget {
  final TextEditingController searchController;
  final DiscoveryType discoveryType;
  final bool hasActiveFilters;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<DiscoveryType> onDiscoveryTypeChanged;
  final VoidCallback onFilterTap;

  const _DiscoveryHeader({
    required this.searchController,
    required this.discoveryType,
    required this.hasActiveFilters,
    required this.onSearchChanged,
    required this.onDiscoveryTypeChanged,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 12,
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    final router = GoRouter.of(context);
                    if (router.canPop()) {
                      router.pop();
                    } else {
                      context.go('/explore');
                    }
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.mutedSurface,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close_rounded, size: 18, color: AppColors.foreground),
                  ),
                ),
              ),
            ],
          ),

          // Title
          const Text(
            'Discover specialists and events',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.foreground),
          ),
          const SizedBox(height: 16),

          // Segmented picker
          Row(
            children: [
              _SegmentButton(
                label: 'Specialists',
                selected: discoveryType == DiscoveryType.specialists,
                onTap: () => onDiscoveryTypeChanged(DiscoveryType.specialists),
              ),
              const SizedBox(width: 8),
              _SegmentButton(
                label: 'Events',
                selected: discoveryType == DiscoveryType.events,
                onTap: () => onDiscoveryTypeChanged(DiscoveryType.events),
              ),
              const SizedBox(width: 8),
              _SegmentButton(
                label: 'All',
                selected: discoveryType == DiscoveryType.all,
                onTap: () => onDiscoveryTypeChanged(DiscoveryType.all),
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
                    hintText: discoveryType == DiscoveryType.events
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
                onTap: onFilterTap,
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
                    color: hasActiveFilters ? AppColors.primary : AppColors.mutedText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SegmentButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _SegmentButton({required this.label, required this.selected, required this.onTap});

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

// ═══════════════════════════════════════════════════════════════════
// FILTER SHEET
// ═══════════════════════════════════════════════════════════════════

class _FilterSheetContent extends StatefulWidget {
  final String? initialLocation;
  final SortOption initialSortBy;
  final String? initialSpecialty;
  final double initialMinRating;
  final void Function(String? location, SortOption sortBy, String? specialty, double minRating) onApply;

  const _FilterSheetContent({
    required this.initialLocation,
    required this.initialSortBy,
    required this.initialSpecialty,
    required this.initialMinRating,
    required this.onApply,
  });

  @override
  State<_FilterSheetContent> createState() => _FilterSheetContentState();
}

class _FilterSheetContentState extends State<_FilterSheetContent> {
  final _locationController = TextEditingController();
  late SortOption _selectedSort;
  String? _selectedSpecialty;
  double _minRating = 0;

  static const _specialties = [
    'Strength', 'Yoga', 'HIIT', 'Calisthenics', 'Pilates', 'Cardio', 'Boxing', 'Mobility',
  ];

  @override
  void initState() {
    super.initState();
    _locationController.text = widget.initialLocation ?? '';
    _selectedSort = widget.initialSortBy;
    _selectedSpecialty = widget.initialSpecialty;
    _minRating = widget.initialMinRating;
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
                    widget.onApply(
                      _locationController.text.isEmpty ? null : _locationController.text,
                      _selectedSort,
                      _selectedSpecialty,
                      _minRating,
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

// ═══════════════════════════════════════════════════════════════════
// TRAINER DISCOVERY CARD
// ═══════════════════════════════════════════════════════════════════

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
                      ? CachedNetworkImage(
                          imageUrl: photoUrl,
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) => const Icon(Icons.person_rounded, size: 36, color: AppColors.mutedText),
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
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: AppColors.foreground),
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
                        style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
                      ),
                    if (location != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 12, color: AppColors.mutedText),
                          const SizedBox(width: 4),
                          Text(location, style: const TextStyle(fontSize: 11, color: AppColors.mutedText)),
                        ],
                      ),
                    ],
                    const SizedBox(height: 4),
                    Text(
                      '$reviewCount Reviews',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primary),
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

// ═══════════════════════════════════════════════════════════════════
// FILTER CHIP
// ═══════════════════════════════════════════════════════════════════

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
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.primary),
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
