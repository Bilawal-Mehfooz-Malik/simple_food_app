import 'package:flutter/material.dart';
import 'package:simple_food_app/screens/home_screen.dart';
import 'package:simple_food_app/components/custom_textfield.dart';
import 'package:simple_food_app/components/custom_elevatedbutton.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onTap;
  const LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  void loginMethod() {
    /*
     
     Fill out authentication
    
    */

    // navigate to homescreen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return const HomeScreen();
        },
      ),
    );
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
              'Food Delivery App',
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

            //* Log In Button
            CustomElevatedButton(text: 'Log in', onTap: loginMethod),
            const SizedBox(height: 16),

            //* Not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: invPriColor),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: widget.onTap,
                  child: Text(
                    'Register now',
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
