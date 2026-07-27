import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PassVault"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),

              const Icon(
                Icons.qr_code_2_rounded,
                size: 80,
              ),

              const SizedBox(height: 20),

              const Text(
                "Secure Credential Transfer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Create a credential, encrypt it using AES-256, and securely transfer it to your PassVault device using QR codes.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),

              const Spacer(),

              SizedBox(
                height: 55,
                child: FilledButton.icon(
                  onPressed: () {
                    context.push(AppRoutes.createCredential);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    "Create Credential",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [
                      Row(
                        children: [
                          Icon(Icons.history),
                          SizedBox(width: 12),
                          Text("Last Transfer"),
                          Spacer(),
                          Text("None"),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Icon(Icons.memory),
                          SizedBox(width: 12),
                          Text("PassVault Device"),
                          Spacer(),
                          Text("Not Connected"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}