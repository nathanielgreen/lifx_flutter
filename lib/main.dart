import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomeScreen(),
    );
  }
}

// final routerDelegate = BeamerDelegate(
//   locationBuilder: SimpleLocationBuilder(
//     routes: {
//       // Return either Widgets or BeamPages if more customization is needed
//       '/': (context, state) => HomeScreen(),
//     },
//   ),
// );
