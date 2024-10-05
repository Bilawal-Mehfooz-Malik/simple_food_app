import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/buttons_section.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/text_field_section.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cnfrmPassController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.surface,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          children: [
            // Header
            AuthHeader(headline: 'Let\'s create an account for you'.hardcoded),
            gapH32,

            // Text Fields
            TextFieldSection(
              emailController: _emailController,
              passController: _passController,
              cnfrmPassController: _cnfrmPassController,
            ),
            gapH32,

            // Login and Toggle Button
            const ButtonsSection(
              loginOrSignup: 'Sign up',
              firstText: 'Already have an account?',
              secondText: 'Login here',
            ),
          ],
        ),
      ),
    );
  }
}
