import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({required this.beamerKey});

  final GlobalKey<BeamerState> beamerKey;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late BeamerDelegate _beamerDelegate;
  final int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _beamerDelegate = widget.beamerKey.currentState!.routerDelegate;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      onTap: (int index) =>
          _beamerDelegate.beamToNamed(index == 0 ? '/lights' : '/settings'),
    );
  }
}
