import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/app_theme_tokens.dart';
import '../../../data/models/trainer_profile.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_event.dart';
import '../bloc/portfolio_state.dart';
import 'widgets/certifications_section.dart';
import 'widgets/instagram_connect_card.dart';
import 'widgets/section_header.dart';
import 'widgets/skills_section.dart';
import 'widgets/social_feed_section.dart';
import 'widgets/success_stories_section.dart';
import 'widgets/trainer_hero.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        return switch (state.status) {
          PortfolioStatus.initial || PortfolioStatus.loading =>
            const _LoadingView(),
          PortfolioStatus.failure => _ErrorView(
              message: state.errorMessage ?? 'Something went wrong',
              onRetry: () => context
                  .read<PortfolioBloc>()
                  .add(const PortfolioLoadRequested()),
            ),
          PortfolioStatus.success => _PortfolioContent(profile: state.profile!),
        };
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: context.tokens.accent),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}

class _PortfolioContent extends StatelessWidget {
  const _PortfolioContent({required this.profile});

  final TrainerProfile profile;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.tokens.accent,
      onRefresh: () async {
        context.read<PortfolioBloc>().add(const PortfolioRefreshRequested());
        await context.read<PortfolioBloc>().stream.firstWhere(
              (s) => s.status != PortfolioStatus.loading,
            );
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            title: const Text('Portfolio'),
            actions: [
              IconButton(
                tooltip: 'Refresh',
                onPressed: () => context
                    .read<PortfolioBloc>()
                    .add(const PortfolioRefreshRequested()),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          SliverToBoxAdapter(child: TrainerHero(profile: profile)),
          SliverToBoxAdapter(
            child: SectionHeader(
              title: 'About',
              subtitle: null,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                profile.bio,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: context.tokens.textSecondary,
                      height: 1.55,
                    ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SkillsSection(skills: profile.skills)),
          SliverToBoxAdapter(
            child: CertificationsSection(certifications: profile.certifications),
          ),
          SliverToBoxAdapter(
            child: SuccessStoriesSection(stories: profile.successStories),
          ),
          SliverToBoxAdapter(
            child: SocialFeedSection(
              instagramPosts: profile.instagramPosts,
              youtubePosts: profile.youtubePosts,
            ),
          ),
          SliverToBoxAdapter(child: InstagramConnectCard(profile: profile)),
        ],
      ),
    );
  }
}
