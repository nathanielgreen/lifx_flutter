import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/screens/home_screen.dart';

class LightsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/lights/:light'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('lights'),
          title: 'Lights',
          child: HomeScreen(),
        ),
      ];
}
