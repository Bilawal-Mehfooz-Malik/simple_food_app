import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_food_app/models/restaurant.dart';
import 'package:simple_food_app/routers/app_router.dart';
import 'package:simple_food_app/themes/dark_mode.dart';
import 'package:simple_food_app/themes/theme_provider.dart';
import 'package:simple_food_app/utils/string_hardcoded.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
// ignore:depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  registerErrorHandlers();
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
    return MaterialApp.router(
      title: 'Simple Food App'.hardcoded,
      debugShowCheckedModeBanner: false,
      theme: darkMode,
      // theme: Provider.of<ThemeProvider>(context).themeData,
      routerConfig: appRouter,
    );
  }
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occurred'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
