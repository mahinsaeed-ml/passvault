import 'package:flutter/material.dart';
import 'package:passvault/screens/home/home_screen.dart';

import '../../core/models/credential.dart';
import 'qr_display_screen.dart';

class CreateCredentialScreen extends StatefulWidget {
  const CreateCredentialScreen({super.key});

  @override
  State<CreateCredentialScreen> createState() =>
      _CreateCredentialScreenState();
}

class _CreateCredentialScreenState
    extends State<CreateCredentialScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _websiteController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _titleController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _generateQr() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final credential = Credential(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      username: _usernameController.text.trim(),
      password: _passwordController.text,
      website: _websiteController.text.trim().isEmpty
          ? null
          : _websiteController.text.trim(),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => QrDisplayScreen(
          credential: credential,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Credential"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Account Name",
                    hintText: "Google, GitHub, Bank...",
                    prefixIcon: Icon(Icons.account_balance_wallet),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value == null || value.trim().isEmpty
                      ? "Account Name is required"
                      : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: "Username / Email",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                  value == null || value.trim().isEmpty
                      ? "Username is required"
                      : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) =>
                  value == null || value.isEmpty
                      ? "Password is required"
                      : null,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _websiteController,
                  decoration: const InputDecoration(
                    labelText: "Website (Optional)",
                    prefixIcon: Icon(Icons.language),
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton.icon(
                    onPressed: _generateQr,
                    icon: const Icon(Icons.qr_code),
                    label: const Text(
                      "Generate Secure QR",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}