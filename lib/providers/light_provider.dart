import 'package:flutter/material.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Client, Bulb;

class Lights with ChangeNotifier {
  final lifxClient = Client("");
  Iterable<Bulb> lights = [];

  Future<List<Bulb>> fetchLights() async {
    final Iterable<Bulb> bulbs = await lifxClient.listLights();
    return lights = bulbs.toList();
  }
}
