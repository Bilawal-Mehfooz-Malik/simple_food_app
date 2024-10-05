import 'package:flutter/material.dart';
import 'package:simple_food_app/components/border.dart';
import 'package:simple_food_app/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: border(context.color.secondary),
        focusedBorder: border(context.color.primary),
        hintStyle: TextStyle(color: context.color.onSecondary),
      ),
    );
  }
}
