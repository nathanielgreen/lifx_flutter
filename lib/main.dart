import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/locations/lights_location.dart';
import 'package:lifx/features/settings/settings.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx/styles/theme.dart' show theme;
import 'package:provider/provider.dart';
import './widgets/global/bottom_bar.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LifxClientModel()),
    ],
    child: MyApp(),
  ));
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
