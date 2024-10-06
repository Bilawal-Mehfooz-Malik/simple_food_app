import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/components/custom_textfield.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({
    super.key,
    required this.emailController,
    required this.passController,
    this.cnfrmPassController,
  });

  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController? cnfrmPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Email Text Field
        CustomTextField(
          hintText: 'Email Address'.hardcoded,
          controller: emailController,
        ),
        gapH16,

        //* Password Text Field
        CustomTextField(
          hintText: 'Password'.hardcoded,
          controller: passController,
        ),

        //* Confirm Password Text Field
        if (cnfrmPassController != null) ...[
          gapH16,
          CustomTextField(
            hintText: 'Confirm Password'.hardcoded,
            controller: cnfrmPassController!,
          ),
        ],
      ],
    );
  }
}
