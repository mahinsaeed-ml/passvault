import 'package:go_router/go_router.dart';
import '../screens/home/home_screen.dart';
import '../routes/app_routes.dart';
import '../screens/auth/create_pin_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/credentials/create_credential_screen.dart';
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.createPin,
      builder: (context, state) => const CreatePinScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.createCredential,
      builder: (context, state) => const CreateCredentialScreen(),
    ),
  ],
);