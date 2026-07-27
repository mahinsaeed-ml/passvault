import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/services/auth_service.dart';
import '../../routes/app_routes.dart';
import '../../widgets/number_pad.dart';
import '../../widgets/pin_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _authService = AuthService();

  final List<String> _pin = [];

  Future<void> _addDigit(String digit) async {
    if (_pin.length >= 4) return;

    setState(() {
      _pin.add(digit);
    });

    if (_pin.length == 4) {
      final enteredPin = _pin.join();

      final valid = await _authService.verifyPin(enteredPin);

      if (!mounted) return;

      if (valid) {
        context.go(AppRoutes.home);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Incorrect PIN"),
          ),
        );

        setState(() {
          _pin.clear();
        });
      }
    }
  }

  void _removeDigit() {
    if (_pin.isEmpty) return;

    setState(() {
      _pin.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unlock PassVault"),
        centerTitle: true,
      ),
      body: SafeArea(child: Column(
        children: [
          const SizedBox(height: 40),

          const Text(
            "Enter your PIN",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          PinIndicator(
            length: 4,
            currentLength: _pin.length,
          ),

          const Spacer(),

          NumberPad(
            onNumberPressed: _addDigit,
            onBackspace: _removeDigit,
          ),

          const SizedBox(height: 30),
        ],
      )),
    );
  }
}