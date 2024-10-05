import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/features/auth/presentation/login_screen.dart';
import 'package:simple_food_app/models/restaurant.dart';
import 'package:simple_food_app/themes/dark_mode.dart';
import 'package:simple_food_app/themes/theme_provider.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Food App'.hardcoded,
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      // theme: Provider.of<ThemeProvider>(context).themeData,
      home: const LoginScreen(),
    );
  }
}
