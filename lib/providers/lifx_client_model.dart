import 'package:flutter/widgets.dart';
import 'package:lifx/services/lifx_client_service.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Client, Bulb;

class LifxClientModel extends ChangeNotifier {
  List<Bulb> bulbs = [];
  late Client client;

  Future<void> initializeLights() async {
    client = await LifxClientService().initializeClient();
    final Iterable<Bulb> lights = await client.listLights();
    final lightsList = lights.toList();
    bulbs = lightsList;
    notifyListeners();
  }

  Bulb? getLight(String id) {
    final Bulb bulb = bulbs.firstWhere((bulb) => bulb.id == id);
    return bulb;
  }

  void setLightPower(String id, {required bool power}) {
    final Bulb bulb = bulbs.firstWhere((bulb) => bulb.id == id);
    bulb.power = power ? "on" : "off";
    client.setState(id, power: power ? "on" : "off");
    notifyListeners();
  }

  void setLightBrightness(String id, {required double brightness}) {
    final Bulb bulb = bulbs.firstWhere((bulb) => bulb.id == id);
    bulb.brightness = brightness;
    client.setState(id, brightness: brightness);
    notifyListeners();
  }
}
