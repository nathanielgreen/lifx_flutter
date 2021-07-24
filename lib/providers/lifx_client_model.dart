import 'package:flutter/widgets.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/locations/settings_location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Client, Bulb;

class LifxClientModel extends ChangeNotifier {
  Client _client = Client("");
  List<Bulb> bulbs = [];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Client get client => _client;

  Future<void> createClient(BuildContext context) async {
    final SharedPreferences prefs = await _prefs;
    final key = prefs.getString("LIFX_API_KEY");
    if (key == null) {
      Beamer.of(context).beamTo(SettingsLocation());
      throw Exception("No API key was found");
    }
    _client = Client(key);
    notifyListeners();
  }

  Future<void> initializeLights() async {
    final Iterable<Bulb> lights = await client.listLights();
    final lightsList = lights.toList();
    bulbs.addAll(lightsList);
    notifyListeners();
  }

  Bulb? getLight(String id) {
    final Bulb bulb = bulbs.firstWhere((bulb) => bulb.id == id);
    return bulb;
  }

  void setLightPower(String id, {required bool power}) {
    client.setState(id, power: power ? "on" : "off");
    notifyListeners();
  }
}
