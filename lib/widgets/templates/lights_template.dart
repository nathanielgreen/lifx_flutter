import 'package:flutter/material.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb;
import '../global/top_bar.dart';
import '../organisms/light_list.dart';

class LightsTemplate extends StatelessWidget {
  const LightsTemplate({
    Key? key,
    required this.futureLights,
    required this.onToggle,
  }) : super(key: key);

  final Future<Iterable<Bulb>> futureLights;
  final Future<void> Function(String, bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Center(
        child: LightList(
          futureLights: futureLights,
          onToggle: onToggle,
        ),
      ),
    );
  }
}
