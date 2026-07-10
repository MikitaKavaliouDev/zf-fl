import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

/// Full-featured onboarding wizard matching iOS OnboardingView exactly.
///
/// Steps (iOS parity):
///   0 – Language selection
///   1 – Role selection (Personal / Professional)
///   2 – Profile details (name, surname, location for trainer, bio)
///   3a – Physical stats (client: height, weight, experience)
///   3b – Service radius (trainer)
///   4 – Avatar upload
///   5 – Goal selection (client only)
///   6 – Location preference (client only: online / in-person + city)
///   → Celebration overlay
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  final _pageController = PageController();
  int _currentStep = 0;

  // Step 0 – Language
  String _selectedLanguage = 'English';

  // Step 1 – Role
  String _selectedRole = '';

  // Step 2 – Details
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _locationController = TextEditingController();
  final _bioController = TextEditingController();

  // Step 3a – Physical stats (client)
  double _height = 175; // cm
  double _weight = 75; // kg
  String _experienceLevel = 'Intermediate';

  // Step 3b – Service radius (trainer)
  double _serviceRadius = 10; // km

  // Step 4 – Avatar
  File? _avatarFile;
  final _picker = ImagePicker();

  // Step 5 – Goal (client)
  String _selectedGoal = '';

  // Step 6 – Location preference (client)
  String _locationPref = 'local'; // 'local' or 'online'
  final _cityController = TextEditingController();

  // Celebration
  bool _showCelebration = false;
  late AnimationController _celebrationController;
  late Animation<double> _celebrationScale;

  static const _goals = [
    ('Lose Weight', Icons.monitor_weight_outlined),
    ('Build Muscle', Icons.fitness_center_outlined),
    ('Improve Mobility', Icons.self_improvement_outlined),
    ('Learn Skills', Icons.school_outlined),
    ('CrossFit', Icons.bolt_outlined),
    ('Yoga & Pilates', Icons.spa_outlined),
    ('Performance', Icons.speed_outlined),
  ];

  static const _experienceLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Elite',
  ];

  int get _totalSteps {
    if (_selectedRole == 'client') return 7; // 0-6
    if (_selectedRole == 'trainer') return 5; // 0-4
    return 3; // 0-2 initial (language, role, details)
  }

  bool get _isNextEnabled {
    switch (_currentStep) {
      case 0:
        return _selectedLanguage.isNotEmpty;
      case 1:
        return _selectedRole.isNotEmpty;
      case 2:
        return _nameController.text.trim().isNotEmpty &&
            _surnameController.text.trim().isNotEmpty;
      case 5:
        return _selectedGoal.isNotEmpty;
      case 6:
        return _locationPref == 'online' ||
            _cityController.text.trim().isNotEmpty;
      default:
        return true;
    }
  }

  @override
  void initState() {
    super.initState();
    _celebrationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _celebrationScale = CurvedAnimation(
      parent: _celebrationController,
      curve: Curves.elasticOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    _cityController.dispose();
    _celebrationController.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_currentStep < _totalSteps - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _submit();
    }
  }

  void _goBack() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _pickAvatar() async {
    final xFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 85,
    );
    if (xFile != null) {
      setState(() => _avatarFile = File(xFile.path));
    }
  }

  void _submit() {
    if (_selectedRole.isEmpty) return;
    final fullName =
        '${_nameController.text.trim()} ${_surnameController.text.trim()}';
    context.read<AuthCubit>().completeOnboarding(
          role: _selectedRole == 'client' ? 'client' : 'trainer',
          name: fullName,
          location: _locationController.text.trim().isEmpty
              ? null
              : _locationController.text.trim(),
          bio: _bioController.text.trim().isEmpty
              ? null
              : _bioController.text.trim(),
          avatarPath: _avatarFile?.path,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, next) =>
          next is AuthAuthenticated || next is AuthError,
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          setState(() => _showCelebration = true);
          _celebrationController.forward();
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              setState(() => _showCelebration = false);
            }
          });
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
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // ── Progress Bar ──
                  _buildProgress(),
                  const SizedBox(height: 8),

                  // ── Pages ──
                  Expanded(child: _buildPages()),

                  // ── Error ──
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthError) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            state.message,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.redAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(height: 8),

                  // ── Bottom Controls ──
                  _buildBottomControls(),
                ],
              ),

              // ── Celebration Overlay ──
              if (_showCelebration) _buildCelebration(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgress() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
      child: Row(
        children: List.generate(_totalSteps, (index) {
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: index <= _currentStep
                    ? AppColors.primary
                    : AppColors.borderMuted,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPages() {
    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: (i) => setState(() => _currentStep = i),
      children: [
        _buildLanguageStep(),
        _buildRoleStep(),
        _buildDetailsStep(),
        if (_selectedRole == 'client') _buildStatsStep() else _buildRadiusStep(),
        _buildAvatarStep(),
        if (_selectedRole == 'client') _buildGoalStep(),
        if (_selectedRole == 'client') _buildLocationStep(),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // Step 0: Language (simplified from iOS)
  // ─────────────────────────────────────────────

  Widget _buildLanguageStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Choose your language',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 32),
          _LanguageOption(
            language: 'English',
            icon: '🇬🇧',
            selected: _selectedLanguage == 'English',
            onTap: () => setState(() => _selectedLanguage = 'English'),
          ),
          const SizedBox(height: 12),
          _LanguageOption(
            language: 'Français',
            icon: '🇫🇷',
            selected: _selectedLanguage == 'Français',
            onTap: () => setState(() => _selectedLanguage = 'Français'),
          ),
          const SizedBox(height: 12),
          _LanguageOption(
            language: 'Deutsch',
            icon: '🇩🇪',
            selected: _selectedLanguage == 'Deutsch',
            onTap: () => setState(() => _selectedLanguage = 'Deutsch'),
          ),
          const SizedBox(height: 12),
          _LanguageOption(
            language: 'Español',
            icon: '🇪🇸',
            selected: _selectedLanguage == 'Español',
            onTap: () => setState(() => _selectedLanguage = 'Español'),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Step 1: Role (matching iOS RoleCard layout)
  // ─────────────────────────────────────────────

  Widget _buildRoleStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'How will you use Ziro Fit?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 32),
          _RoleCard(
            icon: Icons.person_outlined,
            title: 'Personal',
            subtitle: 'I want to train and track my progress.',
            selected: _selectedRole == 'client',
            onTap: () => setState(() => _selectedRole = 'client'),
          ),
          const SizedBox(height: 16),
          _RoleCard(
            icon: Icons.fitness_center_outlined,
            title: 'Professional',
            subtitle: 'I coach clients and manage programs.',
            selected: _selectedRole == 'trainer',
            onTap: () => setState(() => _selectedRole = 'trainer'),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Step 2: Details (iOS parity)
  // ─────────────────────────────────────────────

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
          TextFormField(
            controller: _nameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'First Name',
              prefixIcon: Icon(Icons.person_outlined),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _surnameController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Surname',
              prefixIcon: Icon(Icons.person_outline),
            ),
            onChanged: (_) => setState(() {}),
          ),
          if (_selectedRole == 'trainer') ...[
            const SizedBox(height: 16),
            TextFormField(
              controller: _locationController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Location *',
                prefixIcon: Icon(Icons.location_on_outlined),
              ),
               onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _bioController,
              maxLines: 4,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                labelText: 'Bio (Optional)',
                prefixIcon: Icon(Icons.info_outlined),
                alignLabelWithHint: true,
              ),
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Step 3a: Physical Stats (client, iOS parity)
  // ─────────────────────────────────────────────

  Widget _buildStatsStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Set your baseline',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 32),

          // Height
          _NumericInput(
            title: 'Height',
            value: _height,
            unit: 'cm',
            range: const RangeValues(100, 250),
            onChanged: (v) => setState(() => _height = v),
          ),
          const SizedBox(height: 24),

          // Weight
          _NumericInput(
            title: 'Weight',
            value: _weight,
            unit: 'kg',
            range: const RangeValues(30, 200),
            onChanged: (v) => setState(() => _weight = v),
          ),
          const SizedBox(height: 24),

          // Experience
          const Text(
            'Fitness Experience',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: _experienceLevels.map((level) {
              final selected = _experienceLevel == level;
              return GestureDetector(
                onTap: () => setState(() => _experienceLevel = level),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primary
                        : AppColors.mutedSurface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    level,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: selected ? Colors.white : AppColors.foreground,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Step 3b: Service Radius (trainer, iOS parity)
  // ─────────────────────────────────────────────

  Widget _buildRadiusStep() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'Define your training area',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Set your service radius to help clients find you',
            style: TextStyle(fontSize: 14, color: AppColors.mutedText),
          ),
          const SizedBox(height: 40),
          TextFormField(
            controller: _locationController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Location',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Service Radius',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 18, color: AppColors.mutedText),
              const SizedBox(width: 8),
              Text(
                '${_serviceRadius.round()} km',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          Slider(
            value: _serviceRadius,
            min: 1,
            max: 100,
            divisions: 99,
            activeColor: AppColors.primary,
            label: '${_serviceRadius.round()} km',
            onChanged: (v) => setState(() => _serviceRadius = v),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('1 km',
                  style: TextStyle(fontSize: 12, color: AppColors.mutedText)),
              const Text('100 km',
                  style: TextStyle(fontSize: 12, color: AppColors.mutedText)),
            ],
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Step 4: Avatar (iOS parity with PhotosPicker)
  // ─────────────────────────────────────────────

  Widget _buildAvatarStep() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Add a profile photo',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: _pickAvatar,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.mutedSurface,
              border: Border.all(color: AppColors.borderMuted),
              image: _avatarFile != null
                  ? DecorationImage(
                      image: FileImage(_avatarFile!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: _avatarFile == null
                ? const Icon(
                    Icons.camera_alt_outlined,
                    size: 50,
                    color: AppColors.mutedText,
                  )
                : null,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          _avatarFile == null ? 'Tap to upload' : 'Looking good!',
          style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
        ),
        const SizedBox(height: 8),
        const Text(
          'Optional - you can add this later',
          style: TextStyle(fontSize: 12, color: AppColors.mutedText),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // Step 5: Goal Selection (client, iOS grid)
  // ─────────────────────────────────────────────

  Widget _buildGoalStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            "What's your main goal?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.0,
            ),
            itemCount: _goals.length,
            itemBuilder: (context, index) {
              final (label, icon) = _goals[index];
              final selected = _selectedGoal == label;
              return GestureDetector(
                onTap: () => setState(() => _selectedGoal = label),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: selected
                        ? AppColors.primary
                        : AppColors.mutedSurface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 36,
                        color:
                            selected ? Colors.white : AppColors.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: selected
                              ? Colors.white
                              : AppColors.foreground,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Step 6: Location Preference (client, iOS parity)
  // ─────────────────────────────────────────────

  Widget _buildLocationStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 24),
          const Text(
            'How do you want to train?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _PrefToggle(
                  icon: Icons.wifi,
                  label: 'Online',
                  selected: _locationPref == 'online',
                  onTap: () => setState(() => _locationPref = 'online'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _PrefToggle(
                  icon: Icons.location_on_outlined,
                  label: 'In-Person',
                  selected: _locationPref == 'local',
                  onTap: () => setState(() => _locationPref = 'local'),
                ),
              ),
            ],
          ),
          if (_locationPref == 'local') ...[
            const SizedBox(height: 24),
            TextFormField(
              controller: _cityController,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: 'Enter your city',
                prefixIcon: Icon(Icons.search_outlined),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // Bottom Controls
  // ─────────────────────────────────────────────

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Row(
        children: [
          if (_currentStep > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: _goBack,
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.foreground,
                  side: const BorderSide(color: AppColors.borderActive),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Back'),
              ),
            ),
          if (_currentStep > 0) const SizedBox(width: 12),
          Expanded(
            flex: _currentStep > 0 ? 1 : 2,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                final loading = state is AuthLoading;
                final isLastStep = _currentStep == _totalSteps - 1;

                // Show "Skip" for optional steps
                final showSkip = (_currentStep == 4 && _avatarFile == null) ||
                    (_currentStep == 5 && _selectedGoal.isEmpty) ||
                    (_currentStep == 6 && _cityController.text.trim().isEmpty);

                return ElevatedButton(
                  onPressed:
                      (loading || !_isNextEnabled) && !showSkip ? null : _goNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: loading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          showSkip && !isLastStep
                              ? 'Skip'
                              : isLastStep
                                  ? 'Finish'
                                  : 'Next',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
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

  // ─────────────────────────────────────────────
  // Celebration Overlay (iOS parity)
  // ─────────────────────────────────────────────

  Widget _buildCelebration() {
    return AnimatedBuilder(
      animation: _celebrationScale,
      builder: (context, child) {
        return Container(
          color: Colors.black45,
          child: Center(
            child: Transform.scale(
              scale: _celebrationScale.value,
              child: Container(
                margin: const EdgeInsets.all(40),
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      size: 80,
                      color: Colors.green,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Welcome to Ziro Fit!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Your profile is ready.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────
// Sub-widgets
// ─────────────────────────────────────────────

class _LanguageOption extends StatelessWidget {
  final String language;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.language,
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
              ? AppColors.primary.withValues(alpha: 0.1)
              : AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.borderMuted,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Text(icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 16),
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.primary : AppColors.foreground,
              ),
            ),
            const Spacer(),
            if (selected)
              const Icon(Icons.check_circle,
                  color: AppColors.primary, size: 22),
          ],
        ),
      ),
    );
  }
}

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
          color:
              selected ? AppColors.primary : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? Colors.transparent : AppColors.borderMuted,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Icon(icon,
                size: 40,
                color: selected ? Colors.white : AppColors.primary),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selected ? Colors.white : AppColors.foreground,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: selected
                    ? Colors.white.withValues(alpha: 0.9)
                    : AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _NumericInput extends StatelessWidget {
  final String title;
  final double value;
  final String unit;
  final RangeValues range;
  final ValueChanged<double> onChanged;

  const _NumericInput({
    required this.title,
    required this.value,
    required this.unit,
    required this.range,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              iconSize: 32,
              color: value > range.start
                  ? AppColors.primary
                  : AppColors.borderMuted,
              onPressed: value > range.start
                  ? () => onChanged(value - 1)
                  : null,
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.mutedSurface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${value.round()} $unit',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              iconSize: 32,
              color: value < range.end
                  ? AppColors.primary
                  : AppColors.borderMuted,
              onPressed: value < range.end
                  ? () => onChanged(value + 1)
                  : null,
            ),
          ],
        ),
      ],
    );
  }
}

class _PrefToggle extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PrefToggle({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.mutedSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 36,
              color: selected ? Colors.white : AppColors.primary,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: selected ? Colors.white : AppColors.foreground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
