import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show LifxPower;

import 'package:lifx/utils/lights_to_bulb_group.dart' show BulbGroup;
import 'package:lifx/widgets/atoms/group_header.dart';
import 'package:lifx/widgets/molecules/light_switch.dart';
import 'package:lifx/features/lights/lights.dart';

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
                    power: bulb.power == LifxPower.on,
                    onClick: () => context.beamToNamed('/lights/${bulb.id}'),
                    onToggle: (bool power) =>
                        BlocProvider.of<LightsCubit>(context)
                            .togglePower(bulb.id, power),
                  ),
                )
                .toList(),
          ],
        ),
      );
    }).toList());
  }
}
