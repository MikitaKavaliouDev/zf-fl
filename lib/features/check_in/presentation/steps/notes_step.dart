import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Step 3: Weekly notes — multi-line text editor.
///
/// Matches iOS NotesStep — CheckInWizardView.swift lines 548-598.
class NotesStep extends StatefulWidget {
  final String clientNotes;
  final ValueChanged<String> onNotesChanged;

  const NotesStep({
    super.key,
    required this.clientNotes,
    required this.onNotesChanged,
  });

  @override
  State<NotesStep> createState() => _NotesStepState();
}

class _NotesStepState extends State<NotesStep> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.clientNotes);
  }

  @override
  void didUpdateWidget(NotesStep oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.clientNotes != widget.clientNotes &&
        widget.clientNotes != _controller.text) {
      _controller.text = widget.clientNotes;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text(
            'Weekly Notes',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Anything else you want to tell your trainer?',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.mutedText,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _controller,
            maxLines: 8,
            maxLength: 2000,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              hintText: 'Share your thoughts, concerns, or highlights...',
              hintStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.borderMuted),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: AppColors.borderMuted),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: AppColors.borderActive,
                  width: 2,
                ),
              ),
              filled: true,
              fillColor: AppColors.mutedSurface,
              contentPadding: const EdgeInsets.all(16),
              counterStyle: const TextStyle(
                fontSize: 11,
                color: AppColors.mutedText,
              ),
            ),
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
            onChanged: widget.onNotesChanged,
          ),
        ],
      ),
    );
  }
}
