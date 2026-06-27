import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/more_cubit.dart';

class DataPrivacyScreen extends StatefulWidget {
  const DataPrivacyScreen({super.key});

  @override
  State<DataPrivacyScreen> createState() => _DataPrivacyScreenState();
}

class _DataPrivacyScreenState extends State<DataPrivacyScreen> {
  bool _isLoading = true;
  String? _error;
  bool _isSaving = false;

  // Privacy toggle values
  late bool _shareWorkoutHistory;
  late bool _shareBodyMeasurements;
  late bool _shareCheckinNotes;
  late bool _shareLocation;
  late bool _allowTrainerExport;
  int? _dataRetentionDays;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final settings = await context.read<MoreCubit>().loadPrivacySettings();
      setState(() {
        _shareWorkoutHistory = settings.shareWorkoutHistory;
        _shareBodyMeasurements = settings.shareBodyMeasurements;
        _shareCheckinNotes = settings.shareCheckinNotes;
        _shareLocation = settings.shareLocation;
        _allowTrainerExport = settings.allowTrainerExport;
        _dataRetentionDays = settings.dataRetentionDays;
        _isLoading = false;
      });
    } catch (e) {
      developer.log('Failed to load privacy settings: $e', name: 'data_privacy');
      setState(() {
        _error = 'Failed to load privacy settings.';
        _isLoading = false;
      });
    }
  }

  Future<void> _saveSettings() async {
    setState(() => _isSaving = true);
    try {
      final updates = <String, dynamic>{
        'shareWorkoutHistory': _shareWorkoutHistory,
        'shareBodyMeasurements': _shareBodyMeasurements,
        'shareCheckinNotes': _shareCheckinNotes,
        'shareLocation': _shareLocation,
        'allowTrainerExport': _allowTrainerExport,
        'dataRetentionDays': _dataRetentionDays,
      };
      await context.read<MoreCubit>().updatePrivacySettings(updates);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Privacy settings saved.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      developer.log('Failed to save privacy settings: $e', name: 'data_privacy');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to save settings. Please try again.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data & Privacy'),
        actions: [
          if (!_isLoading)
            TextButton(
              onPressed: _isSaving ? null : _saveSettings,
              child: _isSaving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save'),
            ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
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
                _error!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _loadSettings,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        const SizedBox(height: 8),

        // ── Data Shared with Trainer ──
        _buildSection(
          title: 'Data Shared with Trainer',
          footer:
              'Your trainer needs access to your workout history to create and adjust your training programs. Other data is optional.',
          children: [
            _buildToggleRow(
              icon: Icons.fitness_center_rounded,
              iconColor: AppColors.primary,
              title: 'Workout History',
              subtitle: 'Exercises, sets, reps, weights, and session completion',
              value: _shareWorkoutHistory,
              onChanged: (v) => setState(() => _shareWorkoutHistory = v),
              required_: true,
            ),
            _buildToggleRow(
              icon: Icons.monitor_weight_outlined,
              iconColor: Colors.purple,
              title: 'Body Measurements',
              subtitle: 'Weight, height, and body stats tracked in check-ins',
              value: _shareBodyMeasurements,
              onChanged: (v) => setState(() => _shareBodyMeasurements = v),
            ),
            _buildToggleRow(
              icon: Icons.note_alt_outlined,
              iconColor: Colors.orange,
              title: 'Check-in Notes',
              subtitle: 'Mood, energy levels, sleep quality, and personal notes',
              value: _shareCheckinNotes,
              onChanged: (v) => setState(() => _shareCheckinNotes = v),
            ),
            _buildToggleRow(
              icon: Icons.location_on_outlined,
              iconColor: Colors.green,
              title: 'Location',
              subtitle: 'Share your location for nearby recommendations',
              value: _shareLocation,
              onChanged: (v) => setState(() => _shareLocation = v),
            ),
            _buildToggleRow(
              icon: Icons.file_download_outlined,
              iconColor: Colors.teal,
              title: 'Allow Trainer Export',
              subtitle: 'Let your trainer export your data',
              value: _allowTrainerExport,
              onChanged: (v) => setState(() => _allowTrainerExport = v),
              isLast: true,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // ── Data Retention ──
        _buildSection(
          title: 'Data Retention',
          footer: _dataRetentionDays == null
              ? 'Your data is kept indefinitely.'
              : 'Training data older than $_dataRetentionDays days will be automatically deleted.',
          children: [
            _buildRetentionPicker(isLast: true),
          ],
        ),

        const SizedBox(height: 24),

        // ── Links ──
        _buildSection(
          title: 'Learn More',
          children: [
            _buildLinkRow(
              icon: Icons.privacy_tip_outlined,
              iconColor: AppColors.primary,
              title: 'Privacy Policy',
              url: 'https://ziro.fit/privacy-policy',
            ),
            _buildLinkRow(
              icon: Icons.info_outline_rounded,
              iconColor: AppColors.primary,
              title: 'How Your Data Is Used',
              url: 'https://ziro.fit/data-usage',
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

  Widget _buildToggleRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool required_ = false,
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
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.foreground,
                          ),
                        ),
                        if (required_)
                          Container(
                            margin: const EdgeInsets.only(left: 6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Required',
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.mutedText,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              if (required_)
                const Icon(
                  Icons.lock_rounded,
                  size: 18,
                  color: AppColors.mutedText,
                )
              else
                Switch(
                  value: value,
                  onChanged: onChanged,
                  activeTrackColor: AppColors.primary,
                ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 64),
      ],
    );
  }

  Widget _buildRetentionPicker({
    bool isLast = false,
  }) {
    const options = [90, 180, 365, 730, null];
    String label(int? days) {
      switch (days) {
        case 90:
          return '3 Months';
        case 180:
          return '6 Months';
        case 365:
          return '1 Year';
        case 730:
          return '2 Years';
        case null:
          return 'Indefinitely';
        default:
          return '$days days';
      }
    }

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
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.schedule_rounded,
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Retention Period',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.foreground,
                ),
              ),
              const Spacer(),
              DropdownButton<int?>(
                value: _dataRetentionDays,
                underline: const SizedBox(),
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primary,
                ),
                items: options.map((days) {
                  return DropdownMenuItem<int?>(
                    value: days,
                    child: Text(label(days)),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() => _dataRetentionDays = v);
                },
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 64),
      ],
    );
  }

  Widget _buildLinkRow({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String url,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
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
                  Icons.open_in_new_rounded,
                  size: 18,
                  color: AppColors.mutedText,
                ),
              ],
            ),
          ),
          if (!isLast) const Divider(height: 1, indent: 60),
        ],
      ),
    );
  }
}
