import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx/widgets/organisms/light_list.dart';
import 'package:lifx/widgets/global/top_bar.dart';

class LightsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: topBar("All Lights"),
      body: const Center(
        child: LightList(),
      ),
    );
  }
}
