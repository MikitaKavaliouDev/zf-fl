import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/cubit/auth_cubit.dart';
import '../../../auth/cubit/auth_state.dart';

/// Trainer More/Settings screen — 5th tab in the trainer shell.
///
/// Layout matches iOS MoreView.swift:
///   1. Profile header (avatar, name, email, PRO badge, QR code)
///   2. Preferences — 11 menu rows
///   3. Experimental — 4 toggle rows
///   4. Business — trainer-specific rows
///   5. Legal — Terms & Privacy links
///   6. Sign Out — red button with confirmation
///   7. Brand footer — version, copyright
class TrainerMoreScreen extends StatefulWidget {
  const TrainerMoreScreen({super.key});

  @override
  State<TrainerMoreScreen> createState() => _TrainerMoreScreenState();
}

class _TrainerMoreScreenState extends State<TrainerMoreScreen> {
  // Experimental toggles
  bool _customAppMode = false;
  bool _dailyTargets = false;
  bool _voiceFeedback = false;
  bool _personalRoutines = false;

  @override
  void initState() {
    super.initState();
    _loadToggleStates();
  }

  Future<void> _loadToggleStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _customAppMode = prefs.getBool('isCustomModeEnabled') ?? false;
      _dailyTargets = prefs.getBool('isDailyTargetsEnabled') ?? false;
      _voiceFeedback = prefs.getBool('isVoiceFeedbackEnabled') ?? false;
      _personalRoutines = prefs.getBool('isRoutinesEnabled') ?? false;
    });
  }

  Future<void> _setToggle(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const ValueKey('trainerMoreScreen'),
      backgroundColor: AppColors.background,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state is AuthAuthenticated ? state.user : null;
          return ListView(
            padding: const EdgeInsets.only(top: 16, bottom: 80),
            children: [
              // ── Profile Header ──
              _ProfileHeader(user: user),
              const SizedBox(height: 16),

              // ── Preferences ──
              const _SectionHeader(title: 'Preferences'),
              const SizedBox(height: 8),
              _SettingsGroup(children: [
                _MenuRow(
                  icon: Icons.palette_outlined,
                  color: const Color(0xFFFF2D55),
                  label: 'Appearance',
                  onTap: () => context.push('/trainer/more/appearance'),
                ),
                _MenuRow(
                  icon: Icons.mic_outlined,
                  color: const Color(0xFF5856D6),
                  label: 'AI Coach Settings',
                  onTap: () => context.push('/trainer/more/ai-coach'),
                ),
                _MenuRow(
                  icon: Icons.language_outlined,
                  color: AppColors.primary,
                  label: 'Language',
                  onTap: () => context.push('/trainer/more/language'),
                ),
                _MenuRow(
                  icon: Icons.notifications_outlined,
                  color: const Color(0xFFFF9500),
                  label: 'Notifications',
                  onTap: () => context.push('/trainer/more/notifications'),
                ),
                _MenuRow(
                  icon: Icons.lock_outline_rounded,
                  color: const Color(0xFF34C759),
                  label: 'Permissions',
                  onTap: () =>
                      _showComingSoon(context, 'Permissions Settings'),
                ),
                _MenuRow(
                  icon: Icons.shield_outlined,
                  color: const Color(0xFFAF52DE),
                  label: 'Data & Privacy',
                  onTap: () => context.push('/trainer/more/privacy'),
                ),
                _MenuRow(
                  icon: Icons.inventory_2_outlined,
                  color: const Color(0xFF34C759),
                  label: 'My Packages',
                  onTap: () => context.push('/trainer/more/packages'),
                ),
                _MenuRow(
                  icon: Icons.receipt_long_outlined,
                  color: const Color(0xFFFF9500),
                  label: 'Purchase History',
                  onTap: () => context.push('/trainer/more/purchase-history'),
                ),
                _MenuRow(
                  icon: Icons.privacy_tip_outlined,
                  color: AppColors.primary,
                  label: 'Privacy & Security',
                  onTap: () =>
                      _showComingSoon(context, 'Privacy & Security'),
                ),
                _MenuRow(
                  icon: Icons.dashboard_outlined,
                  color: const Color(0xFFFF9500),
                  label: 'Dashboard Prompts',
                  onTap: () =>
                      context.push('/trainer/more/dashboard-prompts'),
                ),
                _ToggleRow(
                  icon: Icons.swap_horiz_rounded,
                  color: AppColors.primary,
                  label: 'Custom App Mode',
                  subtitle: 'Enable manual Personal/Professional switching',
                  value: _customAppMode,
                  onChanged: (v) {
                    _setToggle('isCustomModeEnabled', v);
                    setState(() => _customAppMode = v);
                  },
                  isLast: true,
                ),
              ]),
              const SizedBox(height: 24),

              // ── Experimental Features ──
              const _SectionHeader(title: 'Experimental Features'),
              const SizedBox(height: 8),
              _SettingsGroup(children: [
                _ToggleRow(
                  icon: Icons.track_changes_rounded,
                  color: Colors.redAccent,
                  label: 'Daily Exercise Targets',
                  subtitle:
                      'Set and track daily rep goals (Experimental)',
                  value: _dailyTargets,
                  onChanged: (v) {
                    _setToggle('isDailyTargetsEnabled', v);
                    setState(() => _dailyTargets = v);
                  },
                ),
                _ToggleRow(
                  icon: Icons.volume_up_outlined,
                  color: AppColors.primary,
                  label: 'Voice Feedback (Beta)',
                  subtitle:
                      'Audio confirmation for voice logs',
                  value: _voiceFeedback,
                  onChanged: (v) {
                    _setToggle('isVoiceFeedbackEnabled', v);
                    setState(() => _voiceFeedback = v);
                  },
                ),
                _ToggleRow(
                  icon: Icons.calendar_month_outlined,
                  color: const Color(0xFFAF52DE),
                  label: 'Personal Routines',
                  subtitle:
                      'Build and schedule multi-session routines',
                  value: _personalRoutines,
                  onChanged: (v) {
                    _setToggle('isRoutinesEnabled', v);
                    setState(() => _personalRoutines = v);
                  },
                  isLast: true,
                ),
              ]),
              const SizedBox(height: 24),

              // ── Business ──
              const _SectionHeader(title: 'Business'),
              const SizedBox(height: 8),
              _SettingsGroup(children: [
                _MenuRow(
                  icon: Icons.qr_code_rounded,
                  color: const Color(0xFFAF52DE),
                  label: 'Digital Business Card',
                  subtitle: 'Let clients scan to see your profile',
                  onTap: () =>
                      _showComingSoon(context, 'Digital Business Card'),
                ),
                _MenuRow(
                  icon: Icons.store_outlined,
                  color: const Color(0xFF34C759),
                  label: 'Storefront Settings',
                  onTap: () =>
                      _showComingSoon(context, 'Storefront Settings'),
                ),
                _MenuRow(
                  icon: Icons.credit_card_outlined,
                  color: AppColors.primary,
                  label: 'Subscription & Billing',
                  onTap: () =>
                      _showComingSoon(context, 'Subscription & Billing'),
                ),
                _MenuRow(
                  icon: Icons.account_balance_wallet_outlined,
                  color: const Color(0xFF34C759),
                  label: 'Payouts',
                  onTap: () => _showComingSoon(context, 'Payouts'),
                ),
                _MenuRow(
                  icon: Icons.fitness_center_outlined,
                  color: AppColors.primary,
                  label: 'Custom Exercises',
                  onTap: () =>
                      context.push('/trainer/more/custom-exercises'),
                ),
                _MenuRow(
                  icon: Icons.assessment_outlined,
                  color: const Color(0xFF00BCD4),
                  label: 'Assessments',
                  onTap: () =>
                      _showComingSoon(context, 'Assessments'),
                ),
                _MenuRow(
                  icon: Icons.support_outlined,
                  color: AppColors.primary,
                  label: 'Contact Support & Feedback',
                  onTap: () => context.push('/contact-support'),
                ),
                _MenuRow(
                  icon: Icons.new_releases_outlined,
                  color: const Color(0xFFFF9500),
                  label: "What's New",
                  onTap: () =>
                      _showComingSoon(context, "What's New"),
                ),
                _MenuRow(
                  icon: Icons.auto_stories_outlined,
                  color: AppColors.primary,
                  label: 'Getting Started Guide',
                  onTap: () =>
                      _showComingSoon(context, 'Getting Started Guide'),
                  isLast: true,
                ),
              ]),
              const SizedBox(height: 24),

              // ── Legal ──
              const _SectionHeader(title: 'Legal'),
              const SizedBox(height: 8),
              _SettingsGroup(children: [
                _MenuRow(
                  icon: Icons.description_outlined,
                  color: AppColors.mutedText,
                  label: 'Terms of Service',
                  trailing: const _ExternalLinkIndicator(),
                  onTap: () => _launchUrl('https://ziro.fit/terms'),
                ),
                _MenuRow(
                  icon: Icons.shield_outlined,
                  color: AppColors.mutedText,
                  label: 'Privacy Policy',
                  trailing: const _ExternalLinkIndicator(),
                  onTap: () =>
                      _launchUrl('https://ziro.fit/privacy-policy'),
                  isLast: true,
                ),
              ]),
              const SizedBox(height: 24),

              // ── Sign Out ──
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () => _showSignOutDialog(context),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: AppColors.borderMuted),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.redAccent
                                .withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.logout_rounded,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // ── Brand Footer ──
              _BrandFooter(),
            ],
          );
        },
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature — coming soon'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        title: const Text('Sign Out',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600)),
        content: const Text(
            'Are you sure you want to sign out?',
            style: TextStyle(
                fontSize: 14, color: AppColors.mutedText)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              await ctx.read<AuthCubit>().logout();
              if (ctx.mounted) Navigator.of(ctx).pop();
              if (context.mounted) context.go('/login');
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Components
// ──────────────────────────────────────────────

/// Profile header: avatar + name + email + PRO badge + QR button.
class _ProfileHeader extends StatelessWidget {
  final dynamic user;

  const _ProfileHeader({required this.user});

  @override
  Widget build(BuildContext context) {
    final name = user?.name ?? 'Trainer';
    final email = user?.email ?? '';
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFAF52DE),
                  AppColors.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                initial,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Name + Email + Badge
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
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.foreground,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF9500)
                            .withValues(alpha: 0.15),
                        borderRadius:
                            BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF9500),
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // QR code button
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:
                      Text('Digital Business Card — coming soon'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary
                    .withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code_rounded,
                size: 20,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Section header label.
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.foreground,
        ),
      ),
    );
  }
}

/// Card-style group wrapping a list of menu/toggle rows.
class _SettingsGroup extends StatelessWidget {
  final List<Widget> children;
  const _SettingsGroup({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children
            .asMap()
            .entries
            .map((entry) {
              final index = entry.key;
              final child = entry.value;
              final isLast = index == children.length - 1;
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                  if (!isLast)
                    const Divider(
                      height: 1,
                      thickness: 1,
                      indent: 56,
                      color: AppColors.borderMuted,
                    ),
                ],
              );
            })
            .toList(),
      ),
    );
  }
}

/// A menu row with icon, label, optional subtitle, and chevron.
/// Matching iOS MenuRow component.
class _MenuRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool isLast;

  const _MenuRow({
    required this.icon,
    required this.color,
    required this.label,
    this.subtitle,
    required this.onTap,
    this.trailing,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Icon circle
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 16, color: color),
            ),
            const SizedBox(width: 12),
            // Label + subtitle
            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.foreground,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 2),
                      child: Text(
                        subtitle!,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.mutedText,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            // Trailing widget or chevron
            trailing ??
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 18,
                  color: AppColors.mutedText,
                ),
          ],
        ),
      ),
    );
  }
}

/// Toggle row with icon, label, subtitle, and switch.
/// Matching iOS ToggleRow component.
class _ToggleRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isLast;

  const _ToggleRow({
    required this.icon,
    required this.color,
    required this.label,
    this.subtitle,
    required this.value,
    required this.onChanged,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Icon circle
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 12),
          // Label + subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.foreground,
                  ),
                ),
                if (subtitle != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      subtitle!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.mutedText,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}

/// Small external-link indicator (arrow-up-right icon).
class _ExternalLinkIndicator extends StatelessWidget {
  const _ExternalLinkIndicator();

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.open_in_new_rounded,
      size: 14,
      color: AppColors.mutedText,
    );
  }
}

/// Brand footer: version, copyright, acknowledgements.
class _BrandFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          // App name
          const Text(
            'ZIRO.FIT',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 8),
          // Version
          Text(
            'Version 1.0.0',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.mutedText.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Ziro Fit for Flutter',
            style: TextStyle(
              fontSize: 11,
              color: AppColors.mutedText.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 16),
          // Links row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _FooterLink(
                label: 'Acknowledgements',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Acknowledgements — coming soon'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
              ),
              const Text(
                ' • ',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.mutedText,
                ),
              ),
              _FooterLink(
                label: 'Terms',
                onTap: () async {
                  final uri =
                      Uri.parse('https://ziro.fit/terms');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri,
                        mode:
                            LaunchMode.externalApplication);
                  }
                },
              ),
              const Text(
                ' • ',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.mutedText,
                ),
              ),
              _FooterLink(
                label: 'Privacy',
                onTap: () async {
                  final uri = Uri.parse(
                      'https://ziro.fit/privacy-policy');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri,
                        mode:
                            LaunchMode.externalApplication);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Copyright
          Text(
            '© 2026 Ziro Fit. All rights reserved.',
            style: TextStyle(
              fontSize: 9,
              color: AppColors.mutedText.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

/// Footer text link.
class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _FooterLink({
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          color: AppColors.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
