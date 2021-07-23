// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import './widgets/molecules/light_switch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Storybook(
        children: [
          Story(
            name: 'Light Switch',
            builder: (_, k) {
              return LightSwitch(
                id: "1",
                power: false,
                text: k.text(label: 'Text', initial: 'Click me'),
                onClick: () => print('onClick'),
                onToggle: (id, power) => print('onToggle $id $power'),
              );
            },
          ),
        ],
      );
}
