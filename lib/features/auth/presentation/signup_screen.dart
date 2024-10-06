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

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _cnfrmPassController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _cnfrmPassController.dispose();
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
                children: [
                  // Header
                  AuthHeader(
                      headline: 'Let\'s create an account for you'.hardcoded),
                  gapH48,

                  // Text Fields
                  Form(
                    key: _formKey,
                    child: TextFieldSection(
                      nameController: _nameController,
                      emailController: _emailController,
                      passController: _passController,
                      cnfrmPassController: _cnfrmPassController,
                    ),
                  ),
                  gapH32,

                  //* Log In Button
                  ElevatedButton(
                    onPressed: _signup,
                    child: Text('sign up'.hardcoded),
                  ),
                  gapH4,

                  //* Already have an account? Login here
                  BottomToggleButton(
                    firstText: 'Already have an account?'.hardcoded,
                    secondText: 'Login here'.hardcoded,
                    onTap: () => context.goNamed(AppRoutes.login.name),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      // add login logic
    }
  }
}
