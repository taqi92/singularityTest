import 'package:shared_preferences/shared_preferences.dart';

/*class SharedPref {
  SharedPref._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<bool> isKeyExists(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      return false;
    }
  }

  static Future<String?> read(var key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> write(String key, value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> remove(String key) async {
    try {
      await _storage.delete(key: key);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> removeAll() async {
    try {
      await _storage.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}*/


class SharedPref {
  static Future<bool> isKeyExists(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.containsKey(key);
    } catch (e) {
      return false;
    }
  }

  static Future<String?> read(var key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> write(String key, value) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.setString(key, value);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> remove(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.remove(key);
    } catch (e) {
      return false;
    }
  }

  static Future<bool> removeAll() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      var keys = prefs.getKeys();

      for(var key in keys) {
        prefs.remove(key);
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
