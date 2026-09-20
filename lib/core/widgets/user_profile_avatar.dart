import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/app_user.dart';
import '../theme/app_theme_tokens.dart';

/// Compact avatar for the signed-in user (app bar, menus).
class UserProfileAvatar extends StatelessWidget {
  const UserProfileAvatar({
    super.key,
    required this.user,
    this.radius = 18,
    this.onTap,
  });

  final AppUser user;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final avatar = CircleAvatar(
      radius: radius,
      backgroundColor: tokens.surfaceElevated,
      foregroundColor: tokens.textSecondary,
      backgroundImage: user.avatarUrl != null && user.avatarUrl!.isNotEmpty
          ? CachedNetworkImageProvider(user.avatarUrl!)
          : null,
      child: user.avatarUrl == null || user.avatarUrl!.isEmpty
          ? Icon(Icons.person, size: radius)
          : null,
    );

    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Tooltip(
        message: user.displayName,
        child: onTap == null
            ? avatar
            : InkWell(
                onTap: onTap,
                customBorder: const CircleBorder(),
                child: avatar,
              ),
      ),
    );
  }
}
