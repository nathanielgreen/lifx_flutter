import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import './settings_page.dart';

class SettingsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('settings'),
          title: 'settings',
          child: const SettingsPage(),
        ),
      ];
}
