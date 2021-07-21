import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/screens/settings_screen.dart';

class SettingsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('settings'),
          title: 'settings',
          child: SettingsScreen(),
        ),
      ];
}
