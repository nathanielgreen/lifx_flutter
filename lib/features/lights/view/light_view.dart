import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifx/widgets/organisms/light_settings.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

import 'package:lifx/widgets/global/top_bar.dart';
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
        body: LightSettings(bulb: bulb),
      );
    });
  }
}
