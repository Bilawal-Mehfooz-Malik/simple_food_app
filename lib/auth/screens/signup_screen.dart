import 'package:flutter/material.dart';
import 'package:simple_food_app/components/custom_textfield.dart';
import 'package:simple_food_app/components/custom_elevatedbutton.dart';

class SignupScreen extends StatefulWidget {
  final VoidCallback onTap;
  const SignupScreen({super.key, required this.onTap});

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
    final style = Theme.of(context);
    final invPriColor = style.colorScheme.inversePrimary;
    return Scaffold(
      backgroundColor: style.colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //* Logo
            Icon(size: 72, Icons.lock_open_rounded, color: invPriColor),
            const SizedBox(height: 24),

            //* Message, app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(fontSize: 16, color: invPriColor),
            ),
            const SizedBox(height: 24),

            //* Email Text Field
            CustomTextField(
              hintText: 'Email Address',
              controller: _emailController,
            ),
            const SizedBox(height: 16),

            //* Password Text Field
            CustomTextField(
              hintText: 'Password',
              controller: _passController,
            ),
            const SizedBox(height: 16),

            //* Confirm Password Text Field
            CustomTextField(
              hintText: 'Confirm Password',
              controller: _cnfrmPassController,
            ),
            const SizedBox(height: 16),

            //* Log In Button
            CustomElevatedButton(text: 'Sign up', onTap: () {}),
            const SizedBox(height: 16),

            //* Already have an account? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: invPriColor),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: widget.onTap,
                  child: Text(
                    'Login here',
                    style: TextStyle(
                      color: invPriColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
