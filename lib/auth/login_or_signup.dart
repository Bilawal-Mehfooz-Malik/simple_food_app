import 'package:flutter/material.dart';
import 'package:simple_food_app/auth/screens/login_screen.dart';
import 'package:simple_food_app/auth/screens/signup_screen.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  bool _loginScreen = true;

  void toggleScreen() {
    setState(() {
      _loginScreen = !_loginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loginScreen == true) {
      return LoginScreen(onTap: toggleScreen);
    } else {
      return SignupScreen(onTap: toggleScreen);
    }
  }
}
