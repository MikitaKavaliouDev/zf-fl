import 'dart:developer' as developer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/error_widget.dart';

import '../../../../core/network/image_url_helper.dart';
import '../../../../core/theme/app_theme.dart';
import '../../cubit/profile_config_cubit.dart';
import '../../cubit/profile_config_state.dart';

/// Profile configuration / edit screen.
///
/// Matches Next.js [ClientProfileEditor] — allows editing:
/// - Profile photo (avatar upload)
/// - Display name
/// - Username
/// - Phone number
/// - Weight unit (KG / LB)
/// - About Me (bio)
class ProfileConfigScreen extends StatefulWidget {
  const ProfileConfigScreen({super.key});

  @override
  State<ProfileConfigScreen> createState() => _ProfileConfigScreenState();
}

class _ProfileConfigScreenState extends State<ProfileConfigScreen> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bioController = TextEditingController();

  String _weightUnit = 'KG';
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileConfigCubit>().loadProfile();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _initForm(ProfileConfigLoaded state) {
    if (_isInitialized) return;
    _nameController.text = state.coreInfo.name;
    _usernameController.text = state.coreInfo.username;
    _phoneController.text = state.coreInfo.phone ?? '';
    _bioController.text =
        state.coreInfo.aboutMe ?? state.textContent?.aboutMe ?? '';
    _weightUnit = state.coreInfo.weightUnit;
    _isInitialized = true;

    // Listen for changes
    _nameController.addListener(_onFieldChanged);
    _usernameController.addListener(_onFieldChanged);
    _phoneController.addListener(_onFieldChanged);
    _bioController.addListener(_onFieldChanged);
  }

  void _onFieldChanged() {
    context.read<ProfileConfigCubit>().markChanged();
  }

  Future<void> _handleSave() async {
    final name = _nameController.text.trim();
    final username = _usernameController.text.trim();
    final phone = _phoneController.text.trim();
    final bio = _bioController.text.trim();

    // Validate
    if (name.length < 2) {
      _showError('Name must be at least 2 characters.');
      return;
    }
    if (username.length < 3) {
      _showError('Username must be at least 3 characters.');
      return;
    }
    if (!RegExp(r'^[a-z0-9-]+$').hasMatch(username)) {
      _showError(
        'Username can only contain lowercase letters, numbers, and hyphens.',
      );
      return;
    }

    try {
      await context.read<ProfileConfigCubit>().saveCoreInfo(
        name: name,
        username: username,
        phone: phone.isNotEmpty ? phone : null,
        weightUnit: _weightUnit,
      );
      if (!mounted) return;
      await context.read<ProfileConfigCubit>().saveTextContent(bio);
      if (!mounted) return;
      context.read<ProfileConfigCubit>().emitSaveSuccess('Profile updated successfully!');
    } catch (e) {
      _showError('Failed to save profile. Please try again.');
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _handleAvatarUpload() async {
    try {
      final filePath = await context.read<ProfileConfigCubit>().pickImage();
      if (filePath == null) return;
      if (!mounted) return;
      await context.read<ProfileConfigCubit>().uploadAvatar(filePath);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile photo updated!'),
          backgroundColor: Color(0xFF22C55E),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      developer.log('Avatar upload failed: $e', name: 'profile');
      if (!mounted) return;
      _showError('Failed to upload photo. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileConfigCubit, ProfileConfigState>(
        listener: (context, state) {
          if (state is ProfileConfigSaveSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: const Color(0xFF22C55E),
                behavior: SnackBarBehavior.floating,
              ),
            );
            // Re-emit loaded state so the form doesn't stay on "save success"
            context.read<ProfileConfigCubit>().loadProfile();
          }
          if (state is ProfileConfigError) {
            _showError(state.message);
          }
        },
        builder: (context, state) {
          return switch (state) {
            ProfileConfigInitial() || ProfileConfigLoading() =>
              const Center(child: CircularProgressIndicator()),
            ProfileConfigError(:final message) => _buildError(message),
            ProfileConfigLoaded() => _buildForm(state),
            ProfileConfigSaveSuccess() => const SizedBox.shrink(),
          };
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return ZiroErrorWidget(
      message: message,
      onRetry: () => context.read<ProfileConfigCubit>().loadProfile(),
    );
  }

  Widget _buildForm(ProfileConfigLoaded state) {
    _initForm(state);

    final hasUnsaved = state.hasUnsavedChanges;
    final isSaving = state.isSaving;
    final avatarUrl = state.avatarUrl;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Avatar Section ──
          _buildAvatarSection(avatarUrl),

          const SizedBox(height: 24),

          // ── Identity Section ──
          _buildSectionHeader('Identity'),
          const SizedBox(height: 12),
          _buildIdentityFields(),

          const SizedBox(height: 24),

          // ── Contact & Preferences Section ──
          _buildSectionHeader('Contact & Preferences'),
          const SizedBox(height: 12),
          _buildContactFields(),

          const SizedBox(height: 24),

          // ── About Me Section ──
          _buildSectionHeader('About Me'),
          const SizedBox(height: 12),
          _buildBioField(),

          const SizedBox(height: 32),

          // ── Save Button ──
          _buildSaveButton(hasUnsaved, isSaving),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.foreground,
      ),
    );
  }

  // ── Avatar ──

  Widget _buildAvatarSection(String? avatarUrl) {
    final resolvedUrl = resolveImageUrl(avatarUrl);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          // Avatar preview
          GestureDetector(
            onTap: _handleAvatarUpload,
            child: Stack(
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.mutedSurface,
                    border: Border.all(
                      color: AppColors.borderMuted,
                      width: 2,
                    ),
                  ),
                  child: resolvedUrl.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(36),
                          child: CachedNetworkImage(
                            imageUrl: resolvedUrl,
                            fit: BoxFit.cover,
                            errorWidget: (_, _, _) => const Icon(
                              Icons.person_rounded,
                              size: 36,
                              color: AppColors.mutedText,
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.person_rounded,
                          size: 36,
                          color: AppColors.mutedText,
                        ),
                ),
                // Camera overlay
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile Photo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Tap to change. JPG, PNG, WebP or GIF. Max 5MB.',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Identity Fields ──

  Widget _buildIdentityFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'Display Name',
            hint: 'Your Name',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _usernameController,
            label: 'Username',
            hint: 'your-username',
            helperText: 'Only lowercase letters, numbers, and hyphens.',
            icon: Icons.alternate_email_rounded,
          ),
        ],
      ),
    );
  }

  // ── Contact & Preferences ──

  Widget _buildContactFields() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        children: [
          _buildTextField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: '+1 (555) 123-4567',
            keyboardType: TextInputType.phone,
            icon: Icons.phone_outlined,
          ),
          const SizedBox(height: 16),
          // Weight Unit selector
          _buildWeightUnitSelector(),
        ],
      ),
    );
  }

  Widget _buildWeightUnitSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.monitor_weight_outlined,
              size: 18,
              color: AppColors.mutedText,
            ),
            SizedBox(width: 8),
            Text(
              'Preferred Weight Unit',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _weightUnit = 'KG');
                      context.read<ProfileConfigCubit>().markChanged();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _weightUnit == 'KG'
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(9),
                          bottomLeft: Radius.circular(9),
                        ),
                      ),
                      child: Text(
                        'Kilograms (kg)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _weightUnit == 'KG'
                              ? Colors.white
                              : AppColors.mutedText,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 24,
                  color: AppColors.borderMuted,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _weightUnit = 'LB');
                      context.read<ProfileConfigCubit>().markChanged();
                    },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: _weightUnit == 'LB'
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(9),
                        bottomRight: Radius.circular(9),
                      ),
                    ),
                    child: Text(
                      'Pounds (lb)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _weightUnit == 'LB'
                            ? Colors.white
                            : AppColors.mutedText,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Bio ──

  Widget _buildBioField() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _bioController,
            maxLines: 5,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.foreground,
            ),
            decoration: InputDecoration(
              hintText:
                  'Tell your trainer and others a bit about yourself, your goals, and your fitness journey...',
              hintStyle: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderMuted),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderMuted),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.all(14),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'This will be visible to your trainer.',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ),
    );
  }

  // ── Reusable Text Field ──

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    String? helperText,
    TextInputType? keyboardType,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: AppColors.mutedText),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.foreground,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.foreground,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderMuted),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.borderMuted),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
            contentPadding: const EdgeInsets.all(14),
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            helperText,
            style: const TextStyle(
              fontSize: 11,
              color: AppColors.mutedText,
            ),
          ),
        ],
      ],
    );
  }

  // ── Save Button ──

  Widget _buildSaveButton(bool hasUnsaved, bool isSaving) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          // Status indicator
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: hasUnsaved
                        ? const Color(0xFFF59E0B)
                        : const Color(0xFF22C55E),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  hasUnsaved ? 'Unsaved changes' : 'All changes saved',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: hasUnsaved
                        ? const Color(0xFFF59E0B)
                        : AppColors.mutedText,
                  ),
                ),
              ],
            ),
          ),
          // Save button
          SizedBox(
            height: 44,
            child: ElevatedButton(
              onPressed:
                  (isSaving || !hasUnsaved) ? null : _handleSave,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: AppColors.borderMuted,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Save Changes',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
