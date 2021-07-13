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
              var power = false;
              return LightSwitch(
                power: k.boolean(label: 'Power', initial: power),
                text: k.text(label: 'Text', initial: 'Click me'),
                onClick: () => print('onClick'),
                onToggle: (val) {
                  power = true;
                },
              );
            },
          ),
        ],
      );
}
