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
                ? () => context.go('/trainer/${trainer.username}')
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
              // Drag handle
              Center(
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
