import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx/data/lights_repository.dart';

import '../lights.dart';
import 'lights_view.dart';

class LightsPage extends StatelessWidget {
  const LightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return BlocProvider(
      create: (_) => LightsCubit(
        LightsRepository(
          authProvider: AuthProvider(),
          lifxProvider: LifxProvider(),
        ),
      ),
      child: LightsView(),
    );
  }
}
