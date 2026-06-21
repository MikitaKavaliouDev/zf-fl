import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Multi-step onboarding flow:
/// 1. Role selection (Trainer / Client)
/// 2. Profile details (name, bio, location)
/// 3. [client only] Find-trainer wizard (goal → type)
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentStep = 0;

  // Step 1 – Role
  String? _selectedRole;

  // Step 2 – Details
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _locationController = TextEditingController();

  // Step 3 – Client find-trainer
  String? _selectedGoal;
  String? _selectedTrainingType;

  int get _totalSteps => _selectedRole == 'client' ? 3 : 2;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_currentStep < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _submit();
    }
  }

  void _submit() {
    if (_selectedRole == null) return;
    context.read<AuthCubit>().completeOnboarding(
          role: _selectedRole!,
          name: _nameController.text.trim(),
          bio: _bioController.text.trim().isEmpty
              ? null
              : _bioController.text.trim(),
          location: _locationController.text.trim().isEmpty
              ? null
              : _locationController.text.trim(),
        );
  }

  bool _canProceed() {
    switch (_currentStep) {
      case 0:
        return _selectedRole != null;
      case 1:
        return _nameController.text.trim().isNotEmpty;
      case 2:
        return _selectedGoal != null && _selectedTrainingType != null;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, next) =>
          next is AuthAuthenticated || next is AuthError,
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Welcome to ZIRO.FIT!')),
          );
          // Navigation handled by parent
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text('Step ${_currentStep + 1} of $_totalSteps'),
        ),
        body: Column(
          children: [
            // Progress indicator
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: LinearProgressIndicator(
                value: (_currentStep + 1) / _totalSteps,
                backgroundColor: AppColors.borderMuted,
                valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),

            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _currentStep = i),
                children: [
                  _buildRoleStep(),
                  _buildDetailsStep(),
                  if (_selectedRole == 'client') _buildFindTrainerStep(),
                ],
              ),
            ),

            // Bottom bar
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                child: Row(
                  children: [
                    if (_currentStep > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.foreground,
                            side: const BorderSide(color: AppColors.borderActive),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Back'),
                        ),
                      ),
                    if (_currentStep > 0) const SizedBox(width: 16),
                    Expanded(
                      flex: _currentStep > 0 ? 1 : 2,
                      child: BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          final loading = state is AuthLoading;
                          final canProceed = _canProceed();
                          return ElevatedButton(
                            onPressed:
                                (loading || !canProceed) ? null : _nextStep,
                            child: loading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(_currentStep == _totalSteps - 1
                                    ? 'Finish'
                                    : 'Continue'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Step 1: Role Selection ──

  Widget _buildRoleStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "What's your role?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Choose how you want to use ZIRO.FIT',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
          const SizedBox(height: 32),

          _RoleCard(
            icon: Icons.fitness_center_rounded,
            title: 'Trainer',
            subtitle: 'Create workouts, manage clients, grow your business',
            selected: _selectedRole == 'trainer',
            onTap: () => setState(() => _selectedRole = 'trainer'),
          ),
          const SizedBox(height: 16),

          _RoleCard(
            icon: Icons.directions_run_rounded,
            title: 'Client',
            subtitle: 'Find a trainer, track progress, achieve your goals',
            selected: _selectedRole == 'client',
            onTap: () => setState(() => _selectedRole = 'client'),
          ),
        ],
      ),
    );
  }

  // ── Step 2: Profile Details ──

  Widget _buildDetailsStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Tell us about yourself',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Set up your profile',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
          const SizedBox(height: 32),

          // Avatar
          Center(
            child: GestureDetector(
              onTap: () {
                // TODO: image picker
              },
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderMuted),
                ),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  size: 32,
                  color: AppColors.mutedText,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Name
          TextFormField(
            controller: _nameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Full name *',
              prefixIcon: Icon(Icons.person_outlined),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),

          // Location (required for trainer)
          if (_selectedRole == 'trainer')
            Column(
              children: [
                TextFormField(
                  controller: _locationController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Location *',
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),

          // Bio
          TextFormField(
            controller: _bioController,
            maxLines: 4,
            textInputAction: TextInputAction.newline,
            decoration: const InputDecoration(
              labelText: 'Bio (optional)',
              prefixIcon: Icon(Icons.info_outlined),
              alignLabelWithHint: true,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ── Step 3 (Client only): Find Trainer Wizard ──

  Widget _buildFindTrainerStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'What are your goals?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 24),

          Expanded(
            child: ListView(
              children: [
                _GoalChip(
                  label: 'Lose Weight',
                  icon: Icons.monitor_weight_outlined,
                  selected: _selectedGoal == 'weight_loss',
                  onTap: () => setState(() => _selectedGoal = 'weight_loss'),
                ),
                const SizedBox(height: 8),
                _GoalChip(
                  label: 'Build Muscle',
                  icon: Icons.fitness_center_outlined,
                  selected: _selectedGoal == 'muscle_building',
                  onTap: () => setState(() => _selectedGoal = 'muscle_building'),
                ),
                const SizedBox(height: 8),
                _GoalChip(
                  label: 'Strength Training',
                  icon: Icons.bolt_outlined,
                  selected: _selectedGoal == 'strength',
                  onTap: () => setState(() => _selectedGoal = 'strength'),
                ),
                const SizedBox(height: 8),
                _GoalChip(
                  label: 'Endurance',
                  icon: Icons.directions_run_outlined,
                  selected: _selectedGoal == 'endurance',
                  onTap: () => setState(() => _selectedGoal = 'endurance'),
                ),
                const SizedBox(height: 8),
                _GoalChip(
                  label: 'Flexibility',
                  icon: Icons.self_improvement_outlined,
                  selected: _selectedGoal == 'flexibility',
                  onTap: () => setState(() => _selectedGoal = 'flexibility'),
                ),
                const SizedBox(height: 8),
                _GoalChip(
                  label: 'General Fitness',
                  icon: Icons.favorite_outline,
                  selected: _selectedGoal == 'general_fitness',
                  onTap: () => setState(() => _selectedGoal = 'general_fitness'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          const Text(
            'Training type',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _TypeToggle(
                  label: 'Online',
                  icon: Icons.videocam_outlined,
                  selected: _selectedTrainingType == 'online',
                  onTap: () => setState(() => _selectedTrainingType = 'online'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TypeToggle(
                  label: 'In-Person',
                  icon: Icons.location_on_outlined,
                  selected: _selectedTrainingType == 'in_person',
                  onTap: () =>
                      setState(() => _selectedTrainingType = 'in_person'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Sub-widgets ──

class _RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withAlpha(20)
              : AppColors.card,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.borderMuted,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary.withAlpha(30)
                    : AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon,
                  color: selected ? AppColors.primary : AppColors.mutedText),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selected
                          ? AppColors.primary
                          : AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            if (selected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _GoalChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _GoalChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withAlpha(20)
              : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected ? AppColors.primary : AppColors.mutedText,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 15,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                color: selected ? AppColors.primary : AppColors.foreground,
              ),
            ),
            const Spacer(),
            if (selected)
              const Icon(Icons.check_circle,
                  color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}

class _TypeToggle extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TypeToggle({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withAlpha(20)
              : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.transparent,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: selected ? AppColors.primary : AppColors.mutedText,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                color: selected ? AppColors.primary : AppColors.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
