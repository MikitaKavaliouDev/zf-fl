import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../data/explore_api_service.dart';
import '../data/models/explore_event_dto.dart';
import '../data/models/paginated_events.dart';
import 'widgets/explore_empty_events_view.dart';
import 'widgets/explore_event_row.dart';

/// Full-screen events list — matches iOS EventsListView sheet behavior.
///
/// Displays all upcoming events in a date-sectioned list with
/// pull-to-refresh. Each event navigates to /explore/event/:id.
class EventsListViewScreen extends StatelessWidget {
  const EventsListViewScreen({super.key});

  ExploreApiService get _api => getIt<ExploreApiService>();

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
      body: QueryBuilder<PaginatedEvents>(
        queryKey: QueryKey(['explore', 'events', 'list']),
        queryFn: () => _api.getEvents(limit: 50),
        staleTime: const Duration(minutes: 5),
        placeholderData: PaginatedEvents(events: [], hasMore: false, page: 1, limit: 50),
        builder: (context, state) {
          if (state.isLoading && !state.isFetched) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          if (state.isError && !state.isFetched) {
            return _ErrorView(
              message: state.error?.toString() ?? 'Failed to load events.',
              onRetry: () => DartQuery.of(context).refetchQueries(
                queryKey: QueryKey(['explore', 'events', 'list']),
              ),
            );
          }
          final events = state.data?.events ?? <ExploreEventDto>[];
          if (events.isEmpty) {
            return ExploreEmptyEventsView(
              onNotifyMe: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications will be available soon.')),
                );
              },
            );
          }

          // Group by date
          final now = DateTime.now();
          final upcoming = events.where((e) => e.startTime.isAfter(now)).toList();
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

          return RefreshIndicator(
            onRefresh: () => DartQuery.of(context).refetchQueries(
              queryKey: QueryKey(['explore', 'events', 'list']),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: sortedDates.length,
              itemBuilder: (context, index) {
                final date = sortedDates[index];
                final key = _dateKey(date);
                final dayEvents = grouped[key] ?? [];
                return RepaintBoundary(child: _DateSection(date: date, events: dayEvents));
              },
            ),
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

  const _DateSection({required this.date, required this.events});

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
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    const weekdays = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday',
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
