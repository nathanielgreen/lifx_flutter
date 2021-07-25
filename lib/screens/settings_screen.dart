import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:beamer/beamer.dart';
import '../widgets/atoms/button.dart';
import '../widgets/global/top_bar.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController textController = TextEditingController();

  Future<void> setKey(String? key) async {
    final SharedPreferences prefs = await _prefs;
    if (key == null) {
      prefs.remove("LIFX_API_KEY");
    } else {
      prefs.setString("LIFX_API_KEY", key);
    }
  }

  Future<String> getKey() async {
    final SharedPreferences prefs = await _prefs;
    final key = prefs.getString("LIFX_API_KEY");
    if (key != null) return key;
    throw Exception("No key present");
  }

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
