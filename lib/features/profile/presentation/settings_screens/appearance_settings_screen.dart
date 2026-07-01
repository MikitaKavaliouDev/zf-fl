import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/settings/appearance_settings_service.dart';
import '../../../../core/theme/app_theme.dart';
import '../../cubit/appearance_cubit.dart';
import '../../cubit/appearance_state.dart';

class AppearanceSettingsScreen extends StatefulWidget {
  const AppearanceSettingsScreen({super.key});

  @override
  State<AppearanceSettingsScreen> createState() =>
      _AppearanceSettingsScreenState();
}

class _AppearanceSettingsScreenState extends State<AppearanceSettingsScreen> {
  @override
  void initState() {
    super.initState();
    // Load persisted preferences when the screen opens.
    context.read<AppearanceCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return const _AppearanceSettingsBody();
  }
}

class _AppearanceSettingsBody extends StatelessWidget {
  const _AppearanceSettingsBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appearance')),
      body: BlocBuilder<AppearanceCubit, AppearanceState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              const SizedBox(height: 8),
              _buildDisplaySection(context, state),
              const SizedBox(height: 24),
              _buildAppIconSection(),
              const SizedBox(height: 24),
              _buildAccessibilitySection(context, state),
            ],
          );
        },
      ),
    );
  }

  // ── Display Section ──

  Widget _buildDisplaySection(BuildContext context, AppearanceState state) {
    return _buildSection(
      title: 'Display',
      children: [
        _ThemeRow(state: state),
        _TextSizeRow(state: state, isLast: true),
      ],
    );
  }

  // ── App Icon Section ──

  Widget _buildAppIconSection() {
    return _buildSection(
      title: 'App Icon',
      children: [
        _buildMenuRow(
          icon: Icons.grid_view_rounded,
          iconColor: AppColors.primary,
          title: 'App Icon',
          subtitle: 'Default',
          isLast: true,
        ),
      ],
    );
  }

  // ── Accessibility Section ──

  Widget _buildAccessibilitySection(
      BuildContext context, AppearanceState state) {
    final cubit = context.read<AppearanceCubit>();
    return _buildSection(
      title: 'Accessibility',
      children: [
        _buildMenuRow(
          icon: Icons.accessibility_new_rounded,
          iconColor: AppColors.primary,
          title: 'Reduce Motion',
          subtitle: state.reduceMotion ? 'On' : 'Off',
          trailing: Switch(
            value: state.reduceMotion,
            onChanged: (v) => cubit.setReduceMotion(v),
            activeTrackColor: AppColors.primary,
          ),
          isLast: true,
        ),
      ],
    );
  }

  // ── Shared Widgets ──

  Widget _buildSection({
    required String title,
    required List<Widget> children,
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
      ],
    );
  }
}

// ── Standalone menu row used by all sub-widgets ──

Widget _buildMenuRow({
  required IconData icon,
  required Color iconColor,
  required String title,
  String? subtitle,
  Widget? trailing,
  bool isLast = false,
  VoidCallback? onTap,
}) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        borderRadius: isLast
            ? const BorderRadius.vertical(bottom: Radius.circular(16))
            : null,
        child: Padding(
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
                    if (subtitle != null)
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
              trailing ??
                  const Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: AppColors.mutedText,
                  ),
            ],
          ),
        ),
      ),
      if (!isLast) const Divider(height: 1, indent: 60),
    ],
  );
}

// ── Theme Row ──

class _ThemeRow extends StatelessWidget {
  final AppearanceState state;

  const _ThemeRow({required this.state});

  String _label(AppThemeOption option) {
    return switch (option) {
      AppThemeOption.light => 'Light',
      AppThemeOption.system => 'System',
    };
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppearanceCubit>();
    return _buildMenuRow(
      icon: Icons.light_mode_rounded,
      iconColor: AppColors.primary,
      title: 'Theme',
      subtitle: _label(state.themeMode),
      onTap: () => _showThemePicker(context, cubit),
    );
  }

  void _showThemePicker(BuildContext context, AppearanceCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8, left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Theme',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                ),
                ...AppThemeOption.values.map((option) {
                  final isSelected = state.themeMode == option;
                  return ListTile(
                    leading: Icon(
                      option == AppThemeOption.light
                          ? Icons.light_mode_rounded
                          : Icons.settings_brightness_rounded,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.mutedText,
                    ),
                    title: Text(_label(option)),
                    trailing: isSelected
                        ? const Icon(Icons.check_rounded,
                            color: AppColors.primary)
                        : null,
                    onTap: () {
                      cubit.setThemeMode(option);
                      Navigator.of(ctx).pop();
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

// ── Text Size Row ──

class _TextSizeRow extends StatelessWidget {
  final AppearanceState state;
  final bool isLast;

  const _TextSizeRow({required this.state, this.isLast = false});

  String _label(TextScaleOption option) {
    return switch (option) {
      TextScaleOption.small => 'Smaller',
      TextScaleOption.defaultScale => 'Default',
      TextScaleOption.large => 'Larger',
    };
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppearanceCubit>();
    return _buildMenuRow(
      icon: Icons.text_fields_rounded,
      iconColor: AppColors.foreground,
      title: 'Text Size',
      subtitle: _label(state.textScale),
      onTap: () => _showTextSizePicker(context, cubit),
      isLast: isLast,
    );
  }

  void _showTextSizePicker(BuildContext context, AppearanceCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.borderActive,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8, left: 20),
                  child: Row(
                    children: [
                      Text(
                        'Text Size',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.foreground,
                        ),
                      ),
                    ],
                  ),
                ),
                ...TextScaleOption.values.map((option) {
                  final isSelected = state.textScale == option;
                  return ListTile(
                    leading: Icon(
                      option == TextScaleOption.small
                          ? Icons.text_decrease_rounded
                          : option == TextScaleOption.large
                              ? Icons.text_increase_rounded
                              : Icons.text_fields_rounded,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.mutedText,
                    ),
                    title: Text(_label(option)),
                    trailing: isSelected
                        ? const Icon(Icons.check_rounded,
                            color: AppColors.primary)
                        : null,
                    onTap: () {
                      cubit.setTextScale(option);
                      Navigator.of(ctx).pop();
                    },
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
