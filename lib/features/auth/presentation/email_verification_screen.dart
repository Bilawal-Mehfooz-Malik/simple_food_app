import 'package:flutter/material.dart';
import 'package:simple_food_app/utils/extensions.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/components/responsive_center.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify your email'.hardcoded)),
      body: SafeArea(
        child: ResponsiveCenter(
          child: ListView(
            padding: const EdgeInsets.all(Sizes.p16),
            children: [
              // Body Text
              Text(
                  'We\'ve sent a verification email to bilawal@gmail.com. Please check your inbox to verify your email and press continue. If you don\'t see it, kindly check your spam or junk.'
                      .hardcoded),
              gapH24,

              // Continue Button
              ElevatedButton(
                onPressed: () {},
                child: Text('Continue'.hardcoded),
              ),
              gapH4,

              // Resend Button
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      WidgetStatePropertyAll(context.color.primary),
                ),
                onPressed: () {},
                child: Text('Resend'.hardcoded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
