import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// 3-step wizard for requesting a custom program from a trainer.
/// Matches iOS CustomProgramRequestView (lines 792-873).
class CustomProgramRequestSheet extends StatefulWidget {
  final String trainerName;

  const CustomProgramRequestSheet({
    super.key,
    required this.trainerName,
  });

  @override
  State<CustomProgramRequestSheet> createState() =>
      _CustomProgramRequestSheetState();
}

class _CustomProgramRequestSheetState extends State<CustomProgramRequestSheet> {
  int _currentStep = 1;
  final _goalsController = TextEditingController();
  int _duration = 8;

  @override
  void dispose() {
    _goalsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          // Progress bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: List.generate(3, (i) {
                final filled = i + 1 <= _currentStep;
                return Expanded(
                  child: Container(
                    height: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: filled ? AppColors.primary : AppColors.borderMuted,
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Step content
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildStep(),
            ),
          ),

          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (_currentStep > 1)
                  TextButton(
                    onPressed: () => setState(() => _currentStep--),
                    child: const Text('Back'),
                  )
                else
                  const SizedBox(),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (_currentStep < 3) {
                      setState(() => _currentStep++);
                    } else {
                      Navigator.of(context).pop(true);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      _currentStep == 3 ? 'Send Request' : 'Next',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep() {
    switch (_currentStep) {
      case 1:
        return _step1();
      case 2:
        return _step2();
      case 3:
        return _step3();
      default:
        return const SizedBox();
    }
  }

  Widget _step1() {
    final firstName = widget.trainerName.split(' ').first;
    return Padding(
      key: const ValueKey(1),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tell $firstName about your goals.',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.mutedSurface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              controller: _goalsController,
              maxLines: 8,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Describe your fitness goals...',
                hintStyle: TextStyle(color: AppColors.mutedText),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tip: Mention equipment, injuries, and training frequency.',
            style: TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }

  Widget _step2() {
    return Padding(
      key: const ValueKey(2),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How long should the program be?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 24),
          ...List.generate(3, (i) {
            final weeks = [4, 8, 12][i];
            final selected = _duration == weeks;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => setState(() => _duration = weeks),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primary.withAlpha(25)
                        : AppColors.mutedSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: selected ? AppColors.primary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '$weeks Weeks',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      if (selected)
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.primary,
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _step3() {
    return Padding(
      key: const ValueKey(3),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(
            Icons.auto_awesome_rounded,
            size: 60,
            color: AppColors.primary,
          ),
          const SizedBox(height: 24),
          const Text(
            'Ready to transform?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '${widget.trainerName.split(' ').first} will review your goals and send a custom program link.',
            textAlign: TextAlign.center,
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
