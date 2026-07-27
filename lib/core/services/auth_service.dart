import 'package:shared_preferences/shared_preferences.dart';

import '../crypto/hash_service.dart';

class AuthService {
  static const String _pinKey = 'user_pin_hash';

  final HashService _hashService = HashService();

  Future<void> savePin(String pin) async {
    final prefs = await SharedPreferences.getInstance();
    final hash = _hashService.hashPin(pin);
    await prefs.setString(_pinKey, hash);
  }

  Future<bool> pinExists() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_pinKey);
  }

  Future<bool> verifyPin(String pin) async {
    final prefs = await SharedPreferences.getInstance();

    final storedHash = prefs.getString(_pinKey);

    if (storedHash == null) {
      return false;
    }

    final enteredHash = _hashService.hashPin(pin);

    return storedHash == enteredHash;
  }

  Future<void> clearPin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_pinKey);
  }
}