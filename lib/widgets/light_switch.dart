import 'package:flutter/material.dart';

class LightSwitch extends StatefulWidget {
  final String text;
  final Function onClick;
  final Function(bool) onToggle;
  final bool power;

  const LightSwitch({
    Key? key,
    required this.text,
    required this.onClick,
    required this.onToggle,
    required this.power,
  }) : super(key: key);

  @override
  _LightSwitchState createState() => _LightSwitchState();
}

class _LightSwitchState extends State<LightSwitch> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  late bool _power;

  @override
  void initState() {
    super.initState();
    _power = widget.power;
  }

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: style,
        onPressed: () => widget.onClick(),
        child: Row(children: [
          Text(widget.text),
          Switch(
            value: _power,
            onChanged: (bool newValue) {
              setState(() {
                _power = newValue;
                widget.onToggle(_power);
              });
            },
          ),
        ]),
      );
}
