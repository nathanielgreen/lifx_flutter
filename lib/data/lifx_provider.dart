import 'package:lifx_http_api/lifx_http_api.dart';

class LifxProvider {
  Future<List<Bulb>?> readLights(String key) async {
    final client = Client(key);
    final lights = await client.listLights();
    return lights.toList();
  }

  Future<void> updateLight(String key, String id,
      {double? brightness, String? power}) async {
    final client = Client(key);
    await client.setState(id, brightness: brightness, power: power);
  }
}
