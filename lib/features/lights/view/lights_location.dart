import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/screens/lights_screen.dart';
import 'package:lifx/screens/light_screen.dart';

class LightsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/lights/:lightId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('lights'),
          title: 'Lights',
          child: LightsScreen(),
        ),
        if (state.pathParameters.containsKey('lightId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['lightId']}'),
            child: LightScreen(
              id: state.pathParameters['lightId']!,
            ),
          )
      ];
}
