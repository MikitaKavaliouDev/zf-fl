import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/cubit/auth_cubit.dart';
import '../../../auth/cubit/auth_state.dart';
import '../../../notifications/cubit/notifications_cubit.dart';

/// Floating header that sits above the home scroll content.
///
/// Matches iOS ZiroHeader — PersonalHomeView.swift lines 77-102.
/// Layout: [Avatar circle] [User name] [Spacer] [Bell icon]
class ZiroHeader extends StatelessWidget {
  const ZiroHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final unreadCount = context.watch<NotificationsCubit>().unreadCount;
    final userName = switch (authState) {
      AuthAuthenticated(:final user) => user.name ?? 'Athlete',
      _ => 'Home',
    };
    final avatarUrl = switch (authState) {
      AuthAuthenticated(:final user) => user.profilePhotoPath,
      _ => null,
    };

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.75),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Row(
            children: [
              // Avatar circle
              GestureDetector(
                onTap: () => context.go('/profile'),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primary,
                  backgroundImage:
                      avatarUrl != null ? NetworkImage(avatarUrl) : null,
                  child: avatarUrl == null
                      ? Text(
                          userName.isNotEmpty
                              ? userName[0].toUpperCase()
                              : '?',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 10),
              // User name
              Expanded(
                child: Text(
                  userName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
              ),
              // Bell icon
              GestureDetector(
                onTap: () => context.go('/home/notifications'),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        size: 22,
                        color: AppColors.foreground,
                      ),
                      // Red dot badge (shown when unread notifications exist)
                      if (unreadCount > 0)
                        Positioned(
                          top: -2,
                          right: -2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
