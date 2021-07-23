import 'package:flutter/material.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb;
import '../molecules/light_switch.dart';

class LightList extends StatelessWidget {
  const LightList({
    Key? key,
    required this.futureLights,
    required this.onToggle,
  }) : super(key: key);

  final Future<Iterable<Bulb>> futureLights;
  final Future<void> Function(String, bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Bulb>>(
      future: futureLights,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!
                .map(
                  (Bulb bulb) => LightSwitch(
                      id: bulb.id,
                      text: bulb.label,
                      onClick: () => {},
                      onToggle: onToggle,
                      power: bulb.power == "on"),
                )
                .toList(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
