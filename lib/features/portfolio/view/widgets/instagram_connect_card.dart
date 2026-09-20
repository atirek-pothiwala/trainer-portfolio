import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../../data/models/trainer_profile.dart';
import 'section_header.dart';

class InstagramConnectCard extends StatelessWidget {
  const InstagramConnectCard({super.key, required this.profile});

  final TrainerProfile profile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Connect on Instagram',
          subtitle: 'DM for coaching inquiries & daily tips',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  AppColors.instagram.withValues(alpha: 0.25),
                  AppColors.surface,
                ],
              ),
              border: Border.all(
                color: AppColors.instagram.withValues(alpha: 0.4),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.alternate_email,
                      color: AppColors.instagram,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      profile.instagramHandle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '1. Open Instagram and search for ${profile.instagramHandle}\n'
                  '2. Tap Follow for workouts & nutrition tips\n'
                  '3. Send a DM with your goal (fat loss, muscle, sport, etc.)\n'
                  '4. Hemant or the team will reply within 24 hours',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.icon(
                        onPressed: () => openExternalUrl(profile.instagramUrl),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: const Text('Open Instagram'),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.instagram,
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
                        foregroundColor: AppColors.textPrimary,
                        side: const BorderSide(color: Color(0xFF2A3139)),
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
        const SizedBox(height: 32),
      ],
    );
  }
}
