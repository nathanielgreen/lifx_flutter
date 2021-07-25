import 'package:flutter/material.dart';
import 'package:lifx/widgets/atoms/screen_header.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx/widgets/organisms/light_list.dart';

class LightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<LifxClientModel>(context, listen: false).initializeLights();
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: const ScreenHeader(text: "All lights"),
        centerTitle: true,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: const Center(
        child: LightList(),
      ),
    );
  }
}
