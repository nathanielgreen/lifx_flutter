import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lifx/locations/locations.dart';
import 'package:lifx/styles/theme.dart' show theme;
import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx/data/lights_repository.dart';
import 'package:lifx/data/settings_repository.dart';

import './widgets/global/bottom_bar.dart';
import './features/lights/lights.dart';
import './features/settings/settings.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/lights',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '*': (context, state) {
          final beamerKey = GlobalKey<BeamerState>();
          return MultiBlocProvider(
            providers: [
              BlocProvider<LightsCubit>(
                create: (context) => LightsCubit(LightsRepository(
                  authProvider: AuthProvider(),
                  lifxProvider: LifxProvider(),
                ))
                  ..getLights(),
              ),
              BlocProvider<SettingsCubit>(
                create: (context) => SettingsCubit(
                  '',
                  SettingsRepository(authProvider: AuthProvider()),
                )..initialize(),
              )
            ],
            child: Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Beamer(
                key: beamerKey,
                routerDelegate: BeamerDelegate(
                  locationBuilder: BeamerLocationBuilder(
                    beamLocations: [
                      LightsLocation(),
                      SettingsLocation(),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BottomBar(
                beamerKey: beamerKey,
              ),
            ),
          );
        },
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
      routerDelegate: routerDelegate,
      title: 'Flutter Demo',
      theme: theme(),
    );
  }
}
