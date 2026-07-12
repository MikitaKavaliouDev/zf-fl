import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_theme.dart';
import '../../../cubit/storefront_cubit.dart';
import '../../../cubit/storefront_state.dart';
import '../../../data/models/storefront_profile_dto.dart';

/// Bottom sheet to edit the trainer's core profile info (name, username,
/// specialties, certifications).
class EditProfileSheet extends StatefulWidget {
  final StorefrontProfileDto profile;

  const EditProfileSheet({super.key, required this.profile});

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _usernameController;
  late final TextEditingController _specialtiesController;
  late final TextEditingController _certificationsController;

  bool get _isValid => _nameController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _usernameController = TextEditingController(
      text: widget.profile.username ?? '',
    );
    _specialtiesController = TextEditingController(
      text: widget.profile.specialties.isNotEmpty
          ? widget.profile.specialties.join(', ')
          : '',
    );
    _certificationsController = TextEditingController(
      text: widget.profile.certifications ?? '',
    );
    // Listen for validation updates
    _nameController.addListener(_onFieldChanged);
    _usernameController.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _nameController.removeListener(_onFieldChanged);
    _usernameController.removeListener(_onFieldChanged);
    _nameController.dispose();
    _usernameController.dispose();
    _specialtiesController.dispose();
    _certificationsController.dispose();
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
                      'Edit Profile',
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
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildField('Name *', _nameController, key: const Key('editProfile_nameField')),
                    const SizedBox(height: 16),
                    _buildField('Username', _usernameController, key: const Key('editProfile_usernameField')),
                    const SizedBox(height: 16),
                    _buildField(
                      'Specialties',
                      _specialtiesController,
                      hint: 'Comma-separated (e.g. Strength, HIIT, Yoga)',
                      key: const Key('editProfile_specialtiesField'),
                    ),
                    const SizedBox(height: 16),
                    _buildField(
                      'Certifications',
                      _certificationsController,
                      maxLines: 3,
                      key: const Key('editProfile_certificationsField'),
                    ),
                    const SizedBox(height: 24),
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
    int maxLines = 1,
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
          maxLines: maxLines,
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
    final specialtiesStr = _specialtiesController.text.trim();
    final specialties = specialtiesStr.isNotEmpty
        ? specialtiesStr.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList()
        : <String>[];

    await context.read<StorefrontCubit>().updateCoreInfo(
          name: _nameController.text.trim(),
          username: _usernameController.text.trim(),
          certifications: _certificationsController.text.trim().isNotEmpty
              ? _certificationsController.text.trim()
              : null,
          specialties: specialties,
        );
    if (mounted) Navigator.of(context).pop();
  }
}
