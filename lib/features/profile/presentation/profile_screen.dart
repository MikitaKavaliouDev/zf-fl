import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/error_widget.dart';

import '../../../core/di/injection.dart';
import '../../../core/models/app_mode.dart';
import '../../../core/theme/app_theme.dart';
import '../../auth/data/models/user.dart';
import '../../check_in/presentation/check_in_history_screen.dart';
import '../../daily_targets/presentation/daily_targets_screen.dart';
import '../../fitness_goals/presentation/fitness_goals_screen.dart';
import '../../onboarding/presentation/educational_onboarding_screen.dart';
import '../../sharing/presentation/sharing_screen.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../../auth/cubit/auth_state.dart';
import '../cubit/more_cubit.dart';
import '../cubit/more_state.dart';
import 'settings_screens/ai_coach_settings_screen.dart';
import 'settings_screens/appearance_settings_screen.dart';
import 'settings_screens/contact_support_screen.dart';
import 'settings_screens/custom_exercises_screen.dart';
import 'settings_screens/dashboard_prompts_screen.dart';
import 'settings_screens/data_privacy_screen.dart';
import 'settings_screens/language_settings_screen.dart';
import 'settings_screens/my_packages_screen.dart';
import 'settings_screens/notification_settings_screen.dart';
import 'settings_screens/purchase_history_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MoreCubit>()..loadUserData(),
      child: const _MoreScreenBody(),
    );
  }
}

class _MoreScreenBody extends StatefulWidget {
  const _MoreScreenBody();

  @override
  State<_MoreScreenBody> createState() => _MoreScreenBodyState();
}

class _MoreScreenBodyState extends State<_MoreScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('profileScreen'),
      appBar: AppBar(
        title: const Text('More'),
        centerTitle: true,
      ),
      body: BlocBuilder<MoreCubit, MoreState>(
        builder: (context, state) {
          return switch (state) {
            MoreInitial() || MoreLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            MoreError(message: final msg) => _buildError(context, msg),
            MoreLoaded(user: final user, privacy: final _) =>
              _buildContent(context, user),
          };
        },
      ),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return ZiroErrorWidget(
      message: message,
      onRetry: () => context.read<MoreCubit>().refresh(),
    );
  }

  Widget _buildContent(BuildContext context, User? user) {
    return RefreshIndicator(
      onRefresh: () => context.read<MoreCubit>().refresh(),
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // ── 1. Profile Section ──
          _buildProfileSection(context, user),
          const SizedBox(height: 24),

          // ── 2. Preferences Section ──
          _buildSectionHeader('Preferences'),
          const SizedBox(height: 8),
          _buildPreferencesSection(context),
          const SizedBox(height: 24),

          // ── 3. Resources Section ──
          _buildSectionHeader('Resources'),
          const SizedBox(height: 8),
          _buildResourcesSection(context),
          const SizedBox(height: 24),

          // ── 3b. Experimental Features Section ──
          _buildSectionHeader('Experimental Features'),
          const SizedBox(height: 8),
          _buildExperimentalFeaturesSection(context),
          const SizedBox(height: 24),

          // ── 4. Legal Section ──
          _buildSectionHeader('Legal'),
          const SizedBox(height: 8),
          _buildLegalSection(context),
          const SizedBox(height: 24),

          // ── 5. Mode Switch ──
          _buildModeSwitchSection(context),
          const SizedBox(height: 24),

          // ── 6. Sign Out ──
          _buildSignOutSection(context),
          const SizedBox(height: 40),

          // ── 7. Brand Footer ──
          _buildBrandFooter(),

          const SizedBox(height: 60),
        ],
      ),
    );
  }

  // ── Profile Section ──

  Widget _buildProfileSection(BuildContext context, User? user) {
    final name = user?.name ?? 'User';
    final email = user?.email ?? '';
    final initials = _getInitials(name);
    final photoPath = user?.profilePhotoPath;
    final hasPhoto = photoPath != null && photoPath.isNotEmpty;
    final photoUrl = hasPhoto ? photoPath : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => context.push('/profile/config'),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Row(
            children: [
              // Avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: hasPhoto
                      ? null
                      : const LinearGradient(
                          colors: [Colors.purple, AppColors.primary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                ),
                child: hasPhoto
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(
                          imageUrl: photoUrl!,
                          fit: BoxFit.cover,
                          errorWidget: (_, _, _) => _buildInitialsCircle(initials),
                        ),
                      )
                    : _buildInitialsCircle(initials),
              ),
              const SizedBox(width: 16),
              // Name + badge + email
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.foreground,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'PERSONAL',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.mutedText,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right_rounded,
                size: 22,
                color: AppColors.mutedText,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInitialsCircle(String initials) {
    return Center(
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  String _getInitials(String name) {
    if (name.isEmpty) return 'U';
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }

  // ── Section Header ──

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.mutedText,
        ),
      ),
    );
  }

  // ── Grouped Menu Container ──

  Widget _buildMenuGroup(List<Widget> items) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(children: items),
    );
  }

  // ── Preferences Section ──

  Widget _buildPreferencesSection(BuildContext context) {
    return _buildMenuGroup([
      _MenuRow(
        icon: Icons.palette_outlined,
        iconColor: Colors.pink,
        title: 'Appearance',
        onTap: () => _push(context, const AppearanceSettingsScreen()),
      ),
      _MenuRow(
        icon: Icons.notifications_outlined,
        iconColor: Colors.orange,
        title: 'Notifications',
        onTap: () => _push(context, const NotificationSettingsScreen()),
      ),
      _MenuRow(
        icon: Icons.shield_outlined,
        iconColor: Colors.purple,
        title: 'Data & Privacy',
        onTap: () => _push(context, const DataPrivacyScreen()),
      ),
      _MenuRow(
        icon: Icons.inventory_2_outlined,
        iconColor: Colors.green,
        title: 'My Packages',
        onTap: () => _push(context, const MyPackagesScreen()),
      ),
      _MenuRow(
        icon: Icons.receipt_long_outlined,
        iconColor: Colors.orange,
        title: 'Purchase History',
        onTap: () => _push(context, const PurchaseHistoryScreen()),
      ),
      _MenuRow(
        icon: Icons.security_outlined,
        iconColor: AppColors.primary,
        title: 'Privacy & Security',
        onTap: () {
          // Navigate to system privacy settings or in-app security screen
        },
      ),
      _MenuRow(
        icon: Icons.dashboard_outlined,
        iconColor: Colors.orange,
        title: 'Dashboard Prompts',
        onTap: () => _push(context, const DashboardPromptsScreen()),
      ),
      _MenuRow(
        icon: Icons.share_outlined,
        iconColor: Colors.teal,
        title: 'Sharing',
        onTap: () => _push(context, const SharingScreen()),
      ),
      _MenuRow(
        icon: Icons.checklist_rounded,
        iconColor: Colors.green,
        title: 'Check-In History',
        onTap: () => _push(context, const CheckInHistoryScreen()),
        isLast: true,
      ),
    ]);
  }

  // ── Resources Section ──

  Widget _buildResourcesSection(BuildContext context) {
    return _buildMenuGroup([
      _MenuRow(
        icon: Icons.fitness_center_outlined,
        iconColor: AppColors.primary,
        title: 'Custom Exercises',
        onTap: () => _push(context, const CustomExercisesScreen()),
      ),
      _MenuRow(
        icon: Icons.track_changes_rounded,
        iconColor: Colors.green,
        title: 'Fitness Goals',
        onTap: () => _push(context, const FitnessGoalsScreen()),
      ),
      _MenuRow(
        icon: Icons.checklist_rounded,
        iconColor: Colors.teal,
        title: 'Daily Targets',
        onTap: () => _push(context, const DailyTargetsScreen()),
      ),
      _MenuRow(
        icon: Icons.auto_awesome_rounded,
        iconColor: Colors.purple,
        title: 'AI Coach Settings',
        onTap: () => _push(context, const AiCoachSettingsScreen()),
      ),
      _MenuRow(
        icon: Icons.language_rounded,
        iconColor: AppColors.primary,
        title: 'Language',
        onTap: () => _push(context, const LanguageSettingsScreen()),
      ),
      _MenuRow(
        icon: Icons.mail_outline,
        iconColor: AppColors.primary,
        title: 'Contact Support & Feedback',
        onTap: () => _push(context, const ContactSupportScreen()),
      ),
      _MenuRow(
        icon: Icons.auto_awesome_outlined,
        iconColor: Colors.orange,
        title: "What's New",
        onTap: () => _showWhatsNew(context),
      ),
      _MenuRow(
        icon: Icons.rocket_launch_outlined,
        iconColor: AppColors.primary,
        title: 'Getting Started Guide',
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => const EducationalOnboardingScreen(),
            ),
          );
        },
        isLast: true,
      ),
    ]);
  }

  // ── Experimental Features Section ──

  Widget _buildExperimentalFeaturesSection(BuildContext context) {
    return _ExperimentalFeaturesSection();
  }

  // ── Legal Section ──

  Widget _buildLegalSection(BuildContext context) {
    return _buildMenuGroup([
      _MenuRow(
        icon: Icons.description_outlined,
        iconColor: AppColors.mutedText,
        title: 'Terms of Service',
        onTap: () => _launchUrl('https://ziro.fit/terms'),
      ),
      _MenuRow(
        icon: Icons.lock_outline,
        iconColor: AppColors.mutedText,
        title: 'Privacy Policy',
        onTap: () => _launchUrl('https://ziro.fit/privacy-policy'),
        isLast: true,
      ),
    ]);
  }

  // ── Mode Switch Section ──

  Widget _buildModeSwitchSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () {
          final auth = context.read<AuthCubit>();
          final state = auth.state;
          final user = state is AuthAuthenticated ? state.user : null;
          final isTrainerRole = user?.role == 'trainer';

          if (isTrainerRole) {
            // Already a trainer — just switch views
            auth.switchMode();
          } else {
            // Client trying to access trainer mode — prompt for login
            _confirmTrainerSwitch(context, auth);
          }
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.swap_horiz_rounded,
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Switch to Trainer View',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Sign Out Section ──

  Widget _buildSignOutSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: () => _confirmSignOut(context),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.logout_rounded,
                  size: 18,
                  color: Colors.red,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Sign Out',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmTrainerSwitch(BuildContext context, AuthCubit auth) {
    final emailCtrl = TextEditingController();
    final passwordCtrl = TextEditingController();
    final isLoading = ValueNotifier(false);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.swap_horiz_rounded,
                size: 22, color: AppColors.primary),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('Switch to Trainer',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Sign in with your trainer account to switch modes. '
                'Your current session will be preserved.',
                style: TextStyle(fontSize: 14, color: AppColors.mutedText),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'trainer@example.com',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (_, loading, __) => TextButton(
              onPressed: loading ? null : () => Navigator.of(ctx).pop(),
              child: const Text('Cancel'),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: isLoading,
            builder: (_, loading, __) => FilledButton(
              onPressed: loading
                  ? null
                  : () async {
                      final email = emailCtrl.text.trim();
                      final password = passwordCtrl.text.trim();
                      if (email.isEmpty || password.isEmpty) return;
                      isLoading.value = true;
                      final ok = await auth.loginAs(
                        email: email,
                        password: password,
                        targetMode: AppMode.trainer,
                      );
                      isLoading.value = false;
                      if (ctx.mounted) Navigator.of(ctx).pop();
                      if (!ok && ctx.mounted) {
                        ScaffoldMessenger.of(ctx).showSnackBar(
                          const SnackBar(
                              content: Text('Invalid credentials. Please try again.')),
                        );
                      }
                    },
              child: loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              context.read<MoreCubit>().signOut();
            },
            child: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  // ── Brand Footer ──

  Widget _buildBrandFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Logo
          Icon(
            Icons.fitness_center_rounded,
            size: 40,
            color: AppColors.primary.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 12),
          const Text(
            'ZIRO.FIT',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Version 1.0.0 (1)',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'ZIRO.FIT for iOS',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => _launchUrl('https://ziro.fit/terms'),
                child: const Text(
                  'Terms',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '•',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
              InkWell(
                onTap: () => _launchUrl('https://ziro.fit/privacy-policy'),
                child: const Text(
                  'Privacy',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '© 2026 Ziro Fit. All rights reserved.',
            style: TextStyle(
              fontSize: 10,
              color: AppColors.mutedText.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helpers ──

  void _push(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showWhatsNew(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("What's New"),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mutedText,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Welcome to ZIRO.FIT! This initial release includes:\n\n'
                '• Personalized workout tracking\n'
                '• Connect with professional trainers\n'
                '• Smart check-in system\n'
                '• Progress analytics\n'
                '• Custom routine builder\n'
                '• Seamless sync across devices',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.foreground,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }
}

// ── Experimental Features Toggle Section ──

class _ExperimentalFeaturesSection extends StatefulWidget {
  @override
  State<_ExperimentalFeaturesSection> createState() =>
      _ExperimentalFeaturesSectionState();
}

class _ExperimentalFeaturesSectionState
    extends State<_ExperimentalFeaturesSection> {
  bool _dailyExerciseTargets = false;
  bool _voiceFeedbackBeta = false;
  bool _personalRoutines = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(children: [
        _buildToggleRow(
          icon: Icons.checklist_rounded,
          iconColor: Colors.green,
          title: 'Daily Exercise Targets',
          subtitle: 'Set daily exercise goals',
          value: _dailyExerciseTargets,
          onChanged: (v) => setState(() => _dailyExerciseTargets = v),
        ),
        _buildToggleRow(
          icon: Icons.record_voice_over_rounded,
          iconColor: AppColors.primary,
          title: 'Voice Feedback (Beta)',
          subtitle: 'Audio cues during workouts',
          value: _voiceFeedbackBeta,
          onChanged: (v) => setState(() => _voiceFeedbackBeta = v),
        ),
        _buildToggleRow(
          icon: Icons.repeat_rounded,
          iconColor: Colors.orange,
          title: 'Personal Routines',
          subtitle: 'Create and manage custom routines',
          value: _personalRoutines,
          onChanged: (v) => setState(() => _personalRoutines = v),
          isLast: true,
        ),
      ]),
    );
  }

  Widget _buildToggleRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 18, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.foreground,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeTrackColor: AppColors.primary,
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 60),
      ],
    );
  }
}

// ── Menu Row Widget ──

class _MenuRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback onTap;
  final bool isLast;

  const _MenuRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, size: 18, color: iconColor),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: AppColors.mutedText,
                ),
              ],
            ),
          ),
          if (!isLast)
            const Divider(height: 1, indent: 60),
        ],
      ),
    );
  }
}
