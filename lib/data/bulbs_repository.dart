import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class BulbsRepository {
  final AuthProvider authProvider;
  final LifxProvider lifxProvider;

  BulbsRepository({
    required this.authProvider,
    required this.lifxProvider,
  });

  Future<List<Bulb>> getBulbs() async {
    final String? key = await authProvider.readApiKey();
    if (key == null) throw "No API Key Found";
    final List<Bulb>? bulbs = await lifxProvider.readLights(key);
    if (bulbs == null) throw "No bulbs found";
    return bulbs;
  }
}
