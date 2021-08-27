import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lifx/widgets/global/top_bar.dart';
import 'package:lifx/features/lights/lights.dart';
import 'package:lifx/utils/lights_to_bulb_group.dart' show lightsToBulbGroup;
import 'package:lifx/widgets/organisms/lights_list.dart';

class LightsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: topBar("All Lights"),
      body: Center(
        child: BlocBuilder<LightsCubit, LightsState>(builder: (context, state) {
          if (state is LightsLoaded || state is LightsUpdated) {
            return LightList(bulbGroups: lightsToBulbGroup(state.lights));
          }
          if (state is LightsError) {
            return Text('ERROR: ${state.message}');
          }
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
