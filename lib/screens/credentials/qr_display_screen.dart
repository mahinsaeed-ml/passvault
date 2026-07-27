import 'package:flutter/material.dart';

import '../../core/models/credential.dart';
import '../../core/crypto/crypto_service.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDisplayScreen extends StatelessWidget {
  final Credential credential;

  const QrDisplayScreen({
    super.key,
    required this.credential,
  });

  @override
  Widget build(BuildContext context) {

// Encrypt
    final encryptedPayload =
    CryptoService.instance.encryptCredential(credential);


    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Display"),
      ),
      body: SafeArea( child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.qr_code_2,
              size: 100,
            ),

            const SizedBox(height: 20),

            const Text(
              "Scan with PassVault Device",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: QrImageView(
                    data: encryptedPayload,
                    version: QrVersions.auto,
                    size: 300,
                    backgroundColor: Colors.white,
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Colors.black,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Colors.black,
                    ),
                  ),
                )
              ),
            ),

            FilledButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      )),
    );
  }
}