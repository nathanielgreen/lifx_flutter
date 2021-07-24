import 'package:flutter/material.dart';
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
    final List<Bulb> bulbs = context.watch<LifxClientModel>().bulbs;
    if (bulbs.isEmpty) return const Text("No bulbs found");
    return _LightListWidget(bulbs: bulbs);
  }
}

class _LightListWidget extends StatelessWidget {
  const _LightListWidget({
    Key? key,
    required this.bulbs,
  }) : super(key: key);

  final List<Bulb> bulbs;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: bulbs
            .map(
              (Bulb bulb) => LightSwitch(
                id: bulb.id,
              ),
            )
            .toList());
  }
}
