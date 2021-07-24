import 'package:flutter/material.dart';
import '../global/top_bar.dart';
import '../organisms/light_list.dart';

class LightsTemplate extends StatelessWidget {
  const LightsTemplate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: const Center(
        child: LightList(),
      ),
    );
  }
}
