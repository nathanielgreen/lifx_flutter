import 'package:flutter/material.dart';
import 'package:lifx/utils/lights_to_bulb_group.dart' show BulbGroup;
import 'package:lifx/widgets/atoms/group_header.dart';
import 'package:lifx/widgets/molecules/light_switch.dart';

class LightList extends StatelessWidget {
  final List<BulbGroup> bulbGroups;

  const LightList({
    Key? key,
    required this.bulbGroups,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: bulbGroups.map((group) {
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
                    onClick: () => null,
                    onToggle: (bool power) => print(bool),
                  ),
                )
                .toList(),
          ],
        ),
      );
    }).toList());
  }
}
