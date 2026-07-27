import 'package:flutter/material.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create PIN"),
      ),
      body: const Center(
        child: Text(
          "Create PIN Screen",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}