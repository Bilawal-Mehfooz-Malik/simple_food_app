import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/components/breakpoints.dart';
import 'package:simple_food_app/components/responsive_center.dart';
import 'package:simple_food_app/features/auth/presentation/common/auth_header.dart';
import 'package:simple_food_app/features/auth/presentation/common/buttons_section.dart';
import 'package:simple_food_app/features/auth/presentation/common/text_field_section.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
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
      body: SafeArea(
        child: ResponsiveCenter(
          showBorder: true,
          maxContentWidth: Breakpoint.tablet,
          padding: const EdgeInsets.all(Sizes.p16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header
                AuthHeader(
                    headline: 'Let\'s create an account for you'.hardcoded),
                gapH48,

                // Text Fields
                Form(
                  key: _formKey,
                  child: TextFieldSection(
                    emailController: _emailController,
                    passController: _passController,
                    cnfrmPassController: _cnfrmPassController,
                  ),
                ),
                gapH32,

                // Login and Toggle Button
                ButtonsSection(
                  loginOrSignup: 'Sign up'.hardcoded,
                  firstText: 'Already have an account?'.hardcoded,
                  secondText: 'Login here'.hardcoded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
