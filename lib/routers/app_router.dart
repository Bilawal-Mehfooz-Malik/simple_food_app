import 'package:go_router/go_router.dart';
import 'package:simple_food_app/features/auth/presentation/login_screen.dart';
import 'package:simple_food_app/features/auth/presentation/signup_screen.dart';
import 'package:simple_food_app/screens/home_screen.dart';

enum AppRoutes { login, signup, home }

final appRouter = GoRouter(
  initialLocation: '/login',
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
    ),
    GoRoute(
      path: '/',
      name: AppRoutes.home.name,
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
