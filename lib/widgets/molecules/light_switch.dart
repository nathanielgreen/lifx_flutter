import 'package:flutter/material.dart';
import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';

class LightSwitch extends StatelessWidget {
  const LightSwitch({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final Bulb? bulb = Provider.of<LifxClientModel>(context).getLight(id);
    final setPower = Provider.of<LifxClientModel>(context).setLightPower;
    if (bulb == null) return const Text("No bulb with that id found");
    return LightSwitchWidget(
      text: bulb.label,
      onClick: () => print('hi'),
      onToggle: (bool power) {
        setPower(bulb.id, power: power);
        bulb.power = power ? "on" : "off";
      },
      power: bulb.power == "on",
    );
  }
}

class LightSwitchWidget extends StatelessWidget {
  LightSwitchWidget({
    Key? key,
    required this.text,
    required this.onClick,
    required this.onToggle,
    required this.power,
  }) : super(key: key);

  final ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, color: Colors.blue),
    primary: const Color(0xFF524f60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(180.0),
    ),
  );
  final String text;
  final Function() onClick;
  final Function(bool) onToggle;
  final bool power;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: style,
        onPressed: onClick,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Switch(value: power, onChanged: onToggle),
            ],
          ),
        ),
      );
}
