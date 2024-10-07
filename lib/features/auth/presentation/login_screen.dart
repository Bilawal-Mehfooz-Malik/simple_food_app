import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/routers/app_router.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/components/breakpoints.dart';
import 'package:simple_food_app/components/responsive_center.dart';
import 'package:simple_food_app/features/auth/presentation/common/auth_header.dart';
import 'package:simple_food_app/features/auth/presentation/common/text_field_section.dart';
import 'package:simple_food_app/features/auth/presentation/common/bottom_toggle_button.dart';
import 'package:simple_food_app/features/auth/presentation/forgot_password/forgot_password_button.dart';

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
      body: SafeArea(
        child: ResponsiveCenter(
          showBorder: true,
          maxContentWidth: Breakpoint.tablet,
          child: Scrollbar(
            interactive: true,
            thumbVisibility: true,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Header
                  AuthHeader(headline: 'Welcome to Nafees Online'.hardcoded),
                  gapH48,

                  // Text Fields
                  Form(
                    key: _formKey,
                    child: TextFieldSection(
                      emailController: _emailController,
                      passController: _passController,
                    ),
                  ),
                  gapH16,

                  // Forgot Password?
                  ForgotPasswordButton(emailController: _emailController),
                  gapH16,

                  //* Log In Button
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Log in'.hardcoded),
                  ),
                  gapH4,

                  //* Not a member? register now
                  BottomToggleButton(
                    firstText: 'Not a member?'.hardcoded,
                    secondText: 'Register now'.hardcoded,
                    onTap: () => context.goNamed(AppRoutes.signup.name),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      // TODO: add login logic
    }
  }
}
