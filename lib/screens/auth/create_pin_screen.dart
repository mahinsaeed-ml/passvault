import 'package:flutter/material.dart';

import '../../widgets/number_pad.dart';
import '../../widgets/pin_indicator.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  final List<String> _pin = [];

  void _addDigit(String digit) {
    if (_pin.length >= 4) return;

    setState(() {
      _pin.add(digit);
    });

    if (_pin.length == 4) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("PIN Entered: ${_pin.join()}"),
          ),
        );
      });
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
          ],
        ),
      ),
    );
  }
}