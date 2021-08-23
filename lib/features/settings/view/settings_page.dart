import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../settings.dart';
import 'settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return BlocProvider(
      create: (_) => SettingsCubit(''),
      child: SettingsView(),
    );
  }
}
