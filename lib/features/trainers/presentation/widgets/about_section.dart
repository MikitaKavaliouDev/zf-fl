import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// Expandable "About" section matching iOS design (lines 178-192).
/// Shows bio text with read more/less for long content.
class AboutSection extends StatefulWidget {
  final String? aboutMe;
  final String? philosophy;
  final String? methodology;
  final String? branding;

  const AboutSection({
    super.key,
    this.aboutMe,
    this.philosophy,
    this.methodology,
    this.branding,
  });

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    // Build combined bio text
    final parts = <String>[];
    if (widget.aboutMe != null && widget.aboutMe!.isNotEmpty) {
      parts.add(widget.aboutMe!);
    }
    if (widget.philosophy != null && widget.philosophy!.isNotEmpty) {
      parts.add('Philosophy: ${widget.philosophy}');
    }
    if (widget.methodology != null && widget.methodology!.isNotEmpty) {
      parts.add('Methodology: ${widget.methodology}');
    }
    if (widget.branding != null && widget.branding!.isNotEmpty) {
      parts.add('Branding: ${widget.branding}');
    }

    final bio = parts.join('\n\n');
    if (bio.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.foreground,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            bio,
            maxLines: _isExpanded ? null : 3,
            overflow: _isExpanded ? null : TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.mutedText,
              height: 1.4,
            ),
          ),
          if (bio.length > 150) ...[
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              child: Text(
                _isExpanded ? 'Show less' : 'Read more',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
