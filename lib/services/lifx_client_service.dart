import 'package:lifx_http_api/lifx_http_api.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class LifxClientService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Client> initializeClient() async {
    final SharedPreferences prefs = await _prefs;
    final key = prefs.getString("LIFX_API_KEY");
    if (key == null) {
      throw Error.safeToString('No API Key was found');
    }
    return Client(key);
  }
}
