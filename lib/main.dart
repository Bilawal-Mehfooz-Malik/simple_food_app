import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/features/auth/presentation/login_screen.dart';
import 'package:simple_food_app/models/restaurant.dart';
import 'package:simple_food_app/themes/dark_mode.dart';
import 'package:simple_food_app/themes/theme_provider.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const riverpod.ProviderScope(child: MyApp()),
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
