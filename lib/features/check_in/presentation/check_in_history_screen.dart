import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/widgets/error_widget.dart';
import '../cubit/check_in_cubit.dart';
import '../cubit/check_in_state.dart';
import '../data/models/check_in_history_item_dto.dart';

/// Full-screen list of past check-ins.
///
/// Fetches history from the API, shows a list with date, status,
/// photo count, and feedback indicator. Tap navigates to detail.
class CheckInHistoryScreen extends StatefulWidget {
  const CheckInHistoryScreen({super.key});

  @override
  State<CheckInHistoryScreen> createState() => _CheckInHistoryScreenState();
}

class _CheckInHistoryScreenState extends State<CheckInHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckInCubit>().loadHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Check-In History'),
      ),
      body: BlocConsumer<CheckInCubit, CheckInState>(
        listener: (context, state) {},
        builder: (context, state) => _buildBody(context, state),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CheckInState state) {
    return state.map(
      initial: (_) => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: AppColors.primary,
        ),
      ),
      step: (_) => const SizedBox.shrink(),
      submitting: (_) => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: AppColors.primary,
        ),
      ),
      success: (_) => const SizedBox.shrink(),
      error: (e) => _buildError(context, e.message),
      historyLoaded: (h) => _buildHistoryList(context, h.items),
      detailLoaded: (_) => const SizedBox.shrink(),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return ZiroErrorWidget(
      message: message,
      onRetry: () => context.read<CheckInCubit>().loadHistory(),
    );
  }

  Widget _buildHistoryList(BuildContext context, List<CheckInHistoryItemDto> items) {
    if (items.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.checklist_rounded,
              size: 50,
              color: AppColors.mutedText,
            ),
            SizedBox(height: 20),
            Text(
              'No check-ins yet',
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            SizedBox(height: 8),
            Text(
              'Complete your first check-in from the Home tab',
              style: TextStyle(fontSize: 13, color: AppColors.mutedText),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => context.read<CheckInCubit>().loadHistory(),
      color: AppColors.primary,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = items[index];
          return _CheckInHistoryCard(
            item: item,
            onTap: () => context.push('/check-in-detail/${item.id}'),
          );
        },
      ),
    );
  }
}

class _CheckInHistoryCard extends StatelessWidget {
  final CheckInHistoryItemDto item;
  final VoidCallback onTap;

  const _CheckInHistoryCard({
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM d, yyyy').format(item.date);
    final dayStr = DateFormat('EEEE').format(item.date);

    return Card(
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Date column
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    item.date.day.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateStr,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      dayStr,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              // Badges
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _StatusBadge(status: item.status),
                  if (item.photoCount > 0) ...[
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.photo_camera_outlined,
                          size: 12,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '${item.photoCount}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (item.hasFeedback) ...[
                    const SizedBox(height: 4),
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.feedback_rounded,
                          size: 12,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 3),
                        Text(
                          'Feedback',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.chevron_right_rounded,
                size: 20,
                color: AppColors.mutedText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final (Color color, String label) = switch (status.toLowerCase()) {
      'completed' => (Colors.green, 'Completed'),
      'pending' => (Colors.orange, 'Pending'),
      'reviewed' => (AppColors.primary, 'Reviewed'),
      _ => (AppColors.mutedText, status),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
