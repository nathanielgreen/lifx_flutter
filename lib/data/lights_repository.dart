import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LightsRepository {
  final AuthProvider authProvider;
  final LifxProvider lifxProvider;

  LightsRepository({
    required this.authProvider,
    required this.lifxProvider,
  });

  Future<void> updateKey(String key) async {
    await authProvider.setApiKey(key);
  }

  Future<List<Bulb>> getBulbs() async {
    final String? key = await authProvider.readApiKey();
    if (key == null) throw "No API Key Found";
    final List<Bulb>? bulbs = await lifxProvider.readLights(key);
    if (bulbs == null) throw "No bulbs found";
    return bulbs;
  }
}
