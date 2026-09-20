import 'package:equatable/equatable.dart';

/// Signed-in app user (distinct from the trainer portfolio subject).
class AppUser extends Equatable {
  const AppUser({
    required this.displayName,
    this.avatarUrl,
  });

  final String displayName;

  /// Optional profile photo; when null, UI shows a generic person avatar.
  final String? avatarUrl;

  @override
  List<Object?> get props => [displayName, avatarUrl];
}
