import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:lifx/locations/locations.dart';
import 'package:lifx/styles/theme.dart' show theme;

import './widgets/global/bottom_bar.dart';

void main() async {
  await Hive.initFlutter();
  runApp(
    MyApp(),
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
                    LightsLocation(),
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
