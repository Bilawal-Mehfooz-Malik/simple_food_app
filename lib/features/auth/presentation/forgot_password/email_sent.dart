import 'package:flutter/material.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';

class EmailSent extends StatelessWidget {
  const EmailSent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // [Icon]
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: context.color.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.mark_email_read, size: 60),
        ),
        gapH24,

        // [Body Text]
        Text(
          'Done, check your email for password reset link. If it is not there, please check your junk or spam folder.'
              .hardcoded,
          style: context.txtTheme.bodyLarge,
        ),
      ],
    );
  }
}
