import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/storefront_cubit.dart';
import '../../cubit/storefront_state.dart';
import '../../data/models/storefront_profile_dto.dart';
import '../../data/models/stripe_status_dto.dart';
import 'widgets/package_preview_card.dart';
import 'widgets/service_preview_row.dart';

/// Storefront Settings screen — Phase 2a: Read-only profile preview.
///
/// Matches iOS StorefrontSettingsView.swift (first section):
///   - Profile hero header (name, avatar, specialties, stats)
///   - Packages carousel
///   - Services list
///   - Stripe Connect status indicator
class StorefrontSettingsScreen extends StatefulWidget {
  const StorefrontSettingsScreen({super.key});

  @override
  State<StorefrontSettingsScreen> createState() => _StorefrontSettingsScreenState();
}

class _StorefrontSettingsScreenState extends State<StorefrontSettingsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StorefrontCubit>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Storefront Settings'),
        centerTitle: true,
      ),
      body: BlocBuilder<StorefrontCubit, StorefrontState>(
        builder: (context, state) {
          return switch (state) {
            StorefrontInitial() => const SizedBox.shrink(),
            StorefrontLoading() => const Center(child: CircularProgressIndicator()),
            StorefrontLoaded(:final profile, :final stripeStatus) =>
              _buildLoaded(profile, stripeStatus),
            StorefrontError(:final message) => _buildError(message),
          };
        },
      ),
    );
  }

  Widget _buildLoaded(StorefrontProfileDto profile, StripeStatusDto? stripe) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Profile header
        _ProfileHeader(profile: profile),
        const SizedBox(height: 24),

        // Stats row
        Row(
          children: [
            _StatBadge(
              icon: Icons.fitness_center_rounded,
              label: '${profile.packages.length} Packages',
            ),
            const SizedBox(width: 12),
            _StatBadge(
              icon: Icons.people_rounded,
              label: '${profile.tags.length} Tags',
            ),
            const SizedBox(width: 12),
            _StatBadge(
              icon: Icons.star_rounded,
              label: '${profile.testimonials.length} Reviews',
            ),
          ],
        ),
        const SizedBox(height: 24),

        // About / Bio
        if (profile.bio != null && profile.bio!.isNotEmpty) ...[
          _SectionTitle(title: 'About'),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: Text(
              profile.bio!,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.foreground,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],

        // Packages
        if (profile.packages.isNotEmpty) ...[
          _SectionTitle(title: 'Packages'),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: profile.packages.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return PackagePreviewCard(
                  package: profile.packages[index],
                  onTap: () {},
                );
              },
            ),
          ),
          const SizedBox(height: 24),
        ],

        // Services
        if (profile.services.isNotEmpty) ...[
          _SectionTitle(title: 'Services'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: Column(
              children: profile.services
                  .map((s) => ServicePreviewRow(service: s))
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
        ],

        // Social links
        if (profile.socialLinks.isNotEmpty) ...[
          _SectionTitle(title: 'Social Links'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: Column(
              children: profile.socialLinks.map((link) {
                return ListTile(
                  leading: Icon(
                    Icons.link_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    link.platform,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                  ),
                  subtitle: Text(
                    link.url,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.mutedText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(
                    Icons.open_in_new_rounded,
                    size: 14,
                    color: AppColors.mutedText,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: Border(
                    bottom: BorderSide(
                      color: AppColors.borderMuted,
                      width: 1,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
        ],

        // Stripe status
        if (stripe != null) ...[
          _SectionTitle(title: 'Payments'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.borderMuted),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: stripe.chargesEnabled
                        ? Colors.green.withValues(alpha: 0.1)
                        : AppColors.mutedText.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    stripe.chargesEnabled
                        ? Icons.check_circle_rounded
                        : Icons.credit_card_rounded,
                    size: 20,
                    color: stripe.chargesEnabled
                        ? Colors.green
                        : AppColors.mutedText,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Stripe Connect',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.foreground,
                        ),
                      ),
                      Text(
                        stripe.chargesEnabled
                            ? 'Connected — payouts enabled'
                            : stripe.accountId != null
                                ? 'Setup incomplete'
                                : 'Not connected',
                        style: TextStyle(
                          fontSize: 12,
                          color: stripe.chargesEnabled
                              ? Colors.green
                              : AppColors.mutedText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.read<StorefrontCubit>().load(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final StorefrontProfileDto profile;

  const _ProfileHeader({required this.profile});

  @override
  Widget build(BuildContext context) {
    final initial = profile.name.isNotEmpty ? profile.name[0].toUpperCase() : '?';

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.primary,
            backgroundImage: profile.avatarUrl != null
                ? NetworkImage(profile.avatarUrl!)
                : null,
            child: profile.avatarUrl == null
                ? Text(
                    initial,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.foreground,
                  ),
                ),
                if (profile.specialties != null && profile.specialties!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      profile.specialties!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Column(
          children: [
            Icon(icon, size: 20, color: AppColors.primary),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.mutedText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.foreground,
      ),
    );
  }
}
