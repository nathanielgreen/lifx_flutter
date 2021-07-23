import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lifx/providers/lifx_client_model.dart';
import 'package:lifx_http_api/lifx_http_api.dart' show Bulb, Client;
import '../widgets/templates/lights_template.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Client> createClient(BuildContext context) async {
    final clientModel = Provider.of<LifxClientModel>(context, listen: false);
    await clientModel.createClient(context);
    return clientModel.client;
  }

  Future<Iterable<Bulb>> getLights(BuildContext context) async {
    return Provider.of<LifxClientModel>(context, listen: false)
        .client
        .listLights();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: createClient(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return LightsTemplate(futureLights: getLights(context));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        });
  }
}
