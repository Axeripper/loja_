import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserToken {
  static const _storage = FlutterSecureStorage();

  static const _keyUserEmail = 'email';

  static Future saveToken(String email) async =>
      await _storage.write(key: _keyUserEmail, value: email);

  static Future<String?> getUserEmail() async =>
      await _storage.read(key: _keyUserEmail);
}
