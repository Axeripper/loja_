import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserIdToken {
  static const _storage = FlutterSecureStorage();

  static const _keyUserid = 'id';

  static Future saveidToken(String id) async =>
      await _storage.write(key: _keyUserid, value: id);

  static Future<String?> getUserid() async =>
      await _storage.read(key: _keyUserid);
}
