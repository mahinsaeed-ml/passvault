import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashService {
  const HashService();

  String hashPin(String pin) {
    return sha256.convert(utf8.encode(pin)).toString();
  }
}