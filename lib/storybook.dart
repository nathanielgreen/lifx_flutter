// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import './widgets/light_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Light Switch',
            section: 'Buttons',
            builder: (_, k) {
              return LightSwitch(
                power: k.boolean(label: 'Power'),
                text: k.text(label: 'Text', initial: 'Click me'),
                onClick: () => print('onClick'),
                onToggle: (val) => print('onToggle $val'),
              );
            },
          ),
        ],
      );
}
