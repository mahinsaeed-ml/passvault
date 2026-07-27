import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../routes/app_routes.dart';
import '../../widgets/number_pad.dart';
import '../../widgets/pin_indicator.dart';
import '../../core/services/auth_service.dart';
class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final AuthService _authService = AuthService();
  final List<String> _pin = [];

  Future<void> _addDigit(String digit) async {
    if (_pin.length >= 4) return;

    setState(() {
      _pin.add(digit);
    });

    if (_pin.length == 4) {
      final pin = _pin.join();

      await _authService.savePin(pin);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("PIN created successfully."),
          duration: Duration(seconds: 1),
        ),
      );

      await Future.delayed(const Duration(seconds: 1));

      if (!mounted) return;

      context.go(AppRoutes.home);
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
        title: const Text("Create PIN"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            const SizedBox(height: 30),

            const Text(
              "Create a 4-digit PIN",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

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
            ElevatedButton(
              onPressed: () async {
                final result = await _authService.verifyPin("1234");

                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Verify 1234 = $result"),
                  ),
                );
              },
              child: const Text("Test Verify"),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                await _authService.clearPin();

                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("PIN cleared"),
                  ),
                );
              },
              child: const Text("Clear PIN"),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}