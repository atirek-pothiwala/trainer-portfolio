import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/theme/frosted_surface.dart';
import '../../../../core/utils/url_launcher_helper.dart';
import '../../../../data/models/social_post.dart';
import 'section_header.dart';

class SocialFeedSection extends StatelessWidget {
  const SocialFeedSection({
    super.key,
    required this.instagramPosts,
    required this.youtubePosts,
  });

  final List<SocialPost> instagramPosts;
  final List<SocialPost> youtubePosts;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Latest on social',
          subtitle: 'Recent Instagram & YouTube posts',
        ),
        _PlatformBlock(
          title: 'Instagram',
          icon: Icons.camera_alt_outlined,
          color: tokens.instagram,
          posts: instagramPosts,
        ),
        const SizedBox(height: 8),
        _PlatformBlock(
          title: 'YouTube',
          icon: Icons.play_circle_outline,
          color: tokens.youtube,
          posts: youtubePosts,
        ),
      ],
    );
  }
}

class _PlatformBlock extends StatelessWidget {
  const _PlatformBlock({
    required this.title,
    required this.icon,
    required this.color,
    required this.posts,
  });

  final String title;
  final IconData icon;
  final Color color;
  final List<SocialPost> posts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: posts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) => _PostTile(post: posts[index]),
          ),
        ),
      ],
    );
  }
}

class _PostTile extends StatelessWidget {
  const _PostTile({required this.post});

  final SocialPost post;

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('MMM d, yyyy').format(post.publishedAt);
    final tokens = context.tokens;

    return Material(
      color: frostedSurface(context),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () => openExternalUrl(post.postUrl),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: tokens.border),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: post.thumbnailUrl,
                width: 100,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        post.caption,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: tokens.textSecondary,
                              fontSize: 11,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: tokens.textSecondary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
