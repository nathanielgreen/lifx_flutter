import 'package:flutter/material.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb, Client;
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/global/top_bar.dart';
import '../widgets/light_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late final Client client;

  Future<Iterable<Bulb>> getLights() async {
    final SharedPreferences prefs = await _prefs;
    final key = prefs.getString("LIFX_API_KEY");
    if (key == null) throw Exception("No API key was found");
    final client = Client(key);
    return client.listLights();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Center(
        child: LightList(futureLights: getLights()),
      ),
    );
  }
}
