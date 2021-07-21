import 'package:flutter/material.dart';
import '../widgets/global/top_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: const Center(child: Text('Settings')),
    );
  }
}
