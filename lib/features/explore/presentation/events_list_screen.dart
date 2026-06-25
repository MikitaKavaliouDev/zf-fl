import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/explore_cubit.dart';
import '../cubit/explore_state.dart';
import '../data/models/explore_event_dto.dart';
import 'widgets/explore_event_row.dart';
import 'widgets/explore_empty_events_view.dart';

/// Full-screen events list — matches iOS EventsListView sheet behavior.
///
/// Displays all upcoming events in a date-sectioned list with
/// pull-to-refresh. Each event navigates to /explore/event/:id.
class EventsListViewScreen extends StatelessWidget {
  const EventsListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.map_outlined),
            onPressed: () => context.push('/explore/map'),
            tooltip: 'Map view',
          ),
        ],
      ),
      body: BlocBuilder<ExploreCubit, ExploreState>(
        builder: (context, state) {
          if (state is ExploreStateInitial || state is ExploreStateLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is ExploreStateError) {
            return _ErrorView(
              message: state.message,
              onRetry: () => context.read<ExploreCubit>().loadContent(),
            );
          } else if (state is ExploreStateLoaded) {
            return _EventsListContent(state: state);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _EventsListContent extends StatelessWidget {
  final ExploreStateLoaded state;

  const _EventsListContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final events = state.content.upcomingEvents;
    final sortedDates = state.content.sortedEventDates;
    final grouped = state.content.groupedEvents;

    if (events.isEmpty) {
      return ExploreEmptyEventsView(
        onNotifyMe: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Notifications will be available soon.')),
          );
        },
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<ExploreCubit>().refresh(),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: sortedDates.length,
        itemBuilder: (context, index) {
          final date = sortedDates[index];
          final key = _dateKey(date);
          final dayEvents = grouped[key] ?? [];

          return _DateSection(
            date: date,
            events: dayEvents,
          );
        },
      ),
    );
  }

  String _dateKey(DateTime dt) =>
      '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
}

class _DateSection extends StatelessWidget {
  final DateTime date;
  final List<ExploreEventDto> events;

  const _DateSection({
    required this.date,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            _formatDateSection(date),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.mutedText,
            ),
          ),
        ),
        for (int i = 0; i < events.length; i++)
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: i == events.length - 1 ? 0 : 12,
            ),
            child: ExploreEventRow(
              event: events[i],
              onTap: () => context.push('/explore/event/${events[i].id}'),
            ),
          ),
      ],
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
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
    ];
    return '${weekdays[dt.weekday - 1]}, ${months[dt.month]} ${dt.day}';
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

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
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}