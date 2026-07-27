import 'package:flutter/material.dart';
import 'routes/app_router.dart';
import 'theme/app_theme.dart';
// Temporary test
// final auth = AuthService();
// await auth.savePin("1234");
// print(await auth.verifyPin("1234")); // true
// print(await auth.verifyPin("4321")); // false

void main() {
  runApp(const PassVaultApp());

}

class PassVaultApp extends StatelessWidget {
  const PassVaultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'PassVault',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}