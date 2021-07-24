// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart' show Story, Storybook;
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb, LifxColor;

import 'package:lifx/widgets/molecules/light_switch.dart'
    show LightSwitchWidget;
import 'package:lifx/widgets/organisms/light_list.dart' show LightListWidget;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Light Switch',
            section: "Molecules",
            builder: (_, k) {
              return LightSwitchWidget(
                power: k.boolean(label: 'Power'),
                text: k.text(label: 'Text', initial: 'Light 1'),
                onClick: () => print('onClick'),
                onToggle: (power) => print('onToggle $power'),
              );
            },
          ),
          Story(
            name: 'Light List',
            section: "Organisms",
            builder: (_, k) {
              final LifxColor c = LifxColor(hue: 0, saturation: 0, kelvin: 0);
              return LightListWidget(bulbs: [
                Bulb(
                  label: "Bulb 1",
                  brightness: 100,
                  power: "on",
                  connected: true,
                  uuid: "1",
                  color: c,
                  id: "1",
                ),
              ]);
            },
          ),
        ],
      );
}
