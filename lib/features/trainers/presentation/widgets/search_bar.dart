import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class TrainerSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const TrainerSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search trainers...',
          prefixIcon: const Icon(Icons.search_rounded),
          suffixIcon: controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded),
                  onPressed: onClear,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.mutedSurface,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
