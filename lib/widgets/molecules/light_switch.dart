import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LightSwitch extends StatelessWidget {
  const LightSwitch({
    Key? key,
    required this.text,
    required this.onClick,
    required this.onToggle,
    required this.power,
  }) : super(key: key);

  final String text;
  final Function() onClick;
  final Function(bool) onToggle;
  final bool power;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, color: Colors.blue),
            primary: const Color(0xFF202224),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          onPressed: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text),
                Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Theme.of(context).accentColor,
                    value: power,
                    onChanged: onToggle,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
