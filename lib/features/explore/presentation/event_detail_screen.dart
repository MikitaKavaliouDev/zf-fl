import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/event_detail_cubit.dart';
import '../cubit/event_detail_state.dart';
import '../data/explore_repository.dart';

/// Event Detail Screen — matches iOS EventDetailView layout.
/// Opened as a full-screen page from explore event cards/rows.
class EventDetailScreen extends StatelessWidget {
  final String eventId;

  const EventDetailScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: RepositoryProvider.value(
        value: getIt<ExploreRepository>(),
        child: BlocProvider(
          create: (context) {
            final cubit = EventDetailCubit(context.read<ExploreRepository>());
            cubit.load(eventId);
            return cubit;
          },
          child: BlocConsumer<EventDetailCubit, EventDetailState>(
            listener: (context, state) {
              if (state is EventDetailLoaded) {
                if (state.enrolled) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You\'ve successfully joined this event!'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
                if (state.checkoutUrl != null) {
                  launchUrl(Uri.parse(state.checkoutUrl!), mode: LaunchMode.externalApplication);
                }
              }
            },
            builder: (context, state) {
              return switch (state) {
                EventDetailInitial() || EventDetailLoading() => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                EventDetailLoaded(:final event, :final enrolled, :final enrolling) =>
                  _EventDetailContent(
                    event: event,
                    enrolled: enrolled,
                    enrolling: enrolling,
                    eventId: eventId,
                  ),
                EventDetailError(:final message) => _ErrorView(message: message),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _EventDetailContent extends StatelessWidget {
  final dynamic event;
  final bool enrolled;
  final bool enrolling;
  final String eventId;

  const _EventDetailContent({
    required this.event,
    required this.enrolled,
    required this.enrolling,
    required this.eventId,
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
                            colors: [
                              Colors.black54,
                              Colors.transparent,
                            ],
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
                      event.title ?? 'Event',
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
                        'Hosted by ${event.createdBy.name}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.mutedText,
                        ),
                      ),
                    const SizedBox(height: 20),

                    // Attendance section
                    if (event.maxAttendees != null || event.bookingCount != null)
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
                        text: event.location,
                      ),
                    if (event.lat != null && event.lon != null) ...[
                      const SizedBox(height: 12),
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
                              const Icon(
                                Icons.map_outlined,
                                size: 48,
                                color: AppColors.mutedText,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '${event.lat?.toStringAsFixed(4)}, ${event.lon?.toStringAsFixed(4)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.mutedText,
                                ),
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
                        event.description,
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
              20,
              16,
              20,
              MediaQuery.of(context).padding.bottom + 16,
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
                  if (event.price != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.mutedText,
                          ),
                        ),
                        Text(
                          event.isFree ? 'Free' : '\$${event.price}',
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
                      onPressed: (enrolled || enrolling)
                          ? null
                          : () => _enroll(context),
                      child: enrolling
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(enrolled ? 'Enrolled' : 'Enroll Now'),
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
    if (event.imageUrl != null && event.imageUrl!.isNotEmpty) {
      return Image.network(
        event.imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => _heroPlaceholder(),
      );
    }
    return _heroPlaceholder();
  }

  Widget _heroPlaceholder() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
        ),
      ),
      child: const Center(
        child: Icon(Icons.event_rounded, size: 64, color: Colors.white24),
      ),
    );
  }

  void _enroll(BuildContext context) async {
    try {
      await context.read<EventDetailCubit>().enroll(eventId);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _openInMaps(BuildContext ctx, double? lat, double? lon) {
    if (lat == null || lon == null) return;
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text('Opened: $lat, $lon'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String _formatDate(dynamic date) {
    if (date == null) return '';
    DateTime dt;
    if (date is String) {
      dt = DateTime.parse(date);
    } else if (date is DateTime) {
      dt = date;
    } else {
      return date.toString();
    }
    final months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[dt.month]} ${dt.day}, ${dt.year}';
  }
}

class _AttendanceSection extends StatelessWidget {
  final dynamic event;
  const _AttendanceSection({required this.event});

  @override
  Widget build(BuildContext context) {
    final max = event.maxAttendees ?? 0;
    final booked = event.bookingCount ?? 0;
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
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
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
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ),
      ],
    );
  }
}

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
            Text(message, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
