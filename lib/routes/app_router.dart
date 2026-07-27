import 'package:go_router/go_router.dart';
import '../screens/auth/create_pin_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/splash/splash_screen.dart';
import 'app_routes.dart';
import '../screens/auth/create_pin_screen.dart';
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [

    GoRoute(
      path: AppRoutes.splash,
      builder: (_, __) => const SplashScreen(),
    ),

    GoRoute(
      path: AppRoutes.login,
      builder: (_, __) => const LoginScreen(),
    ),

    GoRoute(
      path: AppRoutes.createPin,
      builder: (_, __) => const CreatePinScreen(),
    ),
  ],
);