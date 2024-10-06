import 'package:flutter/material.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/utils/validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/components/custom_textfield.dart';
import 'package:simple_food_app/features/auth/presentation/forgot_password/forgot_content_controller.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Headline
        Text(
          'Forgot your password?'.hardcoded,
          style: context.txtTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH20,

        // Body Text
        Text('Confirm your email and we\'ll send you a link to set up a new one'
            .hardcoded),
        gapH12,

        // Text Field
        CustomTextField(
          hintText: 'Email Address'.hardcoded,
          controller: emailController,
          validator: Validators.validateEmail,
        ),
        gapH24,

        // Reset button
        Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                ref
                    .read(forgotContentControllerProvider.notifier)
                    .updateContent();
              },
              child: Text('Reset Password'.hardcoded),
            );
          },
        )
      ],
    );
  }
}
