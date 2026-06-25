import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_theme.dart';
import '../cubit/sharing_cubit.dart';
import '../cubit/sharing_state.dart';
import '../data/models/sharing_config_dto.dart';

class SharingScreen extends StatelessWidget {
  const SharingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SharingCubit>()..loadConfig(),
      child: const _SharingBody(),
    );
  }
}

class _SharingBody extends StatelessWidget {
  const _SharingBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Sharing'),
        actions: [
          BlocBuilder<SharingCubit, SharingState>(
            builder: (context, state) {
              if (state is SharingSaving) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }
              if (state is SharingLoaded) {
                return TextButton(
                  onPressed: () => _save(context),
                  child: const Text('Save'),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<SharingCubit, SharingState>(
        builder: (context, state) {
          return switch (state) {
            SharingInitial() || SharingLoading() => const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColors.primary,
                ),
              ),
            SharingError(:final message) => _ErrorView(message: message),
            SharingSaving() => const Center(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColors.primary,
              ),
            ),
            SharingLoaded(:final config) =>
              _SharingContent(config: config),
          };
        },
      ),
    );
  }

  void _save(BuildContext context) async {
    final cubit = context.read<SharingCubit>();
    final success = await cubit.save();
    if (success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sharing settings saved.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}

class _SharingContent extends StatelessWidget {
  final SharingConfigDto config;

  const _SharingContent({required this.config});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // ── Duration Section ──
        _buildSection(
          title: 'Sharing Duration',
          footer:
              'Choose how long your sharing link remains active. After expiration, a new link must be generated.',
          children: [
            _DurationPicker(
              duration: config.duration,
              onChanged: (v) =>
                  context.read<SharingCubit>().updateDuration(v),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // ── Sharing Settings ──
        _buildSection(
          title: 'What to Share',
          footer:
              'Toggle which types of data are visible to anyone with your sharing link.',
          children: [
            _buildToggleRow(
              context,
              icon: Icons.fitness_center_rounded,
              iconColor: AppColors.primary,
              title: 'Workouts',
              subtitle: 'Workout history and session details',
              value: config.settings.workouts,
              onChanged: () =>
                  context.read<SharingCubit>().toggleSetting('workouts'),
            ),
            _buildToggleRow(
              context,
              icon: Icons.monitor_weight_outlined,
              iconColor: Colors.purple,
              title: 'Measurements',
              subtitle: 'Body measurements and stats',
              value: config.settings.measurements,
              onChanged: () =>
                  context.read<SharingCubit>().toggleSetting('measurements'),
            ),
            _buildToggleRow(
              context,
              icon: Icons.photo_library_outlined,
              iconColor: Colors.orange,
              title: 'Photos',
              subtitle: 'Progress photos and check-in images',
              value: config.settings.photos,
              onChanged: () =>
                  context.read<SharingCubit>().toggleSetting('photos'),
            ),
            _buildToggleRow(
              context,
              icon: Icons.check_circle_outline,
              iconColor: Colors.green,
              title: 'Check-ins',
              subtitle: 'Daily check-in data and notes',
              value: config.settings.checkins,
              onChanged: () =>
                  context.read<SharingCubit>().toggleSetting('checkins'),
              isLast: true,
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
    String? footer,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(children: children),
        ),
        if (footer != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 8),
            child: Text(
              footer,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.mutedText,
                height: 1.3,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildToggleRow(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool value,
    required VoidCallback onChanged,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
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
                    const SizedBox(height: 2),
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
                onChanged: (_) => onChanged(),
                activeTrackColor: AppColors.primary,
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 64),
      ],
    );
  }
}

class _DurationPicker extends StatelessWidget {
  final String duration;
  final ValueChanged<String> onChanged;

  const _DurationPicker({
    required this.duration,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const options = [
      ('30_days', '30 Days'),
      ('90_days', '90 Days'),
      ('forever', 'Forever'),
    ];

    return Column(
      children: List.generate(options.length, (index) {
        final option = options[index];
        final isLast = index == options.length - 1;
        final isSelected = duration == option.$1;

        return Column(
          children: [
            InkWell(
              onTap: () => onChanged(option.$1),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Row(
                  children: [
                    Radio<String>(
                      value: option.$1,
                      groupValue: duration,
                      onChanged: (v) {
                        if (v != null) onChanged(v);
                      },
                      activeColor: AppColors.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      option.$2,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                        color: AppColors.foreground,
                      ),
                    ),
                    if (isSelected)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Active',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (!isLast) const Divider(height: 1, indent: 60),
          ],
        );
      }),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.read<SharingCubit>().loadConfig(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}
