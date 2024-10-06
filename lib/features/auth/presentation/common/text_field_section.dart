import 'package:flutter/material.dart';
import 'package:simple_food_app/utils/validators.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:simple_food_app/components/custom_textfield.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({
    super.key,
    required this.emailController,
    required this.passController,
    this.nameController,
    this.cnfrmPassController,
  });

  final TextEditingController? nameController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController? cnfrmPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* Name Text Field
        if (cnfrmPassController != null) ...[
          CustomTextField(
            hintText: 'Full Name'.hardcoded,
            controller: cnfrmPassController!,
            validator: Validators.validateName,
          ),
          gapH16,
        ],

        //* Email Text Field
        CustomTextField(
          hintText: 'Email Address'.hardcoded,
          controller: emailController,
          validator: Validators.validateEmail,
        ),
        gapH16,

        //* Password Text Field
        CustomTextField(
          hintText: 'Password'.hardcoded,
          controller: passController,
          validator: Validators.validatePassword,
        ),

        //* Confirm Password Text Field
        if (cnfrmPassController != null) ...[
          gapH16,
          CustomTextField(
            hintText: 'Confirm Password'.hardcoded,
            controller: cnfrmPassController!,
            validator: (value) =>
                Validators.validateConfirmPassword(value, passController.text),
          ),
        ],
      ],
    );
  }
}
