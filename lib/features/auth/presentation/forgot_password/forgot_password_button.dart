import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_food_app/features/auth/presentation/forgot_password/email_sent.dart';
import 'package:simple_food_app/features/auth/presentation/forgot_password/forgot_content_controller.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/features/auth/presentation/forgot_password/reset_password.dart';

class ForgotPasswordButton extends StatelessWidget {
  final TextEditingController emailController;
  const ForgotPasswordButton({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => _showBottomSheet(context),
        child: Text(
          'Forgot Password?'.hardcoded,
          style: context.txtTheme.bodyMedium,
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.p32,
            horizontal: Sizes.p16,
          ),
          child: Consumer(
            builder: (_, ref, __) {
              final content = ref.watch(forgotContentControllerProvider);

              return content == ForgotContent.resetPassword
                  ? ResetPassword(emailController: emailController)
                  : const EmailSent();
            },
          ),
        );
      },
    );
  }
}
