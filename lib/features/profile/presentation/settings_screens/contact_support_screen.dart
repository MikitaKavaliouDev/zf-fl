import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';

/// Support / Contact screen with email link, FAQ section, and version info.
class ContactSupportScreen extends StatelessWidget {
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Contact Support'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Contact Section ──
          _buildSection(
            title: 'Contact Us',
            children: [
              _buildContactRow(
                context,
                icon: Icons.mail_outline,
                iconColor: AppColors.primary,
                title: 'Email Us',
                subtitle: 'contact@ziro.fit',
                onTap: () => _launchEmail(context),
              ),
              _buildContactRow(
                context,
                icon: Icons.language_rounded,
                iconColor: AppColors.primary,
                title: 'Website',
                subtitle: 'ziro.fit',
                onTap: () => _launchUrl('https://ziro.fit'),
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── FAQ Section ──
          _buildSection(
            title: 'Frequently Asked Questions',
            children: [
              _buildFaqRow(
                question: 'How do I connect with a trainer?',
                answer:
                    'Go to the Explore tab to browse trainers. Tap on a trainer profile and use the "Connect" button to send a request.',
              ),
              _buildFaqRow(
                question: 'How do I reset my password?',
                answer:
                    'On the login screen, tap "Forgot Password" and follow the instructions sent to your email.',
              ),
              _buildFaqRow(
                question: 'How do check-ins work?',
                answer:
                    'Check-ins allow you to log your progress including weight, wellness metrics, and photos. Your trainer can review and provide feedback.',
              ),
              _buildFaqRow(
                question: 'Can I share my progress with others?',
                answer:
                    'Yes! Use the Sharing feature in Settings to create a sharing link with your workout history, measurements, and photos.',
              ),
              _buildFaqRow(
                question: 'How is my data protected?',
                answer:
                    'Your data is encrypted in transit and at rest. We never share your personal information without your explicit consent.',
                isLast: true,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // ── Version Info ──
          _buildVersionInfo(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
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
      ],
    );
  }

  Widget _buildContactRow(
    BuildContext context, {
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                          fontSize: 13,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.open_in_new_rounded,
                  size: 18,
                  color: AppColors.mutedText,
                ),
              ],
            ),
          ),
          if (!isLast) const Divider(height: 1, indent: 64),
        ],
      ),
    );
  }

  Widget _buildFaqRow({
    required String question,
    required String answer,
    bool isLast = false,
  }) {
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
          ),
        ),
        childrenPadding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        children: [
          Text(
            answer,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVersionInfo() {
    return Column(
      children: [
        Icon(
          Icons.fitness_center_rounded,
          size: 32,
          color: AppColors.primary.withValues(alpha: 0.6),
        ),
        const SizedBox(height: 8),
        const Text(
          'ZIRO.FIT',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.foreground,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Version 1.0.0 (1)',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'Made with ❤️ for fitness',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.mutedText,
          ),
        ),
      ],
    );
  }

  Future<void> _launchEmail(BuildContext context) async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'contact@ziro.fit',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please email us at contact@ziro.fit'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
