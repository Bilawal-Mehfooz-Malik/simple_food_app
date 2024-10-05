import 'package:flutter/material.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/auth_header.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/buttons_section.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/text_field_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

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
            AuthHeader(headline: 'Welcome to Nafees Online'.hardcoded),
            gapH32,

            // Text Fields
            Form(
              key: _formKey,
              child: TextFieldSection(
                emailController: _emailController,
                passController: _passController,
              ),
            ),
            gapH32,

            // Buttons
            ButtonsSection(
              loginOrSignup: 'Log in'.hardcoded,
              firstText: 'Not a member?'.hardcoded,
              secondText: 'Register now'.hardcoded,
            ),
          ],
        ),
      ),
    );
  }
}
