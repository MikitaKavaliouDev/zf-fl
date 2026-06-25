import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  int _selectedIndex = 0;

  static const _languages = [
    _Language('English', 'en'),
    _Language('Spanish', 'es'),
    _Language('French', 'fr'),
    _Language('German', 'de'),
    _Language('Italian', 'it'),
    _Language('Portuguese', 'pt'),
    _Language('Dutch', 'nl'),
    _Language('Polish', 'pl'),
    _Language('Russian', 'ru'),
    _Language('Japanese', 'ja'),
    _Language('Korean', 'ko'),
    _Language('Chinese (Simplified)', 'zh'),
    _Language('Chinese (Traditional)', 'zh-tw'),
    _Language('Arabic', 'ar'),
    _Language('Turkish', 'tr'),
    _Language('Vietnamese', 'vi'),
    _Language('Thai', 'th'),
    _Language('Indonesian', 'id'),
    _Language('Hindi', 'hi'),
    _Language('Swedish', 'sv'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const SizedBox(height: 8),
          _buildSection(
            title: 'App Language',
            children: [
              for (int i = 0; i < _languages.length; i++)
                _buildLanguageRow(
                  language: _languages[i],
                  isSelected: i == _selectedIndex,
                  isLast: i == _languages.length - 1,
                  onTap: () => setState(() => _selectedIndex = i),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              'Language preferences are currently managed locally. '
              'Server-side sync is coming soon.',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.mutedText.withValues(alpha: 0.7),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

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

  Widget _buildLanguageRow({
    required _Language language,
    required bool isSelected,
    required bool isLast,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Text(
                  language.name,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.foreground,
                  ),
                ),
                const Spacer(),
                if (isSelected)
                  const Icon(
                    Icons.check_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
              ],
            ),
          ),
          if (!isLast) const Divider(height: 1, indent: 16),
        ],
      ),
    );
  }
}

class _Language {
  final String name;
  final String code;

  const _Language(this.name, this.code);
}
