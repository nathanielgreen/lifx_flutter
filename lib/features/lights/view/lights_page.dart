import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../lights.dart';
import './lights_view.dart';

class LightsPage extends StatelessWidget {
  const LightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<LightsCubit>(context)..getLights(),
      child: LightsView(),
    );
  }
}
