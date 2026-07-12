import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/storefront_cubit.dart';
import '../../cubit/storefront_state.dart';
import '../../data/models/storefront_profile_dto.dart';
import '../../data/models/stripe_status_dto.dart';
import 'widgets/confirm_delete_sheet.dart';
import 'widgets/edit_profile_sheet.dart';
import 'widgets/edit_text_content_sheet.dart';
import 'widgets/external_link_form_sheet.dart';
import 'widgets/package_form_sheet.dart';
import 'widgets/service_form_sheet.dart';
import 'widgets/social_link_form_sheet.dart';

/// Storefront Settings screen — iOS-style editable profile preview for the
/// trainer's public storefront.
///
/// Layout matches iOS StorefrontSettingsView.swift:
///   - Hero banner (200px) + avatar overlay + Preview button
///   - Name, specialty chips, stats row, bio excerpt
///   - Package preview cards (horizontal scroll)
///   - Services preview list
///   - Session Packages / Classes & Events management links
///   - Platform fee footer
///   - Social Links, External Links, Stripe status sections
///   - Shimmer skeleton loading
class StorefrontSettingsScreen extends StatefulWidget {
  const StorefrontSettingsScreen({super.key});

  @override
  State<StorefrontSettingsScreen> createState() =>
      _StorefrontSettingsScreenState();
}

class _StorefrontSettingsScreenState extends State<StorefrontSettingsScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StorefrontCubit>().load();
    });
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Storefront Settings'),
        centerTitle: true,
      ),
      body: BlocConsumer<StorefrontCubit, StorefrontState>(
        listenWhen: (prev, curr) => curr is StorefrontError,
        listener: (context, state) {
          if (state is StorefrontError && mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return switch (state) {
            StorefrontInitial() => const SizedBox.shrink(),
            StorefrontLoading() => _buildSkeleton(),
            StorefrontLoaded(:final profile, :final stripeStatus) =>
              _buildLoaded(
                profile,
                stripeStatus,
                onEditProfile: () => _showEditProfile(profile),
              ),
            StorefrontError(:final message) => _buildError(message),
          };
        },
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Skeleton / Shimmer loading
  // ---------------------------------------------------------------------------

  Widget _buildSkeleton() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Skeleton banner
          _ShimmerRect(
            height: 220,
            controller: _shimmerController,
          ),
          // Avatar circle offset to overlap the banner bottom
          Transform.translate(
            offset: const Offset(0, -40),
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: AppColors.mutedSurface,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _ShimmerRect(
                  height: 20,
                  width: 180,
                  controller: _shimmerController,
                ),
                const SizedBox(height: 24),
                _ShimmerRect(
                  height: 80,
                  controller: _shimmerController,
                ),
                const SizedBox(height: 12),
                _ShimmerRect(
                  height: 80,
                  controller: _shimmerController,
                ),
                const SizedBox(height: 12),
                _ShimmerRect(
                  height: 80,
                  controller: _shimmerController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Loaded state
  // ---------------------------------------------------------------------------

  Widget _buildLoaded(
    StorefrontProfileDto profile,
    StripeStatusDto? stripe, {
    required VoidCallback onEditProfile,
  }) {
    return RefreshIndicator(
      onRefresh: () => context.read<StorefrontCubit>().refresh(),
      child: SingleChildScrollView(
        child: Column(
          children: [
          _HeroSection(
            profile: profile,
            onPreview: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Preview coming soon')),
              );
            },
            onEditProfile: onEditProfile,
          ),
          _ContentSections(
            profile: profile,
            stripeStatus: stripe,
            onEditProfile: () => _showEditProfile(profile),
            onEditTextContent: (field, content, label) =>
                _showEditTextContent(field, content, label),
            onAddPackage: _showAddPackage,
            onEditPackage: (pkg) => _showEditPackage(pkg),
            onDeletePackage: (pkg) => _confirmDelete(
              'package "${pkg.name}"',
              () => context.read<StorefrontCubit>().deletePackage(pkg.id),
            ),
            onAddService: _showAddService,
            onEditService: (svc) => _showEditService(svc),
            onDeleteService: (svc) => _confirmDelete(
              'service "${svc.name}"',
              () => context.read<StorefrontCubit>().deleteService(svc.id),
            ),
            onAddSocialLink: _showAddSocialLink,
            onDeleteSocialLink: (id) => _confirmDelete(
              'social link',
              () => context.read<StorefrontCubit>().deleteSocialLink(id),
            ),
            onAddExternalLink: _showAddExternalLink,
            onDeleteExternalLink: (id) => _confirmDelete(
              'external link',
              () => context.read<StorefrontCubit>().deleteExternalLink(id),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 48, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.read<StorefrontCubit>().refresh(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  // ── Bottom sheet actions ──

  void _showEditProfile(StorefrontProfileDto profile) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: EditProfileSheet(profile: profile),
      ),
    );
  }

  void _showEditTextContent(
      String fieldName, String initialContent, String label) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: EditTextContentSheet(
          fieldName: fieldName,
          initialContent: initialContent,
          label: label,
        ),
      ),
    );
  }

  void _showAddPackage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: const PackageFormSheet(),
      ),
    );
  }

  void _showEditPackage(StorefrontPackageDto package) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: PackageFormSheet(package: package),
      ),
    );
  }

  void _showAddService() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: const ServiceFormSheet(),
      ),
    );
  }

  void _showEditService(StorefrontServiceDto service) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: ServiceFormSheet(service: service),
      ),
    );
  }

  void _showAddSocialLink() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: const SocialLinkFormSheet(),
      ),
    );
  }

  void _showAddExternalLink() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => BlocProvider.value(
        value: context.read<StorefrontCubit>(),
        child: const ExternalLinkFormSheet(),
      ),
    );
  }

  Future<void> _confirmDelete(
      String itemName, Future<void> Function() onDelete) async {
    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      builder: (_) => ConfirmDeleteSheet(itemName: itemName),
    );
    if (confirmed == true) {
      await onDelete();
    }
  }
}

// =============================================================================
// Hero Section — Banner + Avatar + Name + Chips + Stats + Bio
// =============================================================================

class _HeroSection extends StatelessWidget {
  final StorefrontProfileDto profile;
  final VoidCallback onPreview;
  final VoidCallback onEditProfile;

  const _HeroSection({
    required this.profile,
    required this.onPreview,
    required this.onEditProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Banner + Avatar + Preview button
        SizedBox(
          height: 200,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Banner image or gradient
              if (profile.bannerUrl != null && profile.bannerUrl!.isNotEmpty)
                ClipRRect(
                  child: Image.network(
                    profile.bannerUrl!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _bannerGradient,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return _bannerGradient;
                    },
                  ),
                )
              else
                _bannerGradient,

              // Bottom overlay row: Avatar + Preview button
              Positioned(
                left: 20,
                right: 20,
                bottom: 0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Avatar
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.card,
                        border: Border.all(
                          color: AppColors.background,
                          width: 4,
                        ),
                        image: profile.avatarUrl != null
                            ? DecorationImage(
                                image: NetworkImage(profile.avatarUrl!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: profile.avatarUrl == null
                          ? Center(
                              child: Text(
                                profile.name.isNotEmpty
                                    ? profile.name[0].toUpperCase()
                                    : '?',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.foreground,
                                ),
                              ),
                            )
                          : null,
                    ),
                    const Spacer(),

                    // Preview button
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: TextButton.icon(
                        onPressed: onPreview,
                        icon: const Icon(Icons.visibility_rounded, size: 14),
                        label: const Text('Preview',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          backgroundColor:
                              AppColors.primary.withValues(alpha: 0.1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Name, tags, stats, bio
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 52, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name + Edit button
              GestureDetector(
                key: const Key('editProfile_heroName'),
                onTap: onEditProfile,
                child: Row(
                  children: [
                    Text(
                      profile.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.foreground,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.edit_rounded,
                        size: 16, color: AppColors.primary),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Specialty chips
              if (profile.specialties.isNotEmpty) ...[
                SizedBox(
                  height: 28,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: math.min(profile.specialties.length, 6) +
                        (profile.specialties.length > 6 ? 1 : 0),
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      if (index < 6 && index < profile.specialties.length) {
                        return _SpecialtyChip(
                            label: profile.specialties[index]);
                      }
                      return _MoreChip(
                          count: profile.specialties.length - 6);
                    },
                  ),
                ),
                const SizedBox(height: 16),
              ],

              // Stats row
              Row(
                children: [
                  _StatItem(
                    icon: Icons.star_rounded,
                    iconColor: Colors.orange,
                    value: '${profile.reviewCount}',
                    label: 'Reviews',
                  ),
                  const SizedBox(width: 24),
                  _StatItem(
                    icon: Icons.star_half_rounded,
                    iconColor: Colors.amber,
                    value: profile.averageRating != null
                        ? profile.averageRating!.toStringAsFixed(1)
                        : '—',
                    label: 'Rating',
                  ),
                  const SizedBox(width: 24),
                  _StatItem(
                    icon: Icons.inventory_2_rounded,
                    iconColor: AppColors.primary,
                    value: '${profile.packages.length}',
                    label: 'Packages',
                  ),
                  const SizedBox(width: 24),
                  _StatItem(
                    icon: Icons.fitness_center_rounded,
                    iconColor: Colors.purple,
                    value: '${profile.services.length}',
                    label: 'Services',
                  ),
                ],
              ),

              // Bio excerpt
              if (profile.bio != null && profile.bio!.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  profile.bio!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedText,
                    height: 1.4,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

Widget get _bannerGradient => Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xB3007AFF), Color(0x99BB86FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );

class _SpecialtyChip extends StatelessWidget {
  final String label;
  const _SpecialtyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _MoreChip extends StatelessWidget {
  final int count;
  const _MoreChip({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.mutedSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '+$count',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: AppColors.mutedText,
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;

  const _StatItem({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.foreground,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// Content Sections
// =============================================================================

class _ContentSections extends StatelessWidget {
  final StorefrontProfileDto profile;
  final StripeStatusDto? stripeStatus;

  final VoidCallback onEditProfile;
  final void Function(String field, String content, String label)
      onEditTextContent;
  final VoidCallback onAddPackage;
  final void Function(StorefrontPackageDto) onEditPackage;
  final void Function(StorefrontPackageDto) onDeletePackage;
  final VoidCallback onAddService;
  final void Function(StorefrontServiceDto) onEditService;
  final void Function(StorefrontServiceDto) onDeleteService;
  final VoidCallback onAddSocialLink;
  final void Function(String id) onDeleteSocialLink;
  final VoidCallback onAddExternalLink;
  final void Function(String id) onDeleteExternalLink;

  const _ContentSections({
    required this.profile,
    required this.stripeStatus,
    required this.onEditProfile,
    required this.onEditTextContent,
    required this.onAddPackage,
    required this.onEditPackage,
    required this.onDeletePackage,
    required this.onAddService,
    required this.onEditService,
    required this.onDeleteService,
    required this.onAddSocialLink,
    required this.onDeleteSocialLink,
    required this.onAddExternalLink,
    required this.onDeleteExternalLink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Packages Section ──
          _SectionHeader(
            title: 'Session Packages',
            icon: Icons.inventory_2_rounded,
            onEdit: onAddPackage,
          ),
          const SizedBox(height: 12),
          if (profile.packages.isNotEmpty)
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: profile.packages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final pkg = profile.packages[index];
                  return _PackageActionCard(
                    package: pkg,
                    onEdit: () => onEditPackage(pkg),
                    onDelete: () => onDeletePackage(pkg),
                  );
                },
              ),
            )
          else
            _EmptyHint(
                'No packages yet. Add them in your Marketplace Profile.',
                onAddPackage),
          const SizedBox(height: 28),

          // ── Services Section ──
          _SectionHeader(
            title: 'Services',
            icon: Icons.fitness_center_rounded,
            onEdit: onAddService,
          ),
          const SizedBox(height: 12),
          if (profile.services.isNotEmpty) ...[
            Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderMuted),
              ),
              child: Column(
                children: [
                  for (final svc in profile.services.take(3))
                    _ServiceActionRow(
                      service: svc,
                      onEdit: () => onEditService(svc),
                      onDelete: () => onDeleteService(svc),
                    ),
                ],
              ),
            ),
            if (profile.services.length > 3)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextButton(
                  onPressed: onAddService,
                  child: Text(
                    'View all ${profile.services.length} services',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
          ] else
            _EmptyHint(
                'No services listed. Add them in your Marketplace Profile.',
                onAddService),
          const SizedBox(height: 28),

          // ── Edit About / Text Content ──
          _SectionHeader(
            title: 'About',
            icon: Icons.info_outline_rounded,
            onEdit: () => onEditTextContent(
              'aboutMe',
              profile.bio ?? '',
              'About',
            ),
          ),
          const SizedBox(height: 12),
          if (profile.bio != null && profile.bio!.isNotEmpty)
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
            )
          else
            _EmptyHint(
              'Add a bio...',
              () => onEditTextContent('aboutMe', '', 'About'),
            ),
          const SizedBox(height: 28),

          // ── Social Links ──
          _SectionHeader(
            title: 'Social Links',
            icon: Icons.alternate_email_rounded,
            onEdit: onAddSocialLink,
          ),
          const SizedBox(height: 12),
          if (profile.socialLinks.isNotEmpty)
            _buildLinkSection(
              profile.socialLinks
                  .map((l) => _LinkItemData(
                        id: l.id,
                        title: l.platform,
                        subtitle: l.url,
                        onDelete: () => onDeleteSocialLink(l.id),
                      ))
                  .toList(),
            )
          else
            _EmptyHint(
                'No social links yet. Add one!', onAddSocialLink),
          const SizedBox(height: 28),

          // ── External Links ──
          _SectionHeader(
            title: 'External Links',
            icon: Icons.link_rounded,
            onEdit: onAddExternalLink,
          ),
          const SizedBox(height: 12),
          if (profile.externalLinks.isNotEmpty)
            _buildLinkSection(
              profile.externalLinks
                  .map((l) => _LinkItemData(
                        id: l.id,
                        title: l.label,
                        subtitle: l.url,
                        onDelete: () => onDeleteExternalLink(l.id),
                      ))
                  .toList(),
            )
          else
            _EmptyHint('No external links yet. Add one!', onAddExternalLink),
          const SizedBox(height: 28),

          // ── Stripe Status ──
          if (stripeStatus != null) ...[
            _SectionHeader(
              title: 'Payments',
              icon: Icons.credit_card_rounded,
            ),
            const SizedBox(height: 12),
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
                      color: stripeStatus!.chargesEnabled
                          ? Colors.green.withValues(alpha: 0.1)
                          : AppColors.mutedText.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      stripeStatus!.chargesEnabled
                          ? Icons.check_circle_rounded
                          : Icons.credit_card_rounded,
                      size: 20,
                      color: stripeStatus!.chargesEnabled
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
                          stripeStatus!.chargesEnabled
                              ? 'Connected — payouts enabled'
                              : stripeStatus!.accountId != null
                                  ? 'Setup incomplete'
                                  : 'Not connected',
                          style: TextStyle(
                            fontSize: 12,
                            color: stripeStatus!.chargesEnabled
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
            const SizedBox(height: 28),
          ],

          // ── Session Packages Management Link ──
          _ManagementLink(
            icon: Icons.inventory_2_rounded,
            title: 'Manage Packages',
            subtitle: 'Create and sell session packages to clients',
            onTap: () {},
          ),
          const SizedBox(height: 12),

          // ── Classes & Events Management Link ──
          _ManagementLink(
            icon: Icons.calendar_month_rounded,
            title: 'Manage Classes & Events',
            subtitle: 'Create recurring classes and one-time events',
            onTap: () {},
          ),
          const SizedBox(height: 28),

          // ── Platform Fee ──
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info_outline_rounded,
                      size: 12, color: AppColors.mutedText),
                  SizedBox(width: 6),
                  Text(
                    'Platform processing fee: 5% per transaction',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLinkSection(List<_LinkItemData> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: items
            .map((item) => ListTile(
                  leading: const Icon(
                    Icons.link_rounded,
                    size: 18,
                    color: AppColors.primary,
                  ),
                  title: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.foreground,
                    ),
                  ),
                  subtitle: Text(
                    item.subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.mutedText,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline_rounded,
                        size: 18, color: AppColors.mutedText),
                    onPressed: item.onDelete,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: Border(
                    bottom: BorderSide(
                      color: AppColors.borderMuted,
                      width: 1,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

// =============================================================================
// Section Header
// =============================================================================

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onEdit;

  const _SectionHeader({
    required this.title,
    required this.icon,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.foreground,
          ),
        ),
        const Spacer(),
        if (onEdit != null)
          TextButton.icon(
            key: ValueKey('edit_${title.replaceAll(' ', '_')}'),
            onPressed: onEdit,
            icon: const Icon(Icons.edit_rounded, size: 14),
            label: const Text('Edit', style: TextStyle(fontSize: 12)),
          ),
      ],
    );
  }
}

// =============================================================================
// Package Action Card
// =============================================================================

class _PackageActionCard extends StatelessWidget {
  final StorefrontPackageDto package;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _PackageActionCard({
    required this.package,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Session count badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                package.duration != null
                    ? '${package.duration} SESSIONS'
                    : 'PROGRAM',
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const Spacer(),
            // Name
            Text(
              package.name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            // Price
            Text(
              '\$${package.price}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            // Delete button
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onDelete,
                child: const Icon(Icons.delete_outline_rounded,
                    size: 16, color: AppColors.mutedText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Service Action Row
// =============================================================================

class _ServiceActionRow extends StatelessWidget {
  final StorefrontServiceDto service;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _ServiceActionRow({
    required this.service,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onEdit,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.borderMuted, width: 1),
          ),
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
                Icons.fitness_center_rounded,
                size: 16,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  if (service.description != null &&
                      service.description!.isNotEmpty)
                    Text(
                      service.description!,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.mutedText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
            if (service.price != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  '\$${service.price}',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              ),
            GestureDetector(
              onTap: onDelete,
              child: const Icon(Icons.delete_outline_rounded,
                  size: 16, color: AppColors.mutedText),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// Management Link
// =============================================================================

class _ManagementLink extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ManagementLink({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.foreground,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 11, color: AppColors.mutedText),
          ),
          trailing: const Icon(Icons.chevron_right_rounded,
              size: 18, color: AppColors.mutedText),
          onTap: onTap,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}

// =============================================================================
// Small helpers
// =============================================================================

class _EmptyHint extends StatelessWidget {
  final String message;
  final VoidCallback onTap;

  const _EmptyHint(this.message, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderMuted),
        ),
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.mutedText,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _LinkItemData {
  final String id;
  final String title;
  final String subtitle;
  final VoidCallback onDelete;

  _LinkItemData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.onDelete,
  });
}

// =============================================================================
// Shimmer Rectangle
// =============================================================================

class _ShimmerRect extends StatelessWidget {
  final double height;
  final double? width;
  final AnimationController controller;

  const _ShimmerRect({
    required this.height,
    this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final dx = controller.value * 2.0 - 0.5;
        return Container(
          width: width ?? double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: const [
                AppColors.mutedSurface,
                Color(0xFFE8E8E8),
                AppColors.mutedSurface,
              ],
              stops: [
                math.max(0.0, dx - 0.4),
                dx,
                math.min(1.0, dx + 0.4),
              ],
            ),
          ),
        );
      },
    );
  }
}
