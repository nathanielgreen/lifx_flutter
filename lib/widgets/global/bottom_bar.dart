import 'package:flutter/material.dart';

class BottomBar extends BottomNavigationBar {
  BottomBar()
      : super(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        );
}
