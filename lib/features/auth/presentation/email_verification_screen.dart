import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final _codeController = TextEditingController();
  bool _verifying = false;
  bool _resending = false;
  String? _error;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  String? get _email {
    final state = context.read<AuthCubit>().state;
    if (state is AuthRegisterSuccess) return state.email;
    return null;
  }

  Future<void> _verify() async {
    final code = _codeController.text.trim();
    if (code.length != 6) {
      setState(() => _error = 'Please enter the full 6-digit code.');
      return;
    }

    final email = _email;
    if (email == null) return;

    setState(() {
      _verifying = true;
      _error = null;
    });

    try {
      await context.read<AuthCubit>().verifyEmailCode(email, code);

      if (!mounted) return;
      context.read<AuthCubit>().clearError();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email verified! You can now sign in.'),
          backgroundColor: Colors.green,
        ),
      );
      context.go('/login');
    } on DioException catch (e) {
      if (!mounted) return;
      final message = _extractErrorMessage(e);
      setState(() {
        _error = message;
        _verifying = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _error = 'Invalid or expired code. Please try again.';
        _verifying = false;
      });
    }
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final error = data['error'];
      if (error is Map<String, dynamic>) {
        return (error['message'] as String?) ?? 'Invalid or expired code. Please try again.';
      }
    }
    return 'Invalid or expired code. Please try again.';
  }

  Future<void> _resend() async {
    final email = _email;
    if (email == null) return;

    setState(() {
      _resending = true;
      _error = null;
    });

    try {
      await context.read<AuthCubit>().resendVerification(email);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification code resent!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = 'Failed to resend. Please try again.');
    } finally {
      if (mounted) setState(() => _resending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Envelope icon
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.email_outlined,
                    size: 48,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 32),

                const Text(
                  'Check your email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  _email != null
                      ? 'We sent a code to\n$_email'
                      : "We've sent a confirmation code to your email.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.mutedText,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),

                // Code input
                TextField(
                  controller: _codeController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 6,
                  enabled: !_verifying,
                  style: const TextStyle(
                    fontSize: 28,
                    letterSpacing: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.foreground,
                  ),
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: 'Verification code',
                    hintText: '000000',
                    hintStyle: TextStyle(
                      fontSize: 28,
                      letterSpacing: 12,
                      color: AppColors.mutedText.withAlpha(80),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Error message
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      _error!,
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 13,
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                // Verify button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _verifying ? null : _verify,
                    child: _verifying
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Verify Email'),
                  ),
                ),
                const SizedBox(height: 16),

                // Resend
                TextButton(
                  onPressed: _resending ? null : _resend,
                  child: _resending
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text(
                          'Resend code',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14,
                          ),
                        ),
                ),
                const SizedBox(height: 24),

                // Back to sign in
                TextButton(
                  onPressed: () {
                    context.read<AuthCubit>().clearError();
                    context.go('/login');
                  },
                  child: const Text(
                    'Back to Sign In',
                    style: TextStyle(
                      color: AppColors.mutedText,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
