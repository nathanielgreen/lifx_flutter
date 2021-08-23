import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import '../../widgets/atoms/button.dart';
import '../../widgets/global/top_bar.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar("Settings"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: FutureBuilder<String>(
                  future: getKey(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SelectableText(
                          "LIFX API Key: ${snapshot.data.toString()}");
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              TextField(
                controller: textController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    focusColor: Theme.of(context).accentColor,
                    hintText: 'Enter a search term'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      onClick: () {
                        setKey(textController.text);
                        Beamer.of(context).beamToNamed('lights');
                      },
                      text: 'Set LIFX API key',
                    ),
                    Button(
                      onClick: () => setKey(null),
                      text: 'Clear API Key',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
