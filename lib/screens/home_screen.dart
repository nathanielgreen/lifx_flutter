import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import '../widgets/templates/lights_template.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<LifxClientModel>(context, listen: false).initializeLights();
    return const LightsTemplate();
  }
}
