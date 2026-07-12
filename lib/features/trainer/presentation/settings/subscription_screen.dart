import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../cubit/subscription_cubit.dart';
import '../../cubit/subscription_state.dart';
import '../../data/models/subscription_dto.dart';

/// Subscription & Billing screen.
///
/// Matches iOS TrainerSubscriptionView.swift (107 lines):
///   - Current Plan card (tier, status, dates)
///   - Action buttons (upgrade, billing history, cancel)
class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SubscriptionCubit>().load();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Subscription & Billing'),
        centerTitle: true,
      ),
      body: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (context, state) {
          return switch (state) {
            SubscriptionInitial() => const SizedBox.shrink(),
            SubscriptionLoading() => const Center(child: CircularProgressIndicator()),
            SubscriptionLoaded(:final subscription) => _buildLoaded(subscription),
            SubscriptionError(:final message) => _buildError(message),
          };
        },
      ),
    );
  }

  Widget _buildLoaded(SubscriptionDto sub) {
    final isCanceled = sub.stripeCancelAtPeriodEnd;
    final isActive = sub.subscriptionStatus == 'active';
    final isTrialing = sub.subscriptionStatus == 'trialing';

    String statusLabel;
    Color statusColor;
    if (isCanceled) {
      statusLabel = 'Ending on ${_formatDate(sub.stripeCurrentPeriodEnd)}';
      statusColor = Colors.redAccent;
    } else if (isTrialing) {
      statusLabel = 'Trial — ends ${_formatDate(sub.trialEndsAt)}';
      statusColor = AppColors.primary;
    } else if (isActive) {
      statusLabel = 'Active';
      statusColor = Colors.green;
    } else {
      statusLabel = sub.subscriptionStatus ?? 'Inactive';
      statusColor = AppColors.mutedText;
    }

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Current Plan card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderMuted),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Icons.card_membership_rounded,
                      size: 24,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          sub.tierName,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.foreground,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            statusLabel,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (sub.stripeCurrentPeriodEnd != null && isActive) ...[
                const SizedBox(height: 16),
                _DetailRow(
                  label: 'Next Billing Date',
                  value: _formatDate(sub.stripeCurrentPeriodEnd),
                ),
              ],
              if (sub.trialEndsAt != null) ...[
                const SizedBox(height: 8),
                _DetailRow(
                  label: 'Trial Ends',
                  value: _formatDate(sub.trialEndsAt),
                ),
              ],
              if (isCanceled && sub.stripeCancelAt != null) ...[
                const SizedBox(height: 8),
                _DetailRow(
                  label: 'Canceled On',
                  value: _formatDate(sub.stripeCancelAt),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Upgrade Plan
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: () => _showUpgradeSheet(sub),
            icon: const Icon(Icons.arrow_upward_rounded, size: 18),
            label: const Text('Upgrade Plan'),
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
        const SizedBox(height: 12),
        // Billing History
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => context.read<SubscriptionCubit>().openBillingPortal(),
            icon: const Icon(Icons.receipt_long_outlined, size: 18),
            label: const Text('Billing History'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primary,
              side: const BorderSide(color: AppColors.borderActive),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(99),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ),
        if (!isCanceled) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () => _confirmCancel(sub),
              icon: const Icon(Icons.cancel_outlined, size: 18),
              label: const Text('Cancel Subscription'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ] else ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () => _confirmResume(sub),
              icon: const Icon(Icons.restart_alt_rounded, size: 18),
              label: const Text('Reactivate'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
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
            const Icon(Icons.error_outline_rounded, size: 48, color: AppColors.mutedText),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => context.read<SubscriptionCubit>().load(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showUpgradeSheet(SubscriptionDto current) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.card,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.borderMuted,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upgrade Plan',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.foreground,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choose a new plan tier to upgrade to.',
              style: TextStyle(fontSize: 14, color: AppColors.mutedText),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  _doUpgrade(current);
                },
                child: const Text('Continue to Checkout'),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Future<void> _doUpgrade(SubscriptionDto current) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Opening checkout...'),
        behavior: SnackBarBehavior.floating,
      ),
    );
    await context.read<SubscriptionCubit>().upgrade(current.tierId);
  }

  void _confirmCancel(SubscriptionDto sub) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Cancel Subscription',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Your ${sub.tierName} plan will remain active until the end of your current billing period (${_formatDate(sub.stripeCurrentPeriodEnd)}). After that, you will lose access to premium features.',
          style: const TextStyle(fontSize: 14, color: AppColors.mutedText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Keep Plan'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              _doCancel();
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text('Cancel Subscription'),
          ),
        ],
      ),
    );
  }

  void _confirmResume(SubscriptionDto sub) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.card,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          'Reactivate Subscription',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        content: const Text(
          'Your subscription will be reactivated and you will continue to be billed on your current plan.',
          style: TextStyle(fontSize: 14, color: AppColors.mutedText),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              _doResume();
            },
            child: const Text('Reactivate'),
          ),
        ],
      ),
    );
  }

  Future<void> _doCancel() async {
    final cubit = context.read<SubscriptionCubit>();
    final success = await cubit.cancel();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success
              ? 'Subscription canceled successfully'
              : 'Failed to cancel subscription'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _doResume() async {
    final cubit = context.read<SubscriptionCubit>();
    final success = await cubit.resume();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success
              ? 'Subscription reactivated'
              : 'Failed to reactivate subscription'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '—';
    // Parse ISO date and format nicely
    try {
      final dt = DateTime.parse(dateStr);
      final months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${months[dt.month - 1]} ${dt.day}, ${dt.year}';
    } catch (_) {
      return dateStr;
    }
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.mutedText,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
      ],
    );
  }
}
