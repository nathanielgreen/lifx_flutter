import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx/data/lights_repository.dart';

import '../lights.dart';
import './light_view.dart';
import './lights_view.dart';

class LightsLocation extends BeamLocation {
  final LightsCubit _lightsCubit = LightsCubit(
    LightsRepository(
      authProvider: AuthProvider(),
      lifxProvider: LifxProvider(),
    ),
  )..getLights();

  @override
  Widget builder(BuildContext context, Widget navigator) {
    return BlocProvider.value(
      value: _lightsCubit,
      child: navigator,
    );
  }

  @override
  List<String> get pathBlueprints => ['/lights/:lightId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('lights'),
          title: 'Lights',
          child: LightsView(),
        ),
        if (state.pathParameters.containsKey('lightId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['lightId']}'),
            child: LightView(id: state.pathParameters['lightId']!),
          )
      ];
}
