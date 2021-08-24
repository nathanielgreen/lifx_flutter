import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:lifx/locations/locations.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late BeamerDelegate _beamerDelegate;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
  }

  @override
  Widget build(BuildContext context) {
    _currentIndex =
        _beamerDelegate.currentBeamLocation is LightsLocation ? 0 : 1;
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).canvasColor,
      fixedColor: Theme.of(context).primaryColor,
      currentIndex: _currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "All lights",
            backgroundColor: Color(0xff202224)),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
            backgroundColor: Color(0xff202224)),
      ],
      onTap: (int index) =>
          _beamerDelegate.beamToNamed(index == 0 ? '/lights' : '/settings'),
    );
  }
}
