import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/cubit/auth_cubit.dart';
import '../../../auth/cubit/auth_state.dart';

/// Full-screen Digital Business Card.
///
/// Matches iOS TrainQRCodeView (MoreView.swift lines 692-838):
///   - Centered card with trainer name, subtitle, QR code, avatar
///   - Share button in trailing of AppBar
///   - QR encodes `https://ziro.fit/trainer/{username}`
class DigitalBusinessCardScreen extends StatelessWidget {
  const DigitalBusinessCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Digital Business Card'),
        centerTitle: true,
        actions: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final username = state is AuthAuthenticated
                  ? state.user.username
                  : null;
              return IconButton(
                icon: const Icon(Icons.share_rounded),
                onPressed: username == null
                    ? null
                    : () => _shareProfile(context, username),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is! AuthAuthenticated) {
            return const Center(
              child: Text(
                'Sign in to view your business card',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
            );
          }

          final user = state.user;
          final name = user.name ?? 'Trainer';
          final username = user.username;
          final profilePhotoPath = user.profilePhotoPath;

          if (username == null) {
            return const Center(
              child: Text(
                'Set a username to generate your business card',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.mutedText,
                ),
              ),
            );
          }

          final profileUrl = 'https://ziro.fit/trainer/$username';

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 340),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Name
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Subtitle
                        const Text(
                          'Fitness Professional',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 32),
                        // QR Code
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: QrImageView(
                            data: profileUrl,
                            version: QrVersions.auto,
                            size: 220,
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(12),
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: AppColors.foreground,
                            ),
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: AppColors.foreground,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Profile URL hint
                        Text(
                          profileUrl,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 11,
                            color: AppColors.mutedText,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Avatar overlay hint
                  if (profilePhotoPath != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(profilePhotoPath),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Profile photo will appear\nin the center of the QR code',
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _shareProfile(BuildContext context, String username) {
    final url = 'https://ziro.fit/trainer/$username';
    Clipboard.setData(ClipboardData(text: url));
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile URL copied to clipboard'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
