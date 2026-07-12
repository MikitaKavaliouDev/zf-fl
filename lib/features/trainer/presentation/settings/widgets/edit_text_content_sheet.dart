import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../cubit/storefront_cubit.dart';
import '../../../cubit/storefront_state.dart';

/// Bottom sheet to edit a single text content field (aboutMe, philosophy,
/// methodology, or branding).
class EditTextContentSheet extends StatefulWidget {
  final String fieldName;
  final String initialContent;
  final String label;

  const EditTextContentSheet({
    super.key,
    required this.fieldName,
    required this.initialContent,
    this.label = 'Edit Content',
  });

  @override
  State<EditTextContentSheet> createState() => _EditTextContentSheetState();
}

class _EditTextContentSheetState extends State<EditTextContentSheet> {
  late final TextEditingController _controller;

  bool get _isValid => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialContent);
    _controller.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onFieldChanged);
    _controller.dispose();
    super.dispose();
  }

  void _onFieldChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return BlocListener<StorefrontCubit, StorefrontState>(
      listenWhen: (prev, curr) => curr is StorefrontError,
      listener: (context, state) {
        if (state is StorefrontError && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.borderActive,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    const Spacer(),
                    Text(
                      widget.label,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _isValid ? _save : null,
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1, color: AppColors.borderMuted),
              // Content field
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  key: const Key('editTextContent_contentField'),
                  controller: _controller,
                  maxLines: 8,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: _hintForField(widget.fieldName),
                    filled: true,
                    fillColor: AppColors.mutedSurface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.borderMuted),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _hintForField(String fieldName) {
    return switch (fieldName) {
      'aboutMe' => 'Tell clients about yourself...',
      'philosophy' => 'Your training philosophy...',
      'methodology' => 'Your training methodology...',
      'branding' => 'Branding description...',
      _ => 'Enter content...',
    };
  }

  Future<void> _save() async {
    await context.read<StorefrontCubit>().updateTextContent(
          fieldName: widget.fieldName,
          content: _controller.text.trim(),
        );
    if (mounted) Navigator.of(context).pop();
  }
}
