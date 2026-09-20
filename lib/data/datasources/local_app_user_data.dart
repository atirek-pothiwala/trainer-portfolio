import '../models/app_user.dart';

/// Placeholder signed-in user for Phase 1. Replace with auth/session later.
class LocalAppUserData {
  static AppUser get current => const AppUser(
        displayName: 'Atirek',
        avatarUrl:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=200&q=80',
      );
}
