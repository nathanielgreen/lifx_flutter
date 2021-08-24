import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

import 'package:lifx/widgets/global/top_bar.dart';
import 'package:lifx/widgets/atoms/group_header.dart';
import 'package:lifx/widgets/molecules/bulb_detail.dart';
import 'package:lifx/widgets/molecules/brightness_slider.dart';
import 'package:lifx/features/lights/lights.dart';

class LightView extends StatelessWidget {
  const LightView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LightsCubit, LightsState>(builder: (context, state) {
      final Bulb bulb = state.lights.firstWhere((bulb) => bulb.id == id);
      return Scaffold(
        appBar: topBar('Light'),
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const GroupHeader(
                    text: "Bulb Details",
                    alignment: Alignment.center,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: BulbDetail(
                    label: "Label",
                    value: bulb.label,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: BulbDetail(
                    label: "ID",
                    value: bulb.id,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: BulbDetail(
                    label: "Kelvin",
                    value: "${bulb.color.kelvin}K",
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: GroupHeader(
                    text: "Brightness: ${(bulb.brightness * 100).toInt()}%",
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: BrightnessSlider(
                      onChangeEnd: (double brightness) => print(brightness),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      );
    });
  }
}
