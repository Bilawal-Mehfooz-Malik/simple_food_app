import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/components/custom_elevatedbutton.dart';
import 'package:simple_food_app/features/auth/presentation/login_screen.dart';
import 'package:simple_food_app/features/auth/presentation/signup_screen.dart';
import 'package:simple_food_app/features/auth/presentation/widgets/bottom_toggle_button.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
    required this.loginOrSignup,
    required this.firstText,
    required this.secondText,
  });

  final String loginOrSignup;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Log In Button
        CustomElevatedButton(
          text: loginOrSignup,
          onTap: () {},
        ),
        gapH16,

        //* Not a member? register now
        BottomToggleButton(
          firstText: firstText,
          secondText: secondText,
          onTap: () => _toggleAuth(context),
        ),
      ],
    );
  }

  void _toggleAuth(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          switch (loginOrSignup) {
            case 'sign up':
              return const LoginScreen();

            case 'Log in':
              return const SignupScreen();

            default:
              return const LoginScreen();
          }
        },
      ),
    );
  }
}
