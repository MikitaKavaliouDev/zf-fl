import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tanquery_flutter/tanquery_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/trainer_detail_cubit.dart';
import '../cubit/trainer_detail_state.dart';
import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_package_dto.dart';
import '../data/models/trainer_testimonial_dto.dart';
import '../data/trainer_repository.dart';
import 'widgets/about_section.dart';
import 'widgets/connect_button.dart';
import 'widgets/custom_program_request_sheet.dart';
import 'widgets/package_card.dart';
import 'widgets/photos_section.dart';
import 'widgets/preview_carousel.dart';
import 'widgets/review_card.dart';
import 'widgets/schedule_section.dart';
import 'widgets/tag_badge.dart';
import 'widgets/trainer_profile_banner.dart';

/// Full-screen trainer profile matching iOS PublicTrainerProfileView layout.
///
/// Layout (from iOS, lines 36-245):
///   ZStack(alignment: .top)
///     ScrollView (ignores top safe area)
///       Banner (200pt) + Avatar overlay
///       Identity Row (name, specialties, location, rating)
///       Tag Badges Row (horizontal scroll)
///       "Ask for Custom Plan" button
///       About section (expandable bio)
///       Packages section (horizontal scroll)
///       Photos section (horizontal scroll)
///       Reviews section (horizontal scroll)
///       Schedule section (day selector + time slots)
///     Dismiss button + Connect pill (top overlay)
class TrainerDetailScreen extends StatelessWidget {
  final String username;

  const TrainerDetailScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainerDetailCubit>(
      create: (context) {
        final cubit = TrainerDetailCubit(
          getIt<TrainerRepository>(),
          getIt<QueryClient>(),
        );
        cubit.load(username);
        return cubit;
      },
      child: BlocConsumer<TrainerDetailCubit, TrainerDetailState>(
          listener: (context, state) {
            if (state is TrainerDetailLoaded && state.linkError != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.linkError!),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              context.read<TrainerDetailCubit>().clearLinkError();
            }
          },
          builder: (context, state) {
            Widget body;
            if (state is TrainerDetailLoading) {
              body = const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            } else if (state is TrainerDetailLoaded) {
              body = _ProfileContent(
                trainer: state.trainer,
                username: username,
              );
            } else if (state is TrainerDetailError) {
              body = Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48),
                      const SizedBox(height: 16),
                      Text(state.message),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<TrainerDetailCubit>().load(username),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              body = const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            return body;
          },
        ),
      );
  }
}

// ────────────────────────────────────────────
// Main Profile Content (iOS-matching layout)
// ────────────────────────────────────────────

class _ProfileContent extends StatelessWidget {
  final TrainerDetailDto trainer;
  final String username;

  const _ProfileContent({
    required this.trainer,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TrainerDetailCubit>();
    final name = trainer.name ?? trainer.username ?? 'Professional';
    final specialties = trainer.specialties;
    final location = trainer.locations.isNotEmpty
        ? trainer.locations.first.address
        : null;

    return Scaffold(
      key: const ValueKey('trainerDetailScreen'),
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Banner + Avatar ──
                TrainerProfileBanner(
                  bannerImageUrl: trainer.bannerImagePath,
                  avatarUrl: trainer.profilePhotoPath,
                ),
                const SizedBox(height: 36), // space for avatar offset

                // ── Identity Row ──
                _IdentityRow(
                  name: name,
                  specialties: specialties,
                  location: location,
                  rating: trainer.averageRating,
                  reviewCount: trainer.reviewCount,
                ),

                // ── Tag Badges Row ──
                _TagBadgesRow(
                  rating: trainer.averageRating,
                  reviewCount: trainer.reviewCount,
                  specialties: specialties,
                  location: location,
                ),

                // ── "Ask for Custom Plan" button ──
                _CustomPlanButton(
                  trainerName: name,
                ),
                const SizedBox(height: 8),

                // ── Preview Carousel (images + videos) ──
                BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
                  builder: (context, state) {
                    if (state is! TrainerDetailLoaded ||
                        state.previewMedia.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return PreviewCarousel(media: state.previewMedia);
                  },
                ),

                // ── About Section ──
                AboutSection(
                  aboutMe: trainer.aboutMe,
                  philosophy: trainer.philosophy,
                  methodology: trainer.methodology,
                  branding: trainer.branding,
                ),

                // ── Packages Section ──
                _PackagesSection(
                  packages: trainer.packages,
                  trainerName: name,
                ),

                // ── Photos Section ──
                if (trainer.transformationPhotos.isNotEmpty)
                  PhotosSection(photos: trainer.transformationPhotos),

                // ── Reviews Section ──
                _ReviewsSection(
                  testimonials: trainer.testimonials,
                  rating: trainer.averageRating,
                  reviewCount: trainer.reviewCount,
                ),

                // ── Schedule Section ──
                BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
                  builder: (context, state) {
                    if (state is! TrainerDetailLoaded) {
                      return const SizedBox.shrink();
                    }
                    return ScheduleSection(
                      trainerId: trainer.id,
                      trainerName: name,
                      schedule: state.schedule,
                      isLoading: state.isLoadingSchedule,
                      onLoadSchedule: () {
                        if (state.schedule == null && !state.isLoadingSchedule) {
                          cubit.loadSchedule(username);
                        }
                      },
                      onBookingSuccess: () =>
                          context.read<TrainerDetailCubit>().refresh(username),
                    );
                  },
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          // ── Top overlay: dismiss button + connect pill ──
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // Dismiss button
                GestureDetector(
                  onTap: () {
                    final router = GoRouter.of(context);
                    if (router.canPop()) {
                      router.pop();
                    } else {
                      context.go('/explore');
                    }
                  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppColors.mutedSurface.withAlpha(200),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      size: 20,
                      color: AppColors.foreground,
                    ),
                  ),
                ),
                const Spacer(),

                // Connect pill
                BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
                  builder: (context, state) {
                    if (state is! TrainerDetailLoaded) {
                      return const SizedBox.shrink();
                    }
                    return ConnectButton(
                      key: const ValueKey('connectButton'),
                      isLinked: trainer.isLinked,
                      isPending: state.linkRequestPending,
                      isLoading: state.isLinking,
                      onConnect: () => cubit.linkTrainer(username),
                      onUnlink: () => cubit.unlinkTrainer(username),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ────────────────────────────────────────────
// Identity Row
// ────────────────────────────────────────────

class _IdentityRow extends StatelessWidget {
  final String name;
  final List<String> specialties;
  final String? location;
  final double? rating;
  final int reviewCount;

  const _IdentityRow({
    required this.name,
    required this.specialties,
    this.location,
    this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 2),

                // Specialties
                Text(
                  specialties.isNotEmpty
                      ? specialties.join(' • ')
                      : 'Fitness Professional',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 2),

                // Location
                if (location != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 11,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          location!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                  ),

                // Rating
                if (rating != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 12,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          rating!.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (reviewCount > 0) ...[
                          const SizedBox(width: 6),
                          Text(
                            '$reviewCount reviews',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.mutedText,
                            ),
                          ),
                        ],
                      ],
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

// ────────────────────────────────────────────
// Tag Badges Row (horizontal scroll)
// ────────────────────────────────────────────

class _TagBadgesRow extends StatelessWidget {
  final double? rating;
  final int reviewCount;
  final List<String> specialties;
  final String? location;

  const _TagBadgesRow({
    this.rating,
    required this.reviewCount,
    required this.specialties,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          if (rating != null)
            TagBadge(
              icon: Icons.star_rounded,
              text: rating!.toStringAsFixed(1),
              color: Colors.orange,
            ),
          if (reviewCount > 0)
            TagBadge(
              icon: Icons.person_rounded,
              text: '$reviewCount Reviews',
              color: AppColors.mutedText,
            ),
          ...specialties.take(3).map(
                (s) => TagBadge(
                  text: s,
                  color: AppColors.primary,
                ),
              ),
          if (location != null)
            TagBadge(
              icon: Icons.location_on_outlined,
              text: location!,
              color: const Color(0xFF22C55E),
            ),
        ].map((badge) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: badge,
            )).toList(),
      ),
    );
  }
}

// ────────────────────────────────────────────
// "Ask for Custom Plan" Button
// ────────────────────────────────────────────

class _CustomPlanButton extends StatelessWidget {
  final String trainerName;

  const _CustomPlanButton({required this.trainerName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: AppColors.background,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (_) => CustomProgramRequestSheet(
            trainerName: trainerName,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.auto_awesome_rounded,
                size: 14,
                color: AppColors.primary,
              ),
              SizedBox(width: 6),
              Text(
                'Ask for Custom Plan',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ────────────────────────────────────────────
// Packages Section (horizontal scroll)
// ────────────────────────────────────────────

class _PackagesSection extends StatelessWidget {
  final List<TrainerPackageDto> packages;
  final String trainerName;

  const _PackagesSection({
    required this.packages,
    required this.trainerName,
  });

  void _purchasePackage(BuildContext context, TrainerPackageDto pkg) async {
    try {
      final repo = getIt<TrainerRepository>();
      final url = await repo.createCheckoutSession(
        type: 'PACKAGE_SALE',
        id: pkg.id,
      );
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to start checkout: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionDivider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Text(
                'Packages',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        if (packages.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'No packages available yet',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          )
        else
          SizedBox(
            height: 210,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: packages.length,
              separatorBuilder: (_, _) => const SizedBox(width: 14),
              itemBuilder: (context, index) {
                final pkg = packages[index];
                return PackageCard(
                  key: ValueKey('packageCard_${pkg.id}'),
                  package: pkg,
                  isRecommended: index == 0,
                  onPurchase: () => _purchasePackage(context, pkg),
                );
              },
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _sectionDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(),
    );
  }
}

// ────────────────────────────────────────────
// Reviews Section (horizontal scroll)
// ────────────────────────────────────────────

class _ReviewsSection extends StatelessWidget {
  final List<TrainerTestimonialDto> testimonials;
  final double? rating;
  final int reviewCount;

  const _ReviewsSection({
    required this.testimonials,
    this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              const Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              if (rating != null) ...[
                const Icon(Icons.star_rounded, size: 14, color: Colors.orange),
                const SizedBox(width: 2),
                Text(
                  rating!.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(width: 4),
              ],
              if (reviewCount > 0)
                Text(
                  '$reviewCount reviews',
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.mutedText,
                  ),
                ),
            ],
          ),
        ),
        if (testimonials.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'No reviews yet',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          )
        else
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                // testimonials are from TrainerDetailDto which has dynamic type
                // due to freezed JSON parsing
                final t = testimonials[index];
                // The items are TrainerTestimonialDto objects
                return ReviewCard(
                  testimonial: t,
                );
              },
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _sectionDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(),
    );
  }
}
      