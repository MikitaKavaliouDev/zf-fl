import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/widgets/error_widget.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/check_in_cubit.dart';
import '../cubit/check_in_state.dart';
import '../data/models/check_in_detail_dto.dart';

/// Full detail of a single check-in, showing all metrics, photos,
/// and trainer feedback.
class CheckInDetailScreen extends StatefulWidget {
  final String checkInId;

  const CheckInDetailScreen({super.key, required this.checkInId});

  @override
  State<CheckInDetailScreen> createState() => _CheckInDetailScreenState();
}

class _CheckInDetailScreenState extends State<CheckInDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckInCubit>().loadDetail(widget.checkInId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckInCubit, CheckInState>(
      listener: (context, state) {},
      builder: (context, state) {
        final title = state.maybeMap(
          detailLoaded: (d) => DateFormat('MMM d, yyyy').format(d.detail.date),
          orElse: () => 'Check-In Detail',
        );

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(title),
          ),
          body: _buildBody(context, state),
        );
      },
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
      historyLoaded: (_) => const SizedBox.shrink(),
      detailLoaded: (d) => _buildDetail(context, d.detail),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return ZiroErrorWidget(
      message: message,
      onRetry: () => context.read<CheckInCubit>().loadDetail(widget.checkInId),
    );
  }

  Widget _buildDetail(BuildContext context, CheckInDetailDto detail) {
    return RefreshIndicator(
      onRefresh: () => context.read<CheckInCubit>().loadDetail(widget.checkInId),
      color: AppColors.primary,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Status
          Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _statusColor(detail.status).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                detail.status.toUpperCase(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _statusColor(detail.status),
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              DateFormat('EEEE, MMMM d, yyyy').format(detail.date),
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.mutedText,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // ── Body Metrics ──
          if (detail.weight != null ||
              detail.waistCm != null ||
              detail.sleepHours != null)
            _buildMetricSection('Body Metrics', [
              if (detail.weight != null)
                _buildMetricRow(Icons.monitor_weight_outlined, 'Weight',
                    '${detail.weight!.toStringAsFixed(1)} kg'),
              if (detail.waistCm != null)
                _buildMetricRow(Icons.straighten_rounded, 'Waist',
                    '${detail.waistCm!.toStringAsFixed(1)} cm'),
              if (detail.sleepHours != null)
                _buildMetricRow(Icons.bed_outlined, 'Sleep',
                    '${detail.sleepHours!.toStringAsFixed(1)} hrs'),
            ]),

          // ── Wellness ──
          if (detail.energyLevel != null ||
              detail.stressLevel != null ||
              detail.hungerLevel != null ||
              detail.digestionLevel != null)
            _buildMetricSection('Wellness', [
              if (detail.energyLevel != null)
                _buildMetricRow(Icons.bolt_rounded, 'Energy',
                    _ratingLabel(detail.energyLevel!)),
              if (detail.stressLevel != null)
                _buildMetricRow(Icons.psychology_outlined, 'Stress',
                    _ratingLabel(detail.stressLevel!)),
              if (detail.hungerLevel != null)
                _buildMetricRow(Icons.restaurant_outlined, 'Hunger',
                    _ratingLabel(detail.hungerLevel!)),
              if (detail.digestionLevel != null)
                _buildMetricRow(Icons.self_improvement_rounded, 'Digestion',
                    _ratingLabel(detail.digestionLevel!)),
            ]),

          // ── Nutrition Compliance ──
          if (detail.nutritionCompliance != null &&
              detail.nutritionCompliance!.isNotEmpty)
            _buildMetricSection('Nutrition', [
              _buildMetricRow(Icons.restaurant_menu_rounded, 'Compliance',
                  detail.nutritionCompliance!),
            ]),

          // ── Client Notes ──
          if (detail.clientNotes != null &&
              detail.clientNotes!.isNotEmpty)
            _buildNotesSection(detail.clientNotes!),

          // ── Photos ──
          if (detail.photos.isNotEmpty) _buildPhotosSection(detail.photos),

          // ── Reviewer ──
          if (detail.reviewedBy != null) ...[
            const SizedBox(height: 24),
            _buildReviewerSection(detail.reviewedBy!),
          ],

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    return switch (status.toLowerCase()) {
      'completed' => Colors.green,
      'pending' => Colors.orange,
      'reviewed' => AppColors.primary,
      _ => AppColors.mutedText,
    };
  }

  Widget _buildMetricSection(String title, List<Widget> children) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: Column(children: children),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.mutedText),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.foreground,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotesSection(String notes) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              'Notes',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
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
      ),
    );
  }

  Widget _buildPhotosSection(List<CheckInPhotoDetailDto> photos) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              'Photos (${photos.length})',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.mutedText,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: photos.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final photo = photos[index];
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: GestureDetector(
                    onTap: () => _showPhotoFullscreen(context, photo),
                    child: CachedNetworkImage(
                      imageUrl: photo.imageUrl,
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                      errorWidget: (_, _, _) => Container(
                        width: 100,
                        height: 120,
                        color: AppColors.mutedSurface,
                        child: const Icon(
                          Icons.broken_image_rounded,
                          color: AppColors.mutedText,
                        ),
                      ),
                      progressIndicatorBuilder: (_, _, _) => Container(
                        width: 100,
                        height: 120,
                        color: AppColors.mutedSurface,
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewerSection(CheckInReviewerDto reviewer) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            backgroundImage: reviewer.photoUrl != null
                ? CachedNetworkImageProvider(reviewer.photoUrl!)
                : null,
            child: reviewer.photoUrl == null
                ? Text(
                    _getInitials(reviewer.name),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Reviewed by',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
                Text(
                  reviewer.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.foreground,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.green,
            size: 20,
          ),
        ],
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return '?';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  String _ratingLabel(int level) {
    return switch (level) {
      1 => 'Very Low',
      2 => 'Low',
      3 => 'Moderate',
      4 => 'High',
      5 => 'Very High',
      _ => 'Level $level',
    };
  }

  void _showPhotoFullscreen(
      BuildContext context, CheckInPhotoDetailDto photo) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          children: [
            InteractiveViewer(
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: photo.imageUrl,
                  fit: BoxFit.contain,
                  errorWidget: (_, _, _) => const Icon(
                    Icons.broken_image_rounded,
                    color: Colors.white54,
                    size: 48,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close_rounded,
                    color: Colors.white, size: 28),
                onPressed: () => Navigator.of(ctx).pop(),
              ),
            ),
            if (photo.caption != null)
              Positioned(
                bottom: 40,
                left: 16,
                right: 16,
                child: Text(
                  photo.caption!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
