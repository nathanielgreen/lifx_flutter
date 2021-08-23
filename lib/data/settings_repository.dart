import 'package:lifx/data/auth_provider.dart';

class SettingsRepository {
  final AuthProvider authProvider;

  SettingsRepository({
    required this.authProvider,
  });

  Future<String> getKey() async {
    final key = await authProvider.readApiKey();
    return key;
  }

  Future<String> updateKey(String key) async {
    await authProvider.setApiKey(key);
    final newKey = await authProvider.readApiKey();
    return newKey;
  }
}
