import 'package:hive/hive.dart';

class AuthProvider {
  Future<String> readApiKey() async {
    final box = await Hive.openBox('LIFX_BOX');
    final key = await box.get('LIFX_API_KEY') as String?;
    if (key == null) throw 'Auth: API Key not found in local storage';
    return key;
  }

  Future<void> setApiKey(String key) async {
    final box = await Hive.openBox('LIFX_BOX');
    await box.put('LIFX_API_KEY', key);
  }
}
