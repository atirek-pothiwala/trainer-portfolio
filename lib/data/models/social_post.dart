import 'package:equatable/equatable.dart';

enum SocialPlatform { instagram, youtube }

class SocialPost extends Equatable {
  const SocialPost({
    required this.platform,
    required this.title,
    required this.caption,
    required this.thumbnailUrl,
    required this.postUrl,
    required this.publishedAt,
  });

  final SocialPlatform platform;
  final String title;
  final String caption;
  final String thumbnailUrl;
  final String postUrl;
  final DateTime publishedAt;

  @override
  List<Object?> get props =>
      [platform, title, caption, thumbnailUrl, postUrl, publishedAt];
}
