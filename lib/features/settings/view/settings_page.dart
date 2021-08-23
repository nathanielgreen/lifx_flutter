import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/settings_repository.dart';

import '../settings.dart';
import 'settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return BlocProvider(
      create: (_) => SettingsCubit(
        '',
        SettingsRepository(authProvider: AuthProvider()),
      )..initialize(),
      child: SettingsView(),
    );
  }
}
