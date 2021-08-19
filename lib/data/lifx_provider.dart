import 'package:lifx_http_api/lifx_http_api.dart';

class LifxProvider {
  Future<List<Bulb>?> readLights(String key) async {
    final client = Client(key);
    final lights = await client.listLights();
    return lights.toList();
  }
}
