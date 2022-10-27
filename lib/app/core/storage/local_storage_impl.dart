import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage.dart';

class LocalStorageImpl extends LocalStorage {
  Future<SharedPreferences> get _instance => SharedPreferences.getInstance();

  @override
  Future<void> clear() async {
    final sharedPreferences = await _instance;
    sharedPreferences.clear();
  }

  @override
  Future<bool> contains(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.containsKey(key);
  }

  @override
  Future<void> remove(String key) async {
    final sharedPreferences = await _instance;
    sharedPreferences.remove(key);
  }

  @override
  Future<V?> read<V>(String key) async {
    final sharedPreferences = await _instance;
    return sharedPreferences.get(key) as V;
  }

  @override
  Future<void> write<V>(String key, V value) async {
    final sharedPreferences = await _instance;
    switch (V) {
      case String:
        await sharedPreferences.setString(key, value as String);
        break;
      case int:
        await sharedPreferences.setInt(key, value as int);
        break;
      case double:
        await sharedPreferences.setDouble(key, value as double);
        break;
      case bool:
        await sharedPreferences.setBool(key, value as bool);
        break;
      case List<String>:
        await sharedPreferences.setStringList(key, value as List<String>);
        break;
      default:
        throw Exception('Type Not Supported');
    }
  }
}
