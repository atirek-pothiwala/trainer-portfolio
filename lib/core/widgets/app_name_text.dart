import 'package:flutter/material.dart';

import '../theme/app_branding.dart';
import '../theme/app_name_typography.dart';

class AppNameText extends StatelessWidget {
  const AppNameText({super.key, this.fontSize, this.color});

  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      AppBranding.name,
      style: appNameTextStyle(
        context,
        fontSize: fontSize ?? 28,
        color: color,
      ),
    );
  }
}
