import 'package:go_router/go_router.dart';
import 'package:idea/presentation/screens/auth/login_screen.dart';
import 'package:idea/presentation/screens/auth/register_screen.dart';
import 'package:idea/presentation/screens/home_screen.dart';
import 'package:idea/routing/app_routes.dart';

GoRouter createRouter() {
  return GoRouter(
      initialLocation: '/',
    routes: [
      
      // Define your routes here
      GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
      GoRoute(path: AppRoutes.registerRoute, 
      builder: (context, state) => const RegisterPage()),

      GoRoute(path: AppRoutes.loginRoute, 
      builder: (context, state) => const LoginPage()),
    ],
  );
}