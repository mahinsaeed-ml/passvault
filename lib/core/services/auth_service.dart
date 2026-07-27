import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../crypto/hash_service.dart';

class AuthService {
  static const _pinKey = 'user_pin_hash';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  final HashService _hashService = const HashService();

  Future<void> savePin(String pin) async {
    final hash = _hashService.hashPin(pin);

    await _storage.write(
      key: _pinKey,
      value: hash,
    );
  }

  Future<bool> pinExists() async {
    final value = await _storage.read(key: _pinKey);
    return value != null;
  }

  Future<bool> verifyPin(String pin) async {
    final stored = await _storage.read(key: _pinKey);

    if (stored == null) {
      return false;
    }

    final hash = _hashService.hashPin(pin);

    return hash == stored;
  }

  Future<void> clearPin() async {
    await _storage.delete(key: _pinKey);
  }
}