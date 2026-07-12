import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';
import '../../cubit/payouts_cubit.dart';
import '../../cubit/payouts_state.dart';
import '../../data/models/stripe_status_dto.dart';

/// Payouts screen — Stripe Connect onboarding and status.
///
/// Matches iOS PayoutsView.swift (133 lines):
///   - Stripe Connect card with status badge
///   - Connect / Manage button
///   - Info list items
class PayoutsScreen extends StatefulWidget {
  const PayoutsScreen({super.key});

  @override
  State<PayoutsScreen> createState() => _PayoutsScreenState();
}

class _PayoutsScreenState extends State<PayoutsScreen> {
  bool _loadingAction = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PayoutsCubit>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Payouts'),
        centerTitle: true,
      ),
      body: BlocBuilder<PayoutsCubit, PayoutsState>(
        builder: (context, state) {
          return switch (state) {
            PayoutsInitial() => const SizedBox.shrink(),
            PayoutsLoading() => const Center(child: CircularProgressIndicator()),
            PayoutsLoaded(:final status) => _buildLoaded(status),
            PayoutsError(:final message) => _buildError(message),
          };
        },
      ),
    );
  }

  Widget _buildLoaded(StripeStatusDto status) {
    final isConnected = status.chargesEnabled;
    final detailsSubmitted = status.detailsSubmitted;
    final isPartiallySetup = !detailsSubmitted && status.accountId != null;

    String statusText;
    Color statusColor;
    IconData statusIcon;
    if (isConnected) {
      statusText = 'Connected & Ready';
      statusColor = Colors.green;
      statusIcon = Icons.check_circle_rounded;
    } else if (isPartiallySetup) {
      statusText = 'Setup Incomplete';
      statusColor = Colors.orange;
      statusIcon = Icons.warning_amber_rounded;
    } else {
      statusText = 'Not Connected';
      statusColor = AppColors.mutedText;
      statusIcon = Icons.cancel_outlined;
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Stripe Connect card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(
            children: [
              // Icon + title
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.credit_card_rounded,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Stripe Connect',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(statusIcon, size: 16, color: statusColor),
                            const SizedBox(width: 6),
                            Text(
                              statusText,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: statusColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description
              const Text(
                'Connect your Stripe account to receive payouts from client subscriptions and package purchases.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                ),
              ),
              const SizedBox(height: 20),
              // Action button
              SizedBox(
                width: double.infinity,
                child: _loadingAction
                    ? const Center(child: SizedBox(
                        width: 20, height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ))
                    : FilledButton.icon(
                        onPressed: () => _handleAction(status),
                        icon: Icon(
                          isConnected
                              ? Icons.open_in_new_rounded
                              : Icons.link_rounded,
                          size: 18,
                        ),
                        label: Text(
                          isConnected
                              ? 'Manage Stripe Account'
                              : 'Connect Stripe Account',
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(99),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Info list
        _InfoRow(
          icon: Icons.account_balance_rounded,
          title: 'Direct Payouts',
          subtitle: 'Funds sent directly to your bank account',
        ),
        const SizedBox(height: 12),
        _InfoRow(
          icon: Icons.lock_rounded,
          title: 'Secure Encryption',
          subtitle: 'All payment data is encrypted and secure',
        ),
        const SizedBox(height: 12),
        _InfoRow(
          icon: Icons.dashboard_rounded,
          title: 'Manage via Stripe Dashboard',
          subtitle: 'View payouts, refunds, and reports',
          isLast: true,
        ),
      ],
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: AppColors.mutedText,
            ),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.mutedText,
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.read<PayoutsCubit>().load(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAction(StripeStatusDto status) async {
    setState(() => _loadingAction = true);
    try {
      if (status.chargesEnabled) {
        // Open Stripe dashboard — just launch Stripe for now
        final url = 'https://dashboard.stripe.com/';
        if (await canLaunchUrl(Uri.parse(url))) {
          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
        }
      } else {
        final cubit = context.read<PayoutsCubit>();
        final url = await cubit.fetchOnboardingUrl();
        if (url != null && mounted) {
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
            // Reload status after returning from onboarding
            cubit.load();
          }
        }
      }
    } finally {
      if (mounted) setState(() => _loadingAction = false);
    }
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isLast;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderMuted),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
