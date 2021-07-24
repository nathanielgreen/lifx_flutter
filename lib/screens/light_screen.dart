import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx_http_api/lifx_http_api.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    final Bulb? bulb = Provider.of<LifxClientModel>(context).getLight(id);
    if (bulb == null) return const Text("Bulb not found");
    return Scaffold(
      appBar: AppBar(title: Text(bulb.label)),
      body: Text("${bulb.id} ${bulb.label}"),
    );
  }
}
