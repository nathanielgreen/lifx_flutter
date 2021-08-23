import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lifx/widgets/global/top_bar.dart';
import 'package:lifx/features/lights/lights.dart';

class LightsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: topBar("All Lights"),
      body: Center(child: BlocBuilder<LightsCubit, LightsState>(
        builder: (context, state) {
          return Text('$state');
        },
      )),
    );
  }
}
