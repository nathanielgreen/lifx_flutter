import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lifx_http_api/lifx_http_api.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx/widgets/molecules/brightness_slider.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<LifxClientModel>(builder: (_, lifx, __) {
      final Bulb? bulb = lifx.bulbs.firstWhere((bulb) => bulb.id == id);
      if (bulb == null) return Text("Bulb with id '$id' not found.");
      return Scaffold(
        appBar: AppBar(title: Text(bulb.label)),
        body: ListView(children: [
          Text("Label: ${bulb.label}"),
          Text("ID: ${bulb.id}"),
          Text("Kelvin: ${bulb.color.kelvin}K"),
          Text("Brightness: ${bulb.brightness.toInt() * 100}%"),
          BrightnessSlider(
            onChangeEnd: (double brightness) =>
                lifx.setLightBrightness(bulb.id, brightness: brightness / 100),
          )
        ]),
      );
    });
  }
}
