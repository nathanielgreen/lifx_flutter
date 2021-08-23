import 'package:flutter/material.dart';
import 'package:lifx/widgets/global/top_bar.dart';

class LightView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: topBar("Light"),
      body: const Center(
        child: Text('hi'),
      ),
    );
  }
}
