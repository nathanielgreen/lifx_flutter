import 'package:flutter/material.dart';

class LightSwitch extends StatefulWidget {
  final String text;
  final Function onClick;
  final Function(bool) onToggle;
  bool power;

  LightSwitch({
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

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: style,
        onPressed: () => widget.onClick(),
        child: Row(children: [
          Text(widget.text),
          Switch(
            value: widget.power,
            onChanged: (val) {
              widget.onToggle(val);
              setState(() {
                widget.power = val;
              });
            },
          ),
        ]),
      );
}
