import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../data/check_in_repository.dart';
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
  final CheckInRepository _repository = getIt<CheckInRepository>();

  bool _isLoading = true;
  String? _error;
  List<CheckInHistoryItemDto> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final items = await _repository.getHistory();
      items.sort((a, b) => b.date.compareTo(a.date));
      if (mounted) {
        setState(() {
          _items = items;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Failed to load check-in history.';
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Check-In History'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: AppColors.primary,
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.mutedText,
              ),
              const SizedBox(height: 16),
              Text(
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _load,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_items.isEmpty) {
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
      onRefresh: _load,
      color: AppColors.primary,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = _items[index];
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
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.feedback_rounded,
                          size: 12,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 3),
                        const Text(
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
