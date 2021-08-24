import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

import '../features/settings/settings.dart';

class SettingsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/settings'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        if (state.uri.pathSegments.contains('settings'))
          BeamPage(
            key: const ValueKey('settings'),
            title: 'settings',
            child: SettingsView(),
          ),
      ];
}
