import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/trainer_check_in_review_cubit.dart';
import '../../cubit/trainer_check_in_review_state.dart';

/// Segmented check-in list for trainers (Pending / Reviewed).
/// Refactored from raw Dio to [TrainerCheckInReviewCubit].
class TrainerCheckInReviewScreen extends StatefulWidget {
  const TrainerCheckInReviewScreen({super.key});

  @override
  State<TrainerCheckInReviewScreen> createState() =>
      _TrainerCheckInReviewScreenState();
}

class _TrainerCheckInReviewScreenState
    extends State<TrainerCheckInReviewScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainerCheckInReviewCubit>().loadCheckIns();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Check-In Reviews')),
      body: BlocBuilder<TrainerCheckInReviewCubit, TrainerCheckInReviewState>(
        builder: (context, state) {
          return switch (state) {
            TrainerCheckInReviewInitial() || TrainerCheckInReviewLoading() =>
              const Center(
                  child: CircularProgressIndicator(color: AppColors.primary)),
            TrainerCheckInReviewError(:final message) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(message,
                        style: const TextStyle(color: AppColors.mutedText)),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () => context
                          .read<TrainerCheckInReviewCubit>()
                          .loadCheckIns(),
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            TrainerCheckInReviewLoaded(
              :final pendingCheckIns,
              :final reviewedCheckIns,
              :final selectedStatus
            ) =>
              Column(
                children: [
                  // Segmented control — matches iOS CheckInsView
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(
                          value: 'SUBMITTED',
                          label: Text('Pending'),
                        ),
                        ButtonSegment(
                          value: 'REVIEWED',
                          label: Text('Reviewed'),
                        ),
                      ],
                      selected: {selectedStatus},
                      onSelectionChanged: (sel) {
                        context
                            .read<TrainerCheckInReviewCubit>()
                            .setStatusFilter(sel.first);
                      },
                    ),
                  ),
                  // List
                  Expanded(
                    child: () {
                      final list = selectedStatus == 'SUBMITTED'
                          ? pendingCheckIns
                          : reviewedCheckIns;

                      if (list.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                selectedStatus == 'SUBMITTED'
                                    ? Icons.check_circle_outline
                                    : Icons.history,
                                size: 48,
                                color: AppColors.mutedText.withValues(alpha: 0.3),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                selectedStatus == 'SUBMITTED'
                                    ? 'All caught up!'
                                    : 'No reviewed check-ins yet',
                                style: const TextStyle(
                                    color: AppColors.mutedText),
                              ),
                            ],
                          ),
                        );
                      }

                      return RefreshIndicator(
                        onRefresh: () => context
                            .read<TrainerCheckInReviewCubit>()
                            .refresh(),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            final ci = list[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: ListTile(
                                onTap: () =>
                                    context.push('/trainer/checkins/${ci.id}'),
                                leading: CircleAvatar(
                                  radius: 18,
                                  backgroundColor:
                                      AppColors.primary.withValues(alpha: 0.15),
                                  child: Text(
                                    ci.client.name.isNotEmpty
                                        ? ci.client.name[0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primary),
                                  ),
                                ),
                                title: Text(ci.client.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                subtitle: Text(
                                  ci.date,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.mutedText),
                                ),
                                trailing: ci.status == 'SUBMITTED'
                                    ? Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.primary,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Text('Review',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      )
                                    : const Icon(Icons.check_circle,
                                        size: 20, color: Colors.green),
                              ),
                            );
                          },
                        ),
                      );
                    }(),
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
