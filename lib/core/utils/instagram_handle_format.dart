/// Normalizes handles like `@user` or `user` for display with a single leading `@`.
String formatInstagramHandle(String handle) {
  final bare = handle.trim().replaceFirst(RegExp(r'^@+'), '');
  return '@$bare';
}
