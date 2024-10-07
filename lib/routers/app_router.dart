import 'package:go_router/go_router.dart';
import 'package:simple_food_app/features/auth/presentation/login_screen.dart';
import 'package:simple_food_app/features/auth/presentation/signup_screen.dart';
import 'package:simple_food_app/features/auth/presentation/email_verification_screen.dart';
import 'package:simple_food_app/features/products/home_screen.dart';

enum AppRoutes { login, signup, verifyEmail, home }

final appRouter = GoRouter(
  initialLocation: '/signup/email-verification',
  routes: [
    GoRoute(
      path: '/login',
      name: AppRoutes.login.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: AppRoutes.signup.name,
      builder: (context, state) => const SignupScreen(),
      routes: [
        GoRoute(
          path: 'email-verification',
          name: AppRoutes.verifyEmail.name,
          builder: (context, state) => const EmailVerificationScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
