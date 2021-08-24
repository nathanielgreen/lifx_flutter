import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/settings_repository.dart';

import '../features/settings/settings.dart';

class SettingsLocation extends BeamLocation {
  @override
  Widget builder(BuildContext context, Widget navigator) {
    return BlocProvider(
      create: (context) => SettingsCubit(
        '',
        SettingsRepository(authProvider: AuthProvider()),
      ),
      child: navigator,
    );
  }

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
