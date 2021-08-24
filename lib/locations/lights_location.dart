import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../features/lights/lights.dart';

class LightsLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathBlueprints => ['/lights/:lightId'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('lights'),
          title: 'Lights',
          child: const LightsPage(),
        ),
        if (state.pathParameters.containsKey('lightId'))
          BeamPage(
            key: ValueKey('book-${state.pathParameters['lightId']}'),
            child: LightView(id: state.pathParameters['lightId']!),
          )
      ];
}
