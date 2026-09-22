import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Official-style Instagram & YouTube brand icons (Font Awesome Brands).
class BrandSocialIcon extends StatelessWidget {
  const BrandSocialIcon.instagram({
    super.key,
    this.size = 22,
    this.color,
  })  : _icon = FontAwesomeIcons.instagram,
        _semanticsLabel = 'Instagram';

  const BrandSocialIcon.youtube({
    super.key,
    this.size = 22,
    this.color,
  })  : _icon = FontAwesomeIcons.youtube,
        _semanticsLabel = 'YouTube';

  final FaIconData _icon;
  final String _semanticsLabel;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: _semanticsLabel,
      child: FaIcon(
        _icon,
        size: size,
        color: color,
      ),
    );
  }
}
