import 'package:flutter/material.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/event_detail_cubit.dart';
import '../data/models/event_detail_dto.dart';

/// Event Detail Screen — matches iOS EventDetailView layout.
/// Opened as a full-screen page from explore event cards/rows.
class EventDetailScreen extends StatefulWidget {
  final String eventId;

  const EventDetailScreen({super.key, required this.eventId});

  @override
  State<EventDetailScreen> createState() => _EventDetailScreenState();
}

class _EventDetailScreenState extends State<EventDetailScreen> {
  bool _enrolled = false;
  bool _enrolling = false;
  late final EventDetailCubit _cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit = context.read<EventDetailCubit>();
  }

  Future<void> _enroll(EventDetailDto event) async {
    setState(() => _enrolling = true);
    try {
      if (event.isFree) {
        await _cubit.joinFreeEvent(widget.eventId);
        if (mounted) {
          setState(() => _enrolled = true);
          DartQuery.of(context).invalidateQueries(
            queryKey: QueryKey(['events', widget.eventId]),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You've successfully joined this event!"),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } else {
        final url = await _cubit.createCheckoutSession(
          type: 'EVENT_TICKET',
          id: widget.eventId,
        );
        if (mounted) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString()), behavior: SnackBarBehavior.floating),
        );
      }
    } finally {
      if (mounted) setState(() => _enrolling = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: QueryBuilder<EventDetailDto>(
        queryKey: QueryKey(['events', widget.eventId]),
        queryFn: () => _cubit.getEventDetail(widget.eventId),
        staleTime: const Duration(minutes: 10),
        builder: (context, state) {
          if (state.isLoading && !state.isFetched) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          if (state.isError && !state.isFetched) {
            return _ErrorView(
              message: 'Failed to load event details.',
              onRetry: () => DartQuery.of(context).refetchQueries(
                queryKey: QueryKey(['events', widget.eventId]),
              ),
            );
          }

          final event = state.data;
          if (event == null) {
            return const Center(
              child: Text('Event not found', style: TextStyle(color: AppColors.mutedText)),
            );
          }

          return _EventDetailContent(
            event: event,
            enrolled: _enrolled,
            enrolling: _enrolling,
            eventId: widget.eventId,
            onEnroll: () => _enroll(event),
          );
        },
      ),
    );
  }
}

class _EventDetailContent extends StatelessWidget {
  final EventDetailDto event;
  final bool enrolled;
  final bool enrolling;
  final String eventId;
  final VoidCallback onEnroll;

  const _EventDetailContent({
    required this.event,
    required this.enrolled,
    required this.enrolling,
    required this.eventId,
    required this.onEnroll,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // Hero Image
            SliverAppBar(
              expandedHeight: 250,
              backgroundColor: AppColors.background,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildHeroImage(),
                    // Gradient overlay
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black54, Colors.transparent],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Hosted by
                    if (event.createdBy?.name != null)
                      Text(
                        'Hosted by ${event.createdBy!.name}',
                        style: const TextStyle(fontSize: 15, color: AppColors.mutedText),
                      ),
                    const SizedBox(height: 20),

                    // Attendance section
                    if (event.maxAttendees != null || event.bookingCount > 0)
                      _AttendanceSection(event: event),

                    const SizedBox(height: 24),

                    // Date & Time
                    _InfoRow(
                      icon: Icons.calendar_today_rounded,
                      text: _formatDate(event.date),
                    ),
                    const SizedBox(height: 12),

                    // Location
                    if (event.location != null)
                      _InfoRow(
                        icon: Icons.location_on_outlined,
                        text: event.location!,
                      ),
                    if (event.lat != null && event.lon != null) ...[
                      const SizedBox(height: 24),
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.mutedSurface,
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.map_outlined, size: 48, color: AppColors.mutedText),
                              const SizedBox(height: 8),
                              Text(
                                '${event.lat!.toStringAsFixed(4)}, ${event.lon!.toStringAsFixed(4)}',
                                style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
                              ),
                              const SizedBox(height: 8),
                              TextButton.icon(
                                onPressed: () => _openInMaps(context, event.lat, event.lon),
                                icon: const Icon(Icons.open_in_new, size: 16),
                                label: const Text('Open in Maps'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),

                    // About Event
                    if (event.description != null) ...[
                      const Text(
                        'About Event',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        event.description!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.mutedText,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),

        // Top dismiss button
        Positioned(
          top: MediaQuery.of(context).padding.top + 8,
          left: 16,
          child: GestureDetector(
            onTap: () => Navigator.of(context).maybePop(),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.background.withValues(alpha: 0.85),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close_rounded, size: 20),
            ),
          ),
        ),

        // Bottom Action Bar
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              20, 16, 20, MediaQuery.of(context).padding.bottom + 16,
            ),
            decoration: BoxDecoration(
              color: AppColors.background,
              border: Border(
                top: BorderSide(color: AppColors.borderMuted, width: 0.5),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(fontSize: 11, color: AppColors.mutedText),
                      ),
                      Text(
                        event.isFree ? 'Free' : '\$${event.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Enroll button
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: (enrolled || enrolling) ? null : onEnroll,
                      child: enrolling
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(enrolled ? 'Enrolled ✓' : 'Enroll Now'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeroImage() {
    // EventDetailDto doesn't include imageUrl; always show placeholder.
    return _heroPlaceholder();
  }

  Widget _heroPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)]),
      ),
      child: const Center(
        child: Icon(Icons.event_rounded, size: 64, color: Colors.white24),
      ),
    );
  }

  void _openInMaps(BuildContext ctx, double? lat, double? lon) {
    if (lat == null || lon == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(content: Text('Opened: $lat, $lon'), behavior: SnackBarBehavior.floating),
    );
  }

  String _formatDate(DateTime dt) {
    const months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${months[dt.month]} ${dt.day}, ${dt.year}';
  }
}

class _AttendanceSection extends StatelessWidget {
  final EventDetailDto event;
  const _AttendanceSection({required this.event});

  @override
  Widget build(BuildContext context) {
    final max = event.maxAttendees ?? 0;
    final booked = event.bookingCount;
    final ratio = max > 0 ? booked / max : 0.0;
    final isNearCapacity = ratio >= 0.8;
    final spotsLeft = max > 0 ? max - booked : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$booked Attending',
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.foreground),
          ),
          if (max > 0) ...[
            const SizedBox(height: 4),
            Text(
              '$spotsLeft spots left',
              style: TextStyle(
                fontSize: 12,
                color: isNearCapacity ? Colors.orange : AppColors.mutedText,
                fontWeight: isNearCapacity ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: ratio,
                backgroundColor: AppColors.borderMuted,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isNearCapacity ? Colors.orange : AppColors.primary,
                ),
                minHeight: 6,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.mutedText),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: const TextStyle(fontSize: 14, color: AppColors.foreground)),
        ),
      ],
    );
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
            Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
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
