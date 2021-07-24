import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx/widgets/global/top_bar.dart';
import 'package:lifx/widgets/organisms/light_list.dart';

class LightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<LifxClientModel>(context, listen: false).initializeLights();
    return Scaffold(
      appBar: TopBar(),
      body: const Center(
        child: LightList(),
      ),
    );
  }
}
