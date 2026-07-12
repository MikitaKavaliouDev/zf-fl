import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';

/// Device permission management screen.
///
/// Mirrors the iOS `PermissionsSettingsView` — shows the current status
/// of device-level permissions (camera, location, notifications, photos)
/// and provides a button to open system settings.
///
/// All data is read-only from the device. No backend calls.
class PermissionsSettingsScreen extends StatelessWidget {
  const PermissionsSettingsScreen({Key? key}) : super(key: key ?? const ValueKey('permissionsSettingsScreen'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          const SizedBox(height: 8),
          _buildSection(
            title: 'Device Permissions',
            footer:
                'ZIRO.FIT uses these permissions to provide the best experience. '
                'You can change them at any time in your device settings.',
            children: const [
              _PermissionRow(
                icon: Icons.camera_alt_rounded,
                iconColor: Colors.green,
                title: 'Camera',
                subtitle: 'Take check-in photos and progress pictures',
                permission: 'camera',
              ),
              _PermissionRow(
                icon: Icons.location_on_rounded,
                iconColor: AppColors.primary,
                title: 'Location',
                subtitle: 'Find nearby trainers and events',
                permission: 'location',
              ),
              _PermissionRow(
                icon: Icons.notifications_rounded,
                iconColor: Colors.orange,
                title: 'Notifications',
                subtitle: 'Get reminded about workouts and messages',
                permission: 'notifications',
              ),
              _PermissionRow(
                icon: Icons.photo_library_rounded,
                iconColor: Colors.purple,
                title: 'Photos',
                subtitle: 'Save workout photos and share progress',
                permission: 'photos',
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildOpenSettingsSection(),
          const SizedBox(height: 32),
        ],
      ),
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

  Widget _buildOpenSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            'Need to change permissions?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.mutedText,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: _openAppSettings,
            icon: const Icon(Icons.settings_rounded, size: 20),
            label: const Text('Open System Settings'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.card,
              foregroundColor: AppColors.primary,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: AppColors.borderMuted),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _openAppSettings() async {
    final uri = Uri.parse(
      Platform.isIOS
          ? 'app-settings:'
          : 'android.settings.APPLICATION_DETAILS_SETTINGS',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

/// A single permission row showing icon, description, and status badge.
class _PermissionRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String permission;
  final bool isLast;

  const _PermissionRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.permission,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    // Show a "Granted" / "Not Granted" placeholder status.
    // Actual permission status requires permission_handler plugin.
    // This is a UI placeholder matching the iOS PermissionsSettingsView layout.
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
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.foreground,
                      ),
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.mutedSurface,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Granted',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.mutedText,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isLast) const Divider(height: 1, indent: 64),
      ],
    );
  }
}
