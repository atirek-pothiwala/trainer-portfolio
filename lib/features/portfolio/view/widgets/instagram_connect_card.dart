import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/utils/instagram_handle_format.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../../core/widgets/animated_instagram_mesh_background.dart';
import '../../../../data/models/trainer_profile.dart';
import 'section_header.dart';

class InstagramConnectCard extends StatelessWidget {
  const InstagramConnectCard({super.key, required this.profile});

  final TrainerProfile profile;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final colors = context.colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final handleLabel = formatInstagramHandle(profile.instagramHandle);
    final instagram = tokens.instagram;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Connect on Instagram',
          subtitle: 'DM for coaching inquiries & daily tips',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: AnimatedInstagramMeshBackground(
            expand: false,
            palette: AnimatedMeshPalette.instagram,
            borderRadius: BorderRadius.circular(16),
            vignetteOpacity: isDark ? 0.35 : 0.12,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: instagram.withValues(alpha: isDark ? 0.5 : 0.4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: instagram,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        handleLabel,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? Colors.white : null,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '1. Open Instagram and search for $handleLabel\n'
                    '2. Tap Follow for workouts & nutrition tips\n'
                    '3. Send a DM with your goal (fat loss, muscle, sport, etc.)\n'
                    '4. Your coach or the team will reply within 24 hours',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.78)
                              : tokens.textSecondary,
                          height: 1.5,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () =>
                              openExternalUrl(profile.instagramUrl),
                          icon: const Icon(Icons.open_in_new, size: 18),
                          label: const Text('Open Instagram'),
                          style: FilledButton.styleFrom(
                            backgroundColor: instagram,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () =>
                            openExternalUrl(profile.youtubeChannelUrl),
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              isDark ? Colors.white : colors.onSurface,
                          side: BorderSide(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.35)
                                : tokens.border,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 16,
                          ),
                        ),
                        child: const Icon(Icons.play_arrow),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
