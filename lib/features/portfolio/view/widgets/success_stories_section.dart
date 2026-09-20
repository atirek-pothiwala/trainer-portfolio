import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_tokens.dart';
import '../../../../core/theme/frosted_surface.dart';
import '../../../../data/models/success_story.dart';
import 'section_header.dart';

/// Horizontal story cards need an explicit height so the list viewport does not clip content.
const double _kStoryCardWidth = 280;
const double _kStoryCardHeight = 340;
const double _kStoryImageHeight = 112;

class SuccessStoriesSection extends StatelessWidget {
  const SuccessStoriesSection({super.key, required this.stories});

  final List<SuccessStory> stories;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: 'Client success stories',
          subtitle: 'Real transformations from real people',
        ),
        SizedBox(
          height: _kStoryCardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: stories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              return _StoryCard(story: stories[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard({required this.story});

  final SuccessStory story;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;

    return SizedBox(
      width: _kStoryCardWidth,
      height: _kStoryCardHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: frostedSurface(context),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: tokens.border),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: story.imageUrl,
                height: _kStoryImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        story.clientName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        story.goal,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: tokens.textSecondary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: tokens.accent.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          story.result,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: tokens.accent,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          '"${story.quote}"',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontStyle: FontStyle.italic,
                                height: 1.4,
                              ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        story.duration,
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
