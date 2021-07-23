import 'package:flutter/material.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb;
import './light_switch.dart';

class LightList extends StatelessWidget {
  const LightList({
    Key? key,
    required this.futureLights,
  }) : super(key: key);

  final Future<Iterable<Bulb>> futureLights;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Iterable<Bulb>>(
      future: futureLights,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!
                .map((Bulb bulb) => LightSwitch(
                    text: bulb.label,
                    onClick: () => {},
                    onToggle: (bool power) => {},
                    power: bulb.connected))
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
