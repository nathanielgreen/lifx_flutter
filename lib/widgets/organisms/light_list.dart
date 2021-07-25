import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx/widgets/atoms/group_header.dart';
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
      builder: (_, lifx, __) => ListView(
        children: lifx.bulbsByGroup.map((group) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                GroupHeader(text: group.name),
                ...group.bulbs
                    .map(
                      (bulb) => LightSwitch(
                        id: bulb.id,
                        text: bulb.label,
                        power: bulb.power == "on",
                        onClick: () => context.beamToNamed('lights/${bulb.id}'),
                        onToggle: (bool power) =>
                            setLightPower(bulb.id, power: power),
                      ),
                    )
                    .toList(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
