import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../auth/cubit/auth_cubit.dart';
import '../../../auth/cubit/auth_state.dart';
import '../../cubit/trainer_add_client_cubit.dart';
import '../../cubit/trainer_add_client_state.dart';

/// Trainer "Add Client" screen with QR code card + email invitation.
///
/// Mirrors iOS `AddClientView` layout and behavior:
/// - Segmented control: "QR Code" / "Email"
/// - QR tab: premium card with avatar, name, username, share link
/// - Email tab: input field with validation, invite button, error states
/// - Success overlay on completion
class TrainerAddClientScreen extends StatefulWidget {
  const TrainerAddClientScreen({super.key});

  @override
  State<TrainerAddClientScreen> createState() =>
      _TrainerAddClientScreenState();
}

class _TrainerAddClientScreenState extends State<TrainerAddClientScreen> {
  int _selectedTab = 0; // 0 = QR Code, 1 = Email
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  bool _showSuccess = false;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  bool get _isValidEmail {
    final email = _emailController.text.trim();
    if (email.isEmpty) return false;
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  void _onSendInvitation() {
    _emailFocusNode.unfocus();
    final email = _emailController.text.trim();
    if (!_isValidEmail) return;
    context.read<TrainerAddClientCubit>().inviteByEmail(email);
  }

  void _onRequestLink(String email) {
    context.read<TrainerAddClientCubit>().requestLink(email);
  }

  void _onShareLink(String profileUrl) {
    Clipboard.setData(ClipboardData(text: profileUrl));
    developer.log('Profile link copied: $profileUrl', name: 'trainer');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile link copied to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrainerAddClientCubit, TrainerAddClientState>(
      listener: (context, state) {
        if (state is TrainerAddClientEmailAlreadyExists) {
          final email = _emailController.text.trim();
          _showUserExistsDialog(email);
        } else if (state is TrainerAddClientLinkAlreadyPending) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('This client is already in your list.'),
                backgroundColor: Colors.orange,
              ),
            );
          }
        } else if (state is TrainerAddClientLimitReached) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Client limit reached. Upgrade your plan to add more clients.',
                ),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        } else if (state is TrainerAddClientLoaded) {
          setState(() => _showSuccess = true);
        } else if (state is TrainerAddClientError) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: Text(_showSuccess ? '' : 'New Client'),
            leading: IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => context.pop(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _showSuccess ? _buildSuccessView() : _buildInputForm(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInputForm() {
    final state = context.watch<TrainerAddClientCubit>().state;
    final isLoading = state is TrainerAddClientLoading;

    return Column(
      key: const ValueKey('input_form'),
      children: [
        const SizedBox(height: 16),
        // Segmented control
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 0, label: Text('QR Code')),
            ButtonSegment(value: 1, label: Text('Email')),
          ],
          selected: {_selectedTab},
          onSelectionChanged: (selected) {
            setState(() => _selectedTab = selected.first);
          },
          style: SegmentedButton.styleFrom(
            foregroundColor: AppColors.foreground,
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: AppColors.primary,
            backgroundColor: AppColors.mutedSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(99),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: _selectedTab == 0 ? _buildQrCodeTab() : _buildEmailTab(isLoading),
        ),
      ],
    );
  }

  // ── TAB 1: QR Code ──

  Widget _buildQrCodeTab() {
    final authState = context.watch<AuthCubit>().state;
    final user = authState is AuthAuthenticated ? authState.user : null;

    final name = user?.name ?? 'Professional';
    final username = user?.username ?? user?.id ?? '';
    final initials = (user?.name?.isNotEmpty == true)
        ? user!.name![0].toUpperCase()
        : '?';
    final profileUrl = 'https://ziro.fit/trainer/$username';

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Instruction text
          Text(
            'Let your client scan this QR code to connect '
            'instantly on their device.',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          // Premium-style QR card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mutedSurface,
                  AppColors.borderMuted,
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.borderMuted),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Fitness Professional',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                // QR code placeholder with avatar overlay
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // QR placeholder
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppColors.borderMuted,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.qr_code_rounded,
                            size: 120,
                            color: AppColors.foreground.withValues(alpha: 0.85),
                          ),
                        ),
                      ),
                      // Overlapping avatar
                      Positioned(
                        bottom: 4,
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary.withValues(alpha: 0.1),
                            border: Border.all(
                              color: Colors.white,
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.12),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              initials,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // @username
                Text(
                  '@$username',
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedText,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Share link button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: FilledButton.icon(
              onPressed: () => _onShareLink(profileUrl),
              icon: const Icon(Icons.ios_share_rounded, size: 18),
              label: const Text('Share Connection Link'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ── TAB 2: Email Invitation ──

  Widget _buildEmailTab(bool isLoading) {
    final state = context.watch<TrainerAddClientCubit>().state;
    String? inlineError;
    if (state is TrainerAddClientError) {
      inlineError = state.message;
    }

    return Column(
      children: [
        const SizedBox(height: 10),
        // Instruction text
        Text(
          'Add a client to invite them to Ziro Fit',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 20),
        // Email input
        TextField(
          controller: _emailController,
          focusNode: _emailFocusNode,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.send,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: Icon(
                Icons.email_outlined,
                size: 20,
                color: AppColors.mutedText,
              ),
            ),
            filled: true,
            fillColor: AppColors.mutedSurface,
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
              borderSide: const BorderSide(
                color: AppColors.borderActive,
                width: 2,
              ),
            ),
          ),
          onSubmitted: (_) => _onSendInvitation(),
          onChanged: (_) => setState(() {}),
        ),
        // Inline error
        if (inlineError != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.error_outline, size: 14, color: Colors.redAccent),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  inlineError,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
        const Spacer(),
        // Send Invitation button
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledButton(
            onPressed:
                (_isValidEmail && !isLoading) ? _onSendInvitation : null,
            style: FilledButton.styleFrom(
              backgroundColor:
                  _isValidEmail ? AppColors.primary : AppColors.mutedText.withValues(alpha: 0.4),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBackgroundColor:
                  AppColors.mutedText.withValues(alpha: 0.3),
            ),
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Send Invitation',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  // ── User Exists Dialog ──

  void _showUserExistsDialog(String email) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('User Exists'),
        content: const Text(
          'This email is already registered on Ziro Fit. '
          'Would you like to request to connect with them?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              _onRequestLink(email);
            },
            child: const Text('Request Connection'),
          ),
        ],
      ),
    );
  }

  // ── Success View ──

  Widget _buildSuccessView() {
    return Center(
      key: const ValueKey('success_view'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Green checkmark circle
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withValues(alpha: 0.1),
            ),
            child: const Icon(
              Icons.check_circle_rounded,
              size: 80,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Request Sent!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "We've sent a connection request to their app and "
              'an email invitation to ${_emailController.text.trim()}.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
          ),
          const Spacer(),
          // Done button
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: FilledButton(
                onPressed: () => context.pop(),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  shadowColor: AppColors.primary.withValues(alpha: 0.3),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
