import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Client;

class LifxClientProvider extends ChangeNotifier {
  late Client client;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> createClient() async {
    final SharedPreferences prefs = await _prefs;
    final key = prefs.getString("LIFX_API_KEY");
    if (key == null) throw Exception("No API key was found");
    client = Client(key);
    notifyListeners();
  }
}
