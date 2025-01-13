import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final storage = FlutterSecureStorage();

  static Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> write(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  static Future<Map<String, String>> allValues() async {
    return await storage.readAll();
  }
}
