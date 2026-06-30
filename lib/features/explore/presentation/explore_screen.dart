import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';
import 'package:ziro_fit/core/models/trainer_list_item_dto.dart';

import '../../../core/di/injection.dart' as di;
import '../../../core/theme/app_theme.dart';
import '../cubit/explore_cubit.dart';
import '../data/models/explore_category.dart';
import '../data/models/explore_city.dart';
import '../data/models/explore_event_dto.dart';
import '../data/models/explore_metadata.dart';
import '../data/models/featured_content.dart';
import '../data/models/paginated_events.dart';
import 'widgets/city_picker_sheet.dart';
import 'widgets/explore_category_filter.dart';
import 'widgets/explore_empty_events_view.dart';
import 'widgets/explore_event_row.dart';
import 'widgets/explore_featured_carousel.dart';
import 'widgets/explore_sliding_segment.dart';
import 'widgets/explore_trainer_card.dart';
import 'widgets/map_spotlight_preview_card.dart';
import 'widgets/trainer_spotlight_hero_card.dart';
import 'widgets/trending_tags_view.dart';

/// Main Explore Screen — replaces old Bloc-based version with tanquery QueryBuilders.
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  ExploreSection _selectedSection = ExploreSection.trainers;
  ExploreCity? _selectedCity;
  ExploreCategory? _selectedCategory;

  Future<void> _refresh() async {
    // Bust ResponseCache first so the queryFn hits the API,
    // then invalidate and refetch via tanquery.
    await context.read<ExploreCubit>().invalidateResponseCache();
    final client = DartQuery.of(context);
    await Future.wait([
      client.invalidateQueries(queryKey: QueryKey(['explore'])),
      client.refetchQueries(queryKey: QueryKey(['explore'])),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExploreCubit>(
      create: (_) => di.getIt<ExploreCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: _refresh,
              child: CustomScrollView(
                slivers: [
                  // Top spacer for floating header
                  SliverToBoxAdapter(
                    child: SizedBox(height: MediaQuery.of(context).padding.top + 80),
                  ),

                  // Sliding segment
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                      child: ExploreSlidingSegment(
                        selectedSection: _selectedSection,
                        onChanged: (section) => setState(() => _selectedSection = section),
                      ),
                    ),
                  ),

                  // Content based on selected section
                  if (_selectedSection == ExploreSection.trainers)
                    ..._buildTrainersTab()
                  else
                    ..._buildEventsTab(),

                  // Bottom padding
                  SliverToBoxAdapter(
                    child: SizedBox(height: MediaQuery.of(context).padding.bottom + 110),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _CityHeaderSection(
                selectedCity: _selectedCity,
                onCitySelected: (city) => setState(() => _selectedCity = city),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── TRAINERS TAB ─────────────────────────────────────────────

  List<Widget> _buildTrainersTab() {
    return [
      // 0. Spotlight Hero — from featured content
      _SpotlightSection(
        cityId: _selectedCity?.id,
        lat: _selectedCity?.latitude,
        lng: _selectedCity?.longitude,
        key: ValueKey('spotlight_${_selectedCity?.id ?? ''}'),
      ),

      // 1. Browse by Category — from metadata
      _CategorySection(
        selectedCategory: _selectedCategory,
        onCategorySelected: (cat) => setState(() => _selectedCategory = cat),
        key: const ValueKey('categories'),
      ),

      // 2. Trending tags
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.only(bottom: 24),
          child: TrendingTagsView(),
        ),
      ),

      // 3. Trainers Near You — from featured content
      _TrainerSectionWidget(
        title: 'Trainers Near You',
        key: ValueKey('nearby_${_selectedCity?.id ?? ''}'),
        cityId: _selectedCity?.id,
        lat: _selectedCity?.latitude,
        lng: _selectedCity?.longitude,
        source: 'algorithm',
      ),

      // 4. Featured Trainers — from featured content
      _TrainerSectionWidget(
        title: 'Featured Trainers',
        promotionLabel: 'Featured',
        key: ValueKey('featured_${_selectedCity?.id ?? ''}'),
        cityId: _selectedCity?.id,
        lat: _selectedCity?.latitude,
        lng: _selectedCity?.longitude,
      ),

      // 5. Ziro Recommends — from promoted trainers
      const _RecommendedSection(
        key: ValueKey('recommended'),
      ),

      // 6. Map Spotlight
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: MapSpotlightPreviewCard(
            onTap: () => context.push('/explore/map'),
          ),
        ),
      ),
    ];
  }

  // ─── EVENTS TAB ───────────────────────────────────────────────

  List<Widget> _buildEventsTab() {
    return [
      // Events from featured content
      _EventsSection(
        cityId: _selectedCity?.id,
        lat: _selectedCity?.latitude,
        lng: _selectedCity?.longitude,
        key: ValueKey('events_${_selectedCity?.id ?? ''}'),
      ),
    ];
  }
}

// ═══════════════════════════════════════════════════════════════════
// QueryBuilder helper widgets
// ═══════════════════════════════════════════════════════════════════

/// Metadata-based city header. Loads cities from API and shows city picker.
class _CityHeaderSection extends StatelessWidget {
  final ExploreCity? selectedCity;
  final ValueChanged<ExploreCity?> onCitySelected;

  const _CityHeaderSection({
    required this.selectedCity,
    required this.onCitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return QueryBuilder<ExploreMetadata>(
      queryKey: QueryKey(['explore', 'metadata']),
      queryFn: () => context.read<ExploreCubit>().getMetadata(),
      staleTime: const Duration(minutes: 30),
      builder: (context, state) {
        final cities = state.data?.cities ?? <ExploreCity>[];
        return _CityHeaderContent(
          cities: cities,
          selectedCity: selectedCity,
          onCitySelected: onCitySelected,
        );
      },
    );
  }
}

/// Actual city header visual with city picker.
class _CityHeaderContent extends StatelessWidget {
  final List<ExploreCity> cities;
  final ExploreCity? selectedCity;
  final ValueChanged<ExploreCity?> onCitySelected;

  const _CityHeaderContent({
    required this.cities,
    required this.selectedCity,
    required this.onCitySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        bottom: 12,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.85),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        border: const Border(
          bottom: BorderSide(color: AppColors.borderMuted, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          // City selector
          Expanded(
            child: GestureDetector(
              onTap: () => _showCityPicker(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: selectedCity == null
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : Colors.red.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      selectedCity == null
                          ? Icons.my_location_rounded
                          : Icons.location_on_rounded,
                      size: 18,
                      color: selectedCity == null
                          ? AppColors.primary
                          : Colors.redAccent,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedCity?.name ?? 'SF',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.4,
                            color: AppColors.foreground,
                          ),
                        ),
                        Text(
                          selectedCity != null ? 'Active Region' : 'Current Location',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: AppColors.mutedText,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          _HeaderButton(
            icon: Icons.search_rounded,
            onTap: () => context.push('/explore/discovery'),
          ),
          const SizedBox(width: 8),
          _HeaderButton(
            icon: Icons.map_outlined,
            onTap: () => context.push('/explore/map'),
          ),
        ],
      ),
    );
  }

  void _showCityPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => CityPickerSheet(
        cities: cities,
        selectedCity: selectedCity,
        onSelected: (city) {
          onCitySelected(city);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _HeaderButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: const BoxDecoration(
          color: AppColors.mutedSurface,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20, color: AppColors.foreground),
      ),
    );
  }
}

/// Spotlight trainer hero card.
class _SpotlightSection extends StatelessWidget {
  final String? cityId;
  final double? lat;
  final double? lng;

  const _SpotlightSection({this.cityId, this.lat, this.lng, super.key});

  @override
  Widget build(BuildContext context) {
    return QueryBuilder<FeaturedContent>(
      queryKey: QueryKey(['explore', 'featured', cityId ?? '']),
      queryFn: () => context.read<ExploreCubit>().getFeaturedContent(cityId: cityId, lat: lat, lng: lng),
      staleTime: const Duration(minutes: 5),
      builder: (context, state) {
        if (!state.isSuccess || state.data == null) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        final trainers = state.data!.featuredTrainers;
        final nearby = trainers.where((t) => t.source == 'algorithm').toList();
        final spotlight = nearby.isNotEmpty ? nearby.first : null;
        if (spotlight == null) return const SliverToBoxAdapter(child: SizedBox.shrink());

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: TrainerSpotlightHeroCard(
              trainer: TrainerListItemDto(
                id: spotlight.id,
                name: spotlight.name,
                profile: TrainerProfileSummary(
                  profilePhotoPath: spotlight.avatarUrl,
                  averageRating: spotlight.rating,
                  certifications: spotlight.specialties,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Browse by Category section.
class _CategorySection extends StatelessWidget {
  final ExploreCategory? selectedCategory;
  final ValueChanged<ExploreCategory?> onCategorySelected;

  const _CategorySection({
    required this.selectedCategory,
    required this.onCategorySelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QueryBuilder<ExploreMetadata>(
      queryKey: QueryKey(['explore', 'metadata']),
      queryFn: () => context.read<ExploreCubit>().getMetadata(),
      staleTime: const Duration(minutes: 30),
      builder: (context, state) {
        final categories = state.data?.categories ?? <ExploreCategory>[];
        if (categories.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ExploreCategoryFilter(
              categories: categories,
              selectedCategory: selectedCategory,
              onSelected: onCategorySelected,
            ),
          ),
        );
      },
    );
  }
}

/// Horizontal scroll section for trainers from featured content.
class _TrainerSectionWidget extends StatelessWidget {
  final String title;
  final String? promotionLabel;
  final String? cityId;
  final double? lat;
  final double? lng;
  final String? source;

  const _TrainerSectionWidget({
    required this.title,
    this.promotionLabel,
    this.cityId,
    this.lat,
    this.lng,
    this.source,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return QueryBuilder<FeaturedContent>(
      queryKey: QueryKey(['explore', 'featured', cityId ?? '']),
      queryFn: () => context.read<ExploreCubit>().getFeaturedContent(cityId: cityId, lat: lat, lng: lng),
      staleTime: const Duration(minutes: 5),
      builder: (context, state) {
        if (!state.isSuccess || state.data == null) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        final trainers = state.data!.featuredTrainers;
        final filtered = source != null
            ? trainers.where((t) => t.source == source).toList()
            : trainers;
        if (filtered.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _TrainerCardList(title: title, trainers: filtered, promotionLabel: promotionLabel),
          ),
        );
      },
    );
  }
}

/// Ziro Recommends — promoted trainers.
class _RecommendedSection extends StatelessWidget {
  const _RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return QueryBuilder<List<FeaturedTrainerDto>>(
      queryKey: QueryKey(['explore', 'promoted', 'ZIRO_RECOMMENDED']),
      queryFn: () => context.read<ExploreCubit>().getPromotedTrainers(category: 'ZIRO_RECOMMENDED'),
      staleTime: const Duration(minutes: 5),
      builder: (context, state) {
        if (!state.isSuccess || state.data == null || state.data!.isEmpty) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _TrainerCardList(
              title: 'Ziro Recommends',
              trainers: state.data!,
              promotionLabel: 'Ziro',
            ),
          ),
        );
      },
    );
  }
}

/// Horizontal scroll list of trainer cards.
class _TrainerCardList extends StatelessWidget {
  final String title;
  final List<dynamic> trainers;
  final String? promotionLabel;

  const _TrainerCardList({
    required this.title,
    required this.trainers,
    this.promotionLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: trainers.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final t = trainers[index];
              return ExploreTrainerCard(
                trainer: TrainerListItemDto(
                  id: t.id,
                  name: t.name,
                  username: t.username,
                  profile: TrainerProfileSummary(
                    profilePhotoPath: t.avatarUrl,
                    averageRating: t.rating,
                    certifications: t.specialties is List
                        ? List<String>.from(t.specialties)
                        : [],
                  ),
                ),
                promotionLabel: promotionLabel,
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Events section (featured carousel + upcoming date-sectioned list).
class _EventsSection extends StatelessWidget {
  final String? cityId;
  final double? lat;
  final double? lng;

  const _EventsSection({this.cityId, this.lat, this.lng, super.key});

  @override
  Widget build(BuildContext context) {
    return QueryBuilder<PaginatedEvents>(
      queryKey: QueryKey(['explore', 'events', 'main', cityId ?? '']),
      queryFn: () => context.read<ExploreCubit>().getEvents(limit: 20, lat: lat, lon: lng),
      staleTime: const Duration(minutes: 5),
      placeholderData: const PaginatedEvents(hasMore: false, page: 1, limit: 20),
      builder: (context, state) {
        final events = state.data?.events ?? <ExploreEventDto>[];
        if (events.isEmpty && state.isSuccess) {
          return const SliverToBoxAdapter(
            child: ExploreEmptyEventsView(),
          );
        }

        // Separate featured from upcoming
        final now = DateTime.now();
        final featured = events.take(3).toList();
        final upcoming = events.where((e) => e.startTime.isAfter(now)).toList();

        // Group upcoming by date
        final Map<String, List<ExploreEventDto>> grouped = {};
        final List<DateTime> sortedDates = [];
        for (final event in upcoming) {
          final key = _dateKey(event.startTime);
          grouped.putIfAbsent(key, () => []).add(event);
          if (!sortedDates.any((d) => _dateKey(d) == key)) {
            sortedDates.add(DateTime(
              event.startTime.year,
              event.startTime.month,
              event.startTime.day,
            ));
          }
        }
        sortedDates.sort();

        return SliverList(
          delegate: SliverChildListDelegate([
            // Events header + see all
            if (events.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Row(
                  children: [
                    const Text(
                      'Events',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => context.push('/explore/events'),
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Featured carousel
            if (featured.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: ExploreFeaturedCarousel(
                  events: featured,
                  onEventTap: (event) => context.push('/explore/event/${event.id}'),
                ),
              ),

            // Upcoming events date-sectioned
            ...sortedDates.map((date) {
              final key = _dateKey(date);
              final dayEvents = grouped[key] ?? [];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: Text(
                        _formatDateSection(date),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ),
                    for (int i = 0; i < dayEvents.length; i++)
                      Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: i == dayEvents.length - 1 ? 0 : 12,
                        ),
                        child: ExploreEventRow(
                          event: dayEvents[i],
                          onTap: () => context.push('/explore/event/${dayEvents[i].id}'),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ]),
        );
      },
    );
  }

  String _formatDateSection(DateTime dt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateOnly = DateTime(dt.year, dt.month, dt.day);
    if (dateOnly == today) return 'Today';
    if (dateOnly == today.add(const Duration(days: 1))) return 'Tomorrow';
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
    ];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month]} ${dt.day}';
  }

  String _dateKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}
      