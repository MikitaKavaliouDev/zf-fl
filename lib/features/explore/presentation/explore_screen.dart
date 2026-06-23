import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../trainers/data/models/trainer_list_item_dto.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';
import 'widgets/explore_city_header.dart';
import 'widgets/explore_sliding_segment.dart';
import 'widgets/explore_category_filter.dart';
import 'widgets/trending_tags_view.dart';
import 'widgets/trainer_spotlight_hero_card.dart';
import 'widgets/explore_trainer_card.dart';
import 'widgets/explore_featured_carousel.dart';
import 'widgets/explore_event_row.dart';
import 'widgets/map_spotlight_preview_card.dart';
import 'widgets/explore_empty_events_view.dart';

/// Main Explore Screen — matches iOS PersonalExploreView layout.
/// Replaces the old basic explore screen entirely.
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ExploreCubit>().loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          if (state is ExploreStateInitial || state is ExploreStateLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is ExploreStateLoaded) {
            return _ExploreContent(state: state);
          } else if (state is ExploreStateError) {
            return _ErrorView(message: state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

/// Main content with floating header overlay.
class _ExploreContent extends StatelessWidget {
  final ExploreStateLoaded state;

  const _ExploreContent({required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Scrollable content
        RefreshIndicator(
          onRefresh: () => context.read<ExploreCubit>().refresh(),
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
                    selectedSection: state.selectedSection,
                    onChanged: (section) =>
                        context.read<ExploreCubit>().setSection(section),
                  ),
                ),
              ),

              // Content based on selected section
              if (state.selectedSection == ExploreSection.trainers)
                ..._buildTrainersTab(context)
              else
                ..._buildEventsTab(context),

              // Bottom padding
              SliverToBoxAdapter(
                child: SizedBox(height: MediaQuery.of(context).padding.bottom + 110),
              ),
            ],
          ),
        ),

        // Floating city header (top overlay)
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ExploreCityHeader(),
        ),
      ],
    );
  }

  // ─── TRAINERS TAB ─────────────────────────────────────────────

  List<Widget> _buildTrainersTab(BuildContext context) {
    return [
      // 0. Spotlight Hero
      if (state.content.spotlightTrainer != null)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SizedBox(
              // Wrap the spotlight hero in BlocBuilder to access trainer detail
              child: TrainerSpotlightHeroCard(
                trainer: TrainerListItemDto(
                  id: state.content.spotlightTrainer!.id,
                  name: state.content.spotlightTrainer!.name,
                  profile: TrainerProfileSummary(
                    profilePhotoPath: state.content.spotlightTrainer!.avatarUrl,
                    averageRating: state.content.spotlightTrainer!.rating,
                    certifications: state.content.spotlightTrainer!.specialties,
                  ),
                ),
              ),
            ),
          ),
        ),

      // 1. Browse by Category
      if (state.content.categories.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ExploreCategoryFilter(
              categories: state.content.categories,
              selectedCategory: state.selectedCategory,
              onSelected: (cat) => context.read<ExploreCubit>().selectCategory(cat),
            ),
          ),
        ),

      // Trending tags
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: const TrendingTagsView(),
        ),
      ),

      // 2. Trainers Near You
      if (state.content.nearbyTrainers.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _TrainerSection(
              title: 'Trainers Near You',
              trainers: state.content.nearbyTrainers,
            ),
          ),
        ),

      // 3. Featured Trainers
      if (state.content.featuredTrainers.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _TrainerSection(
              title: 'Featured Trainers',
              trainers: state.content.featuredTrainers,
              promotionLabel: 'Featured',
            ),
          ),
        ),

      // 4. Ziro Recommends
      if (state.content.recommendedTrainers.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _TrainerSection(
              title: 'Ziro Recommends',
              trainers: state.content.recommendedTrainers,
              promotionLabel: 'Ziro',
            ),
          ),
        ),

      // 5. Map Spotlight
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: MapSpotlightPreviewCard(
            onlineCoachCount: state.content.totalTrainersCount,
            onTap: () => context.push('/explore/map'),
          ),
        ),
      ),
    ];
  }

  // ─── EVENTS TAB ───────────────────────────────────────────────

  List<Widget> _buildEventsTab(BuildContext context) {
    if (state.content.featuredEvents.isEmpty &&
        state.content.upcomingEvents.isEmpty) {
      return [
        SliverFillRemaining(
          child: ExploreEmptyEventsView(
            onNotifyMe: () {
              // Placeholder: subscribe to event notifications
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifications will be available soon.')),
              );
            },
          ),
        ),
      ];
    }

    return [
      // Featured Events Carousel
      if (state.content.featuredEvents.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: ExploreFeaturedCarousel(
              events: state.content.featuredEvents,
              onEventTap: (event) => context.push('/explore/event/${event.id}'),
            ),
          ),
        ),

      // Upcoming Events (date-sectioned)
      if (state.content.sortedEventDates.isNotEmpty) ...[
        // Build date-sectioned list: each date header + its events
        for (final date in state.content.sortedEventDates) ...[
          SliverToBoxAdapter(
            child: Padding(
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final key = _dateKey(date);
                final dayEvents = state.content.groupedEvents[key] ?? [];
                final event = dayEvents[index];
                return Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: index == dayEvents.length - 1 ? 0 : 12,
                  ),
                  child: ExploreEventRow(
                    event: event,
                    onTap: () => context.push('/explore/event/${event.id}'),
                  ),
                );
              },
              childCount: (state.content.groupedEvents[_dateKey(date)] ?? []).length,
            ),
          ),
        ],
      ],
    ];
  }

  /// Format date section header matching iOS: "Today", "Tomorrow", "EEEE, MMM d".
  String _formatDateSection(DateTime dt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(dt.year, dt.month, dt.day);
    if (date == today) return 'Today';
    if (date == today.add(const Duration(days: 1))) return 'Tomorrow';
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month]} ${dt.day}';
  }

  /// Build a date key string for grouping (matches cubit's _dateKey).
  String _dateKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}

// ─── SUPPORTING WIDGETS ─────────────────────────────────────────

/// Horizontal scroll section for trainers.
class _TrainerSection extends StatelessWidget {
  final String title;
  final List<dynamic> trainers;
  final String? promotionLabel;

  const _TrainerSection({
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

/// Error view with retry.
class _ErrorView extends StatelessWidget {
  final String message;
  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<ExploreCubit>().loadContent(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
