import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 20, 20),
    onSurface: Colors.grey.shade300,
    primary: const Color.fromRGBO(134, 135, 231, 1),
    onPrimary: Colors.grey.shade300,
    secondary: const Color.fromRGBO(54, 54, 54, 1),
    onSecondary: Colors.grey.shade600,
  ),
);
