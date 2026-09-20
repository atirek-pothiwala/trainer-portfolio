import 'package:flutter/material.dart';

import '../../core/theme/app_theme_tokens.dart';
import '../../core/theme/frosted_surface.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.phaseLabel,
  });

  final String title;
  final String description;
  final IconData icon;
  final String phaseLabel;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: frostedSurface(context),
                shape: BoxShape.circle,
                border: Border.all(color: tokens.border),
              ),
              child: Icon(icon, size: 48, color: tokens.accent),
            ),
            const SizedBox(height: 24),
            Text(
              phaseLabel,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: tokens.accent,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: tokens.textSecondary,
                    height: 1.5,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
