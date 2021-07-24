// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart' show Story, Storybook;

import 'package:lifx/widgets/molecules/light_switch.dart'
    show LightSwitchWidget;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Light Switch',
            builder: (_, k) {
              return LightSwitchWidget(
                power: k.boolean(label: 'Power'),
                text: k.text(label: 'Text', initial: 'Click me'),
                onClick: () => print('onClick'),
                onToggle: (power) => print('onToggle $power'),
              );
            },
          ),
        ],
      );
}
