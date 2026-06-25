import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/check_in_cubit.dart';
import '../cubit/check_in_state.dart';
import '../data/models/check_in_config_dto.dart';
import '../data/models/check_in_submission_dto.dart';
import 'check_in_success_widget.dart';
import 'steps/body_metrics_step.dart';
import 'steps/notes_step.dart';
import 'steps/photos_step.dart';
import 'steps/wellness_step.dart';

/// 4-step check-in wizard screen.
///
/// Matches iOS CheckInWizardView — CheckInWizardView.swift lines 1-155.
/// Steps: Body Metrics (0), Wellness (1), Photos (2), Notes (3).
class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Defer load to next frame so the cubit is available.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CheckInCubit>().loadConfig();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CheckInCubit, CheckInState>(
          builder: (context, state) {
            return switch (state) {
              CheckInInitial() => const SizedBox.shrink(),
              CheckInSubmitting() => const _SubmittingView(),
              CheckInSuccess() =>
                CheckInSuccessWidget(
                  onDone: () {
                    context.read<CheckInCubit>().reset();
                    if (context.mounted) context.pop();
                  },
                ),
              CheckInError(:final message) => _ErrorView(
                  message: message,
                  onRetry: () => context.read<CheckInCubit>().loadConfig(),
                ),
              CheckInStep(:final step, :final submission, :final config) =>
                _buildWizard(step, submission, config),
            };
          },
        ),
      ),
    );
  }

  Widget _buildWizard(int step, CheckInSubmissionDto submission, CheckInConfigDto? config) {
    return Column(
      children: [
        // Header area
        _WizardHeader(
          step: step,
          totalSteps: 4,
          onClose: () {
            context.read<CheckInCubit>().reset();
            if (context.mounted) context.pop();
          },
        ),

        // Progress bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: (step + 1) / 4,
              minHeight: 4,
              backgroundColor: AppColors.borderMuted,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Step content
        Expanded(
          child: _buildStepContent(step, submission),
        ),

        // Bottom navigation buttons
        _BottomNav(
          step: step,
          totalSteps: 4,
          onBack: step > 0
              ? () => context.read<CheckInCubit>().prevStep()
              : null,
          onNext: step < 3
              ? () => context.read<CheckInCubit>().nextStep()
              : null,
          onSubmit: step == 3
              ? () => context.read<CheckInCubit>().submit()
              : null,
        ),
      ],
    );
  }

  Widget _buildStepContent(int step, CheckInSubmissionDto submission) {
    switch (step) {
      case 0:
        return BodyMetricsStep(
          weight: submission.weight,
          waistCm: submission.waistCm,
          sleepHours: submission.sleepHours,
          onWeightChanged: (v) =>
              context.read<CheckInCubit>().updateWeight(v),
          onWaistCmChanged: (v) =>
              context.read<CheckInCubit>().updateWaistCm(v),
          onSleepHoursChanged: (v) =>
              context.read<CheckInCubit>().updateSleepHours(v),
        );
      case 1:
        return WellnessStep(
          energyLevel: submission.energyLevel ?? 5,
          stressLevel: submission.stressLevel ?? 5,
          hungerLevel: submission.hungerLevel ?? 5,
          digestionLevel: submission.digestionLevel ?? 5,
          nutritionCompliance: submission.nutritionCompliance,
          onEnergyLevelChanged: (v) =>
              context.read<CheckInCubit>().updateEnergyLevel(v),
          onStressLevelChanged: (v) =>
              context.read<CheckInCubit>().updateStressLevel(v),
          onHungerLevelChanged: (v) =>
              context.read<CheckInCubit>().updateHungerLevel(v),
          onDigestionLevelChanged: (v) =>
              context.read<CheckInCubit>().updateDigestionLevel(v),
          onNutritionComplianceChanged: (v) =>
              context.read<CheckInCubit>().updateNutritionCompliance(v),
        );
      case 2:
        return PhotosStep(
          photos: submission.photos,
          onRemovePhoto: (index) =>
              context.read<CheckInCubit>().removePhoto(index),
          onAddPhoto: _pickAndAddPhoto,
        );
      case 3:
        return NotesStep(
          clientNotes: submission.clientNotes,
          onNotesChanged: (v) =>
              context.read<CheckInCubit>().updateClientNotes(v),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Future<void> _pickAndAddPhoto() async {
    try {
      final picked = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
        maxHeight: 1200,
        imageQuality: 80,
      );
      if (picked != null && mounted) {
        context.read<CheckInCubit>().addPhoto(picked.path, null);
      }
    } catch (e) {
      // Image picker cancelled or failed — do nothing.
    }
  }
}

/// Header with title, step indicator, and close button.
class _WizardHeader extends StatelessWidget {
  final int step;
  final int totalSteps;
  final VoidCallback onClose;

  const _WizardHeader({
    required this.step,
    required this.totalSteps,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: onClose,
            child: const Icon(
              Icons.close_rounded,
              size: 24,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
          const Text(
            'Weekly Check-in',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const Spacer(),
          Text(
            '${step + 1}/$totalSteps',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

/// Bottom navigation bar with Back / Next / Submit buttons.
class _BottomNav extends StatelessWidget {
  final int step;
  final int totalSteps;
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final VoidCallback? onSubmit;

  const _BottomNav({
    required this.step,
    required this.totalSteps,
    this.onBack,
    this.onNext,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.borderMuted),
        ),
      ),
      child: Row(
        children: [
          if (onBack != null)
            Expanded(
              child: OutlinedButton(
                onPressed: onBack,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                  side: const BorderSide(color: AppColors.borderActive),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ),
          if (onBack != null && (onNext != null || onSubmit != null))
            const SizedBox(width: 12),
          if (onNext != null)
            Expanded(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Next'),
              ),
            ),
          if (onSubmit != null)
            Expanded(
              child: ElevatedButton(
                onPressed: onSubmit,
                child: const Text('Submit'),
              ),
            ),
        ],
      ),
    );
  }
}

/// Loading indicator overlay while submitting.
class _SubmittingView extends StatelessWidget {
  const _SubmittingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            strokeWidth: 3,
            color: AppColors.primary,
          ),
          SizedBox(height: 16),
          Text(
            'Submitting check-in...',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }
}

/// Error state with retry button.
class _ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorView({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.cloud_off_rounded,
              size: 56,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded, size: 18),
              label: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
