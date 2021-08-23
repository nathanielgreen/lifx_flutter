import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:beamer/beamer.dart';

import 'package:lifx/data/auth_provider.dart';
import 'package:lifx/data/bulbs_repository.dart';
import 'package:lifx/data/lifx_provider.dart';
import 'package:lifx/features/settings/settings.dart';
import 'package:lifx/styles/theme.dart' show theme;

import './widgets/global/bottom_bar.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) => BulbsRepository(
        lifxProvider: LifxProvider(),
        authProvider: AuthProvider(),
      ),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/home',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '*': (context, state) {
          final beamerKey = GlobalKey<BeamerState>();
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Beamer(
              key: beamerKey,
              routerDelegate: BeamerDelegate(
                locationBuilder: BeamerLocationBuilder(
                  beamLocations: [
                    SettingsLocation(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(
              beamerKey: beamerKey,
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
