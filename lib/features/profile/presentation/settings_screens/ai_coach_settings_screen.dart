import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/network/response_cache.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../voice_coach/data/models/voice_settings_dto.dart';
import '../../../voice_coach/data/services/voice_settings_api_service.dart';

/// AI Coach settings screen with voice selection and configuration.
///
/// Mirrors the iOS voice settings screen.
/// Fetches available voices from the backend and lets users pick
/// their preferred voice for the ElevenLabs Conversational AI Agent.
class AiCoachSettingsScreen extends StatefulWidget {
  const AiCoachSettingsScreen({super.key});

  @override
  State<AiCoachSettingsScreen> createState() => _AiCoachSettingsScreenState();
}

class _AiCoachSettingsScreenState extends State<AiCoachSettingsScreen> {
  final _apiService = getIt<VoiceSettingsApiService>();
  final _cache = getIt<ResponseCache>();
  static const _settingsCacheKey = 'voice:settings';

  bool _isLoading = true;
  String? _errorMessage;

  List<VoiceDto> _voices = [];
  String? _selectedVoiceId;
  late VoiceSettingsValues _settings;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _settings = const VoiceSettingsValues();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // 1. Check cache first
    final cachedSettings = await _cache.get<VoiceSettingsResponseDto>(
      _settingsCacheKey,
      VoiceSettingsResponseDto.fromJson,
    );
    if (cachedSettings != null) {
      setState(() {
        _selectedVoiceId = cachedSettings.voiceId;
        _settings = cachedSettings.settings ?? const VoiceSettingsValues();
        _isLoading = false;
      });
    }

    // 2. Try network — always attempt to refresh
    try {
      final results = await Future.wait([
        _apiService.getVoiceSettings(),
        _apiService.getAvailableVoices(),
      ]);

      final voiceSettings = results[0] as VoiceSettingsResponseDto;
      final voices = results[1] as List<VoiceDto>;

      // Update cache with fresh data
      await _cache.set(_settingsCacheKey, voiceSettings.toJson());

      setState(() {
        _selectedVoiceId = voiceSettings.voiceId;
        _settings = voiceSettings.settings ?? const VoiceSettingsValues();
        _voices = voices;
        _isLoading = false;
        _errorMessage = null;
      });
    } catch (e) {
      developer.log('[AICoachSettings] Failed to load: $e', name: 'settings');
      if (cachedSettings == null) {
        // No cache and network failed — show error
        setState(() {
          _isLoading = false;
          _errorMessage =
              'Failed to load voice settings. Check your connection.';
        });
      }
      // If cache was available, we already showed it — no error needed
    }
  }

  Future<void> _saveSettings() async {
    if (_selectedVoiceId == null) return;

    setState(() => _hasChanges = false);

    try {
      final updated = await _apiService.updateVoiceSettings(
        voiceId: _selectedVoiceId!,
        settings: _settings,
      );
      // Update cache after save
      await _cache.set(_settingsCacheKey, updated.toJson());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Voice settings saved'),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      developer.log('[AICoachSettings] Failed to save: $e', name: 'settings');
      setState(() => _hasChanges = true);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to save settings'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Coach Settings'),
        actions: [
          if (_hasChanges)
            TextButton(
              onPressed: _saveSettings,
              child: const Text('Save'),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? _buildError()
              : _buildContent(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.cloud_off_rounded, size: 48, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              _errorMessage!,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.mutedText),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        const SizedBox(height: 8),

        // ── Voice Selection ──
        _buildSection(
          title: 'Coach Voice',
          children: [
            _buildVoiceSelector(),
          ],
        ),

        const SizedBox(height: 24),

        // ── Voice Settings ──
        _buildSection(
          title: 'Voice Settings',
          children: [
            _buildSliderRow(
              label: 'Stability',
              subtitle: 'Lower = more emotional, Higher = more consistent',
              value: _settings.stability,
              onChanged: (v) {
                setState(() {
                  _settings = _settings.copyWith(stability: v);
                  _hasChanges = true;
                });
              },
            ),
            _buildSliderRow(
              label: 'Similarity Boost',
              subtitle: 'How closely to match the original voice',
              value: _settings.similarityBoost,
              onChanged: (v) {
                setState(() {
                  _settings = _settings.copyWith(similarityBoost: v);
                  _hasChanges = true;
                });
              },
            ),
            _buildSliderRow(
              label: 'Style',
              subtitle: 'Style exaggeration',
              value: _settings.style,
              onChanged: (v) {
                setState(() {
                  _settings = _settings.copyWith(style: v);
                  _hasChanges = true;
                });
              },
            ),
            _buildSliderRow(
              label: 'Speed',
              subtitle: 'Speech speed',
              value: _settings.speed,
              min: 0.5,
              max: 2.0,
              onChanged: (v) {
                setState(() {
                  _settings = _settings.copyWith(speed: v);
                  _hasChanges = true;
                });
              },
              isLast: true,
            ),
          ],
        ),

        const SizedBox(height: 24),

        // ── Info ──
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            'This voice is used by the AI Coach during your workouts. '
            'Changes are synced across all your devices.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.mutedText.withValues(alpha: 0.7),
            ),
          ),
        ),

        const SizedBox(height: 32),
      ],
    );
  }

  // ── Voice Selector ──

  Widget _buildVoiceSelector() {
    final selectedVoice = _voices.where((v) => v.voiceId == _selectedVoiceId);

    return InkWell(
      onTap: _showVoicePicker,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.record_voice_over_rounded,
                size: 22,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedVoice.isNotEmpty
                        ? selectedVoice.first.name
                        : _selectedVoiceId ?? 'Default Voice',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    _voices.length > 1
                        ? '${_voices.length} voices available'
                        : 'Loading voices...',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.mutedText,
            ),
          ],
        ),
      ),
    );
  }

  void _showVoicePicker() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.85,
          minChildSize: 0.3,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Voice',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _voices.length,
                    separatorBuilder: (_, _) =>
                        const Divider(height: 1, indent: 60),
                    itemBuilder: (context, index) {
                      final voice = _voices[index];
                      final isSelected =
                          voice.voiceId == _selectedVoiceId;
                      return ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary.withValues(alpha: 0.15)
                                : AppColors.mutedSurface,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            isSelected
                                ? Icons.radio_button_checked
                                : Icons.record_voice_over_rounded,
                            size: 20,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.mutedText,
                          ),
                        ),
                        title: Text(
                          voice.name,
                          style: TextStyle(
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                        ),
                        subtitle: voice.description != null
                            ? Text(
                                voice.description!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              )
                            : null,
                        trailing: isSelected
                            ? const Icon(Icons.check_circle_rounded,
                                color: AppColors.primary, size: 22)
                            : null,
                        onTap: () {
                          setState(() {
                            _selectedVoiceId = voice.voiceId;
                            _hasChanges = true;
                          });
                          Navigator.of(ctx).pop();
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ── Shared UI Builders ──

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

  Widget _buildSliderRow({
    required String label,
    required String subtitle,
    required double value,
    required ValueChanged<double> onChanged,
    double min = 0.0,
    double max = 1.0,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.foreground,
                    ),
                  ),
                  Text(
                    value.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.mutedText,
                    ),
                  ),
                ],
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            divisions: 100,
            activeColor: AppColors.primary,
            onChanged: onChanged,
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 60),
      ],
    );
  }
}
