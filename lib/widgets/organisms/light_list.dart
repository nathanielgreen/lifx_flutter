import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb;
import 'package:provider/provider.dart';
import '../molecules/light_switch.dart';

class LightList extends StatelessWidget {
  const LightList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final setLightPower = Provider.of<LifxClientModel>(context).setLightPower;
    return Consumer<LifxClientModel>(
      builder: (_, lifx, __) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: lifx.bulbs
              .map(
                (Bulb bulb) => LightSwitch(
                  text: bulb.label,
                  onClick: () => context.beamToNamed('/lights/${bulb.id}'),
                  onToggle: (bool power) =>
                      setLightPower(bulb.id, power: power),
                  power: bulb.power == "on",
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
