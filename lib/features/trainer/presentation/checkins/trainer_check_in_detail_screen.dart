import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../trainer/data/models/check_in_client_ref_dto.dart';
import '../../../trainer/data/models/check_in_photo_dto.dart';
import '../../../trainer/data/models/trainer_check_in_detail_dto.dart';
import '../../cubit/trainer_check_in_detail_cubit.dart';
import '../../cubit/trainer_check_in_detail_state.dart';

/// Full check-in detail view for trainers.
///
/// Layout (matching iOS CheckInDetailView):
///   1. StatsGrid — 3-column weight/waist/sleep cards
///   2. BiofeedbackSection — energy/stress/hunger/digestion ratings
///   3. PhotosSection — horizontal scroll of check-in photos
///   4. ClientNotesSection — client's notes text
///   5. TrainerFeedbackSection — text editor + submit/read-only
class TrainerCheckInDetailScreen extends StatefulWidget {
  final String checkInId;

  const TrainerCheckInDetailScreen({super.key, required this.checkInId});

  @override
  State<TrainerCheckInDetailScreen> createState() =>
      _TrainerCheckInDetailScreenState();
}

class _TrainerCheckInDetailScreenState
    extends State<TrainerCheckInDetailScreen> {
  final _feedbackController = TextEditingController();

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<TrainerCheckInDetailCubit>()..loadDetail(widget.checkInId),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(title: const Text('Check-in')),
        body: BlocConsumer<TrainerCheckInDetailCubit,
            TrainerCheckInDetailState>(
          listener: (context, state) {
            if (state is TrainerCheckInDetailLoaded) {
              // Pre-fill feedback field if there's an existing response
              final response = state.checkIn.trainerResponse;
              if (response != null &&
                  response.isNotEmpty &&
                  _feedbackController.text.isEmpty) {
                _feedbackController.text = response;
              }
            }
          },
          builder: (context, state) {
            return switch (state) {
              TrainerCheckInDetailInitial() ||
              TrainerCheckInDetailLoading() =>
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              TrainerCheckInDetailError(:final message) => _ErrorView(
                  message: message,
                  onRetry: () => context
                      .read<TrainerCheckInDetailCubit>()
                      .loadDetail(widget.checkInId),
                ),
              TrainerCheckInDetailLoaded(
                :final checkIn,
                :final isSubmitting
              ) =>
                _CheckInContent(
                  checkIn: checkIn,
                  isSubmitting: isSubmitting,
                  feedbackController: _feedbackController,
                  onSubmit: () =>
                      context.read<TrainerCheckInDetailCubit>().submitReview(
                            widget.checkInId,
                            _feedbackController.text.trim(),
                          ),
                ),
            };
          },
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Error View
// ──────────────────────────────────────────────

class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, size: 48, color: AppColors.mutedText),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.mutedText, fontSize: 14),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Main Content
// ──────────────────────────────────────────────

class _CheckInContent extends StatelessWidget {
  final TrainerCheckInDetailDto checkIn;
  final bool isSubmitting;
  final TextEditingController feedbackController;
  final VoidCallback onSubmit;

  const _CheckInContent({
    required this.checkIn,
    required this.isSubmitting,
    required this.feedbackController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Client header
          _ClientHeader(client: checkIn.client, date: checkIn.date),
          const SizedBox(height: 16),

          // Stats grid
          _StatsGrid(checkIn: checkIn),
          const SizedBox(height: 16),

          // Biofeedback
          _BiofeedbackSection(checkIn: checkIn),
          const SizedBox(height: 16),

          // Photos
          if (checkIn.photos.isNotEmpty) ...[
            _PhotosSection(photos: checkIn.photos),
            const SizedBox(height: 16),
          ],

          // Client notes
          if (checkIn.clientNotes != null &&
              checkIn.clientNotes!.isNotEmpty) ...[
            _ClientNotesSection(notes: checkIn.clientNotes!),
            const SizedBox(height: 16),
          ],

          // Trainer feedback
          _TrainerFeedbackSection(
            checkIn: checkIn,
            isSubmitting: isSubmitting,
            controller: feedbackController,
            onSubmit: onSubmit,
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Client Header
// ──────────────────────────────────────────────

class _ClientHeader extends StatelessWidget {
  final CheckInClientRefDto client;
  final String date;

  const _ClientHeader({required this.client, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: AppColors.primary.withValues(alpha: 0.15),
          child: Text(
            client.name.isNotEmpty ? client.name[0].toUpperCase() : '?',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                client.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.foreground,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.mutedText,
                ),
              ),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: AppColors.mutedText, size: 20),
      ],
    );
  }
}

// ──────────────────────────────────────────────
// Stats Grid — 3-column weight / waist / sleep
// ──────────────────────────────────────────────

class _StatsGrid extends StatelessWidget {
  final TrainerCheckInDetailDto checkIn;

  const _StatsGrid({required this.checkIn});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.monitor_weight_outlined,
            value: checkIn.weight != null
                ? '${checkIn.weight!.toStringAsFixed(1)} kg'
                : '-',
            label: 'Weight',
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: Icons.straighten,
            value: checkIn.waistCm != null
                ? '${checkIn.waistCm!.toStringAsFixed(0)} cm'
                : '-',
            label: 'Waist',
            color: const Color(0xFF7C3AED), // purple
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _StatCard(
            icon: Icons.bedtime_outlined,
            value: checkIn.sleepHours != null
                ? '${checkIn.sleepHours!.toStringAsFixed(1)} hrs'
                : '-',
            label: 'Sleep',
            color: const Color(0xFF4F46E5), // indigo
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Biofeedback Section
// ──────────────────────────────────────────────

class _BiofeedbackSection extends StatelessWidget {
  final TrainerCheckInDetailDto checkIn;

  const _BiofeedbackSection({required this.checkIn});

  @override
  Widget build(BuildContext context) {
    final rows = <_BiofeedbackRow>[
      _BiofeedbackRow(
        label: 'Energy',
        value: checkIn.energyLevel,
      ),
      _BiofeedbackRow(
        label: 'Stress',
        value: checkIn.stressLevel,
      ),
      _BiofeedbackRow(
        label: 'Hunger',
        value: checkIn.hungerLevel,
      ),
      _BiofeedbackRow(
        label: 'Digestion',
        value: checkIn.digestionLevel,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Biofeedback',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(
            children: List.generate(rows.length, (index) {
              return Column(
                children: [
                  if (index > 0)
                    const Divider(height: 1, color: AppColors.borderMuted),
                  rows[index],
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _BiofeedbackRow extends StatelessWidget {
  final String label;
  final int? value;

  const _BiofeedbackRow({required this.label, this.value});

  Color _valueColor(int v) {
    if (v >= 7) return Colors.green;
    if (v >= 4) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final displayValue = value != null ? '$value/10' : '-/10';
    final textColor =
        value != null ? _valueColor(value!) : AppColors.mutedText;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
          Text(
            displayValue,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Photos Section
// ──────────────────────────────────────────────

class _PhotosSection extends StatelessWidget {
  final List<CheckInPhotoDto> photos;

  const _PhotosSection({required this.photos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Photos',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final photo = photos[index];
              final url = photo.imageUrl ?? photo.imagePath;

              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 120,
                  height: 160,
                  child: url != null
                      ? Image.network(
                          url,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            developer.log(
                              'Photo load failed: $error',
                              name: 'trainer',
                            );
                            return _photoPlaceholder();
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return _photoPlaceholder();
                          },
                        )
                      : _photoPlaceholder(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _photoPlaceholder() {
    return Container(
      color: AppColors.mutedSurface,
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          color: AppColors.mutedText,
          size: 32,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Client Notes Section
// ──────────────────────────────────────────────

class _ClientNotesSection extends StatelessWidget {
  final String notes;

  const _ClientNotesSection({required this.notes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Client Notes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Text(
            notes,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────
// Trainer Feedback Section
// ──────────────────────────────────────────────

class _TrainerFeedbackSection extends StatelessWidget {
  final TrainerCheckInDetailDto checkIn;
  final bool isSubmitting;
  final TextEditingController controller;
  final VoidCallback onSubmit;

  const _TrainerFeedbackSection({
    required this.checkIn,
    required this.isSubmitting,
    required this.controller,
    required this.onSubmit,
  });

  bool get _isReadOnly => checkIn.status == 'REVIEWED';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trainer Feedback',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: TextField(
            controller: controller,
            readOnly: _isReadOnly,
            maxLines: null,
            minLines: 1,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8),
              hintText: 'Write your feedback...',
              hintStyle: TextStyle(color: AppColors.mutedText, fontSize: 14),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
          ),
        ),
        const SizedBox(height: 12),
        if (_isReadOnly)
          _ReviewedBadge(reviewedAt: checkIn.reviewedAt)
        else
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed:
                  (controller.text.trim().isEmpty || isSubmitting) ? null : onSubmit,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: isSubmitting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Submit Review',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
      ],
    );
  }
}

class _ReviewedBadge extends StatelessWidget {
  final String? reviewedAt;

  const _ReviewedBadge({this.reviewedAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Text(
            reviewedAt != null
                ? 'Reviewed on ${reviewedAt!}'
                : 'Reviewed',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
