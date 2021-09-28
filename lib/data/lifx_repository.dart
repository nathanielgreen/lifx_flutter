import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LifxRepository {
  final AuthProvider authProvider;
  final LifxProvider lifxProvider;

  LifxRepository({
    required this.authProvider,
    required this.lifxProvider,
  });

  Future<String?> getKey() async {
    final key = await authProvider.readApiKey();
    return key;
  }

  Future<String> updateKey(String key) async {
    await authProvider.setApiKey(key);
    final newKey = await authProvider.readApiKey();
    return newKey;
  }

  Future<List<Bulb>> getBulbs() async {
    final String key = await authProvider.readApiKey();
    final List<Bulb>? bulbs = await lifxProvider.readLights(key);
    if (bulbs == null) throw "No bulbs found";
    return bulbs;
  }

  Future<void> updateLight(
    String id, {
    double? brightness,
    String? power,
  }) async {
    try {
      final String key = await authProvider.readApiKey();
      final client = Client(key);
      await client.setState(id, brightness: brightness, power: power);
    } catch (e) {
      throw Exception(e);
    }
  }
}
