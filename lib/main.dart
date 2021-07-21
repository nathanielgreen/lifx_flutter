import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/locations/lights_location.dart';
import 'package:lifx/locations/settings_location.dart';
import './widgets/global/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routerDelegate = BeamerDelegate(
    initialPath: '/home',
    locationBuilder: SimpleLocationBuilder(
      routes: {
        '*': (context, state) {
          final beamerKey = GlobalKey<BeamerState>();
          return Scaffold(
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
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
    );
  }
}
