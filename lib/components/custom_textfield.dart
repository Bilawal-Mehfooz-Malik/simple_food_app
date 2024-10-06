import 'package:flutter/material.dart';
import 'package:simple_food_app/components/app_sizes.dart';
import 'package:simple_food_app/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: _border(context.color.onSecondary),
        focusedBorder: _border(context.color.primary),
        errorBorder: _border(context.color.error),
        focusedErrorBorder: _border(context.color.primary),
        hintStyle: TextStyle(color: context.color.onSecondary),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(Sizes.p8),
    );
  }
}
