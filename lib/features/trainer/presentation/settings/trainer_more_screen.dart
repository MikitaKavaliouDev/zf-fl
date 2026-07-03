import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/cubit/auth_cubit.dart';
import '../../../auth/cubit/auth_state.dart';

/// Trainer More/Settings screen — 5th tab in the trainer shell.
class TrainerMoreScreen extends StatelessWidget {
  const TrainerMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('More')),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          final user = state is AuthAuthenticated ? state.user : null;
          return ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              // Profile header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                      child: Text(
                        user != null && (user.name ?? user.email).isNotEmpty
                            ? (user.name ?? user.email)[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.name ?? 'Trainer',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          if (user?.email != null)
                            Text(user!.email,
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.mutedText)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderMuted),
              // Settings items
              _SettingsItem(
                icon: Icons.notifications_outlined,
                label: 'Notification Settings',
                onTap: () => context.push('/trainer/more/notifications'),
              ),
              _SettingsItem(
                icon: Icons.lock_outline_rounded,
                label: 'Data & Privacy',
                onTap: () => context.push('/trainer/more/privacy'),
              ),
              _SettingsItem(
                icon: Icons.support_outlined,
                label: 'Contact Support',
                onTap: () => context.push('/contact-support'),
              ),
              // Switch to client view
              _SettingsItem(
                icon: Icons.person_outline_rounded,
                label: 'Switch to Client View',
                onTap: () => context.read<AuthCubit>().switchMode(),
              ),
              const Divider(
                  height: 16,
                  thickness: 6,
                  color: AppColors.mutedSurface),
              // Sign out
              _SettingsItem(
                icon: Icons.logout_rounded,
                label: 'Sign Out',
                textColor: Colors.redAccent,
                onTap: () {
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
                              fontSize: 14,
                              color: AppColors.mutedText)),
                      actions: [
                        TextButton(
                          onPressed: () =>
                              Navigator.of(ctx).pop(),
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          onPressed: () async {
                            await ctx
                                .read<AuthCubit>()
                                .logout();
                            if (ctx.mounted) {
                              Navigator.of(ctx).pop();
                            }
                            // Force navigation to login regardless of
                            // GoRouter refresh timing.
                            if (context.mounted) {
                              context.go('/login');
                            }
                          },
                          child: const Text('Sign Out'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? textColor;

  const _SettingsItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, size: 22, color: AppColors.foreground),
      title: Text(label,
          style: TextStyle(
              fontSize: 14,
              color: textColor ?? AppColors.foreground)),
      trailing: const Icon(Icons.chevron_right_rounded,
          size: 18, color: AppColors.mutedText),
    );
  }
}
