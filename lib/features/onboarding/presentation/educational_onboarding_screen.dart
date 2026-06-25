import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import 'onboarding_slide_widget.dart';

/// 5-step educational carousel wizard matching iOS EducationalOnboardingView exactly
/// (client/personal mode). Shown once to new users or accessible from MoreScreen.
///
/// Steps:
///   0. Welcome — title, subtitle, gradient card with crown icon
///   1. Find Your Coach — OnboardingSlide with shield checkmark
///   2. Master Your Workouts — OnboardingSlide with strength icon
///   3. Stay Accountable — OnboardingSlide with checkmark seal
///   4. Ready to Transform? — sparkles icon, title, "Get Started" button
///
/// No Bloc/Cubit needed — simple StatefulWidget with currentStep (0-4).
class EducationalOnboardingScreen extends StatefulWidget {
  const EducationalOnboardingScreen({super.key});

  @override
  State<EducationalOnboardingScreen> createState() =>
      _EducationalOnboardingScreenState();
}

class _EducationalOnboardingScreenState
    extends State<EducationalOnboardingScreen> {
  int _currentStep = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    if (_currentStep < 4) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() => Navigator.of(context).pop();

  void _getStarted() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── Progress Capsules ──
            _buildProgressBar(),
            const SizedBox(height: 8),

            // ── Page Content ──
            Expanded(child: _buildPageView()),

            // ── Bottom Controls ──
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  // ── Progress Indicator ──

  Widget _buildProgressBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
      child: Row(
        children: List.generate(5, (index) {
          final isActive = index == _currentStep;
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: isActive ? AppColors.primary : AppColors.borderMuted,
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Page View ──

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() => _currentStep = index);
      },
      children: const [
        _WelcomeStep(),
        OnboardingSlide(
          title: 'Find Your Coach',
          description:
              'Browse certified trainers who design personalized programs to help you reach your specific goals.',
          icon: Icons.verified_user,
          color: AppColors.primary,
        ),
        OnboardingSlide(
          title: 'Master Your Workouts',
          description:
              'Follow clear instructions for every exercise. Logging your sessions helps you and your trainer track real progress.',
          icon: Icons.fitness_center,
          color: Colors.purple,
        ),
        OnboardingSlide(
          title: 'Stay Accountable',
          description:
              'Weekly check-ins bridge the gap between sessions. Share your wins and challenges to get expert feedback.',
          icon: Icons.verified,
          color: Colors.orange,
        ),
        _FinalStep(),
      ],
    );
  }

  // ── Bottom Controls ──

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_currentStep < 4) ...[
            // Next button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _goToNextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  disabledBackgroundColor: AppColors.borderMuted,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Next'),
              ),
            ),
            const SizedBox(height: 20),
            // Skip link
            GestureDetector(
              onTap: _skip,
              child: const Text(
                'Skip',
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.mutedText,
                ),
              ),
            ),
          ] else ...[
            // Get Started button with blue→purple gradient
            SizedBox(
              width: double.infinity,
              height: 56,
              child: GestureDetector(
                onTap: _getStarted,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, Colors.purple],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Welcome Step (Step 0)
// ─────────────────────────────────────────────

class _WelcomeStep extends StatelessWidget {
  const _WelcomeStep();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          const Spacer(),
          // Title
          const Text(
            'Welcome to Ziro Fit',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Subtitle
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Become the best version of yourself through expert-led education and training.',
              style: TextStyle(
                fontSize: 17,
                color: AppColors.mutedText,
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          // Gradient card with crown icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                  colors: [
                    Color(0x1A007AFF), // AppColors.primary at 10%
                    Color(0x1A7C3AED), // purple at 10%
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // White circle with gradient icon
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.amber, Colors.orange],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ).createShader(bounds),
                      child: const Icon(
                        Icons.workspace_premium,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'The Premium Experience',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.foreground,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Final Step (Step 4) — "Ready to Transform?"
// ─────────────────────────────────────────────

class _FinalStep extends StatelessWidget {
  const _FinalStep();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        // Sparkles icon with blue→purple gradient circle
        Container(
          width: 150,
          height: 150,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0x33007AFF), // AppColors.primary at 20%
                Color(0x337C3AED), // purple at 20%
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [AppColors.primary, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Icon(
              Icons.auto_awesome,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Title
        const Text(
          'Ready to Transform?',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        // Description
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'Your journey to a better version of yourself starts now. Everything you need is right here.',
            style: TextStyle(
              fontSize: 17,
              color: AppColors.mutedText,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}