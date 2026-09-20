import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/theme/frosted_surface.dart';
import '../../../../core/utils/instagram_handle_format.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../../core/widgets/brand_social_icon.dart';
import '../../../../core/widgets/instagram_gradient_button.dart';
import '../../../../data/models/trainer_profile.dart';
import 'section_header.dart';

class InstagramConnectCard extends StatelessWidget {
  const InstagramConnectCard({super.key, required this.profile});

  final TrainerProfile profile;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final handleLabel = formatInstagramHandle(profile.instagramHandle);

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
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: frostedSurface(context),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: tokens.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: tokens.surfaceElevated,
                      backgroundImage: CachedNetworkImageProvider(
                        profile.profileImageUrl,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            handleLabel,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Follow on Instagram',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color: tokens.instagram,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    BrandSocialIcon.instagram(
                      color: tokens.instagram,
                      size: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  'DM your goal — we reply within 24 hours.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: tokens.textSecondary,
                        height: 1.45,
                      ),
                ),
                const SizedBox(height: 16),
                InstagramGradientButton(
                  label: 'Open Instagram',
                  onPressed: () => openExternalUrl(profile.instagramUrl),
                ),
                const SizedBox(height: 10),
                Center(
                  child: TextButton.icon(
                    onPressed: () =>
                        openExternalUrl(profile.youtubeChannelUrl),
                    icon: BrandSocialIcon.youtube(
                      color: tokens.youtube,
                      size: 18,
                    ),
                    label: Text(
                      'YouTube channel',
                      style: TextStyle(color: tokens.textSecondary),
                    ),
                  ),
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
