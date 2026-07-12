import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../cubit/storefront_cubit.dart';
import '../../../cubit/storefront_state.dart';

/// Bottom sheet to add a new social link.
class SocialLinkFormSheet extends StatefulWidget {
  const SocialLinkFormSheet({super.key});

  @override
  State<SocialLinkFormSheet> createState() => _SocialLinkFormSheetState();
}

class _SocialLinkFormSheetState extends State<SocialLinkFormSheet> {
  late final TextEditingController _platformController;
  late final TextEditingController _usernameController;
  late final TextEditingController _urlController;

  bool get _isValid =>
      _platformController.text.trim().isNotEmpty &&
      _usernameController.text.trim().isNotEmpty &&
      _urlController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _platformController = TextEditingController();
    _usernameController = TextEditingController();
    _urlController = TextEditingController();
    _platformController.addListener(_onFieldChanged);
    _usernameController.addListener(_onFieldChanged);
    _urlController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _platformController.removeListener(_onFieldChanged);
    _usernameController.removeListener(_onFieldChanged);
    _urlController.removeListener(_onFieldChanged);
    _platformController.dispose();
    _usernameController.dispose();
    _urlController.dispose();
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
                    const Text(
                      'Add Social Link',
                      style: TextStyle(
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
              // Form fields
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildField('Platform *', _platformController,
                        hint: 'e.g. Instagram, YouTube, TikTok',
                        key: const Key('socialLink_platformField')),
                    const SizedBox(height: 16),
                    _buildField('Username *', _usernameController,
                        hint: 'Your handle on the platform',
                        key: const Key('socialLink_usernameField')),
                    const SizedBox(height: 16),
                    _buildField('Profile URL *', _urlController,
                        hint: 'https://instagram.com/yourhandle',
                        keyboardType: TextInputType.url,
                        key: const Key('socialLink_urlField')),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller, {
    Key? key,
    String? hint,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          key: key,
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: AppColors.mutedSurface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderMuted),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _save() async {
    await context.read<StorefrontCubit>().createSocialLink(
          platform: _platformController.text.trim(),
          username: _usernameController.text.trim(),
          profileUrl: _urlController.text.trim(),
        );
    if (mounted) Navigator.of(context).pop();
  }
}
