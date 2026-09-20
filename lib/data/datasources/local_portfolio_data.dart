import '../models/certification.dart';
import '../models/skill.dart';
import '../models/social_post.dart';
import '../models/success_story.dart';
import '../models/trainer_profile.dart';

/// Dummy portfolio content for Phase 1. Replace with API/CMS later.
class LocalPortfolioData {
  static TrainerProfile get trainer => TrainerProfile(
        name: 'Jordan Reed',
        title: 'Certified Strength & Conditioning Coach',
        tagline: 'Build strength. Move better. Transform for life.',
        bio:
            'Jordan helps busy professionals and athletes train with purpose. '
            'Programs blend evidence-based strength training, mobility work, '
            'and sustainable nutrition habits. Whether your goal is fat loss, '
            'muscle gain, or athletic performance, every plan is built to follow '
            'consistently — on mobile, at the gym, or at home.',
        profileImageUrl:
            'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=800&q=80',
        yearsExperience: 12,
        clientsTrained: 850,
        location: 'Mumbai, India · Online worldwide',
        instagramHandle: '@fit.coach.jordan',
        instagramUrl: 'https://instagram.com/fit.coach.jordan',
        youtubeChannelUrl: 'https://youtube.com/@FitCoachJordan',
        skills: const [
          Skill(name: 'Hypertrophy Programming', level: 5, category: 'Strength'),
          Skill(name: 'Fat Loss & Body Recomp', level: 5, category: 'Nutrition'),
          Skill(name: 'Powerlifting Technique', level: 4, category: 'Strength'),
          Skill(name: 'Mobility & Injury Prevention', level: 4, category: 'Recovery'),
          Skill(name: 'Sports Performance', level: 4, category: 'Athletics'),
          Skill(name: 'Habit & Mindset Coaching', level: 5, category: 'Lifestyle'),
        ],
        certifications: const [
          Certification(
            title: 'NASM Certified Personal Trainer',
            issuer: 'National Academy of Sports Medicine',
            year: 2014,
            description:
                'Foundational certification in exercise science, program design, '
                'and client assessment.',
          ),
          Certification(
            title: 'Precision Nutrition Level 1',
            issuer: 'Precision Nutrition',
            year: 2018,
            description:
                'Coaching nutrition for sustainable fat loss and performance.',
          ),
          Certification(
            title: 'CSCS (Candidate)',
            issuer: 'NSCA',
            year: 2020,
            description:
                'Advanced strength and conditioning for athletes and advanced lifters.',
          ),
          Certification(
            title: 'Functional Range Conditioning',
            issuer: 'FRC',
            year: 2022,
            description: 'Mobility and joint health for long-term training longevity.',
          ),
        ],
        successStories: const [
          SuccessStory(
            clientName: 'Priya S.',
            goal: 'Fat loss & confidence',
            result: 'Lost 18 kg in 9 months',
            duration: '9 months',
            quote:
                'My coach never made me feel like I was on a "diet." The workouts '
                'were challenging but doable, and I finally understand how to eat.',
            imageUrl:
                'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=600&q=80',
          ),
          SuccessStory(
            clientName: 'Rahul M.',
            goal: 'Strength & muscle gain',
            result: 'Added 12 kg to squat, visible muscle gain',
            duration: '6 months',
            quote:
                'Clear programming and form feedback. I hit PRs I thought were years away.',
            imageUrl:
                'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=600&q=80',
          ),
          SuccessStory(
            clientName: 'Ananya K.',
            goal: 'Postpartum return to fitness',
            result: 'Regained core strength, runs 5K comfortably',
            duration: '5 months',
            quote:
                'Patient, knowledgeable, and always adjusted my plan when life got busy.',
            imageUrl:
                'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600&q=80',
          ),
        ],
        instagramPosts: [
          SocialPost(
            platform: SocialPlatform.instagram,
            title: 'Full-body dumbbell circuit',
            caption: '20-min burner you can do anywhere. Save for later.',
            thumbnailUrl:
                'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=600&q=80',
            postUrl: 'https://instagram.com/p/example1',
            publishedAt: DateTime(2026, 9, 15),
          ),
          SocialPost(
            platform: SocialPlatform.instagram,
            title: 'Squat depth checklist',
            caption: '3 cues that fixed my clients\' knee cave this week.',
            thumbnailUrl:
                'https://images.unsplash.com/photo-1583454110551-21f2fa2afe61?w=600&q=80',
            postUrl: 'https://instagram.com/p/example2',
            publishedAt: DateTime(2026, 9, 10),
          ),
          SocialPost(
            platform: SocialPlatform.instagram,
            title: 'Meal prep Sunday',
            caption: 'High-protein bowls for the work week — recipes in carousel.',
            thumbnailUrl:
                'https://images.unsplash.com/photo-1490645935967-10de6ba17061?w=600&q=80',
            postUrl: 'https://instagram.com/p/example3',
            publishedAt: DateTime(2026, 9, 5),
          ),
        ],
        youtubePosts: [
          SocialPost(
            platform: SocialPlatform.youtube,
            title: 'Push Pull Legs for Beginners (Full Week)',
            caption: 'Complete PPL split with form demos and progression tips.',
            thumbnailUrl:
                'https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?w=600&q=80',
            postUrl: 'https://youtube.com/watch?v=example1',
            publishedAt: DateTime(2026, 9, 12),
          ),
          SocialPost(
            platform: SocialPlatform.youtube,
            title: 'Fix Your Deadlift in 10 Minutes',
            caption: 'Common mistakes and drills to lock in safe technique.',
            thumbnailUrl:
                'https://images.unsplash.com/photo-1517963879433-6ad2c056f474?w=600&q=80',
            postUrl: 'https://youtube.com/watch?v=example2',
            publishedAt: DateTime(2026, 8, 28),
          ),
        ],
      );
}
