import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;

import '../models/credential.dart';

class CryptoService {
  CryptoService._();

  static final CryptoService instance = CryptoService._();

  // MUST be exactly 32 bytes (AES-256)
  static const String _secretKey =
      'PassVaultSecureKey2026AES256Key!';

  final encrypt.Key _key =
  encrypt.Key.fromUtf8(_secretKey);

  /// Encrypts a credential and returns:
  ///
  /// Base64(IV + CipherText)
  String encryptCredential(Credential credential) {
    final json = jsonEncode(credential.toJson());

    final iv = _generateRandomIV();

    final aes = encrypt.Encrypter(
      encrypt.AES(
        _key,
        mode: encrypt.AESMode.cbc,
      ),
    );

    final encrypted = aes.encrypt(
      json,
      iv: iv,
    );

    final combined = Uint8List.fromList([
      ...iv.bytes,
      ...encrypted.bytes,
    ]);

    return base64Encode(combined);
  }

  Credential decryptCredential(String encryptedText) {
    final combined = base64Decode(encryptedText);

    final iv = encrypt.IV(
      combined.sublist(0, 16),
    );

    final cipherBytes = combined.sublist(16);

    final aes = encrypt.Encrypter(
      encrypt.AES(
        _key,
        mode: encrypt.AESMode.cbc,
      ),
    );

    final decrypted = aes.decrypt(
      encrypt.Encrypted(cipherBytes),
      iv: iv,
    );

    final Map<String, dynamic> json =
    jsonDecode(decrypted);

    return Credential.fromJson(json);
  }

  encrypt.IV _generateRandomIV() {
    final random = Random.secure();

    final bytes = Uint8List.fromList(
      List<int>.generate(
        16,
            (_) => random.nextInt(256),
      ),
    );

    return encrypt.IV(bytes);
  }
}