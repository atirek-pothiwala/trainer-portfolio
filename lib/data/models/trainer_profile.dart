import 'package:equatable/equatable.dart';

import 'certification.dart';
import 'skill.dart';
import 'social_post.dart';
import 'success_story.dart';

class TrainerProfile extends Equatable {
  const TrainerProfile({
    required this.name,
    required this.title,
    required this.tagline,
    required this.bio,
    required this.profileImageUrl,
    required this.yearsExperience,
    required this.clientsTrained,
    required this.location,
    required this.instagramHandle,
    required this.instagramUrl,
    required this.youtubeChannelUrl,
    required this.skills,
    required this.certifications,
    required this.successStories,
    required this.instagramPosts,
    required this.youtubePosts,
  });

  final String name;
  final String title;
  final String tagline;
  final String bio;
  final String profileImageUrl;
  final int yearsExperience;
  final int clientsTrained;
  final String location;
  final String instagramHandle;
  final String instagramUrl;
  final String youtubeChannelUrl;
  final List<Skill> skills;
  final List<Certification> certifications;
  final List<SuccessStory> successStories;
  final List<SocialPost> instagramPosts;
  final List<SocialPost> youtubePosts;

  @override
  List<Object?> get props => [
        name,
        title,
        tagline,
        bio,
        profileImageUrl,
        yearsExperience,
        clientsTrained,
        location,
        instagramHandle,
        instagramUrl,
        youtubeChannelUrl,
        skills,
        certifications,
        successStories,
        instagramPosts,
        youtubePosts,
      ];
}
