import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/extensions.dart';

class AuthHeader extends StatelessWidget {
  final String headline;
  const AuthHeader({super.key, required this.headline});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Logo
        Icon(
          size: 72,
          Icons.lock_open_rounded,
          color: context.color.onSurface,
        ),
        gapH24,

        //* Message, app slogan
        Text(headline, style: context.txtTheme.bodyLarge),
      ],
    );
  }
}
