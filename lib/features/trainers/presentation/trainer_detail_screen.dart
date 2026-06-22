import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/trainer_detail_cubit.dart';
import '../cubit/trainer_detail_state.dart';
import '../data/models/trainer_detail_dto.dart';
import '../data/models/trainer_package_dto.dart';
import '../data/trainer_repository.dart';

class TrainerDetailScreen extends StatelessWidget {
  final String username;

  const TrainerDetailScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trainer'),
      ),
      body: RepositoryProvider.value(
        value: getIt<TrainerRepository>(),
        child: BlocProvider(
          create: (context) {
            final cubit = TrainerDetailCubit(
              context.read<TrainerRepository>(),
            );
            cubit.load(username);
            return cubit;
          },
          child: BlocBuilder<TrainerDetailCubit, TrainerDetailState>(
            builder: (context, state) {
              return switch (state) {
                TrainerDetailInitial() || TrainerDetailLoading() =>
                  const Center(child: CircularProgressIndicator()),
                TrainerDetailLoaded(:final trainer, :final packages) =>
                  _TrainerContent(trainer: trainer, packages: packages, username: username),
                TrainerDetailError(:final message) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline, size: 48),
                        const SizedBox(height: 16),
                        Text(message),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => context
                              .read<TrainerDetailCubit>()
                              .load(username),
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
              };
            },
          ),
        ),
      ),
    );
  }
}

class _TrainerContent extends StatelessWidget {
  final TrainerDetailDto trainer;
  final List<TrainerPackageDto> packages;
  final String username;

  const _TrainerContent({
    required this.trainer,
    required this.packages,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    final name = trainer.name ?? trainer.username ?? '';
    final photoPath = trainer.profilePhotoPath;
    final bio = trainer.bio;
    final rating = trainer.averageRating;
    final specialties = trainer.specialties;
    final isLinked = trainer.isLinked;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile header
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundImage:
                      photoPath != null ? NetworkImage(photoPath) : null,
                  child: photoPath == null
                      ? const Icon(Icons.person, size: 48)
                      : null,
                ),
                const SizedBox(height: 16),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                if (rating != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star_rounded,
                          size: 20, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                if (isLinked)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(25),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Linked Trainer',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Bio
          if (bio != null) ...[
            const Text(
              'About',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(bio, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 24),
          ],

          // Specialties
          if (specialties.isNotEmpty) ...[
            const Text(
              'Specialties',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: specialties
                  .map((s) => Chip(
                        label: Text(s, style: const TextStyle(fontSize: 12)),
                        materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                      ))
                  .toList(),
            ),
            const SizedBox(height: 24),
          ],

          // Packages
          if (packages.isNotEmpty) ...[
            const Text(
              'Packages',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...packages.map((pkg) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListTile(
                    title: Text(
                      pkg.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: pkg.description != null
                        ? Text(
                            pkg.description!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                    trailing: Text(
                      pkg.price,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                )),
          ],

          // Link button
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: isLinked
                  ? null
                  : () => context
                      .read<TrainerDetailCubit>()
                      .linkTrainer(username),
              icon: Icon(isLinked
                  ? Icons.check_circle_rounded
                  : Icons.link_rounded),
              label: Text(isLinked ? 'Linked' : 'Link with Trainer'),
            ),
          ),
        ],
      ),
    );
  }
}
