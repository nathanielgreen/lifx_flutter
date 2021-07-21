import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/screens/settings_screen.dart';
import './screens/home_screen.dart';
import './widgets/global/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

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

class LightsLocation extends BeamLocation {
  @override
  List<String> get pathBlueprints => ['/lights/:light'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) => [
        BeamPage(
          key: const ValueKey('lights'),
          title: 'Lights',
          child: HomeScreen(),
        ),
      ];
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
